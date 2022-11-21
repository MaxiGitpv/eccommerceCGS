
import { users } from "../models/user.js"




export const getUsers = async (req, res) => {
   try {
    const userss = await users.findAll()
    res.json(userss)
   } catch (error) {
     return res.status(400).json({messsge: error.message})
   }

}


export const createUsers = async (req, res) => {
    
    try {
        const data = req.body

     const newUser = await users.create({
        name: data.name,
        lastName: data.lastName,
        gender: data.gender,
        birthday_date: data.birthday_date
    })
    res.status(200).json(newUser)
    } catch (error) {
        return res.status(400).send({message: error.message})
    }
}

export const updateUsers = (req, res) => {
    res.send("updatting users")
}

export const deleteUsers = (req, res) => {
    res.send("deleted users")
}

export const getByUsers = (req, res) => {
    res.send("getting by users")
}