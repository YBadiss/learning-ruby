require 'sqlite3'

DATABASE = "kiddo.db"

def set_names(user:, names:)
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

def get_names_by_user(selected_user: nil)
  SQLite3::Database.new( DATABASE ) do |db|
    _fetch_names_by_user().each do |user, names|
      if selected_user.nil? or selected_user == user
        yield user, names
      end
    end
  end
end

def _fetch_names_by_user
  SQLite3::Database.new( DATABASE ) do |db|
    cursor = db.execute( "SELECT user, name FROM name_ideas;")
    result = Hash.new { Array.new }
    cursor.map { |row| result[row[0]] += [row[1]]}
    return result
  end
end
