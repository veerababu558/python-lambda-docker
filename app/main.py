from fastapi import FastAPI
import mangum

app = FastAPI()

@app.get("/hello")
def hello():
    return {"message": "Hello from FastAPI on Lambda V2 !"}

# Lambda handler
handler = mangum.Mangum(app)

