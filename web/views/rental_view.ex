defmodule PhoenixApi.RentalView do
  use PhoenixApi.Web, :view
  use JaSerializer.PhoenixView

  attributes [:title, :owner, :city, :type, :image, :bedrooms, :inserted_at, :updated_at]
  

end
