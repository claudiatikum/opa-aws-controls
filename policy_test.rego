package aws.s3.access_test

test_allow_access() {
    input := {"user": {"role": "st-access-role"}}
    allow
}

test_deny_access_different_role() {
    input := {"user": {"role": "other-role"}}
    not allow
}

test_deny_access_no_role() {
    input := {"user": {}}
    not allow
}
