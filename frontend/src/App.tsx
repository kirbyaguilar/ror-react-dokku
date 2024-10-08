import axios from "axios";
import { useEffect, useState } from "react"

export default function App() {
  const [text, setText] = useState('');

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await axios.get('/api/employees');
        const employees = response.data;

        if (employees) {
          setText(employees.data);
        }
      } catch (error) {
        console.error("Error fetching data: ", error);
      }
    };

    fetchData();
  }, []);  // empty dependency array since the effect should run once on mount

  return (
    <div>
      <h1>Hello world!</h1>
      <pre>
        {JSON.stringify(text, null, 2)}
      </pre>
    </div>
  )
}
