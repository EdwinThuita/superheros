# Description
- #### live link = [Superheroes](https://s-isn5.onrender.com)

-This api is designed to manage database of different `superheroes `and their `powers`. 
- It has three main resources: `Hero`, `Power`, and `HeroPower`.
- `Hero `model represents a `superhero `that possess one or more `powers` while power model represents the different types of `powers` that a superhero can have. 
- The `HeroPower` model acts as a join table between the `hero` and the `power` model, hence allowing for relations between the two.

-The API allows users to perform **CRUD** operations such as **adding** new `heroes` and `powers`, updating and **deleting** existing heroes and powers. Users can also associate specific powers with a hero by creating a new HeroPower entry.

# Get-started
1. First **fork** this repository to your github account.

     [Click-Here-To-Fork](https://github.com/EdwinThuita/codechallenge/fork)
2. **Git clone** to your local machine
   ```bash
       git clone https://github.com/{your-username}/codechallenge.git
   ```
3. Run bundle install and bundle update to install necessary dependencies.
   ```sh
   bundle install
   bundle update
   ```
   <!-- - If the above commands bring an error try appending bundle exec.
      ```sh
          bundle exec -->
4. Run any pending migrations and seed if necessary
   ```ruby
   rails db:migrate db:seed
   ```
5. Start the server
   ```ruby
   rails s
   ```
6. Navigate to your **[localhost](http://localhost:3000/)** and try out the endpoints

# Tables

# Tables

| Heroes      | powers      | HeroPower         |
| ----------- | ----------- | ----------------- |
| id (**pk**) | id (**pk**) | id (**pk**)       |
| name        | name        | hero_id (**FK**)  |
| super_name  | description | power_id (**FK**) |

-This diagram shows the relationships between the `Heroes`, `Powers`, and `HeroPowers` tables. The `Heroes` table has a **many-to-many** relationship with the `Powers` table, as each hero can have multiple `powers`, and each `power` can belong to multiple `heroes`. The `HeroPowers` table acts as a bridge table between `Heroes` and `Powers`, allowing for the **many-to-many** relationship between them.

# Routes

1. **GET /heroes**
  - Returns a list of all `heroes` in **JSON** format with their id, name and superhero name. The format of the **JSON** response is.

    ```json
    [
      {
        "id": 1,
        "name": "Kamala Khan",
        "super_name": "Ms. Marvel"
        },
      {
        "id": 2,
        "name": "Doreen Green",
        "super_name": "Squirrel Girl"
        },
      {
        "id": 3,
        "name": "Gwen Stacy",
        "super_name": "Spider-Gwen"
        }
    ]
    ```
2. **GET /heroes/:id**

   - This route should return information about a specific `hero`. If the `hero` with the given ID exists, it should return **JSON** data in the following format:

    ```json
    {
      "id": 1,
      "name": "Kamala Khan",
      "super_name": "Ms. Marvel",
      "powers": [
        {
          "id": 1,
          "name": "super strength",
          "description": "gives the wielder super-human strengths"
        },
        {
          "id": 2,
          "name": "flight",
          "description": "gives the wielder the ability to fly through the skies at supersonic speed"
        }
      ]
    }
    ```

   - If the `hero` does not exist, the route should return the following **JSON** data along with an appropriate **HTTP** status code:

   ```json
   {
     "error": "Hero not found"
   }
   ```

3. **GET /powers**

   - This route should return an array of all `powers` in the following **JSON** format.
    ```json
             [
                {    "id": 1,
                      "name": "super strength",
                      "description": "gives the wielder super-human strengths"
                },
                {
                     "id": 2,
                     "name": "flight",
                     "description": "gives the wielder the ability to fly through the skies at supersonic speed"
                }
             ]
    ```
4. **GET /powers/:id**
  -  If the power with the specified id exists, returns the details of the power in JSON format with their id, name and description. The format of the JSON response is
        ```json
             {
                "id": 1,
                "name": "super strength",
                "description": "gives the wielder super-human strengths"
             }
        ```
  - If the power with the specified id does not exist, returns a JSON response with an error message and the appropriate HTTP status code:
    ```json
            {
                 "error": "Power not found"
            }
    ```
5. **PATCH /powers/:id**
  - Updates the description of the power with the specified id. Accepts a JSON object in the request body with the updated description in the "description" field. The format of the JSON response depends on the success of the update operation:
      -If the power with the specified id exists and is updated successfully (passes validations), returns the updated details of the power in JSON format with their id, name and updated description. The format of the JSON response is:
      ```json
          {
              "name": "super strength update",
              "description":"updated description"
          }
       ```
  - If the power with the specified id does not exist, returns a JSON response with an error message and the appropriate HTTP status code:
      ```json
           {
             "error":"power not found"
           }
      ```
  - If the power with the specified id is not updated successfully (does not passvalidations), returns a JSON response with an error message and the appropriate HTTP status code:
      ```json
            {
                "errors":["Validation errors"]
            }
      ```
6. **POST /hero_powers**
  - Creates a new HeroPower association between an existing power and hero. Accepts a JSON object in the request body with the following properties:
      ```json
            {
                "strength":"medium",
                "power_id":"1",
                "hero_id":"2"
            }
      ```
  - If the HeroPower is created successfully, returns a JSON response with the details of the hero in the format specified below :
      ```json
            {
               "id": 1,
               "name": "Kamala Khan",
               "super_name": "Ms. Marvel",
               "powers": [
                   {
                   "id": 1,
                   "name": "super strength",
                   "description": "gives the wielder super-human strengths"
                   },
                   {
                   "id": 2,
                   "name": "flight",
                   "description": "gives the wielder the ability to fly through the skies at supersonic speed"
                   }
               ]
            }
      ```
  - If the `HeroPower` is **not** created successfully, return the following JSON data, along with the appropriate HTTP status code:
    ```json
       "errors": ["validation errors"]
    ```


7. **DELETE /powers/:id`**
   - This **DELETE** route is used to delete a specific power from the database based on its ID. If the power with the given ID exists, it will be deleted and a 204 No Content status code will be returned.

   - If the power does not exist, the route should return the following JSON data along with an appropriate HTTP status code
    ```json
           {
           "error": "Power not found"
           }
    ```

# Contributor

**[EdwinThuita](https://github.com/EdwinThuita)**

# License

MIT License
**EdwinThuita**

