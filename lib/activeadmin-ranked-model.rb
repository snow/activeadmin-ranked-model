# require 'activeadmin-sortable/version'
require 'activeadmin'
require 'rails/engine'

module ActiveAdmin
  module RankedModel
    module ControllerActions
      def ranked( attribute )
        member_action :rank, method: :post do
          resource.update_attribute(  "#{attribute}_position",
                                      params[attribute].to_i )
          head 200
        end
      end
    end

    module TableMethods
      HANDLE = '&#x2195;'.html_safe

      def ranked_handle_column( attribute )
        column '', class: "activeadmin-ranked-model" do |resource|
          sort_url, query_params = resource_path(resource).split "?", 2
          sort_url += "/rank"
          sort_url += "?" + query_params if query_params
          content_tag :span, class: 'handle',
                             data: { rank_url: sort_url, rank_attribute: attribute } do
            HANDLE
          end
        end
      end
    end

    ::ActiveAdmin::ResourceDSL.send(:include, ControllerActions)
    ::ActiveAdmin::Views::TableFor.send(:include, TableMethods)

    class Engine < ::Rails::Engine
      # Including an Engine tells Rails that this gem contains assets
    end
  end
end

