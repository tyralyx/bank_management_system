import Navbar from "../components/Navbar";
import Card from "../components/Card";
import { user } from "../data/mockData";

export default function Dashboard() {
  return (
    <>
      <Navbar />
      <div className="p-6 grid grid-cols-3 gap-4">
        <Card title="Name" value={user.name} />
        <Card title="Account" value={user.account} />
        <Card title="Balance" value={`₹${user.balance}`} />
      </div>
    </>
  );
}