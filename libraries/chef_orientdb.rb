class Chef
	module Orientdb
		def get_root_password()
			# First check if password is provided in node config
			passwd = node[:orientdb][:root_password]
			# Then look into the databags
			unless passwd
				begin
					credentials = Chef::EncryptedDataBagItem.load('secrets', 'orientdb') 
					passwd = credentials['root_password']
				rescue Exception => e
				end
			end
			# Lastly just generate a random password
			unless passwd
				passwd = (0...8).map { (65 + rand(26)).chr }.join
			end
			passwd
		end
	end
end

Chef::Recipe.send(:include, Chef::Orientdb)