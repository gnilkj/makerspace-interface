import * as React from "react";
import { connect } from "react-redux";
import { push } from "connected-react-router";
import isEmpty from "lodash-es/isEmpty";

import { Invoice } from "app/entities/invoice";
import { Routing } from "app/constants";
import { CollectionOf } from "app/interfaces";

import { submitPaymentAction } from "ui/checkout/actions";

import { State as ReduxState, ScopedThunkDispatch } from "ui/reducer";
import CheckoutPage from "ui/checkout/CheckoutPage";

import { buildProfileRouting } from "ui/member/utils";

interface OwnProps {}
interface StateProps {
  invoices: CollectionOf<Invoice>;
  userId: string;
  error: string;
  isRequesting: boolean;
}
interface DispatchProps {
  submitCheckout: (invoices: Invoice[], paymentMethodId: string) => void;
  pushLocation: (location: string) => void;
}
interface Props extends OwnProps, StateProps, DispatchProps {}
class CheckoutContainer extends React.Component<Props> {
  public componentDidMount() {
    // Redirect if there are no invoices to checkout
    const { userId, invoices } = this.props;
    const redirectPath = userId ? buildProfileRouting(userId) : Routing.Login;
    const redirect = invoices && isEmpty(invoices) ? redirectPath : undefined;
    if (redirect) {
      this.props.pushLocation(redirectPath);
    }
  }

  public componentDidUpdate(prevProps: Props) {
    const { isRequesting, error, invoices, userId } = this.props;
    const { isRequesting: wasRequesting } = prevProps;
    if (wasRequesting && !isRequesting && !error) {
      // If there are no invoices, redirect to profile since there's nothing to do here
      if (isEmpty(invoices)) {
        this.props.pushLocation(buildProfileRouting(userId));
      }
    }
  }

  private submitPayment = (paymentMethodId: string) => {
    const { invoices } = this.props;
    if (!paymentMethodId) {
      return;
    } else {
      this.setState({ paymentMethodId });
    }
    this.props.submitCheckout(Object.values(invoices), paymentMethodId);
  }

  public render(): JSX.Element {
    const { isRequesting, error, invoices } = this.props;

    return (
      <CheckoutPage
        onSubmit={this.submitPayment}
        isRequesting={isRequesting}
        error={error}
        invoices={invoices}
      />
    )
  }
}

const mapStateToProps = (state: ReduxState, _ownProps: OwnProps): StateProps => {
  const { invoices, isRequesting, error } = state.checkout;
  const { currentUser: { id: userId } } = state.auth;
  return {
    invoices,
    userId,
    isRequesting,
    error
  }
}

const mapDispatchToProps = (
  dispatch: ScopedThunkDispatch
): DispatchProps => {
  return {
    submitCheckout: (invoices, paymentMethodId) => dispatch(submitPaymentAction(paymentMethodId, invoices)),
    pushLocation: (location) => dispatch(push(location))
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(CheckoutContainer);
