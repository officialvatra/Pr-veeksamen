CREATE TABLE Users (
    UserID INT AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Password VARCHAR(100),
    Role ENUM('Admin', 'User'),
    PRIMARY KEY(UserID)
);

CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT,
    CategoryName ENUM('Faktura', 'Support', 'Vedlikehold', 'Programvarelisens'),
    PRIMARY KEY(CategoryID)
);

CREATE TABLE Tickets (
    TicketID INT AUTO_INCREMENT,
    UserID INT,
    CategoryID INT,
    Description TEXT,
    Status ENUM('Open', 'Closed'),
    PRIMARY KEY(TicketID),
    FOREIGN KEY(UserID) REFERENCES Users(UserID),
    FOREIGN KEY(CategoryID) REFERENCES Categories(CategoryID)
);
