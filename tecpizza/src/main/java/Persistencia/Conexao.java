package Persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://us-cdbr-east-06.cleardb.net:3306/heroku_62cc6185d251d62";
    private static final String USER = "bc9dcec6b9b82e";
    private static final String PASS = "2443bc8f";
    private static Connection cn = null;

    public static Connection criaConexao() throws SQLException {
        if (cn == null) {
            try {
                Class.forName(DRIVER);
                System.out.println("Driver foi carregado");
                cn = DriverManager.getConnection(URL, USER, PASS);
                System.out.println("Conexão realizada com sucesso!");
            } catch (ClassNotFoundException e) {
                System.out.println("Driver não foi localizado!");
            }
        }
        return cn;
    }
}
