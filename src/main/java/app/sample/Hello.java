package app.sample;

import static spark.Spark.get;

public class Hello {
    public static void main(String[] args) {
        get("/", (req, res) -> "Dead Simple REST Api Implementation !");
        get("/hello", (req, res) -> "hello from spark !");
    }
}
