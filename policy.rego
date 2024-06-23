package s3_access

default allow = false

allow {
    input.user.role == "st-access-role"
    input.action == "s3:GetObject"
}