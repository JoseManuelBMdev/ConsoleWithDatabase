using Microsoft.EntityFrameworkCore;
using Pomelo.EntityFrameworkCore.MySql.Infrastructure;


public class AplicationDbContext : DbContext
{
    public DbSet<User> Users { get; set; }
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var serverVersion = new MariaDbServerVersion(new Version(10, 3, 16)); // Especifica la versión de tu servidor MySQL
        optionsBuilder.UseMySql("server=localhost;port=3306;database=shp1p;user=root;password=", 
        new MariaDbServerVersion(serverVersion));
    }

}
