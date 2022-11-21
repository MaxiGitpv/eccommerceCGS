import app from "./app.js"
import {sequelize} from './database/database.js'



async function main(){
    try {
        await sequelize.sync({force: false })
        console.log('Coneccion has been estableshed okkk')
    app.listen("5000", console.log("server at runing on port 5000"))
    } catch (error) {
        console.log(error )
    }
}

main()