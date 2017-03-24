# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixApi.Repo.insert!(%PhoenixApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias PhoenixApi.Repo
alias PhoenixApi.Rental

[
	%Rental{
	  title: "Grand Old Mansion",
	  owner: "Veruca Salt",
	  city: "San Francisco",
	  type: "Estate",
	  bedrooms: 15,
	  image: "https://upload.wikimedia.org/wikipedia/commons/c/cb/Crane_estate_(5).jpg"
	},
	%Rental{
	  title: "Urban Living",
	  owner: "Mike Teavee",
	  city: "Seattle",
	  type: "Condo",
	  bedrooms: 1,
	  image: "https://upload.wikimedia.org/wikipedia/commons/0/0e/Alfonso_13_Highrise_Tegucigalpa.jpg"
	},
	%Rental{
	  title: "Downtown Charm",
	  owner: "Violet Beauregarde",
	  city: "Portland",
	  type: "Apartment",
	  bedrooms: 3,
	  image: "https://upload.wikimedia.org/wikipedia/commons/f/f7/Wheeldon_Apartment_Building_-_Portland_Oregon.jpg"
	}
] |> Enum.each(&Repo.insert!(&1))