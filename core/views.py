# views.py
from django.shortcuts import render
from .models import Flavor  # Import the Flavor model

# Existing 'home' view with database integration
def home(request):
    flavors = Flavor.objects.all()  # Fetch all flavor objects from the database
    print(flavors)  # Debugging: print the QuerySet to the console
    context = {
        'home': 'active',
        'flavors': flavors  # Add flavors to the context
    }
    return render(request, 'core/home.html', context)

# Existing 'contact' view without changes
def contact(request):
    context = {'contact': 'active'}
    return render(request, 'core/contact.html', context)
