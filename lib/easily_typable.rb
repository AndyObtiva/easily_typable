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

  # NOTE: Rails Specific Feature
  # Retroactively load Rails model class matching missing method name to add to
  # EasilyTypable hierarchy when it fails on first attempt.
  # This shall result in it working on second attempt if model class exists.
  # Example:
  alias method_missing_without_easily_typable method_missing
  def method_missing(name, *args, &block)
    if name.to_s.end_with?('?') && !@easily_typable_class_load_attempted
      # attempt to load Rails class and re-invoke once
      class_name = name.to_s.sub(/\?$/, '').split('_').map(&:capitalize).join
      Object.const_get(class_name) rescue nil
      @easily_typable_class_load_attempted = true
      send(name, *args, &block)
    else
      method_missing_without_easily_typable(name, *args, &block)
    end
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
