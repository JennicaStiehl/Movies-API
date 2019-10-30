# Backend Software Development Exercise
## Objective
Build an API service with a database backend for storing and editing a movie collection. Please
use a technology stack of your choosing to deliver the application, though use of AWS
infrastructure is recommended.
1. Start by briefly documenting the technology stack of your choosing. Let us know what
component you’ve chosen for each layer and why.
2. Setup a source code repository where we can watch your progress. GitHub or Bitbucket
are fine.
3. You’ll need to deploy your application to a hosting service of your choosing (AWS,
DigitalOcean, Azure, etc). Free tiers should be sufficient.
## Requirements
1. The service must be accessible over http using a command line interface (curl, node,
etc.); a GUI is not necessary.
2. Add an authentication method to restrict access to the repository. Only users that need
access to the service should be able to access it.
3. The service must create, read, update, delete, and list movies in the collection.
4. Each movie in the collection needs the following attributes:
a. Title [text; length between 1 and 50 characters]
b. Format [text; allowable values “VHS”, “DVD”, “Streaming”]
c. Length [time; value between 0 and 500 minutes]
d. Release Year [integer; value between 1800 and 2100]
e. Rating [integer; value between 1 and 5]
5. On the collection list request, the items in the list must be sortable by movie attributes.
6. Integrate a third-party web service relevant to the project.
## Endpoints
### Sessions
request:
```ruby
delete("/api/v1/sessions/1")
```
response:
```ruby
results => {:message=>"Successfully logged out."}
```
request:
```ruby
post("/api/v1sessions?email=#{@user.email}&password=#{@user.password}")
```
response:
```ruby
results
=> {:user_id=>1, :name=>"Jill Moss", :role=>"visitor"}
```
### Users
request:
```ruby
    new_user = {
      name: "Jill Moss",
      email: "jill@gmail.com",
      password: "pw",
      password_confirmation: "pw",
      role: "visitor",
      active: true
    }
    post "/api/v1/users", params: new_user
```
response:
```ruby
results
=> {:message=>"Successfully created an account."}
```
### Movies
request:
```ruby
    new_movie = {
      title: "Deadpool",
      format: "Streaming",
      length: 168,
      release_year: 2016,
      rating: 4
    }
    post "/api/v1/movies", params: new_movie
```
response:
```ruby
results
=> {:id=>333, :title=>"Deadpool", :format=>"Streaming", :length=>168, :release_year=>2016, :rating=>4, :created_at=>"2019-10-30T02:10:54.142Z", :updated_at=>"2019-10-30T02:10:54.142Z"}
```
request:
```ruby
get "/api/v1/movies"
```
response:
```ruby
results
=> [{"id"=>266, "title"=>"Batman", "format"=>"DVD", "length"=>150, "release_year"=>1997, "rating"=>5, "created_at"=>"2019-10-30T01:49:12.861Z", "updated_at"=>"2019-10-30T01:49:12.861Z"},
 {"id"=>267, "title"=>"Batman Returns", "format"=>"DVD", "length"=>157, "release_year"=>1999, "rating"=>3, "created_at"=>"2019-10-30T01:49:12.863Z", "updated_at"=>"2019-10-30T01:49:12.863Z"}]
```
request:     
```ruby
batman = Movie.create(title: "Batman", format: "DVD", length: 150, release_year: 1997, rating: 5)
get "/api/v1/movies/Batman"
```
response:
```ruby
results => {"id": 223, "title": "Batman", "format": "DVD", "length": 150, "release_year": 1997, "rating": 5, "created_at": "2019-10-30T01:36:51.533Z", "updated_at": "2019-10-30T01:36:51.533Z"}
```
request:     
```ruby
changed_movie = {length: 156}
patch "/api/v1/movies/Batman", params: changed_movie
```
response:  
```ruby
results
=> {:id=>526, :title=>"Batman", :length=>156, :format=>"DVD", :release_year=>1997, :rating=>5, :created_at=>"2019-10-30T02:41:46.699Z", :updated_at=>"2019-10-30T02:41:46.703Z"}
```
## Extra Credit (none, any, or all)
1. Implement a build tool of your choosing (CloudFormation in AWS, etc)
2. Integrate a testing suite of some sort
## Keep In Mind
1. We want to see your progress, not just a finished product. Email us your source code
repository and a link to your application instance as soon as you have them setup.
2. Stay in communication with us (ask questions, give status updates). This is part of the
challenge.
