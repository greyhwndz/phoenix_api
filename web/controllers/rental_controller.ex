defmodule PhoenixApi.RentalController do
  use PhoenixApi.Web, :controller

  alias PhoenixApi.Rental
  alias JaSerializer.Params

  plug :scrub_params, "data" when action in [:create, :update]

  def index(conn, _params) do
    rentals = Repo.all(Rental)
    render(conn, "index.json-api", data: rentals)
  end

  def create(conn, %{"data" => data = %{"type" => "rental", "attributes" => _rental_params}}) do
    changeset = Rental.changeset(%Rental{}, Params.to_attributes(data))

    case Repo.insert(changeset) do
      {:ok, rental} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", rental_path(conn, :show, rental))
        |> render("show.json-api", data: rental)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(:errors, data: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    rental = Repo.get!(Rental, id)
    render(conn, "show.json-api", data: rental)
  end

  def update(conn, %{"id" => id, "data" => data = %{"type" => "rental", "attributes" => _rental_params}}) do
    rental = Repo.get!(Rental, id)
    changeset = Rental.changeset(rental, Params.to_attributes(data))

    case Repo.update(changeset) do
      {:ok, rental} ->
        render(conn, "show.json-api", data: rental)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(:errors, data: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    rental = Repo.get!(Rental, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(rental)

    send_resp(conn, :no_content, "")
  end

end
