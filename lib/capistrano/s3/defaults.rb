module Capistrano
  module S3
    module Defaults
      DEFAULTS = {
        :deployment_path      => "",
        :target_path          => "",
        :bucket_write_options => { :acl => 'public-read' },
        :region               => 'ap-northeast-1',
        :redirect_options     => {},
        :only_gzip            => false,
        :invalidations        => [],
        :exclusions           => [],
        :s3_keep_releases     => 5
      }

      def self.populate(context, set_method)
        DEFAULTS.each do |key, value|
          value = value.is_a?(Proc) ? value.call : value
          context.send(set_method, key, value)
        end
      end
    end
  end
end
