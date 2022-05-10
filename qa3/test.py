def getValue(key, obj):
    keys = key.split('/')
    prev_result = obj
    for temp_key in keys:
        prev_result = prev_result[temp_key]
    return prev_result

print(getValue('x/y/z', {"x":{"y":{"z":"a"}}}))

