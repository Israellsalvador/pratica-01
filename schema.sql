-- Ativar chaves estrangeiras
PRAGMA foreign_keys = ON;

-- Tabela Participante
CREATE TABLE Participante (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT
);

-- Tabela Evento
CREATE TABLE Evento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    local TEXT NOT NULL,
    data TEXT NOT NULL
);

-- Tabela Inscricao (associativa)
CREATE TABLE Inscricao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_evento INTEGER NOT NULL,
    id_participante INTEGER NOT NULL,
    data_inscricao TEXT,
    status TEXT,
    FOREIGN KEY (id_evento) REFERENCES Evento(id) ON DELETE CASCADE,
    FOREIGN KEY (id_participante) REFERENCES Participante(id) ON DELETE CASCADE
);

-- Tabela Pagamento (1:1 com Inscricao)
CREATE TABLE Pagamento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_inscricao INTEGER UNIQUE,
    valor REAL,
    data_pagamento TEXT,
    status TEXT,
    FOREIGN KEY (id_inscricao) REFERENCES Inscricao(id) ON DELETE CASCADE
);

-- Inserts de exemplo
INSERT INTO Participante (nome, email, telefone) VALUES
('João Silva', 'joao@email.com', '349999999'),
('Maria Souza', 'maria@email.com', '349888888'),
('Carlos Lima', 'carlos@email.com', '349777777');

INSERT INTO Evento (nome, descricao, local, data) VALUES
('Seminário de Tecnologia', 'Discussão sobre inovação', 'Auditório Central', '2025-09-10'),
('Workshop de Banco de Dados', 'Prática com SQLite', 'Lab 2', '2025-09-15');

INSERT INTO Inscricao (id_evento, id_participante, data_inscricao, status) VALUES
(1, 1, '2025-09-01', 'confirmada'),
(1, 2, '2025-09-01', 'confirmada'),
(2, 2, '2025-09-02', 'confirmada'),
(2, 3, '2025-09-02', 'cancelada');

INSERT INTO Pagamento (id_inscricao, valor, data_pagamento, status) VALUES
(1, 100.00, '2025-09-02', 'pago'),
(2, 100.00, '2025-09-02', 'pago'),
(3, 50.00, '2025-09-03', 'pendente'),
(4, 50.00, '2025-09-03', 'estornado');
