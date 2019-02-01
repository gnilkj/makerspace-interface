import * as React from "react";
import mapValues from "lodash-es/mapValues";
import isEmpty from "lodash-es/isEmpty";
import omit from "lodash-es/omit";
import merge from "lodash-es/merge";
import isUndefined from "lodash-es/isUndefined";

import DialogTitle from "@material-ui/core/DialogTitle";
import DialogContent from "@material-ui/core/DialogContent";
import DialogActions from "@material-ui/core/DialogActions";
import Button from "@material-ui/core/Button";

import { CollectionOf } from "app/interfaces";

import ErrorMessage from "ui/common/ErrorMessage";
import LoadingOverlay from "ui/common/LoadingOverlay";


export interface FormField {
  label?: string;
  name: string;
  placeholder?: string;
  validate?: (val: any) => boolean;
  transform?: (val: any) => any;
  error?: string;
  render?: (value: string | number | object) => string | JSX.Element;
  [key: string]: any;
}

export interface FormFields {
  [key: string]: FormField
}

interface FormModalProps {
  id: string;
  title?: string;
  onCancel?: () => void;
  cancelText?: string;
  onSubmit?: (form: Form) => void;
  submitText?: string;
  loading?: boolean;
  children?: React.ReactNode;
  error?: string;
  submitDisabled?: boolean;
  style?: { [key: string]: string }
}
interface State {
  values: CollectionOf<string>;
  errors: CollectionOf<string>;
  isDirty: boolean;
  touched: CollectionOf<boolean>;
}

type ChildNode = React.ReactElement<HTMLFormElement>;

class Form extends React.Component<FormModalProps, State> {

  private extractInputNames = (values: CollectionOf<string>, input: ChildNode) => {
    if (input && input.props) {
      // Get input name
      if (this.isFormInput(input)) {
        values[input.props.name] = input.props.value || input.props.defaultValue || "";
      }
      // extract names from input children elements
      if (React.Children.count(input.props.children) > 0) {
        values = {
          ...values,
          ...this.extractNamesFromChildren(input.props.children)
        }
      }
    }

    return values;
  }

  private extractNamesFromChildren = (children: React.ReactNode) => {
    return React.Children.toArray(children).reduce(this.extractInputNames, {});
  }

  /**
   * Set values to collection of strings by input name
   */
  private getDefaultState = (props: FormModalProps): State => {
    const defaultValues = this.extractNamesFromChildren(props.children);

    return (
      {
        values: defaultValues,
        errors: {},
        touched: {},
        isDirty: false
      }
    )
  }

  constructor(props: FormModalProps) {
    super(props);
    this.state = this.getDefaultState(props);
  }

  public componentDidMount() {
    this.setState({...this.getDefaultState(this.props)});
  }

  public getValues = (): CollectionOf<string> => {
    return this.state.values;
  };

  public setFormState = (newState: Partial<State>) => {
    return new Promise((resolve) => this.setState(state => (merge({}, state, newState)), resolve))
  };

  public setValue = (fieldName: string, value: any) => {
    return new Promise((resolve) => this.setState(state => ({
      values: {
          ...state.values,
          [fieldName]: isUndefined(value) ? null : value
        }
      }), resolve))
  }

  public setError = (fieldName: string, error: string) => {
    return new Promise((resolve) => this.setState(state => ({
      errors: {
        ...state.errors,
        [fieldName]: isUndefined(error) ? null : error
      }
    }), resolve))
  }

  public isValid = (): boolean => {
    return isEmpty(this.state.errors);
  }

  public isDirty = (): boolean => {
    return this.state.isDirty;
  }

  public simpleValidate = async <T extends object>(fields: FormFields) => {
    const values = this.getValues();
    const errors: CollectionOf<string> = {};
    const validatedForm: Partial<T> = {};
    Object.entries(fields).forEach(([key, field]) => {
      const value = field.transform ? field.transform(values[field.name]) : values[field.name];
      if (field.validate && !field.validate(value)) {
        errors[field.name] = field.error;
      } else {
        validatedForm[key] = value;
      }
    });

    await this.setFormState({
      errors,
    });

    return validatedForm as T;
  }

