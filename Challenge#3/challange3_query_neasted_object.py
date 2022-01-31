"""
Challenge  # 3
    We have a nested object, we would like a function that you pass in the object and a key and get back the value
    # object = {“a”: {“b”: {“c”: ”d”}}}
    # key = a/b/c
    # value = a
    We would like to see some tests

====================================

Note - 
- call this script using terminal & provide inpute as key= "user_input"
> python .\nested_id_value.py

"""

# this module is prerequisite to run this script.
import pydash

# program will ask the for input
userinput = input("Provide the Key=").lower()
# new variable with replacing the "/" with "."
provided_key = userinput.replace("/", ".")

# Defining the two object for store input data
abc_obj = {
    "a": {
        "b": {
            "c": "d"
        }
    }
}

xyz_obj = {
    "x": {
        "y": {
            "z": "a"
        }
    }
}


# this function will test the condition and return the approriate value.
def call_value(self):
    if (pydash.zip_object_deep([provided_key], ["d"]) == abc_obj):
        return "Output value=d"
    elif (pydash.zip_object_deep([provided_key], ["a"]) == xyz_obj):
        return "Output value=a"
    else:
        return "Please provide the proper Key"


# function calling there with inpute key
print(call_value(provided_key))
