export enum Action {
  StartReadRequest = "CARD/START_READ_REQUEST",
  GetCardsSuccess = "CARD/GET_CARDS_SUCCESS",
  GetCardsFailure = "CARD/GET_CARDS_FAILURE",
  StartUpdateRequest = "CARD/START_UPDATE_REQUEST",
  UpdateCardSuccess = "CARD/UPDATE_CARD_SUCCESS",
  UpdateCardFailure = "CARD/UPDATE_CARD_FAILURE",
  StartCreateRequest = "CARD/START_CREATE_REQUEST",
  CreateCardSuccess = "CARD/CREATE_CARD_SUCCESS",
  CreateCardFailure = "CARD/CREATE_CARD_FAILURE",
}