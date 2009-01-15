module Obtiva
  module EasilyTypable
    def self.included(class_constant)
      super
      class_constant.class_eval <<-end_eval, __FILE__, __LINE__
        def #{Obtiva::EasilyTypable::methodize(class_constant.name)}?
          self.is_a?(#{class_constant.name})
        end
        def self.inherited(subclass_constant)
          super
          subclass_constant.send :include, SubClassMethods
        end
      end_eval
    end
    
    module SubClassMethods
      def self.included(subclass_constant)
        super
        subclass_constant.class_eval <<-end_eval, __FILE__, __LINE__
          def #{Obtiva::EasilyTypable::methodize(subclass_constant.name)}?
            self.is_a?(#{subclass_constant.name})
          end
        end_eval
        superclass_constant = subclass_constant.superclass
        begin
          superclass_constant.class_eval <<-end_eval, __FILE__, __LINE__
            def #{Obtiva::EasilyTypable::methodize(subclass_constant.name)}?
              self.is_a?(#{subclass_constant.name})
            end
          end_eval
          superclass_constant = superclass_constant.superclass
        end while superclass_constant.include?(Obtiva::EasilyTypable)
      end
    end
    
    #added this method to break reliance on ActiveSupport and Facets
    def self.methodize(text)
      text.gsub(/([A-Z]+)([A-Z])/,'\1_\2').
      gsub(/([a-z])([A-Z])/,'\1_\2').
      downcase
    end
  end
end