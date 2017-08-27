var app = angular.module('app', [
  'ui.router',
  'ui.bootstrap',
  'templates',
  'Devise',
  'ngAnimate',
  'ngMaterial',
  'ngMessages',
  'signature',
  'ipCookie'
]).run(function($transitions, $state, Auth, alertService, $q){
  $transitions.onStart({}, function(trans){
    var toState = trans.to();
    Auth.currentUser().then(function(){
      if (toState.name === 'login' || toState.name === 'register') {
        alertService.addAlert("Logged In", 'success');
        return $state.target("root.members");
      }
    }).catch(function(){
      if (toState.name !== 'root.members') {
        alertService.addAlert("Please log in");
        return $state.go("login");
      }
    });
  });
}).config(function($stateProvider, $urlRouterProvider, $locationProvider, AuthProvider){
  $locationProvider.hashPrefix('');

  AuthProvider.resourceName('member');
  AuthProvider.registerPath('api/members.json');
  AuthProvider.loginPath('api/members/sign_in.json');
  AuthProvider.logoutPath('api/members/sign_out.json');
  AuthProvider.sendResetPasswordInstructionsPath('api/members/password.json');
  AuthProvider.resetPasswordPath('api/members/password.json');

  $urlRouterProvider.otherwise('/members');
  $stateProvider
    .state('login', {
      url: '/login',
      component: 'loginComponent'
    })
    .state('register', {
      url: '/register/:id/:token',
      component: 'registerComponent',
      params: {
        token: null
      },
      resolve: {
        groups: function(groupService){
          return groupService.getAllGroups();
        },
        token: function(tokenService, $stateParams, $q, $state, alertService){
          return tokenService.validate($stateParams.id, $stateParams.token).catch(function(){
            $state.go('login');
            alertService.addAlert("Please login");
            return $q.reject();
          });
        },
        contract: function(tokenService) {
          return tokenService.getContract();
        }
      }
    })
    .state('passwordReset', {
      url: '/resetPassword',
      component: 'passwordComponent'
    })
    .state('passwordResetConfirm', {
      url: '/resetPassword/:token',
      component: 'passwordComponent',
      params: {
        token: null
      }
    })
    .state('root', {
      url: '',
      abstract: true,
      component: 'rootComponent',
      resolve: {
        currentUser: function(Auth, $q){
          return Auth.currentUser().then(function(response){
            return response;
          }).catch(function(){
            $q.resolve();
          });
        }
      }
    })
    .state('root.admin', {
      url: '/admin',
      abstract: true
    })
    .state('root.members', {
      url: '/members',
      component: 'membersIndexComponent',
      resolve: {
        members: function(memberService){
          return memberService.getAllMembers();
        }
      }
    })
    .state('root.admin.memberEdit', {
      url: '/members/:id',
      component: 'memberEditComponent',
      resolve: {
        member: function($stateParams, memberService) {
          return memberService.getById($stateParams.id);
        },
        cards: function(member, cardService) {
          return cardService.getMemberCards(member.id);
        },
        groups: function(groupService){
          return groupService.getAllGroups();
        }
      }
    })
    .state('root.memberships', {
      url: '/memberships',
      component: 'membershipsComponent',
      abstract: true,
      resolve: {
        members: function(memberService){
          return memberService.getAllMembers();
        }
      }
    })
    .state('root.memberships.new', {
      url: '/new',
      component: 'newMemberComponent',
      resolve: {
        card: function(cardService){
          return cardService.getLatestRejection();
        },
        groups: function(groupService){
          return groupService.getAllGroups();
        }
      }
    })
    .state('root.memberships.renew', {
      url: '/renew',
      component: 'renewMemberComponent'
    })
    .state('root.memberships.renewId', {
      url: '/renew/:id',
      component: 'renewMemberComponent',
      resolve: {
        member: function(memberService, $stateParams) {
          return memberService.getByID($stateParams.id);
        }
      }
    })
    .state('root.memberships.invite', {
      url: '/invite/:email',
      component: 'inviteComponent',
      params: {
        email: null
      }
    })
    .state('root.payments', {
      url: '/payments',
      component: 'paymentsComponent',
      resolve: {
        members: function(memberService){
          return memberService.getAllMembers();
        },
        payments: function(paymentsService){
          return paymentsService.getAllPayments();
        }
      }
    })
    .state('root.rentals', {
      url: '/rentals',
      component: 'rentalsComponent',
      resolve: {
        rentals: function(rentalsService) {
          return rentalsService.getAllRentals();
        },
        members: function(memberService){
          return memberService.getAllMembers();
        }
      }
    })
    .state('root.rentals.edit', {
      url: '/:id',
      component: 'rentalFormComponent',
      resolve: {
        rental: function(rentalsService, $stateParams) {
          return rentalsService.getByID($stateParams.id).then(function(response){
            return response;
          }).catch(function(err){
            return err; //return error so state doesn't drop
          });
        }
      }
    })
    .state('root.rentals.new', {
      url: '/new',
      component: 'rentalFormComponent'
    })
    .state('root.workshops', {
      url: '/workshops',
      component: 'workshopsComponent',
      resolve: {
        workshops: function(workshopService){
          return workshopService.getAllWorkshops();
        }
      }
    });
});