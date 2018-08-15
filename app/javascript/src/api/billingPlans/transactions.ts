import axios from "axios";
import { Url } from "app/constants";
import { buildJsonUrl, handleApiError } from "app/utils";
import { QueryParams } from "app/interfaces";
import { Checkout } from "app/entities/checkout";

export const getPlans = async () => {
  try {
    return await axios.get(buildJsonUrl(Url.Billing.Plans));
  } catch (e) {
    const error = handleApiError(e);
    throw error;
  }
}