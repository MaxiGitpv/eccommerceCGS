import app from "./app.js"
import {sequelize} from './database/database.js'


const port = process.env.PORT || 5000


async function main(){
    
    try {
        await sequelize.sync({force: false })
        console.log('Coneccion has been estableshed okokok')
    app.listen(port, console.log("server at runing on port", port))
    } catch (error) {
        console.log(error )
    }
}

main()