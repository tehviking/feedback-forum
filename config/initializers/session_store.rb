# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_feedback_app_session',
  :secret      => '99228e1b8ac1cedb3ab56c12c7af67fbc4e800a9fbc4ff941a03170243ea574f548dd855cccfeeb5d299585897d7ae56385aa133ec5ba77a808a25afa4ed15ce'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
