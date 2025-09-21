// Espera a que el DOM esté listo
document.addEventListener("DOMContentLoaded", () => {
    // Activar animaciones suaves en botones
    const buttons = document.querySelectorAll(".cta-button, .btn");
    buttons.forEach(btn => {
        btn.addEventListener("mouseenter", () => {
            btn.style.transform = "scale(1.03)";
        });
        btn.addEventListener("mouseleave", () => {
            btn.style.transform = "scale(1)";
        });
    });

    // Mostrar alerta si el usuario intenta acceder a publicar sin estar logueado (simulado)
    const publishLink = document.querySelector('a[href="publish.html"]');
    if (publishLink) {
        publishLink.addEventListener("click", (e) => {
            const loggedIn = false; // Simulación: cambiar cuando tengas login real
            if (!loggedIn) {
                e.preventDefault();
                alert("Debes iniciar sesión para publicar un sueño.");
            }
        });
    }

    // Mensaje de bienvenida en index.html
    if (document.title.includes("Inicio")) {
        console.log("Bienvenido a DreamFile. Que tus sueños encuentren su voz.");
    }
});