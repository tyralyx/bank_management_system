export default function Table({ data }) {
  return (
    <table className="w-full bg-white shadow rounded">
      <thead>
        <tr className="bg-gray-200">
          <th className="p-2">Type</th>
          <th className="p-2">Amount</th>
          <th className="p-2">Date</th>
        </tr>
      </thead>
      <tbody>
        {data.map((t) => (
          <tr key={t.id} className="text-center">
            <td>{t.type}</td>
            <td>₹{t.amount}</td>
            <td>{t.date}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
}
