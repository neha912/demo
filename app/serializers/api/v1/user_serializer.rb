class Api::V1::UserSerializer
    include FastJsonapi::ObjectSerializer
  
    attributes :id,
      :email,
      :first_name,
      :last_name
    
  
    attributes :products do |object|
      values = Api::V1::ProductSerializer.new(object.products).serializable_hash
      values[:data].map{|member| member[:attributes]} if values && values[:data]
    end
  
    
  end
