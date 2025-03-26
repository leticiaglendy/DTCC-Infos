create DATABASE  redeMaeAutistaBD;

USE redeMaeAutistaBD;

create table usuarios(
 id_usuario int primary key auto_increment unique, 
 email varchar(200),
 senha varchar(10)
 );
 
CREATE TABLE cadastro_Filho (
    id_Filho INT PRIMARY KEY auto_increment unique,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    sexo ENUM('Masculino', 'Feminino'),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE cadastro_responsavel (
    id_cadastro_Responsavel INT PRIMARY KEY AUTO_INCREMENT unique,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    rg VARCHAR(20) NOT NULL,
    email varchar(100),
    contato int(12),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_filho INT,
    FOREIGN KEY (id_filho) REFERENCES cadastro_Filho(id_filho) 
);

CREATE TABLE historico_medico (
    id_medico INT PRIMARY KEY AUTO_INCREMENT unique,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100) NOT NULL,
    CRM VARCHAR(20) NOT NULL UNIQUE,
    diagnostico VARCHAR(255) NOT NULL,
    data_diagnostico DATE,
    medicacao varchar (255),
	alergias varchar (255),
    doencas_cronicas varchar(255),
    tratamento varchar (255),
	sensibilidades_sensoriais varchar(255),
	nivel_comunicacao ENUM('Verbal', 'Não verbal', 'Pouco verbal', 'Usa dispositivos'),
    id_filho int,
    foreign key (id_Filho) references cadastro_Filho(id_Filho)
    );
    
    create table medicos(
	id_medico int primary key auto_increment unique,
	nome_medico varchar (255),
	especialidade varchar(255),
	CRM varchar(20),
	local_atendimento varchar(255),
    contato varchar(12),
	id_filho int,
	Foreign key (id_filho) references cadastro_filho(id_filho)
	);
    
    CREATE TABLE educacao_desenvolvimento (
     id_educacao_desenvolvimento INT PRIMARY KEY auto_increment unique,
	 escola VARCHAR(255),
	 nivel_escolaridade VARCHAR(100),
     necessidades_educacionais VARCHAR(255),
     habilidades_especiais VARCHAR(255),
	 desafios_comportamentais VARCHAR(255),
     interesses_preferidos VARCHAR(255),
	 id_filho int,
     foreign key (id_Filho) references cadastro_Filho(id_Filho)
     );
     
	CREATE TABLE dados_sociais (
    id_dados_sociais INT PRIMARY KEY auto_increment unique,
    cad_unico int(20),
    crea VARCHAR(20),
    bolsa_familia BOOLEAN,
    loas BOOLEAN,
    beneficios VARCHAR(255),
    id_Filho INT,
    foreign key (id_Filho) references cadastro_Filho(id_Filho)
    );
    
CREATE TABLE rotina_preferencias (
id_rotina_preferencia INT PRIMARY KEY auto_increment unique,
dieta_especial varchar(255),
atividades_favoritas varchar(255),
suporte_na_comunicacao varchar(255),
gatilhos_estresse varchar(255),
estrategias_acalmar varchar(255),
id_Filho INT,
foreign key (id_Filho) references cadastro_Filho(id_Filho)
);

CREATE TABLE terapia (
    id_terapia INT PRIMARY KEY auto_increment unique ,
    tipo_terapia VARCHAR(100) NOT NULL,
    data_terapia DATE NOT NULL,
    profissional VARCHAR(100),
    local_atendimento VARCHAR(255),
    presenca BOOLEAN DEFAULT FALSE,
    id_filho INT,
    FOREIGN KEY (id_filho) REFERENCES cadastro_filho(id_filho)
);

     
create table atividades (
	id int primary key auto_increment unique,
    nome_atividade varchar (255),
    data_atividade datetime,
    horario varchar (255),
    local_atividade varchar(255),
    nivel_dificuldade int,
    comentario text,
    nota int,
    id_Filho int,
    foreign key (id_Filho) references cadastro_Filho(id_Filho)
    );
    
