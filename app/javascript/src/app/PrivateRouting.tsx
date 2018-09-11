import * as React from 'react';
import { Switch, Route } from "react-router";

import NotFound from "ui/common/NotFound";
import MembersList from "ui/members/MembersList";
import PlansList from 'ui/billingPlans/PlansList';
import RentalsList from 'ui/rentals/RentalsList';
import SubscriptionsList from 'ui/subscriptions/SubscriptionsList';
import LandingPage from 'ui/auth/LandingPage';
import MemberDetail from 'ui/member/MemberDetail';


const PrivateRouting: React.SFC<{}> = () => (
  <>
    <Route exact path="/members" component={MembersList} />
    <Route exact path="/members/:id" component={MemberDetail} />
    <Route exact path="/billing" component={PlansList} />
    <Route exact path="/subscriptions" component={SubscriptionsList} />
    <Route exact path="/rentals" component={RentalsList} />
    <Route exact path="/" component={LandingPage} />
    <Route path="*" render={() => (<div>frig</div>)} />
  </>
  );

export default PrivateRouting;