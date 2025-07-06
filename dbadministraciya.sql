CREATE DATABASE DocumentRegistry;
GO

USE DocumentRegistry;
GO

-- �����������
CREATE TABLE Organizations (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL
);

-- ������������
CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY,
    Login NVARCHAR(50) NOT NULL,
    Password NVARCHAR(100) NOT NULL
);

-- ��������� (��������/���������)
CREATE TABLE Documents (
    Id INT PRIMARY KEY IDENTITY,
    Number NVARCHAR(50) NOT NULL,
    Date DATE NOT NULL,
    Sender NVARCHAR(100),
    Recipient NVARCHAR(100),
    Name NVARCHAR(200) NOT NULL,
    ExecutionDate DATE,
    IsIncoming BIT NOT NULL, -- 1 ��� ��������, 0 ��� ���������
    OrganizationId INT REFERENCES Organizations(Id)
);

-- ���������/����������
CREATE TABLE Resolutions (
    Id INT PRIMARY KEY IDENTITY,
    DocumentId INT REFERENCES Documents(Id),
    ResolutionText NVARCHAR(500),
    Result NVARCHAR(200),
    ExecutionDate DATE
)
INSERT INTO Organizations (Name) VALUES 
('������������� ����������� ������'),
('��� "���������"');

INSERT INTO Users (Login, Password) VALUES 
('admin', '12345'),
('user1', 'pass1');

INSERT INTO Documents (Number, Date, Sender, Recipient, Name, ExecutionDate, IsIncoming, OrganizationId) VALUES
('��-001', '2025-05-01', '�������� ��', '�������������', '����������� � ��������', '2025-06-01', 1, 1),
('��-001', '2025-05-02', '�������������', '��� "���������"', '������� ��������', NULL, 0, 1);