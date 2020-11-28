encrypt <- function(s){
  digest(s, algo="sha256")
  # Return with the SHA256 hash value of `v`
} 

init.table <- function(){
  df <- data.frame(user.name = character(0), password = character(0))
  
  #' Create and return empty dataframe with these columns:
  #' user.name : character
  #' password: character
}

new.name <- NULL
new.password <- NULL
add.or.update.user <- function(df, new.name, new.password){
  row_to_find <- data.frame(user.name= new.name)
  match_df(df, row_to_find)
  rbind(df, user.name, password)
  
  #' Add a new record to `df` setting the `user.name` and the `password`
  #' 
  #' If there is a record with the same username, makes sure you update the row
  #' instead of creating a duplicate
  #' 
  #' return with the updated DataFrame
}

authenticate.user <- function (df, user.name, password){
  #' Check if the user with the specified `user.name` and `password`
  #' exists in `df`
  #' Return TRUE/FALSE respectively.
}

# Example execution

user.df <- init.table()
user.df <- add.or.update.user(user.df, "example_user", "example_password")
user.df <- add.or.update.user(user.df, "example_user", "example_password_2")

# EVALUATE THE RESULTS
# These all must be TRUE
print(nrow(user.df[user.df$password == "example_password_2",]) == 0)
print(nrow(user.df[user.df$user.name == "example_user",]) == 1)
print(authenticate.user(user.df, "example_user", "example_password_2"))
print(!authenticate.user(user.df, "example_user", "example_password"))
