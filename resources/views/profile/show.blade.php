@extends('layouts.app')

@section('content')
<div class="container-fluid px-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-white py-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <h2 class="mb-0">My Profile</h2>
                        <a href="{{ route('profile.edit') }}" class="btn btn-primary">
                            <i class="fas fa-edit me-1"></i> Edit Profile
                        </a>
                    </div>
                </div>
                <div class="card-body">
                    @if(session('success'))
                        <div class="alert alert-success">
                            {{ session('success') }}
                        </div>
                    @endif

                    <div class="row">
                        <div class="col-md-4 text-center mb-4">
                            <div class="profile-image-container">
                                <img src="{{ $user->profile_image ? asset($user->profile_image) : asset('assets/images/default-profile.jpg') }}" 
                                     alt="Profile Image" 
                                     class="rounded-circle img-fluid"
                                     style="width: 200px; height: 200px; object-fit: cover;">
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="profile-details">
                                <div class="mb-4">
                                    <h4 class="text-muted mb-3">Personal Information</h4>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label text-muted">Full Name</label>
                                            <p class="fw-bold">{{ $user->name }}</p>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label text-muted">Email Address</label>
                                            <p class="fw-bold">{{ $user->email }}</p>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label text-muted">Phone Number</label>
                                            <p class="fw-bold">{{ $user->phone ?? 'Not provided' }}</p>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label text-muted">Address</label>
                                            <p class="fw-bold">{{ $user->address ?? 'Not provided' }}</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-4">
                                    <h4 class="text-muted mb-3">Account Information</h4>
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label text-muted">Member Since</label>
                                            <p class="fw-bold">{{ $user->created_at->format('F d, Y') }}</p>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label text-muted">Last Updated</label>
                                            <p class="fw-bold">{{ $user->updated_at->format('F d, Y') }}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .profile-image-container {
        position: relative;
        margin-bottom: 1rem;
    }
    .profile-details label {
        font-size: 0.9rem;
    }
    .profile-details p {
        margin-bottom: 0;
    }
</style>
@endsection 