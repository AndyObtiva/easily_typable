module EasilyTypable

  def self.included(class_constant)
    super
    class_constant.class_eval <<-end_eval
      def #{__methodize__(class_constant.name)}?
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
      subclass_constant.class_eval(type_method_definition(subclass_constant))
      superclass_constant = subclass_constant.superclass
      begin
        superclass_constant.class_eval(type_method_definition(subclass_constant))
        superclass_constant = superclass_constant.superclass
      end while superclass_constant.include?(EasilyTypable)
    end

    private
    def self.type_method_definition(subclass_constant)
      <<-MULTI
        def #{EasilyTypable::__methodize__(subclass_constant.name)}?
          self.is_a?(#{subclass_constant.name})
        end
      MULTI
    end
  end

  protected
  #added this method to break reliance on ActiveSupport and Facets
  def self.__methodize__(text)
    text.gsub(/([A-Z]+)([A-Z])/,'\1_\2').
    gsub(/([a-z])([A-Z])/,'\1_\2').
    downcase
  end
  
end
