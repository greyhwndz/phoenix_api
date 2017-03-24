defmodule PhoenixApi.Repo.Migrations.CreateRental do
  use Ecto.Migration

  def change do
    create table(:rentals) do
      add :title, :string
      add :owner, :string
      add :city, :string
      add :type, :string
      add :image, :string
      add :bedrooms, :integer

      timestamps()
    end

  end
end
