import { useState } from "react";
import Navbar from "../components/Navbar";
import { user, transactions } from "../data/mockData";

export default function Loan(){
  const [amount, setAmount] = useState("");
  const [error, setError] = useState("");

  const handleLoan = () => {
    const loanAmount = Number(amount);

    if (!loanAmount) {
      setError("Enter a valid amount");
      return;
    }

    if (loanAmount > 1000000) {
      setError("Loan limit is ₹10,00,000");
      return;
    }

    if (loanAmount < 1) {
      setError("enter valid loan ammount");
      return;
    }

    setError("");

    // update balance
    user.balance += loanAmount;

    // add transaction
    transactions.push({
      id: transactions.length + 1,
      type: "Loan",
      amount: loanAmount,
      date: new Date().toISOString().split("T")[0],
    });

    alert("Loan approved!");
    setAmount("");
  };

  return (
    <>
      <Navbar />
      <div className="flex justify-center items-center h-[80vh]">
        <div className="bg-white p-6 rounded-xl shadow w-96">
          <h2 className="text-xl font-bold mb-4">Take Loan</h2>

          <input
            type="number"
            placeholder="Enter amount"
            value={amount}
            onChange={(e) => setAmount(e.target.value)}
            className="w-full p-2 border rounded mb-3"
          />

          {error && <p className="text-red-500 mb-2">{error}</p>}

          <button
            onClick={handleLoan}
            className="w-full bg-purple-600 text-white p-2 rounded hover:bg-purple-700"
          >
            Apply Loan
          </button>
        </div>
      </div>
    </>
  );
}