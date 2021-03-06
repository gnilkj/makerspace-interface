import { FormFields } from "ui/common/Form";

export enum Action {
  StartAsyncRequest = "CHECKOUT/START_ASYNC_REQUEST",
  StopAsyncRequest = "CHECKOUT/STOP_ASYNC_REQUEST",
  GetClientTokenSuccess = "CHECKOUT/GET_CLIENT_TOKEN_SUCCESS",
  GetClientTokenFailure = "CHECKOUT/GET_CLIENT_TOKEN_FAILURE",

  StartTransactionRequest = "CHECKOUT/START_TRANSACTION",
  FinishTransactionFailure = "CHECKOUT/FINISH_TRANSACTION_FAILURE",
  FinishTransactionSuccess = "CHECKOUT/FINISH_TRANSACTION_SUCCESS",

  StageInvoicesForPayment = "CHECKOUT/STAGE_INVOICES_PAYMENT",
  ResetStagedInvoices = "CHECKOUT/RESET_STAGED_INVOICES",
  ResetStagedInvoice = "CHECKOUT/RESET_STAGED_INVOICE",
}

const formPrefix = "credit-card-form";
export const CreditCardFields: FormFields = {
  cardNumber: {
    label: "Credit or debit card number",
    name: `${formPrefix}-cardNumber`,
    placeholder: "4111 1111 1111 1111",
    validate: (val) => !!val
  },
  csv: {
    label: "Security code",
    name: `${formPrefix}-csv`,
    placeholder: "123"
  },
  expirationDate: {
    label: "Expiration date",
    name: `${formPrefix}-expirationDate`,
    placeholder: "MM/YYYY"
  },
  postalCode: {
    label: "Zipcode",
    name: `${formPrefix}-zipcode`,
    placeholder: "90210"
  }
}
