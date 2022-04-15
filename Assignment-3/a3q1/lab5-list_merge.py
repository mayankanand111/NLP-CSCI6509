#!/local/bin/python3

some_list = ["first_name","last_name","age","occupation"]
some_touple = ("John","Holloway",35,"carpenter")

result = {l:t for l,t in zip(some_list,some_touple)}

print(result)