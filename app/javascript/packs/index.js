import Particles from 'particlesjs'
import 'bulma'
window.onload = function() {
    Particles.init({
        selector: '.background',
        maxParticles: 1000
    });
};