import { MemberStatus } from "app/entities/member";
import { SelectOption } from "ui/common/RenewalForm";

export enum Action {
  StartReadRequest = "MEMBERS/START_READ_REQUEST",
  GetMembersSuccess = "MEMBERS/GET_MEMBERS_SUCCESS",
  GetMembersFailure = "MEMBERS/GET_MEMBERS_FAILURE",

  StartCreateRequest = "MEMBERS/START_CREATE_REQUEST",
  CreateMembersSuccess = "MEMBERS/CREATE_MEMBERS_SUCCESS",
  CreateMembersFailure = "MEMBERS/CREATE_MEMBERS_FAILURE",
}

  export const membershipRenewalOptions: SelectOption[] = [
  {
    label: "None",
    value: undefined,
  },
  {
    label: "1 month",
    value: 1,
  },
  {
    label: "3 months",
    value: 3,
  },
  {
    label: "6 months",
    value: 6,
  },
  {
    label: "12 months",
    value: 12,
  },
];