/* login*/
INSERT INTO usuarios (email, senha) VALUES 
('lucas.tavares@email.com', 'senha123'),
('ana.pereira@email.com', 'senha456'),
('marcio.souza@email.com', 'senha789'),
('fernanda.gomes@email.com', 'senha321'),
('jose.rodrigues@email.com', 'senha654');

INSERT INTO cadastro_Filho (nome, data_nascimento, sexo) VALUES 
('João Paulo', '2015-07-18', 'Masculino'),
('Maria Fernanda', '2017-05-03', 'Feminino'),
('Pedro Henrique', '2014-08-24', 'Masculino'),
('Isabela Costa', '2016-12-10', 'Feminino'),
('Lucas Almeida', '2018-01-27', 'Masculino');

INSERT INTO cadastro_responsavel (nome, data_nascimento, endereco, cpf, rg, email, contato, id_filho) VALUES 
('Camila Tavares', '1985-03-22', 'Rua das Flores, 125', '123.456.789-10', 'MG-4567890', 'camila.tavares@email.com', 987654321, 1),
('Ricardo Pereira', '1982-10-15', 'Av. Paulista, 1200', '987.654.321-11', 'SP-6543210', 'ricardo.pereira@email.com', 123456789, 2),
('Cláudia Souza', '1990-06-30', 'Rua Nova, 45', '321.654.987-12', 'RJ-1234567', 'claudia.souza@email.com', 234567890, 3),
('Juliana Costa', '1987-11-10', 'Av. Brasil, 900', '456.789.123-13', 'SP-9876543', 'juliana.costa@email.com', 345678901, 4),
('Carlos Almeida', '1983-02-05', 'Rua do Sol, 234', '654.321.987-14', 'RJ-7654321', 'carlos.almeida@email.com', 456789012, 5);

INSERT INTO historico_medico (nome, especialidade, CRM, diagnostico, data_diagnostico, medicacao, alergias, doencas_cronicas, tratamento, sensibilidades_sensoriais, nivel_comunicacao, id_filho) VALUES 
('Dr. João Silva', 'Neurologista', 'CRM98765', 'Autismo leve', '2019-10-15', 'Risperidona', 'Nenhuma', 'Nenhuma', 'Terapia ABA', 'Luz forte', 'Pouco verbal', 1),
('Dra. Ana Lima', 'Psiquiatra', 'CRM12345', 'Autismo moderado', '2020-06-22', 'Sertralina', 'Lactose', 'Asma', 'Fonoaudiologia', 'Sons altos', 'Não verbal', 2),
('Dr. Ricardo Mendes', 'Pediatra', 'CRM23456', 'Autismo leve', '2018-09-10', 'Nenhuma', 'Poeira', 'Déficit de atenção', 'Terapia ocupacional', 'Texturas ásperas', 'Verbal', 3),
('Dra. Luana Rocha', 'Neuropediatra', 'CRM34567', 'TEA moderado', '2021-03-18', 'Quetiapina', 'Ovos', 'Epilepsia', 'Terapia cognitiva', 'Toques inesperados', 'Pouco verbal', 4),
('Dr. Marcos Oliveira', 'Psiquiatra', 'CRM45678', 'Autismo severo', '2022-01-25', 'Aripiprazol', 'Nenhuma', 'Distúrbios de sono', 'Fisioterapia', 'Ambientes movimentados', 'Usa dispositivos', 5);

INSERT INTO medicos (nome_medico, especialidade, CRM, local_atendimento, contato, id_filho) VALUES
('Dr. Carlos Oliveira', 'Neurologista', 123456, 'Clínica NeuroKids', 1122334455, 1),
('Dra. Fernanda Silva', 'Pediatra', 234567, 'Consultório Infantil', 1198765432, 2),
('Dr. Rafael Costa', 'Psiquiatra', 345678, 'Hospital de Saúde Mental', 1187654321, 3),
('Dra. Juliana Pereira', 'Oftalmologista', 456789, 'Clínica Visão Total', 1176543210, 4),
('Dr. Marcos Souza', 'Otorrinolaringologista', 567890, 'Clínica Audiovision', 1165432109, 5);


