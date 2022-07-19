from fastapi import FastAPI
from faker import Faker

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/employeeDetails/{total}")
async def return_employees(total: int):
    result = []
    data_generator = Faker()
    for i in range(min(total,200)):
        val = {}
        val["name"] = data_generator.name()
        val["job"] = data_generator.job()
        val["location"] = data_generator.location_on_land()
        result.append(val)
    return result

@app.get("/healthcheck")
async def health_check():
    return "healthy"
