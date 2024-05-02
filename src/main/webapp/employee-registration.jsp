<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Registration Form</title>
	<style>
		header {
			background-color: #333;
			color: #fff;
			padding: 10px 0;
			text-align: center;
		}
		footer {
			background-color: #333;
			color: #fff;
			padding: 10px 0;
			text-align: center;
			position: fixed;
			bottom: 0;
			width: 100%;
		}
		h1 {
			text-align: center;
		}
		form {
			width: 300px;
			margin: 0 auto;
			padding: 40px;
			text-align: left;
			border: 5px solid #ccc;
			border-radius: 5px;
		}
		.button-group {
			display: flex;
			justify-content: center;
		}
		input[type="text"],
		input[type="password"],
		input[type="date"],
		input[type="email"],
		select {
			width: 90%;
			padding: 10px;
			margin-bottom: 5px;
		}
		.errorMessage {
			color: red;
			font-size: 12px;
			margin-bottom: 5px;
		}
	</style>
</head>
	<body>
		<header>
			<h1>Employee Registration Form</h1>
		</header>
			<form id="registrationForm" action="Register" method="post" onsubmit="return validateForm()">
				<label for="firstName">First Name:</label>
				<input type="text" id="firstName" name="firstName" required>
				<p id="firstNameError" class="errorMessage"/>
				<label for="lastName">Last Name:</label>
				<input type="text" id="lastName" name="lastName" required>
				<p id="lastNameError" class="errorMessage"/>
				<label for="dob">Date of Birth:</label>
				<input type="date" id="dob" name="dob" required>
				<label for="address1">Address 1:</label>
				<input type="text" id="address1" name="address1" required>
				<p id="address1Error" class="errorMessage"/>
				<label for="address2">Address 2:</label>
				<input type="text" id="address2" name="address2">
				<p id="address2Error" class="errorMessage"/>
				<label for="age">Age:</label>
				<input type="text" id="age" name="age" required>
				<label for="gender">Gender:</label>
					<select id="gender" name="gender" required>
						<option value="">Select Gender</option>
						<option value="male">Male</option>
						<option value="female">Female</option>
						<option value="other">Other</option>
					</select>
				<label for="email">Email:</label>
				<input type="email" id="email" name="email" required>
				<label for="contact">Contact:</label>
				<input type="text" id="contact" name="contact" required>
				<p id="contactError" class="errorMessage"/>
					<div class="button-group">
					<input type="submit" id="submitBtn" value="Submit">
					<input type="reset" id="resetBtn" value="Reset" disabled>
					</div>
			</form>
		<footer>
			<p>Already registered? <a href="customers.jsp">View Customers</a></p>
		</footer>
	<script>
		function validateForm() {
			var firstName = document.getElementById("firstName").value;
			var lastName = document.getElementById("lastName").value;
			var contact = document.getElementById("contact").value;
			var address1 = document.getElementById("address1").value;
			var address2 = document.getElementById("address2").value;
			var firstNameError = document.getElementById("firstNameError");
			var lastNameError = document.getElementById("lastNameError");
			var contactError = document.getElementById("contactError");
			var address1Error = document.getElementById("address1Error");
			var address2Error = document.getElementById("address2Error");
				firstNameError.innerText = "";
				lastNameError.innerText = "";
				contactError.innerText = "";
				address1Error.innerText = "";
				address2Error.innerText = "";
				var isValid = true;
					if (firstName.trim() === "") {
					isValid = false;
					} else if (/\d/.test(firstName)) {
					isValid = false;
					firstNameError.innerText = "First name cannot contain numbers";
					}
					if (lastName.trim() === "") {
					isValid = false;
					} else if (/\d/.test(lastName)) {
					isValid = false;
					lastNameError.innerText = "Last name cannot contain numbers";
					}
					if (contact.trim() === "") {
					isValid = false;
					} else if (!(/^\d{10}$/.test(contact))) {
					isValid = false;
					contactError.innerText = "Contact number must contain exactly 10 digits";
					}
					if (address1.trim() === "") {
					isValid = false;
					} else if (!/^[a-zA-Z0-9\s]+$/.test(address1)) {
					isValid = false;
					address1Error.innerText = "Address 1 can only contain alphanumeric characters and spaces";
					}
					if (address2.trim() !== "" && !/^[a-zA-Z0-9\s]+$/.test(address2)) {
					isValid = false;
					address2Error.innerText = "Address 2 can only contain alphanumeric characters and spaces";
					}
						document.getElementById("resetBtn").disabled = !isValid;
						return isValid;
		}
				function enableSubmitButton() {
				var anyFieldHasData = document.getElementById("firstName").value.trim() !== "" ||
				document.getElementById("lastName").value.trim() !== "" ||
				document.getElementById("contact").value.trim() !== "" ||
				document.getElementById("address1").value.trim() !== "" ||
				document.getElementById("address2").value.trim() !== "";
				document.getElementById("submitBtn").disabled = !anyFieldHasData;
				document.getElementById("resetBtn").disabled = !anyFieldHasData;
				}
				window.onload = function() {
				enableSubmitButton();
				document.getElementById("firstName").addEventListener("input", function() {
				validateForm();
				enableSubmitButton();
				});
				document.getElementById("lastName").addEventListener("input", function() {
				validateForm();
				enableSubmitButton();
				});
				document.getElementById("contact").addEventListener("input", function() {
				validateForm();
				enableSubmitButton();
				});
				document.getElementById("address1").addEventListener("input", function() {
				validateForm();
				enableSubmitButton();
				});
				document.getElementById("address2").addEventListener("input", function() {
				validateForm();
				enableSubmitButton();
				});
				document.getElementById("resetBtn").addEventListener("click", function() {
				document.getElementById("submitBtn").disabled = true;
					var errorMessages = document.getElementsByClassName("errorMessage");
						for (var i = 0; i < errorMessages.length; i++) {
						errorMessages[i].innerText = "";
						}
				});
				};
</script>
</body>
</html>