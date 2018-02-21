require 'sqlite3'

DATABASE = "kiddo.db"

def store_names(user:, names:)
  validate_names(names: names)

  SQLite3::Database.new( DATABASE ) do |db|
    db.execute( "INSERT OR IGNORE INTO users (email) VALUES (?)", user )

    db.transaction do |db|
      db.execute( "DELETE FROM name_ideas WHERE user = ?", user )
      names.each { |name|
        db.execute( "INSERT INTO name_ideas (name, user) VALUES (?, ?)", name, user )
      }
    end
  end
end

def validate_names(names:)
  raise "Expected exactly 3 names" unless names.length == 3
  raise "The names must be different" unless names.uniq!.nil?
end

def get_names(user:)
  SQLite3::Database.new( DATABASE ) do |db|
    result = db.execute( "SELECT name FROM name_ideas WHERE user = ?", user)
    return result.map { |row| row.first }
  end
end
