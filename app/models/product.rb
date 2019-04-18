require 'csv'

class Product < ApplicationRecord

  # Import CSV, Find or Create product by its title.description
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      products_hash = row.to_hash
      product = find_or_create_by!(name: products_hash['name'], price: products_hash['price'], description: products_hash['description'] )
      product.update_attributes(products_hash)
    end
  end

end
