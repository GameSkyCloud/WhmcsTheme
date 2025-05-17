// Game Hosting Homepage Script
document.addEventListener('DOMContentLoaded', function() {
  // Initialize particles.js
  particlesJS("particles-js", { particles: { number: { value: 60, 
        density: {
          enable: true, value_area: 800
        }
      },
      color: { value: "#ffffff" }, shape: { type: "circle", stroke: { 
        width: 0, color: "#000000" }
      },
      opacity: { value: 0.5, random: false
      },
      size: { value: 3, random: true
      },
      line_linked: { enable: true, distance: 150, color: "#ffffff", 
        opacity: 0.4, width: 1
      },
      move: { enable: true, speed: 2, direction: "none", random: false, 
        straight: false, out_mode: "out", bounce: false
      }
    },
    interactivity: { detect_on: "canvas", events: { onhover: { enable: 
        true, mode: "repulse" }, onclick: { enable: true, mode: "push" 
        },
        resize: true
      },
      modes: { repulse: { distance: 100, duration: 0.4 }, push: { 
        particles_nb: 4 }
      }
    },
    retina_detect: true
  });
  // Initialize variables
  const isMobile = 
  /iPhone|iPad|iPod|Android/i.test(navigator.userAgent); const modal = 
  document.getElementById("slideshow-modal"); const videoElement = 
  document.getElementById("slideshow-video"); const sourceElement = 
  videoElement?.querySelector("source"); let currentAudio = null; let 
  currentCard = null; let audioUnlocked = false;
  // Function to unlock audio
  function unlockAudio() { const interactionElement = 
    document.getElementById('hidden-interaction');
    
    // Try to play a silent audio
    const silentAudio = new 
    Audio('data:audio/wav;base64,UklGRl9vT19XQVZFZm10IBAAAAABAAEAQB8AAEAfAAABAAgAZGF0YU...'); 
    silentAudio.volume = 0;
    
    function attemptPlay() { silentAudio.play() .then(() => { 
          console.log('Áudio desbloqueado com sucesso'); audioUnlocked = 
          true; silentAudio.pause(); silentAudio.currentTime = 0;
        })
        .catch(e => { console.log('Falha ao desbloquear áudio:', e);
        });
    }
    // Simulate interaction events
    if (interactionElement) { ['click', 'touchstart'].forEach(event => { 
        interactionElement.dispatchEvent(new MouseEvent(event, {
          bubbles: true, cancelable: true, view: window
        }));
      });
    }
    setTimeout(attemptPlay, 100);
  }
  // Function to play audio with fallback
  function playAudio(audioFile) { if (currentAudio) { 
      currentAudio.pause(); currentAudio.currentTime = 0;
    }
    
    currentAudio = new Audio(audioFile); currentAudio.volume = 0.4;
    
    if (audioUnlocked) { currentAudio.play().catch(e => 
      console.log('Erro ao reproduzir áudio:', e));
    } else {
      const fallback = () => { currentAudio.play() .then(() => 
          document.removeEventListener('click', fallback)) .catch(e => 
          console.log('Erro ao reproduzir áudio:', e));
      };
      document.addEventListener('click', fallback);
    }
  }
  // Functions to show/hide preview
  function showPreview(card) { if (currentCard === card || !modal || 
    !videoElement || !sourceElement) return;
    
    const audioFile = card.dataset.audio; const gameName = 
    card.querySelector("p")?.textContent.trim().toLowerCase().replace(/[^a-z0-9]/gi, 
    '-');
    
    // Construct video path using template variables
    const videoPath = `${audioFile.replace('/audio/', 
    '/videos/').replace('.mp3', '.mp4')}`;
    
    sourceElement.src = videoPath; videoElement.load();
    
    if (isMobile) { modal.style.width = '95vw'; modal.style.maxWidth = 
      'none';
    }
    
    modal.style.display = "block"; playAudio(audioFile); currentCard = 
    card;
  }
  function hidePreview(card) { if (currentCard !== card || !modal || 
    !videoElement) return; modal.style.display = "none"; 
    videoElement.pause(); videoElement.currentTime = 0; if 
    (currentAudio) {
      currentAudio.pause(); currentAudio.currentTime = 0;
    }
    currentCard = null;
  }
  // Event listeners for game cards
  document.querySelectorAll(".server-card").forEach(card => { if 
    (isMobile) {
      card.addEventListener("click", () => { showPreview(card); 
        setTimeout(() => hidePreview(card), 6000);
      });
    } else {
      card.addEventListener("mouseenter", () => showPreview(card)); 
      card.addEventListener("mouseleave", () => {
        setTimeout(() => { if (!card.matches(":hover") && 
          !modal?.matches(":hover")) {
            hidePreview(card);
          }
        }, 100);
      });
    }
  });
  // Event listener for modal
  modal?.addEventListener("mouseleave", () => { if 
    (!currentCard?.matches(":hover")) {
      hidePreview(currentCard);
    }
  });
  // Image carousel
  const images = document.querySelectorAll('.carousel-image'); const 
  texts = document.querySelectorAll('.slide-text'); let currentIndex = 
  0; const slideInterval = 6000; function showSlide(index) {
    images.forEach((img, i) => img.classList.toggle('active', i === 
    index)); texts.forEach((text, i) => text.classList.toggle('active', 
    i === index));
  }
  function nextSlide() { currentIndex = (currentIndex + 1) % 
    images.length; showSlide(currentIndex);
  }
  setInterval(nextSlide, slideInterval);
  // FAQ Accordion
  document.querySelectorAll('.faq-question').forEach(btn => { 
    btn.addEventListener('click', function() {
      const item = this.parentElement; const isOpening = 
      !item.classList.contains('open');
      
      document.querySelectorAll('.faq-item.open').forEach(openItem => { 
        if (openItem !== item) {
          openItem.classList.remove('open'); void openItem.offsetHeight;
        }
      });
      
      item.classList.toggle('open', isOpening);
    });
  });
  // Initialize audio
  unlockAudio();
  
  // Fallback for real interaction
  document.addEventListener('click', function() { audioUnlocked = true;
  }, { once: true });
});
