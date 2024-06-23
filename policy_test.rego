package s3_access

test_allow_access {
    allow with input as {
        "user": {"role": "st-access-role"},
        "action": "s3:GetObject"
    }
}

test_deny_wrong_role {
    not allow with input as {
        "user": {"role": "wrong-role"},
        "action": "s3:GetObject"
    }
}

test_deny_wrong_action {
    not allow with input as {
        "user": {"role": "st-access-role"},
        "action": "s3:PutObject"
    }
}