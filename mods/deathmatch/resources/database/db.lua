local db
outputDebugString("Trying to connect db")

addEventHandler("onResourceStart", resourceRoot, function()
    db = dbConnect("mysql", "dbname=s3079114_global;host=15.235.181.136;charset=utf8", "u3079114_m9OfDMH0W5", "^X^yvStuv4ie8MDdXb=!g0Io")
    
    if db then
        outputDebugString("Success: Connected to the MySQL database server")
    else
        outputDebugString("Error: Failed to connect to the MySQL database server")
    end
end)

function GetConnection()
    return db
end