  private handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    this.setState(state => {
      return {
        isDirty: true,
        touched: mapValues(state.values, () => true)
      };
    }, () => {
      this.props.onSubmit(this);
    }
  );
  }

  private handleChange = (event: React.ChangeEvent<HTMLFormElement>) => {
    const fieldName = event.target.name;
    // Set value depending on checked state for checkboxes and radios
    const fieldValue = event.target.hasOwnProperty("checked") ? (isUndefined(event.target.value) ? !!event.target.checked : (event.target.checked && event.target.value)) : event.target.value;
    const { isDirty } = this.state;
    if (!isDirty) {
      this.setState({ isDirty: true });
    }
    this.setState((state) => {
      return {
        values: {
          ...state.values,
          [fieldName]: isUndefined(fieldValue) ? null : fieldValue
        },
        touched: {
          ...state.touched,
          [fieldName]: true
        },
        errors: {
          ...omit(state.errors, [fieldName])
        }
      };
    });
  }

  private isFormInput = (element: ChildNode): boolean => {
    return element && element.hasOwnProperty("props") && element.props.hasOwnProperty("name");
  }

  /**
   * Add Error div for displaying errors.
   * Always added to hold space for error
   * Only displayed once child is considered touched
   */
  private renderChildren = (children: React.ReactNode, index: number = 0): JSX.Element[] => {
    const { id } = this.props;
    index++;
    let uniqKey = index + 1;
    return React.Children.map(children, (child: ChildNode, index: number) => {
      let modifiedChild = child;
      if (child && child.props) {

        uniqKey = uniqKey + index;
        const key = child.props.key || `${id}-${uniqKey}`;
        const hasChildren = child && React.Children.count(child.props.children) > 0;

        if (this.isFormInput(child)) {
          // Configure error handling for input
          modifiedChild = this.configureFormInput(child);
        } else if (typeof child === "string") {
          // Do nothing if plain text
        } else if (hasChildren) {
          // Recursively modify children
          const nestedChildren = this.renderChildren(child.props.children, index);
          modifiedChild = React.cloneElement(child, { key }, nestedChildren);
        }
      }
      return modifiedChild;
    });
  }

  private configureFormInput = (input: ChildNode) => {
    const { errors, touched, isDirty } = this.state;
    const fieldName = input.props.name;
    const id = input.props.id || fieldName;
    const isTouched = touched[fieldName];
    const error = errors[fieldName];
    return (
      <React.Fragment key={id}>
        {this.cloneFormInput(input)}
        <ErrorMessage id={`${id}-error`} error={isDirty && isTouched && error}/>
      </React.Fragment>
    );
  }

  private cloneFormInput = (input: ChildNode, newChildren?: React.ReactNode) => {
    const { values, errors } = this.state;
    const fieldName = input.props.name;
    const id = input.props.id || fieldName;
    const error = errors[fieldName];
    const value = values[fieldName];
    return (
      React.cloneElement(input, {
        error: error ? !!error : undefined,
        id,
        value
      })
    );
  }

  private closeForm = () => {
    const { onCancel } = this.props;
    this.setState(this.getDefaultState(this.props));
    onCancel && onCancel();
  }

  private renderFormContent = (): JSX.Element => {
    const { onSubmit, submitText, cancelText, title, id, onCancel, children, error, loading, submitDisabled } = this.props;
    const { isDirty } = this.state;
    return (
      <>
        {title && <DialogTitle id={`${id}-title`}>{title}</DialogTitle>}
        <DialogContent>
          {this.renderChildren(children)}
          {isDirty && !loading && error && <ErrorMessage error={error} id={`${id}-error`}/>}
        </DialogContent>

        <DialogActions>
          {onSubmit && <Button variant="contained" id={`${id}-submit`} color="primary" type="submit" disabled={submitDisabled}>{submitText || "Submit"}</Button>}
          {onCancel && <Button variant="outlined" id={`${id}-cancel`}  onClick={this.closeForm}>{cancelText || "Cancel"}</Button>}
        </DialogActions>
      </>
    )
  }

  // Wrap form in loading icon w/ background blocker if loading
  public render(): JSX.Element {
    const { id, loading, style, onSubmit, onCancel } = this.props;
    const Wrapper = (onSubmit || onCancel) && <form
      onSubmit={this.handleSubmit}
      onChange={this.handleChange}
      noValidate
      autoComplete="off"
      id={id}
      style={{ width: "100%", ...style }}
      children={<>
        {loading && <LoadingOverlay id={id} />}
        {this.renderFormContent()}
      </>}
    />;
    const Content = (<>
      {loading && <LoadingOverlay id={id} />}
      {this.renderFormContent()}
    </>)

      return (
      <div style={{ position: 'relative' }}>
        {Wrapper || Content}
      </div>
    );
  }
}

export default Form;