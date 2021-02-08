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
    public class FacultadesController : ControllerBase
    {
        private readonly T28API_JWT_Ex4Context _context;

        public FacultadesController(T28API_JWT_Ex4Context context)
        {
            _context = context;
        }

        // GET: api/Facultades
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Facultad>>> GetFacultad()
        {
            return await _context.Facultad.ToListAsync();
        }

        // GET: api/Facultades/5
        [HttpGet("{Codigo}")]
        public async Task<ActionResult<Facultad>> GetFacultad(int Codigo)
        {
            var facultad = await _context.Facultad.FindAsync(Codigo);

            if (facultad == null)
            {
                return NotFound();
            }

            return facultad;
        }

        // PUT: api/Facultades/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{Codigo}")]
        public async Task<IActionResult> PutFacultad(int Codigo, Facultad facultad)
        {
            if (Codigo != facultad.Codigo)
            {
                return BadRequest();
            }

            _context.Entry(facultad).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!FacultadExists(Codigo))
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

        // POST: api/Facultades
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Facultad>> PostFacultad(Facultad facultad)
        {
            _context.Facultad.Add(facultad);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (FacultadExists(facultad.Codigo))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetFacultad", new { Codigo = facultad.Codigo }, facultad);
        }

        // DELETE: api/Facultades/5
        [HttpDelete("{Codigo}")]
        public async Task<ActionResult<Facultad>> DeleteFacultad(int Codigo)
        {
            var facultad = await _context.Facultad.FindAsync(Codigo);
            if (facultad == null)
            {
                return NotFound();
            }

            _context.Facultad.Remove(facultad);
            await _context.SaveChangesAsync();

            return facultad;
        }

        private bool FacultadExists(int Codigo)
        {
            return _context.Facultad.Any(e => e.Codigo == Codigo);
        }
    }
}
