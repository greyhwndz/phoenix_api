defmodule PhoenixApi.RentalControllerTest do
  use PhoenixApi.ConnCase

  alias PhoenixApi.Rental
  alias PhoenixApi.Repo

  @valid_attrs %{bedrooms: 42, city: "some content", image: "some content", owner: "some content", title: "some content", type: "some content"}
  @invalid_attrs %{}

  setup do
    conn = build_conn()
      |> put_req_header("accept", "application/vnd.api+json")
      |> put_req_header("content-type", "application/vnd.api+json")

    {:ok, conn: conn}
  end
  
  defp relationships do
    %{}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, rental_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    rental = Repo.insert! %Rental{}
    conn = get conn, rental_path(conn, :show, rental)
    data = json_response(conn, 200)["data"]
    assert data["id"] == "#{rental.id}"
    assert data["type"] == "rental"
    assert data["attributes"]["title"] == rental.title
    assert data["attributes"]["owner"] == rental.owner
    assert data["attributes"]["city"] == rental.city
    assert data["attributes"]["type"] == rental.type
    assert data["attributes"]["image"] == rental.image
    assert data["attributes"]["bedrooms"] == rental.bedrooms
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, rental_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, rental_path(conn, :create), %{
      "meta" => %{},
      "data" => %{
        "type" => "rental",
        "attributes" => @valid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Rental, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, rental_path(conn, :create), %{
      "meta" => %{},
      "data" => %{
        "type" => "rental",
        "attributes" => @invalid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    rental = Repo.insert! %Rental{}
    conn = put conn, rental_path(conn, :update, rental), %{
      "meta" => %{},
      "data" => %{
        "type" => "rental",
        "id" => rental.id,
        "attributes" => @valid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Rental, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    rental = Repo.insert! %Rental{}
    conn = put conn, rental_path(conn, :update, rental), %{
      "meta" => %{},
      "data" => %{
        "type" => "rental",
        "id" => rental.id,
        "attributes" => @invalid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    rental = Repo.insert! %Rental{}
    conn = delete conn, rental_path(conn, :delete, rental)
    assert response(conn, 204)
    refute Repo.get(Rental, rental.id)
  end

end
