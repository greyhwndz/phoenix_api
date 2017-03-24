defmodule PhoenixApi.Rental do
  use PhoenixApi.Web, :model

  schema "rentals" do
    field :title, :string
    field :owner, :string
    field :city, :string
    field :type, :string
    field :image, :string
    field :bedrooms, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :owner, :city, :type, :image, :bedrooms])
    |> validate_required([:title, :owner, :city, :type, :image, :bedrooms])
  end
end
