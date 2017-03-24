defmodule PhoenixApi.Router do
  use PhoenixApi.Web, :router

  pipeline :api do
	  plug :accepts, ["json-api"]
	  plug JaSerializer.ContentTypeNegotiation
	  plug JaSerializer.Deserializer
	end

	scope "/api/v1", PhoenixApi do
    pipe_through :api
    resources "/rentals", RentalController, except: [:new, :edit]
  end
end
