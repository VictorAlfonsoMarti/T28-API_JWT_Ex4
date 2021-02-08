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
    public class InvestigadoresController : ControllerBase
    {
        private readonly T28API_JWT_Ex4Context _context;

        public InvestigadoresController(T28API_JWT_Ex4Context context)
        {
            _context = context;
        }

        // GET: api/Investigadores
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Investigadores>>> GetInvestigadores()
        {
            return await _context.Investigadores.ToListAsync();
        }

        // GET: api/Investigadores/5
        [HttpGet("{DNI}")]
        public async Task<ActionResult<Investigadores>> GetInvestigadores(string DNI)
        {
            var investigadores = await _context.Investigadores.FindAsync(DNI);

            if (investigadores == null)
            {
                return NotFound();
            }

            return investigadores;
        }

        // PUT: api/Investigadores/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{DNI}")]
        public async Task<IActionResult> PutInvestigadores(string DNI, Investigadores investigadores)
        {
            if (DNI != investigadores.Dni)
            {
                return BadRequest();
            }

            _context.Entry(investigadores).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!InvestigadoresExists(DNI))
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

        // POST: api/Investigadores
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Investigadores>> PostInvestigadores(Investigadores investigadores)
        {
            _context.Investigadores.Add(investigadores);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (InvestigadoresExists(investigadores.Dni))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetInvestigadores", new { DNI = investigadores.Dni }, investigadores);
        }

        // DELETE: api/Investigadores/5
        [HttpDelete("{DNI}")]
        public async Task<ActionResult<Investigadores>> DeleteInvestigadores(string DNI)
        {
            var investigadores = await _context.Investigadores.FindAsync(DNI);
            if (investigadores == null)
            {
                return NotFound();
            }

            _context.Investigadores.Remove(investigadores);
            await _context.SaveChangesAsync();

            return investigadores;
        }

        private bool InvestigadoresExists(string DNI)
        {
            return _context.Investigadores.Any(e => e.Dni == DNI);
        }
    }
}
