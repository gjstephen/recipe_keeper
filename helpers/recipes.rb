def directions_array_split directions
    directions.slice(1..-2).split ", "
end

def ingredients_array_split ingredients
    ingredients.split ", "
end

def directions_array_join directions
    directions.slice(1..-2).join "\r\n"
end

def ingredients_array_join ingredients
    ingredients.slice(1..-2).join "\r\n"
end