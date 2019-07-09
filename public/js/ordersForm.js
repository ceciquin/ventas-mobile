/**
 * Evento que se activa cuando hace click en botón 'Enviar'
 */
var btn = document.getElementById('btn');
btn.addEventListener('click', validateForm);

function multiplicar(){
  m1 = document.getElementById("precioproducto").value;
  m2 = document.getElementById("cantidadproducto").value;
  r = m1*m2;
  document.getElementById("totalproducto").value = r;
}
