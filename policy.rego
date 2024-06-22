package s3.access

# Define the allowed role
allowed_role = "st-access-role"

# Define the main rule for access control
default allow = false

# Rule to allow access if the user has the required role
allow {
    input.user.roles[_] == allowed_role
}

