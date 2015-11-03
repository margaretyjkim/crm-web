class Contact
	attr_reader :id
	attr_accessor :first_name, :last_name, :email, :notes
	#CLASS VARIABLE = DEFINE IN THE WHOLE CONTACTS
	@@contacts = []
	@@id = 1
	# attr_accessor creates these getter and setter
	# GETTER
	# def first_name
	# 	@first_name
	# end
	# SETTER
	# def first_name=(new_first_name)
	# 	@first_name = new_first_name
	# end
	def initialize(first_name, last_name, email, notes) #make a hash so that you can extend more and get nil if you dont have the info
		@first_name = first_name
		@last_name = last_name
		@email = email
		@notes = notes

		@id = @@id
		@@id += 1
	end
	#self - refers to the object itself and in this case, it's the class that you are referring to
	def self.create(first_name, last_name, email, notes)
		new_contact = Contact.new(first_name, last_name, email, notes) #same thing as new_contact = new(first_name, last_name, options)

		@@contacts << new_contact
	end

	def self.all #class method
		@@contacts
	end

	def self.find(id) #class method
		contacts = @@contacts.select do |contact|
			contact.id == id
		end

		contacts.first
	end

	def display_first_name(first_name)
		@@contacts.each do |first_name|
			if contact.first_name = first_name
				return contact
			end
		end
	end

	def self.display_attribute(attribute)
		list = []
		@@contacts.each do |contact|
			list << contact.send(attribute)
		end
		return list
	end

	def self.delete_contact(user_specified_id)
		@@contacts.delete_if { |contact| contact.id == user_specified_id }
	end

	# This a more advanced way of updating
	def update(field, new_value)
		self.send("#{field}=", new_value)
	end

	def full_name
		"#{first_name} #{last_name}"
	end

end

