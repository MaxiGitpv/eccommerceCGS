import express from 'express';
import usersRouter from "./routes/users.routes.js"

const app = express()

// middleware
app.use(express.json())

app.get("/",(req, res) => {
    res.json({message: "Evethin is succesfull!!"})
} )

app.use(usersRouter)

export default app