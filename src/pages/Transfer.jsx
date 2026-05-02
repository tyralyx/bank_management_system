import { useState } from "react";
import Navbar from "../components/Navbar";
import { user, transactions } from "../data/mockData";

export default function Transfer() {
  const [amount, setAmount] = useState("");

  const handleTransfer = () => {
    if (!amount) return;

    user.balance -= Number(amount);
    transactions.push({
      id: transactions.length + 1,
      type: "Debit",
      amount,
      date: new Date().toISOString().split("T")[0],
    });

    alert("Transfer Successful");
    setAmount("");
  };

  return (
    <>
      <Navbar />
      <div className="p-6">
        <h2 className="text-xl mb-4">Transfer Money</h2>
        <input
          className="border p-2 mb-2 w-full"
          placeholder="Amount"
          value={amount}
          onChange={(e) => setAmount(e.target.value)}
        />
        <button className="bg-green-600 text-white p-2" onClick={handleTransfer}>
          Send
        </button>
      </div>
    </>
  );
}