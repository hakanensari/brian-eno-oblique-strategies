# frozen_string_literal: true

strategies = File.read('strategies.txt').split("\n")
run -> _ { [200, { 'Content-Type' => 'text/plain' }, [strategies.sample]] }
