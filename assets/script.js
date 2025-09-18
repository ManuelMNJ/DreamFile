// Animación simple al hacer scroll
document.addEventListener('scroll', () => {
    const scrollPosition = window.scrollY;
    const hero = document.querySelector('.hero');
    hero.style.backgroundPositionY = `${scrollPosition * 0.5}px`;
});

// Formulario de contacto (demo)
const contactForm = document.getElementById('contactForm');
contactForm.addEventListener('submit', e => {
    e.preventDefault();
    alert('¡Gracias por tu mensaje! Nos pondremos en contacto pronto.');
    contactForm.reset();
});
