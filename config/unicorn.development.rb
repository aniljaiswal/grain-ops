# Ansible managed: /Users/anil/Code/grain/opstracker/railsbox/ansible/roles/unicorn/templates/unicorn.rb.j2 modified on 2017-01-19 13:45:04 by anil on anil-macbook.local

working_directory '/rails'

pid '/tmp/rails/unicorn.development.pid'

stderr_path '/rails/log/unicorn.err.log'
stdout_path '/rails/log/unicorn.log'

listen '/tmp/unicorn.development.sock'

worker_processes 2

timeout 30
