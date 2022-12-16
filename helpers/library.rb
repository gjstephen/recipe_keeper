def is_liked?(user_id, recipe_id)
    if get_like_status(user_id, recipe_id).to_a.count > 0
        return true
    else
        return false
    end
end

# SELECT COUNT(*) AS number_likes FROM likes WHERE recipe_id = 4 GROUP BY user_id;