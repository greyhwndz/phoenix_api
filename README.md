# PhoenixApi

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


## When I curl to the api:

λ curl -H "Accept: application/vnd.api+json" http://localhost:4000/api/v1/rentals

```javascript
{
  "jsonapi":{
    "version":"1.0"
  },
  "data":[
    {
      "type":"Estate",
      "id":"1",
      "attributes":{
        "updated-at":"2017-03-24T07:13:29.867832",
        "type":"Estate",
        "title":"Grand Old Mansion",
        "owner":"Veruca Salt",
        "inserted-at":"2017-03-24T07:13:29.819691",
        "image":"https://upload.wikimedia.org/wikipedia/commons/c/cb/Crane_estate_(5).jpg",
        "city":"San Francisco",
        "bedrooms":15
      }
    },
    {
      "type":"Condo",
      "id":"2",
      "attributes":{
        "updated-at":"2017-03-24T07:13:30.049467",
        "type":"Condo",
        "title":"Urban Living",
        "owner":"Mike Teavee",
        "inserted-at":"2017-03-24T07:13:30.049458",
        "image":"https://upload.wikimedia.org/wikipedia/commons/0/0e/Alfonso_13_Highrise_Tegucigalpa.jpg",
        "city":"Seattle",
        "bedrooms":1
      }
    },
    {
      "type":"Apartment",
      "id":"3",
      "attributes":{
        "updated-at":"2017-03-24T07:13:30.051900",
        "type":"Apartment",
        "title":"Downtown Charm",
        "owner":"Violet Beauregarde",
        "inserted-at":"2017-03-24T07:13:30.051891",
        "image":"https://upload.wikimedia.org/wikipedia/commons/f/f7/Wheeldon_Apartment_Building_-_Portland_Oregon.jpg",
        "city":"Portland",
        "bedrooms":3
      }
    }
  ]
}
```