class AuthenticationController < ApplicationController
    # skip_before_action :authenticate, only: [:login]
    
    def login
        binding.break
    end
end
