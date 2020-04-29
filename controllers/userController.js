const Sequelize = require("sequelize");
const config = require("../configs/database");
const bcrypt = require("bcrypt");

const userController = {
  /* 
  index,
    //metodo principal
  show,
    //serve para exibir um unico usuario/produto/post, geralmente recebe um id
  create,
    //exibe o formulario para criar um usario/post/produto
  store,
    //grava as infos do form do create
  edit,
    //exibe o form de edição
  update,
    //salva as infos do edit
  destroy
    //exclusão
*/

  create: (_req, res) => res.render("auth/register"),
  //padrao: _req informa que não será usada, mas precisa estar lá

  store: async (req, res) => {
    const { name, username, email, password } = req.body;
    const con = new Sequelize(config);
      //cria a conexao
    const hashPassword = bcrypt.hashSync(password, 10);
      //padroa: usar uma nova const com o hash

    const user = await con.query(
      "INSERT INTO users (name, username, email , password, create_at, update_at) values (:name, :username, :email, :password, :create_at, :update_at)",
      //: pois serao passados pelo replacements
      {
        replacements: {
          name,
          username,
          email,
          password: hashPassword,
          create_at: new Date(),
          update_at: new Date(),
        },
        type: Sequelize.QueryTypes.INSERT,
      }
      //inserte retorna um array, 1 deu certo, 0 ruim
    );
    if (!user) {
      return res.render("auth/register", {
        msg: "Erro ao cadastrar um usuario",
      });
    }

    return res.redirect("/home");
  },
};

module.exports = userController;
