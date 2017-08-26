# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module DataflowV1b3
      # Google Dataflow API
      #
      # Manages Google Cloud Dataflow projects on Google Cloud Platform.
      #
      # @example
      #    require 'google/apis/dataflow_v1b3'
      #
      #    Dataflow = Google::Apis::DataflowV1b3 # Alias the module
      #    service = Dataflow::DataflowService.new
      #
      # @see https://cloud.google.com/dataflow
      class DataflowService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://dataflow.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Send a worker_message to the service.
        # @param [String] project_id
        #   The project to send the WorkerMessages to.
        # @param [Google::Apis::DataflowV1b3::SendWorkerMessagesRequest] send_worker_messages_request_object
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::SendWorkerMessagesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::SendWorkerMessagesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def worker_project_messages(project_id, send_worker_messages_request_object = nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1b3/projects/{projectId}/WorkerMessages', options)
          command.request_representation = Google::Apis::DataflowV1b3::SendWorkerMessagesRequest::Representation
          command.request_object = send_worker_messages_request_object
          command.response_representation = Google::Apis::DataflowV1b3::SendWorkerMessagesResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::SendWorkerMessagesResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Launch a template.
        # @param [String] project_id
        #   Required. The ID of the Cloud Platform project that the job belongs to.
        # @param [Google::Apis::DataflowV1b3::LaunchTemplateParameters] launch_template_parameters_object
        # @param [String] location
        #   The location to which to direct the request.
        # @param [Boolean] validate_only
        #   If true, the request is validated but not actually executed.
        #   Defaults to false.
        # @param [String] gcs_path
        #   Required. A Cloud Storage path to the template from which to create
        #   the job.
        #   Must be valid Cloud Storage URL, beginning with 'gs://'.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::LaunchTemplateResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::LaunchTemplateResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def launch_project_template(project_id, launch_template_parameters_object = nil, location: nil, validate_only: nil, gcs_path: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1b3/projects/{projectId}/templates:launch', options)
          command.request_representation = Google::Apis::DataflowV1b3::LaunchTemplateParameters::Representation
          command.request_object = launch_template_parameters_object
          command.response_representation = Google::Apis::DataflowV1b3::LaunchTemplateResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::LaunchTemplateResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['location'] = location unless location.nil?
          command.query['validateOnly'] = validate_only unless validate_only.nil?
          command.query['gcsPath'] = gcs_path unless gcs_path.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get the template associated with a template.
        # @param [String] project_id
        #   Required. The ID of the Cloud Platform project that the job belongs to.
        # @param [String] location
        #   The location to which to direct the request.
        # @param [String] view
        #   The view to retrieve. Defaults to METADATA_ONLY.
        # @param [String] gcs_path
        #   Required. A Cloud Storage path to the template from which to
        #   create the job.
        #   Must be a valid Cloud Storage URL, beginning with `gs://`.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::GetTemplateResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::GetTemplateResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_template(project_id, location: nil, view: nil, gcs_path: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1b3/projects/{projectId}/templates:get', options)
          command.response_representation = Google::Apis::DataflowV1b3::GetTemplateResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::GetTemplateResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['location'] = location unless location.nil?
          command.query['view'] = view unless view.nil?
          command.query['gcsPath'] = gcs_path unless gcs_path.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a Cloud Dataflow job from a template.
        # @param [String] project_id
        #   Required. The ID of the Cloud Platform project that the job belongs to.
        # @param [Google::Apis::DataflowV1b3::CreateJobFromTemplateRequest] create_job_from_template_request_object
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_job_from_template(project_id, create_job_from_template_request_object = nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1b3/projects/{projectId}/templates', options)
          command.request_representation = Google::Apis::DataflowV1b3::CreateJobFromTemplateRequest::Representation
          command.request_object = create_job_from_template_request_object
          command.response_representation = Google::Apis::DataflowV1b3::Job::Representation
          command.response_class = Google::Apis::DataflowV1b3::Job
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Send a worker_message to the service.
        # @param [String] project_id
        #   The project to send the WorkerMessages to.
        # @param [String] location
        #   The location which contains the job
        # @param [Google::Apis::DataflowV1b3::SendWorkerMessagesRequest] send_worker_messages_request_object
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::SendWorkerMessagesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::SendWorkerMessagesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def worker_project_location_messages(project_id, location, send_worker_messages_request_object = nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1b3/projects/{projectId}/locations/{location}/WorkerMessages', options)
          command.request_representation = Google::Apis::DataflowV1b3::SendWorkerMessagesRequest::Representation
          command.request_object = send_worker_messages_request_object
          command.response_representation = Google::Apis::DataflowV1b3::SendWorkerMessagesResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::SendWorkerMessagesResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['location'] = location unless location.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a Cloud Dataflow job.
        # @param [String] project_id
        #   The ID of the Cloud Platform project that the job belongs to.
        # @param [String] location
        #   The location that contains this job.
        # @param [Google::Apis::DataflowV1b3::Job] job_object
        # @param [String] view
        #   The level of information requested in response.
        # @param [String] replace_job_id
        #   Deprecated. This field is now in the Job message.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_location_job(project_id, location, job_object = nil, view: nil, replace_job_id: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1b3/projects/{projectId}/locations/{location}/jobs', options)
          command.request_representation = Google::Apis::DataflowV1b3::Job::Representation
          command.request_object = job_object
          command.response_representation = Google::Apis::DataflowV1b3::Job::Representation
          command.response_class = Google::Apis::DataflowV1b3::Job
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['location'] = location unless location.nil?
          command.query['view'] = view unless view.nil?
          command.query['replaceJobId'] = replace_job_id unless replace_job_id.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Request the job status.
        # @param [String] project_id
        #   A project id.
        # @param [String] location
        #   The location which contains the job specified by job_id.
        # @param [String] job_id
        #   The job to get messages for.
        # @param [String] start_time
        #   Return only metric data that has changed since this time.
        #   Default is to return all information about all metrics for the job.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::JobMetrics] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::JobMetrics]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_job_metrics(project_id, location, job_id, start_time: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1b3/projects/{projectId}/locations/{location}/jobs/{jobId}/metrics', options)
          command.response_representation = Google::Apis::DataflowV1b3::JobMetrics::Representation
          command.response_class = Google::Apis::DataflowV1b3::JobMetrics
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['location'] = location unless location.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['startTime'] = start_time unless start_time.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the state of the specified Cloud Dataflow job.
        # @param [String] project_id
        #   The ID of the Cloud Platform project that the job belongs to.
        # @param [String] location
        #   The location that contains this job.
        # @param [String] job_id
        #   The job ID.
        # @param [String] view
        #   The level of information requested in response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_job(project_id, location, job_id, view: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1b3/projects/{projectId}/locations/{location}/jobs/{jobId}', options)
          command.response_representation = Google::Apis::DataflowV1b3::Job::Representation
          command.response_class = Google::Apis::DataflowV1b3::Job
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['location'] = location unless location.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['view'] = view unless view.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List the jobs of a project.
        # @param [String] project_id
        #   The project which owns the jobs.
        # @param [String] location
        #   The location that contains this job.
        # @param [String] filter
        #   The kind of filter to use.
        # @param [String] page_token
        #   Set this to the 'next_page_token' field of a previous response
        #   to request additional results in a long list.
        # @param [Fixnum] page_size
        #   If there are many jobs, limit response to at most this many.
        #   The actual number of jobs returned will be the lesser of max_responses
        #   and an unspecified server-defined limit.
        # @param [String] view
        #   Level of information requested in response. Default is `JOB_VIEW_SUMMARY`.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::ListJobsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::ListJobsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_jobs(project_id, location, filter: nil, page_token: nil, page_size: nil, view: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1b3/projects/{projectId}/locations/{location}/jobs', options)
          command.response_representation = Google::Apis::DataflowV1b3::ListJobsResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::ListJobsResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['location'] = location unless location.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['view'] = view unless view.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the state of an existing Cloud Dataflow job.
        # @param [String] project_id
        #   The ID of the Cloud Platform project that the job belongs to.
        # @param [String] location
        #   The location that contains this job.
        # @param [String] job_id
        #   The job ID.
        # @param [Google::Apis::DataflowV1b3::Job] job_object
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_project_location_job(project_id, location, job_id, job_object = nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:put, 'v1b3/projects/{projectId}/locations/{location}/jobs/{jobId}', options)
          command.request_representation = Google::Apis::DataflowV1b3::Job::Representation
          command.request_object = job_object
          command.response_representation = Google::Apis::DataflowV1b3::Job::Representation
          command.response_class = Google::Apis::DataflowV1b3::Job
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['location'] = location unless location.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get encoded debug configuration for component. Not cacheable.
        # @param [String] project_id
        #   The project id.
        # @param [String] location
        #   The location which contains the job specified by job_id.
        # @param [String] job_id
        #   The job id.
        # @param [Google::Apis::DataflowV1b3::GetDebugConfigRequest] get_debug_config_request_object
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::GetDebugConfigResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::GetDebugConfigResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_job_debug_config(project_id, location, job_id, get_debug_config_request_object = nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1b3/projects/{projectId}/locations/{location}/jobs/{jobId}/debug/getConfig', options)
          command.request_representation = Google::Apis::DataflowV1b3::GetDebugConfigRequest::Representation
          command.request_object = get_debug_config_request_object
          command.response_representation = Google::Apis::DataflowV1b3::GetDebugConfigResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::GetDebugConfigResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['location'] = location unless location.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Send encoded debug capture data for component.
        # @param [String] project_id
        #   The project id.
        # @param [String] location
        #   The location which contains the job specified by job_id.
        # @param [String] job_id
        #   The job id.
        # @param [Google::Apis::DataflowV1b3::SendDebugCaptureRequest] send_debug_capture_request_object
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::SendDebugCaptureResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::SendDebugCaptureResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def send_project_location_job_debug_capture(project_id, location, job_id, send_debug_capture_request_object = nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1b3/projects/{projectId}/locations/{location}/jobs/{jobId}/debug/sendCapture', options)
          command.request_representation = Google::Apis::DataflowV1b3::SendDebugCaptureRequest::Representation
          command.request_object = send_debug_capture_request_object
          command.response_representation = Google::Apis::DataflowV1b3::SendDebugCaptureResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::SendDebugCaptureResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['location'] = location unless location.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Leases a dataflow WorkItem to run.
        # @param [String] project_id
        #   Identifies the project this worker belongs to.
        # @param [String] location
        #   The location which contains the WorkItem's job.
        # @param [String] job_id
        #   Identifies the workflow job this worker belongs to.
        # @param [Google::Apis::DataflowV1b3::LeaseWorkItemRequest] lease_work_item_request_object
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::LeaseWorkItemResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::LeaseWorkItemResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def lease_project_location_work_item(project_id, location, job_id, lease_work_item_request_object = nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1b3/projects/{projectId}/locations/{location}/jobs/{jobId}/workItems:lease', options)
          command.request_representation = Google::Apis::DataflowV1b3::LeaseWorkItemRequest::Representation
          command.request_object = lease_work_item_request_object
          command.response_representation = Google::Apis::DataflowV1b3::LeaseWorkItemResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::LeaseWorkItemResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['location'] = location unless location.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Reports the status of dataflow WorkItems leased by a worker.
        # @param [String] project_id
        #   The project which owns the WorkItem's job.
        # @param [String] location
        #   The location which contains the WorkItem's job.
        # @param [String] job_id
        #   The job which the WorkItem is part of.
        # @param [Google::Apis::DataflowV1b3::ReportWorkItemStatusRequest] report_work_item_status_request_object
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::ReportWorkItemStatusResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::ReportWorkItemStatusResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def report_project_location_job_work_item_status(project_id, location, job_id, report_work_item_status_request_object = nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1b3/projects/{projectId}/locations/{location}/jobs/{jobId}/workItems:reportStatus', options)
          command.request_representation = Google::Apis::DataflowV1b3::ReportWorkItemStatusRequest::Representation
          command.request_object = report_work_item_status_request_object
          command.response_representation = Google::Apis::DataflowV1b3::ReportWorkItemStatusResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::ReportWorkItemStatusResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['location'] = location unless location.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Request the job status.
        # @param [String] project_id
        #   A project id.
        # @param [String] location
        #   The location which contains the job specified by job_id.
        # @param [String] job_id
        #   The job to get messages about.
        # @param [String] end_time
        #   Return only messages with timestamps < end_time. The default is now
        #   (i.e. return up to the latest messages available).
        # @param [String] start_time
        #   If specified, return only messages with timestamps >= start_time.
        #   The default is the job creation time (i.e. beginning of messages).
        # @param [String] page_token
        #   If supplied, this should be the value of next_page_token returned
        #   by an earlier call. This will cause the next page of results to
        #   be returned.
        # @param [Fixnum] page_size
        #   If specified, determines the maximum number of messages to
        #   return.  If unspecified, the service may choose an appropriate
        #   default, or may return an arbitrarily large number of results.
        # @param [String] minimum_importance
        #   Filter to only get messages with importance >= level
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::ListJobMessagesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::ListJobMessagesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_location_job_messages(project_id, location, job_id, end_time: nil, start_time: nil, page_token: nil, page_size: nil, minimum_importance: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1b3/projects/{projectId}/locations/{location}/jobs/{jobId}/messages', options)
          command.response_representation = Google::Apis::DataflowV1b3::ListJobMessagesResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::ListJobMessagesResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['location'] = location unless location.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['endTime'] = end_time unless end_time.nil?
          command.query['startTime'] = start_time unless start_time.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['minimumImportance'] = minimum_importance unless minimum_importance.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Launch a template.
        # @param [String] project_id
        #   Required. The ID of the Cloud Platform project that the job belongs to.
        # @param [String] location
        #   The location to which to direct the request.
        # @param [Google::Apis::DataflowV1b3::LaunchTemplateParameters] launch_template_parameters_object
        # @param [Boolean] validate_only
        #   If true, the request is validated but not actually executed.
        #   Defaults to false.
        # @param [String] gcs_path
        #   Required. A Cloud Storage path to the template from which to create
        #   the job.
        #   Must be valid Cloud Storage URL, beginning with 'gs://'.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::LaunchTemplateResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::LaunchTemplateResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def launch_project_location_template(project_id, location, launch_template_parameters_object = nil, validate_only: nil, gcs_path: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1b3/projects/{projectId}/locations/{location}/templates:launch', options)
          command.request_representation = Google::Apis::DataflowV1b3::LaunchTemplateParameters::Representation
          command.request_object = launch_template_parameters_object
          command.response_representation = Google::Apis::DataflowV1b3::LaunchTemplateResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::LaunchTemplateResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['location'] = location unless location.nil?
          command.query['validateOnly'] = validate_only unless validate_only.nil?
          command.query['gcsPath'] = gcs_path unless gcs_path.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get the template associated with a template.
        # @param [String] project_id
        #   Required. The ID of the Cloud Platform project that the job belongs to.
        # @param [String] location
        #   The location to which to direct the request.
        # @param [String] view
        #   The view to retrieve. Defaults to METADATA_ONLY.
        # @param [String] gcs_path
        #   Required. A Cloud Storage path to the template from which to
        #   create the job.
        #   Must be a valid Cloud Storage URL, beginning with `gs://`.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::GetTemplateResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::GetTemplateResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_location_template(project_id, location, view: nil, gcs_path: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1b3/projects/{projectId}/locations/{location}/templates:get', options)
          command.response_representation = Google::Apis::DataflowV1b3::GetTemplateResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::GetTemplateResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['location'] = location unless location.nil?
          command.query['view'] = view unless view.nil?
          command.query['gcsPath'] = gcs_path unless gcs_path.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a Cloud Dataflow job from a template.
        # @param [String] project_id
        #   Required. The ID of the Cloud Platform project that the job belongs to.
        # @param [String] location
        #   The location to which to direct the request.
        # @param [Google::Apis::DataflowV1b3::CreateJobFromTemplateRequest] create_job_from_template_request_object
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_job_from_template_with_location(project_id, location, create_job_from_template_request_object = nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1b3/projects/{projectId}/locations/{location}/templates', options)
          command.request_representation = Google::Apis::DataflowV1b3::CreateJobFromTemplateRequest::Representation
          command.request_object = create_job_from_template_request_object
          command.response_representation = Google::Apis::DataflowV1b3::Job::Representation
          command.response_class = Google::Apis::DataflowV1b3::Job
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['location'] = location unless location.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Gets the state of the specified Cloud Dataflow job.
        # @param [String] project_id
        #   The ID of the Cloud Platform project that the job belongs to.
        # @param [String] job_id
        #   The job ID.
        # @param [String] view
        #   The level of information requested in response.
        # @param [String] location
        #   The location that contains this job.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_job(project_id, job_id, view: nil, location: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1b3/projects/{projectId}/jobs/{jobId}', options)
          command.response_representation = Google::Apis::DataflowV1b3::Job::Representation
          command.response_class = Google::Apis::DataflowV1b3::Job
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['view'] = view unless view.nil?
          command.query['location'] = location unless location.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List the jobs of a project.
        # @param [String] project_id
        #   The project which owns the jobs.
        # @param [String] filter
        #   The kind of filter to use.
        # @param [String] location
        #   The location that contains this job.
        # @param [String] page_token
        #   Set this to the 'next_page_token' field of a previous response
        #   to request additional results in a long list.
        # @param [Fixnum] page_size
        #   If there are many jobs, limit response to at most this many.
        #   The actual number of jobs returned will be the lesser of max_responses
        #   and an unspecified server-defined limit.
        # @param [String] view
        #   Level of information requested in response. Default is `JOB_VIEW_SUMMARY`.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::ListJobsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::ListJobsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_jobs(project_id, filter: nil, location: nil, page_token: nil, page_size: nil, view: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1b3/projects/{projectId}/jobs', options)
          command.response_representation = Google::Apis::DataflowV1b3::ListJobsResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::ListJobsResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['filter'] = filter unless filter.nil?
          command.query['location'] = location unless location.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['view'] = view unless view.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Updates the state of an existing Cloud Dataflow job.
        # @param [String] project_id
        #   The ID of the Cloud Platform project that the job belongs to.
        # @param [String] job_id
        #   The job ID.
        # @param [Google::Apis::DataflowV1b3::Job] job_object
        # @param [String] location
        #   The location that contains this job.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def update_project_job(project_id, job_id, job_object = nil, location: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:put, 'v1b3/projects/{projectId}/jobs/{jobId}', options)
          command.request_representation = Google::Apis::DataflowV1b3::Job::Representation
          command.request_object = job_object
          command.response_representation = Google::Apis::DataflowV1b3::Job::Representation
          command.response_class = Google::Apis::DataflowV1b3::Job
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['location'] = location unless location.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates a Cloud Dataflow job.
        # @param [String] project_id
        #   The ID of the Cloud Platform project that the job belongs to.
        # @param [Google::Apis::DataflowV1b3::Job] job_object
        # @param [String] view
        #   The level of information requested in response.
        # @param [String] location
        #   The location that contains this job.
        # @param [String] replace_job_id
        #   Deprecated. This field is now in the Job message.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::Job] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::Job]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_project_job(project_id, job_object = nil, view: nil, location: nil, replace_job_id: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1b3/projects/{projectId}/jobs', options)
          command.request_representation = Google::Apis::DataflowV1b3::Job::Representation
          command.request_object = job_object
          command.response_representation = Google::Apis::DataflowV1b3::Job::Representation
          command.response_class = Google::Apis::DataflowV1b3::Job
          command.params['projectId'] = project_id unless project_id.nil?
          command.query['view'] = view unless view.nil?
          command.query['location'] = location unless location.nil?
          command.query['replaceJobId'] = replace_job_id unless replace_job_id.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Request the job status.
        # @param [String] project_id
        #   A project id.
        # @param [String] job_id
        #   The job to get messages for.
        # @param [String] location
        #   The location which contains the job specified by job_id.
        # @param [String] start_time
        #   Return only metric data that has changed since this time.
        #   Default is to return all information about all metrics for the job.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::JobMetrics] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::JobMetrics]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_job_metrics(project_id, job_id, location: nil, start_time: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1b3/projects/{projectId}/jobs/{jobId}/metrics', options)
          command.response_representation = Google::Apis::DataflowV1b3::JobMetrics::Representation
          command.response_class = Google::Apis::DataflowV1b3::JobMetrics
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['location'] = location unless location.nil?
          command.query['startTime'] = start_time unless start_time.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Get encoded debug configuration for component. Not cacheable.
        # @param [String] project_id
        #   The project id.
        # @param [String] job_id
        #   The job id.
        # @param [Google::Apis::DataflowV1b3::GetDebugConfigRequest] get_debug_config_request_object
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::GetDebugConfigResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::GetDebugConfigResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_project_job_debug_config(project_id, job_id, get_debug_config_request_object = nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1b3/projects/{projectId}/jobs/{jobId}/debug/getConfig', options)
          command.request_representation = Google::Apis::DataflowV1b3::GetDebugConfigRequest::Representation
          command.request_object = get_debug_config_request_object
          command.response_representation = Google::Apis::DataflowV1b3::GetDebugConfigResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::GetDebugConfigResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Send encoded debug capture data for component.
        # @param [String] project_id
        #   The project id.
        # @param [String] job_id
        #   The job id.
        # @param [Google::Apis::DataflowV1b3::SendDebugCaptureRequest] send_debug_capture_request_object
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::SendDebugCaptureResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::SendDebugCaptureResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def send_project_job_debug_capture(project_id, job_id, send_debug_capture_request_object = nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1b3/projects/{projectId}/jobs/{jobId}/debug/sendCapture', options)
          command.request_representation = Google::Apis::DataflowV1b3::SendDebugCaptureRequest::Representation
          command.request_object = send_debug_capture_request_object
          command.response_representation = Google::Apis::DataflowV1b3::SendDebugCaptureResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::SendDebugCaptureResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Leases a dataflow WorkItem to run.
        # @param [String] project_id
        #   Identifies the project this worker belongs to.
        # @param [String] job_id
        #   Identifies the workflow job this worker belongs to.
        # @param [Google::Apis::DataflowV1b3::LeaseWorkItemRequest] lease_work_item_request_object
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::LeaseWorkItemResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::LeaseWorkItemResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def lease_project_work_item(project_id, job_id, lease_work_item_request_object = nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1b3/projects/{projectId}/jobs/{jobId}/workItems:lease', options)
          command.request_representation = Google::Apis::DataflowV1b3::LeaseWorkItemRequest::Representation
          command.request_object = lease_work_item_request_object
          command.response_representation = Google::Apis::DataflowV1b3::LeaseWorkItemResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::LeaseWorkItemResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Reports the status of dataflow WorkItems leased by a worker.
        # @param [String] project_id
        #   The project which owns the WorkItem's job.
        # @param [String] job_id
        #   The job which the WorkItem is part of.
        # @param [Google::Apis::DataflowV1b3::ReportWorkItemStatusRequest] report_work_item_status_request_object
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::ReportWorkItemStatusResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::ReportWorkItemStatusResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def report_project_job_work_item_status(project_id, job_id, report_work_item_status_request_object = nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:post, 'v1b3/projects/{projectId}/jobs/{jobId}/workItems:reportStatus', options)
          command.request_representation = Google::Apis::DataflowV1b3::ReportWorkItemStatusRequest::Representation
          command.request_object = report_work_item_status_request_object
          command.response_representation = Google::Apis::DataflowV1b3::ReportWorkItemStatusResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::ReportWorkItemStatusResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Request the job status.
        # @param [String] project_id
        #   A project id.
        # @param [String] job_id
        #   The job to get messages about.
        # @param [String] location
        #   The location which contains the job specified by job_id.
        # @param [String] end_time
        #   Return only messages with timestamps < end_time. The default is now
        #   (i.e. return up to the latest messages available).
        # @param [String] page_token
        #   If supplied, this should be the value of next_page_token returned
        #   by an earlier call. This will cause the next page of results to
        #   be returned.
        # @param [String] start_time
        #   If specified, return only messages with timestamps >= start_time.
        #   The default is the job creation time (i.e. beginning of messages).
        # @param [Fixnum] page_size
        #   If specified, determines the maximum number of messages to
        #   return.  If unspecified, the service may choose an appropriate
        #   default, or may return an arbitrarily large number of results.
        # @param [String] minimum_importance
        #   Filter to only get messages with importance >= level
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::DataflowV1b3::ListJobMessagesResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::DataflowV1b3::ListJobMessagesResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_project_job_messages(project_id, job_id, location: nil, end_time: nil, page_token: nil, start_time: nil, page_size: nil, minimum_importance: nil, quota_user: nil, fields: nil, options: nil, &block)
          command =  make_simple_command(:get, 'v1b3/projects/{projectId}/jobs/{jobId}/messages', options)
          command.response_representation = Google::Apis::DataflowV1b3::ListJobMessagesResponse::Representation
          command.response_class = Google::Apis::DataflowV1b3::ListJobMessagesResponse
          command.params['projectId'] = project_id unless project_id.nil?
          command.params['jobId'] = job_id unless job_id.nil?
          command.query['location'] = location unless location.nil?
          command.query['endTime'] = end_time unless end_time.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['startTime'] = start_time unless start_time.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['minimumImportance'] = minimum_importance unless minimum_importance.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          command.query['fields'] = fields unless fields.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
        end
      end
    end
  end
end
