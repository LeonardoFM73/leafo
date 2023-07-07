from sqlalchemy import create_engine
from sqlalchemy import text
# or from sqlalchemy.sql import text

engine = create_engine('mysql://root:@localhost:3306/leafo', echo=True)

with engine.connect() as con:
    with open("leafo2.sql") as file:
        query = text(file.read())
        con.execute(query)