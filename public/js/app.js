// Date Picker Initialization
document.addEventListener('DOMContentLoaded', function() {
    // Set minimum date for check-in to today
    const checkInInput = document.getElementById('check_in');
    const checkOutInput = document.getElementById('check_out');
    
    if (checkInInput && checkOutInput) {
        const today = new Date().toISOString().split('T')[0];
        checkInInput.min = today;
        
        checkInInput.addEventListener('change', function() {
            checkOutInput.min = this.value;
            if (checkOutInput.value && checkOutInput.value < this.value) {
                checkOutInput.value = this.value;
            }
        });
    }
});

// Price Calculator
function calculatePrice(checkIn, checkOut, pricePerNight) {
    if (!checkIn || !checkOut) return 0;
    
    const start = new Date(checkIn);
    const end = new Date(checkOut);
    const nights = Math.ceil((end - start) / (1000 * 60 * 60 * 24));
    
    return nights * pricePerNight;
}

// Form Validation
function validateBookingForm() {
    const form = document.getElementById('bookingForm');
    if (!form) return;
    
    form.addEventListener('submit', function(e) {
        const checkIn = document.getElementById('check_in').value;
        const checkOut = document.getElementById('check_out').value;
        
        if (!checkIn || !checkOut) {
            e.preventDefault();
            alert('Please select both check-in and check-out dates');
            return;
        }
        
        if (new Date(checkOut) <= new Date(checkIn)) {
            e.preventDefault();
            alert('Check-out date must be after check-in date');
            return;
        }
    });
}

// Image Gallery
function initImageGallery() {
    const gallery = document.querySelector('.property-gallery');
    if (!gallery) return;
    
    const mainImage = gallery.querySelector('.main-image');
    const thumbnails = gallery.querySelectorAll('.thumbnail');
    
    thumbnails.forEach(thumb => {
        thumb.addEventListener('click', function() {
            const newSrc = this.getAttribute('data-src');
            mainImage.src = newSrc;
            
            thumbnails.forEach(t => t.classList.remove('active'));
            this.classList.add('active');
        });
    });
}

// Search Form
function initSearchForm() {
    const searchForm = document.querySelector('.search-form');
    if (!searchForm) return;
    
    searchForm.addEventListener('submit', function(e) {
        const location = document.getElementById('location').value;
        const checkIn = document.getElementById('check_in').value;
        const checkOut = document.getElementById('check_out').value;
        
        if (!location && !checkIn && !checkOut) {
            e.preventDefault();
            alert('Please enter at least one search criteria');
        }
    });
}

// Initialize all functions
document.addEventListener('DOMContentLoaded', function() {
    validateBookingForm();
    initImageGallery();
    initSearchForm();
});

// Loading Spinner
function showSpinner() {
    const spinner = document.createElement('div');
    spinner.className = 'spinner';
    document.body.appendChild(spinner);
}

function hideSpinner() {
    const spinner = document.querySelector('.spinner');
    if (spinner) {
        spinner.remove();
    }
}

// AJAX Form Submission
function submitFormAjax(form, successCallback) {
    showSpinner();
    
    fetch(form.action, {
        method: form.method,
        body: new FormData(form),
        headers: {
            'X-Requested-With': 'XMLHttpRequest'
        }
    })
    .then(response => response.json())
    .then(data => {
        hideSpinner();
        if (successCallback) {
            successCallback(data);
        }
    })
    .catch(error => {
        hideSpinner();
        console.error('Error:', error);
        alert('An error occurred. Please try again.');
    });
}

// Responsive Navigation
function initResponsiveNav() {
    const navToggle = document.querySelector('.navbar-toggler');
    const navCollapse = document.querySelector('.navbar-collapse');
    
    if (navToggle && navCollapse) {
        navToggle.addEventListener('click', function() {
            navCollapse.classList.toggle('show');
        });
        
        // Close menu when clicking outside
        document.addEventListener('click', function(e) {
            if (!navCollapse.contains(e.target) && !navToggle.contains(e.target)) {
                navCollapse.classList.remove('show');
            }
        });
    }
}

// Initialize responsive navigation
document.addEventListener('DOMContentLoaded', initResponsiveNav); 