FROM node:14

# Setăm directorul de lucru în container
WORKDIR /app

# Copiem pachetele de dependențe
COPY package*.json ./

# Instalăm dependențele
RUN npm install

# Copiem codul sursă în container
COPY . .

# Expunem un port (poți ajusta la nevoie)
EXPOSE 3000

# Comandă pentru a porni aplicația
CMD ["npm", "start"]
