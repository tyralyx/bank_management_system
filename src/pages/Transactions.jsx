import Navbar from "../components/Navbar";
import Table from "../components/Table";
import { transactions } from "../data/mockData";

export default function Transactions() {
  return (
    <>
      <Navbar />
      <div className="p-6">
        <h2 className="text-xl mb-4">Transaction History</h2>
        <Table data={transactions} />
      </div>
    </>
  );
}