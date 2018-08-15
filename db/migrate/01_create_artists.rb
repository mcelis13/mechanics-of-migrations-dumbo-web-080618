class CreateArtists < ActiveRecord::Migration

  connection = ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/artists.sqlite"
  );

  sql = <<-SQL
    CREATE TABLE IF NOT EXISTS artists (
    id INTEGER PRIMARY KEY,
    name TEXT,
    genre TEXT,
    age INTEGER,
    hometown TEXT
  );
  SQL

  ActiveRecord::Base.connection.execute(sql);

  #primary way of writing migrations
  def change
    create_table :artists do |t|
      t.string :name
      t.string :genre
      t.integer :age
      t.string :hometown
    end
  end

end
