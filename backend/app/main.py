import os

import psycopg2
from fastapi import FastAPI

app = FastAPI(title="Secure Full-Stack Application")


@app.get("/")
def root():
    return {
        "message": "Secure Full-Stack Application",
        "status": "running"
    }


@app.get("/health")
def health():
    return {"status": "healthy"}


@app.get("/db-test")
def db_test():
    try:
        connection = psycopg2.connect(
            host=os.getenv("DB_HOST", "database"),
            port=os.getenv("DB_PORT", "5432"),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD"),
            dbname=os.getenv("DB_NAME"),
        )

        connection.close()

        return {"status": "database connected"}

    except Exception as error:
        return {
            "status": "database connection failed",
            "error": str(error),
        }
