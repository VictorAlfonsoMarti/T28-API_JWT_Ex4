using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using T28_API_JWT_Ex4.Models;

namespace T28_API_JWT_Ex4.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ReservasController : ControllerBase
    {
        private readonly T28API_JWT_Ex4Context _context;

        public ReservasController(T28API_JWT_Ex4Context context)
        {
            _context = context;
        }

        // GET: api/Reservas
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Reserva>>> GetReserva()
        {
            return await _context.Reserva.ToListAsync();
        }

        // GET: api/Reservas/12345678:3
        [HttpGet("{DNI}:{NumSerie}")]
        public async Task<ActionResult<Reserva>> GetReserva(string DNI, string NumSerie)
        {
            var reserva = await _context.Reserva.FindAsync(DNI, NumSerie);

            if (reserva == null)
            {
                return NotFound();
            }

            return reserva;
        }

        // PUT: api/Reservas/12345678:3
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{DNI}:{NumSerie}")]
        public async Task<IActionResult> PutReserva(string DNI, string NumSerie, Reserva reserva)
        {
            if (DNI != reserva.Dni && NumSerie != reserva.NumSerie)
            {
                return BadRequest();
            }

            _context.Entry(reserva).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ReservaDNIExists(DNI) || !ReservaNumSerieExists(NumSerie))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Reservas
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Reserva>> PostReserva(Reserva reserva)
        {
            _context.Reserva.Add(reserva);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (ReservaDNIExists(reserva.Dni) && ReservaNumSerieExists(reserva.NumSerie))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetReserva", new { DNI = reserva.Dni }, reserva);
        }

        // DELETE: api/Reservas/12345678:3
        [HttpDelete("{DNI}:{NumSerie}")]
        public async Task<ActionResult<Reserva>> DeleteReserva(string DNI, string NumSerie)
        {
            var reserva = await _context.Reserva.FindAsync(DNI, NumSerie);
            if (reserva == null)
            {
                return NotFound();
            }

            _context.Reserva.Remove(reserva);
            await _context.SaveChangesAsync();

            return reserva;
        }

        private bool ReservaDNIExists(string DNI)
        {
            return _context.Reserva.Any(e => e.Dni == DNI);
        }
        private bool ReservaNumSerieExists(string NumSerie)
        {
            return _context.Reserva.Any(e => e.NumSerie == NumSerie);
        }
    }
}