INSERT INTO educacao_desenvolvimento (escola, nivel_escolaridade, necessidades_educacionais, habilidades_especiais, desafios_comportamentais, interesses_preferidos, id_filho) VALUES 
('Escola Mirim', 'Ensino Fundamental', 'Auxílio com fala', 'Leitura rápida', 'Dificuldade em interagir com colegas', 'Desenho', 1),
('Colégio Infantil', 'Educação Infantil', 'Apoio psicológico', 'Memorização rápida', 'Ansiedade em grupo', 'Brinquedos educativos', 2),
('Instituto Aprende', 'Ensino Fundamental', 'Fonoaudiologia', 'Cálculo rápido', 'Dificuldade de concentração', 'Música', 3),
('Escola Novo Horizonte', 'Ensino Infantil', 'Terapia ocupacional', 'Habilidade manual', 'Impulsividade', 'Ciências', 4),
('Colégio Estrela', 'Educação Infantil', 'Terapia comportamental', 'Raciocínio lógico', 'Resistência a mudanças', 'Brinquedos sensoriais', 5);

INSERT INTO dados_sociais (cad_unico, crea, bolsa_familia, loas, beneficios, id_Filho) VALUES 
(12345678, 'CREA-001', TRUE, FALSE, 'Auxílio transporte', 1),
(87654321, 'CREA-002', FALSE, TRUE, 'Benefício BPC', 2),
(23456789, 'CREA-003', TRUE, FALSE, 'Cesta básica', 3),
(98765432, 'CREA-004', FALSE, FALSE, 'Nenhum', 4),
(34567890, 'CREA-005', TRUE, TRUE, 'Auxílio saúde', 5);

INSERT INTO rotina_preferencias (dieta_especial, atividades_favoritas, suporte_na_comunicacao, gatilhos_estresse, estrategias_acalmar, id_Filho) VALUES 
('Sem glúten', 'Desenho', 'PECS', 'Ambientes muito barulhentos', 'Música calma', 1),
('Sem lactose', 'Brincar com blocos', 'Libras', 'Muitas pessoas em volta', 'Pressão profunda', 2),
('Dieta comum', 'Jogos de tabuleiro', 'Cartões de comunicação', 'Mudança repentina de rotina', 'Histórias repetitivas', 3),
('Vegetariana', 'Quebra-cabeças', 'Linguagem simples', 'Sons altos', 'Exercícios de respiração', 4),
('Dieta balanceada', 'Pintura', 'Aplicativo de comunicação', 'Toques inesperados', 'Falar devagar', 5);

INSERT INTO terapia (tipo_terapia, data_terapia, profissional, local_atendimento, presenca, id_filho) VALUES 
('Terapia ABA', '2024-02-20', 'Dr. Paulo Martins', 'Clínica Terapêutica', TRUE, 1),
('Fonoaudiologia', '2024-03-12', 'Dra. Ana Paula', 'Centro Fonoaudiológico', FALSE, 2),
('Psicoterapia', '2024-03-05', 'Dr. José Silva', 'Clínica Mental', TRUE, 3),
('Terapia Ocupacional', '2024-01-28', 'Dra. Fernanda Lima', 'Instituto Saúde', TRUE, 4),
('Musicoterapia', '2024-02-10', 'Dr. Bruno Rocha', 'Centro Cultural', FALSE, 5);

INSERT INTO atividades (nome_atividade, data_atividade, horario, local_atividade, nivel_dificuldade, comentario, nota, id_Filho) VALUES 
('Pintura', '2024-03-12 14:00:00', '14:00', 'Escola Mirim', 2, 'Gostou muito de pintar', 9, 1),
('Jogos educativos', '2024-03-14 16:00:00', '16:00', 'Casa de Brinquedos', 3, 'Precisa de acompanhamento', 8, 2),
('Dança', '2024-03-15 10:00:00', '10:00', 'Centro de Reabilitação', 4, 'Bem receptivo', 10, 3),
('Quebra-cabeças', '2024-03-17 15:30:00', '15:30', 'Escola Estrela', 2, 'Excelente desempenho', 9, 4),
('Atividades sensoriais', '2024-03-18 11:00:00', '11:00', 'Centro Terapêutico', 3, 'Requer mais paciência', 7, 5);

