class Rental_Property:
    def __init__(self, purchase_price, monthly_rent, annual_expenses):
        self.purchase_price = purchase_price
        self.monthly_rent = monthly_rent
        self.annual_expenses = annual_expenses

    def calculate_return_on_investment(self):
        annual_income = self.monthly_rent * 12
        print(f"Annual Income: {annual_income}")
        net_annual_income = annual_income - self.annual_expenses
        print(f"Net Annual Income: {net_annual_income}")
        return_on_investment = (net_annual_income / self.purchase_price) * 100
        print(f"Return on Investment: {return_on_investment}")
        return return_on_investment

def main():
    # Example property details
    purchase_price = 200000
    monthly_rent = 1500
    annual_expenses = 8000

    # Create a RentalProperty object
    property1 = Rental_Property(purchase_price, monthly_rent, annual_expenses)

    # Calculate and print the return on investment
    roi = property1.calculate_return_on_investment()
    print(f"Return on Investment: {roi:.2f}%")

if __name__ == "__main__":
    main()