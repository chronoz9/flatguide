- The traffic to your backend API is distributed over multiple servers, and the servers use rolling deployment (e.g. in AWS Elastic Beanstalk). In such a scenario a migration would run when the new code gets deployed to the first server in the instance cluster.
    
  You need rename a column in the database. What could go wrong on deployment? And how would you handle this to avoid possible errors and issues for the users of the application?

- answer: assuming we have one database server and three application server. when the first cluster is updated, means the database will already be updated also, then a simple rename will possibly break the other two running server, because the old version will still look up to the old column name. I think one of the mitigation for this is not to simply rename it, but the migration should create another column with the new name, copy the existing data from old column to the new one. this way we make sure that the old version that is still running can work as it is, while the new version will be able to access the existing data from the new column. after the deployment finished, we will need to make sure that the data in the new column is syncronized with the old column.

- You have taken over an application where you need to refactor a controller with 500 lines and a lot of complex logic. How would you organize the code? What options are available?

- answer: The goal for refactoring usually would be decluttering for sepearation of concern, readability, testability and maintainability. I will see if there are any repetition and group them to be a method if possible, slim down unnecessary variables, pick apart the logics written in there and separate whichever concern that can be taken out to be independent module. 


- You have been assigned to design a new version of the API. How would ensure that the API will be reliable, easy to maintain and easy for other developers to consume?

- answer: to be reliable, I think it would be best if we develop it by having every method tested by unit testing, because that means we will have at least the common scenarios and hopefully up until some edge cases figured out and handled, plus it would ensure that every update moving forward would not break existing code. Trying to adhere to SOLID principle and referring to industry standard(guides in rubystyle.guide as an example) would help us and the next developer to maintain the application, so the code would be less messy, readable, and having a good separation of concern. also connected to reliability and ease of consumption, it I think it would be good to have the code structured as versionable(having separate folder for each major version) so that our consumer would not find a nasty break in their application that is caused by a major update in our code base. Lastly, this API should be RESTful and well documented so that other developers that need to consume the API would be at ease


We're not measuring your coding-speed, do not overthink this task. We don't want you to spend too much time on this. The following guidelines apply:

- Use Rails, with libraries of your choice.
- Develop **public** API CRUD endpoints for the scope specified below. Add **tests** for the implemented functionality **as you see necessary,** be it unit or integration tests.

**Scope:**

- The system has **users**
    - Users have a **name** and **email**
- The system can have **flats** (apartments)
    - Flats have a **name** and **a location** (coordinates)
    - Users can share flats
- The system has **neighborhoods**
    - Neighborhoods have a **name** and a **coordinate range** (criteria)
    - A flat **belongs to** a neighborhood if the criteria is met


endpoints:
GET users - get all users
POST users - register user
GET users/:id - get a user
PUT users/:id - update a user
DELETE users/:id - delete a user
GTE users/:id/flat - get flat of user

GET flats - get all flats
POST flats - add a flat
GET flats/:id - get a flat
PUT flats/:id - update a flat
DELETE flats/:id - remove a flat
GET flats/:id/users - get flat users

GET neighborhoods - get all neighborhoods
POST neighborhoods - add a neighborhood
GET neighborhoods/:id - get a neighborhood
PUT neighborhoods/:id - update a neighborhood
DELETE neighborhoods/:id - delete a neighborhood
GET neighborhoods/flats - get flats in neighborhood
