import getDBConnection from "./getDBConnection.js";

export const getItemPersonagem = async () => {
  const query = "SELECT * FROM personagem";
  return await getDBConnection(query);
};

export const postNewPersonagem = async () => {
  const query =
    "INSERT INTO personagem(alma, local, tipoP) VALUES (6, 1006, 2);";
  return await getDBConnection(query);
};

export const getPersonagensPorLocal = async (idLocal) => {
  const query = `SELECT * FROM personagem WHERE idLocal = ${idLocal};`;
  return await getDBConnection(query);
};
