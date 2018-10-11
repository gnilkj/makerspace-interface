import { ApiErrorMessageMap } from "app/constants";
import { ApiErrorResponse } from "app/interfaces";
import isString from "lodash-es/isString";
import { isObject } from "util";
import { isUndefined } from "lodash-es";

const defaultMessage = "Unknown Error.  Contact an administrator";
export const handleApiError = (e: any): ApiErrorResponse => {
  const apiErrorResponse: ApiErrorResponse = {
    response: undefined,
    errorMessage: defaultMessage,
  }

  if (isString(e)) {
    console.error(`API Error Recieved: ${e}`);
  } else if (isObject(e) && isObject(e.response)) {
    try {
      const { response: errorResponse, error } = e;
      apiErrorResponse.response = errorResponse;
      if (!isUndefined(error)) {
        if (isObject(error)) {
          apiErrorResponse.errorMessage = error.message;
        } else {
          apiErrorResponse.errorMessage = error;
        }
      }
    } catch (parseError) {
      console.error(`Error handling API Error: ${parseError}`);
    }
  }

  return apiErrorResponse;
};