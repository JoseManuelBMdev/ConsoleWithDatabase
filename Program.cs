using System;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Hola, mundo desde el método Main!");

        using (var dbContext = new AplicationDbContext())
        {
            // Aquí puedes escribir el código para realizar operaciones CRUD en la base de datos

             // Crear un nuevo usuario
            var newUser = new User
            {
                name = "John",
                last_name = "Doe",
                email = "john.doe@example.com",
                password = "12345678"
            };
            dbContext.Users.Add(newUser);
            dbContext.SaveChanges();
            Console.WriteLine("Usuario creado con éxito.");
        }
    }
}
