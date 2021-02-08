using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace T28_API_JWT_Ex4.Models
{
    public partial class T28API_JWT_Ex4Context : DbContext
    {

        public T28API_JWT_Ex4Context(DbContextOptions<T28API_JWT_Ex4Context> options)
            : base(options)
        {
        }

        public virtual DbSet<Equipos> Equipos { get; set; }
        public virtual DbSet<Facultad> Facultad { get; set; }
        public virtual DbSet<Investigadores> Investigadores { get; set; }
        public virtual DbSet<Reserva> Reserva { get; set; }
        public virtual DbSet<UserInfo> UserInfo { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Equipos>(entity =>
            {
                entity.HasKey(e => e.NumSerie)
                    .HasName("PK__Equipos__63AD4263F2FE0521");

                entity.Property(e => e.NumSerie)
                    .HasMaxLength(4)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.Nombre).HasMaxLength(100);

                entity.HasOne(d => d.FacultadNavigation)
                    .WithMany(p => p.Equipos)
                    .HasForeignKey(d => d.Facultad)
                    .HasConstraintName("FK__Equipos__Faculta__3C69FB99");
            });

            modelBuilder.Entity<Facultad>(entity =>
            {
                entity.HasKey(e => e.Codigo)
                    .HasName("PK__Facultad__06370DAD48D72703");

                entity.Property(e => e.Codigo).ValueGeneratedNever();

                entity.Property(e => e.Nombre).HasMaxLength(100);
            });

            modelBuilder.Entity<Investigadores>(entity =>
            {
                entity.HasKey(e => e.Dni)
                    .HasName("PK__Investig__C035B8DCE78D31B2");

                entity.Property(e => e.Dni)
                    .HasColumnName("DNI")
                    .HasMaxLength(8)
                    .IsUnicode(false);

                entity.Property(e => e.NomApels).HasMaxLength(255);

                entity.HasOne(d => d.FacultadNavigation)
                    .WithMany(p => p.Investigadores)
                    .HasForeignKey(d => d.Facultad)
                    .HasConstraintName("FK__Investiga__Facul__3D5E1FD2");
            });

            modelBuilder.Entity<Reserva>(entity =>
            {
                entity.HasKey(e => new { e.Dni, e.NumSerie });

                entity.Property(e => e.Dni)
                    .HasColumnName("DNI")
                    .HasMaxLength(8)
                    .IsUnicode(false);

                entity.Property(e => e.NumSerie)
                    .HasMaxLength(4)
                    .IsUnicode(false)
                    .IsFixedLength();

                entity.Property(e => e.Comienzo).HasColumnType("datetime");

                entity.Property(e => e.Fin).HasColumnType("datetime");

                entity.HasOne(d => d.DniNavigation)
                    .WithMany(p => p.Reserva)
                    .HasForeignKey(d => d.Dni)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Reserva__DNI__3E52440B");

                entity.HasOne(d => d.NumSerieNavigation)
                    .WithMany(p => p.Reserva)
                    .HasForeignKey(d => d.NumSerie)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Reserva__NumSeri__3F466844");
            });

            modelBuilder.Entity<UserInfo>(entity =>
            {
                entity.HasKey(e => e.UserId)
                    .HasName("PK__UserInfo__1788CC4C2919D122");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.UserName)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
