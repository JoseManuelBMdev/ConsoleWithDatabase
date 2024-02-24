using Microsoft.EntityFrameworkCore;

public class AplicacionDB : DbContext
{
    public DbSet<users> users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseMySQL("3306;database=shp1p;user=usuario;password=");
    }
}
