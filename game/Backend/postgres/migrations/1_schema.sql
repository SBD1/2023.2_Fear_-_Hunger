CREATE TABLE regiao (
    idRegiao SERIAL PRIMARY KEY,
    nomeR VARCHAR(50) NOT NULL,
    descricao TEXT DEFAULT '',
	tranca bool DEFAULT FALSE,
    imgTexto TEXT DEFAULT ''
);


CREATE TABLE local (
  idLocal SERIAL PRIMARY KEY,
  idRegiao SERIAL REFERENCES regiao(idRegiao),
  nomeL VARCHAR(25) NOT NULL,
  imgTexto TEXT DEFAULT ''
);


-- Tabela de Personagens
CREATE TABLE personagem (
    id_personagem SERIAL PRIMARY KEY,
    idLocal INTEGER REFERENCES local(idLocal) DEFAULT 1, -- Relação com a tabela Local
    nome VARCHAR(50) NOT NULL,
    dinheiro INTEGER NOT NULL DEFAULT 0,
    tipoP VARCHAR(25), -- Tipo de personagem
    atq INTEGER, -- Ataque
    agilidade INTEGER, -- Agilidade
    defesaM INTEGER, -- Defesa mágica
    defesa INTEGER -- Defesa física
);


CREATE TABLE personagem_jogavel (
    id_personagem SERIAL PRIMARY KEY,
    hpAtual INTEGER,
    hpMax INTEGER,
    menteAtual INTEGER,
    menteMax INTEGER,
    arma TEXT,
    armadura TEXT,
    acessorio1 TEXT,
    acessorio2 TEXT
    -- Assumindo que as colunas acessorio1 e acessorio2 estão relacionadas a outra tabela, 
    -- você poderia precisar de chaves estrangeiras aqui.
);


CREATE TABLE inventario (
    id_personagem SERIAL PRIMARY KEY,
    dinAtual INTEGER NOT NULL DEFAULT 0,
    dinMax INTEGER NOT NULL DEFAULT 100,
    capAtual INTEGER NOT NULL DEFAULT 0,
    capTotal INTEGER NOT NULL DEFAULT 50,
    FOREIGN KEY (id_personagem) REFERENCES personagem_jogavel (id_personagem) ON DELETE CASCADE
);


CREATE TABLE personagem_nao_jogavel (
    id_personagem SERIAL PRIMARY KEY,
    descricao TEXT,
    fala TEXT,
    imgTexto TEXT,
    tipoPnj TEXT -- Supondo que 'tipoPnj' seja um texto que descreve o tipo do PNJ
    -- Se 'tipoPnj' for uma chave estrangeira para outra tabela, você precisará adicionar a chave estrangeira aqui.
);