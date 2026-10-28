CREATE DATABASE petsBlend;
use petsBlend;

CREATE TABLE tutor(
	id INT primary key AUTO_INCREMENT NOT NULL,
	nome varchar(55) NOT NULL,
    telefone varchar(55) NOT NULL,
    email varchar(100) NOT NULL,
    cpf varchar(11) NOT NULL,
    endereco varchar(150) NOT NULL
);

CREATE TABLE pet(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_tutor_fk INT NOT NULL,
    nome varchar(60) NOT NULL,
    especie varchar(55) NOT NULL,
    raca varchar(55) NOT NULL,
    idade int NOT NULL,
    FOREIGN KEY (id_tutor_fk) REFERENCES tutor(id)
);

CREATE TABLE agendamento_servico(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_pet_fk INT NOT NULL,
	servico ENUM('banho', 'tosa', 'banho e tosa'),
    data date NOT NULL,
    horario varchar(55) NOT NULL,
    status ENUM('agendado', 'em andamento', 'concluido', 'cancelado'),
    FOREIGN KEY (id_pet_fk) REFERENCES pet(id)
);

CREATE TABLE produto(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    preco double NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE painelPetShop(
	agendamentosDia INT NOT NULL,
    totalClientes INT NOT NULL,
    FOREIGN KEY (agendamentosDia) REFERENCES agendamento_servico(id),
    FOREIGN KEY (totalClientes) REFERENCES agendamento_servico(id),
    PRIMARY KEY (agendamentosDia, totalClientes)
);