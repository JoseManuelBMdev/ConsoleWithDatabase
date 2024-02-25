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
            //
            // // Leer todos los usuarios
            // var allUsers = dbContext.Users.ToList();
            // Console.WriteLine("Todos los usuarios:");
            // foreach (var user in allUsers)
            // {
            //     Console.WriteLine($"ID: {user.id}, Nombre: {user.name}, Apellido: {user.last_name}, Email: {user.email}");
            // }

            // // Actualizar un usuario existente
            // var userToUpdate = dbContext.Users.FirstOrDefault(u => u.name == "John");
            // if (userToUpdate != null)
            // {
            //     userToUpdate.last_name = "Smith";
            //     dbContext.SaveChanges();
            //     Console.WriteLine("Usuario actualizado con éxito.");
            // }
            // else
            // {
            //     Console.WriteLine("Usuario no encontrado para actualizar.");
            // }

            // // Eliminar un usuario existente
            // var userToDelete = dbContext.Users.FirstOrDefault(u => u.name == "John");
            // if (userToDelete != null)
            // {
            //     dbContext.Users.Remove(userToDelete);
            //     dbContext.SaveChanges();
            //     Console.WriteLine("Usuario eliminado con éxito.");
            // }
            // else
            // {
            //     Console.WriteLine("Usuario no encontrado para eliminar.");
            // }
        }
    }
}
