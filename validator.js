customerValidator = {
	$jsonSchema: {
		bsonType: "object",
		required: ["Address", "City", "Country", "District", "First Name", "Last Name", "Phone", "Rentals"],
		properties: {
			Address: {
				bsonType: "string",
				description: "Address must exist and be a string"
			}
			City: {
				bsonType: "string",
				description: "City must exist and be a string"
			}
			Country: {
				bsonType: "string",
				description: "Country must exist and be a string"
			}
			District: {
				bsonType: "string",
				description: "District must exist and be a string"
			}
			First Name: {
				bsonType: "string",
				description: "First Name must exist and be a string"
			}
			Last Name: {
				bsonType: "string",
				description: "Last Name must exist and be a string"
			}
			Phone {
				bsonType: "string",
				description: "Phone must exist and be a string"
			}
			Rentals: {
				bsonType: "array",
				uniqueItems: true,
				items: {
					bsonType: "object",
					required: [ "Film Title", "Payments", "Rental Date", "Return Date", "filmID", "rentalID", "staffID"],
					properties: {
						Film Title: {
							bsonType: "string",
							description: "Film Title must exist and be a string"
						}
						Payments: {
							bsonType: "array", 
							uniqueItems: true, 
							required: ["Amount", "Payment Date", "Payment Id"],
							properties: {
								Amount: {
									bsonType: "number",
									description: "Each payment must have an Amount that is a number"
								}
								Payment Date: {
									bsonType: "string", 
									description: "Each payment must have a Payment Date that is a string"
								}
								Payment Id: {
									bsonType: "number",
									description: "Each payment must have a Payment Id that is a number"
								}
						}
						Rental Date: {
							bsonType: "string",
							description: "Rental Date must exist and be a string"
						}
						Return Date: {
							bsonType: "string",
							description: "Return Date must exist and be a string"
						}
						filmID: {
							bsonType: "number",
							description: "All films must have a 'filmID'"
						}
						rentalID: {
							bsonType: "number",
							description: "All rentals must have a 'rentalID'"
						}
						staffID: {
							bsonType: "number",
							description: "All staff must have a 'staffID'"
						}
					}
				}
			}
		}
	}
}