/*Selecet para login de usuario;*/
SELECT id_usuario, email 
FROM usuarios
WHERE email = 'marcio.souza@email.com' AND senha = 'senha789';

/*listar todos os filhos cadastrados*/
SELECT id_filho, nome, data_nascimento, sexo FROM cadastro_filho;

/*Listar informações dos responsaveis cadastrados*/
SELECT id_cadastro_responsavel, nome, email, data_nascimento, cpf
FROM cadastro_responsavel 
ORDER BY nome;


/*Busca histórico médico de uma criança especifica*/
SELECT h.nome AS medicos, h.especialidade, h.diagnostico, h.data_diagnostico, 
       h.medicacao, h.alergias, h.doencas_cronicas, h.tratamento, h.nivel_comunicacao
FROM historico_medico h
JOIN cadastro_filho f ON h.id_filho = f.id_filho
WHERE f.nome = 'Isabela Costa';

/*Encontrar profissionais de saude especializados proximos*/
SELECT nome_medico, especialidade, local_atendimento, contato 
FROM medicos
WHERE especialidade IN ('Neurologista', 'Psiquiatra Infantil', 'Terapeuta Ocupacional', 'Fonoaudiólogo')
ORDER BY local_atendimento;

/*Listar atividades do dia*/
SELECT nome_atividade, horario, local_atividade
FROM atividades
WHERE id_filho = 4 AND data_atividade = CURDATE();

/*Listar todas as atividades dos ultimos 30 dias*/
SELECT nome_atividade, data_atividade, nota, comentario 
FROM atividades
WHERE id_filho = 2 AND data_atividade >= CURDATE() - INTERVAL 90 DAY;

/*Seleciona médicos que atendem um filho específico*/
SELECT nome, especialidade FROM medico WHERE id_Filho = 4;

/*Seleciona os dados do filho e do responsável*/
SELECT f.nome AS nome_filho, r.nome AS nome_responsavel
FROM cadastro_Filho f
JOIN cadastro_responsavel r ON f.id_Filho = r.id_filho;

/*Listar todas as atividades realizadas por um filho específico*/
select t.nome_atividade, t.horario, t.data_atividade, t.nota, f.nome
from cadastro_filho f
join atividades t on t.id_Filho = f.id_Filho
where f.id_filho = 5
order by t.data_atividade desc;

/*Seleciona atividades mais bem avaliadas*/
SELECT nome_atividade, nota FROM atividades
WHERE id_filho = 1 AND nota >= 6;

/*Seleciona atividades que ocorreram após uma data especifica*/
SELECT nome_atividade, data_atividade FROM atividades 
WHERE data_atividade > '2024-01-01';

/*Listar todas as terapias realizadas por uma criança especifica*/
SELECT f.nome AS filho, t.tipo_terapia, t.data_terapia, t.profissional, t.local_atendimento
FROM terapia t
JOIN cadastro_filho f ON t.id_filho = f.id_filho
WHERE f.nome = 'Isabela Costa';

/*Contar quantas terapias a criança participou*/
SELECT f.nome AS filho, COUNT(t.id_terapia) AS total_terapias
FROM terapia t
JOIN cadastro_filho f ON t.id_filho = f.id_filho
GROUP BY f.nome;

/*Lista as atividades futuras da criança*/
SELECT a.nome_atividade, a.data_atividade, a.horario, a.local_atividade, a.nivel_dificuldade
FROM atividades a
JOIN cadastro_filho f ON a.id_filho = f.id_filho
WHERE a.data_atividade >= CURDATE() AND f.nome = 'Isabela Costa';

/*Consultar atividades preferidas das criaças*/
SELECT nome_atividade, AVG(nota) AS media_nota 
FROM atividades
WHERE id_filho = 1
GROUP BY nome_atividade
ORDER BY media_nota DESC
limit 3;



