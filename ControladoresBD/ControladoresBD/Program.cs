var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configurar políticas de CORS (Permitir solicitudes desde cualquier origen).
app.UseCors(options =>
{
    options.AllowAnyOrigin(); // Esto permite solicitudes desde cualquier origen.
    options.AllowAnyMethod(); // Esto permite cualquier método HTTP (GET, POST, etc.).
    options.AllowAnyHeader(); // Esto permite cualquier encabezado en las solicitudes.
});

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
