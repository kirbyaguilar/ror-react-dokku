import { useState } from "react"

export default function App() {
  const [text, setText] = useState('aaaa');

  return (
    <div>
      <h1>Hello world!</h1>
      <pre>
        {JSON.stringify(text, null, 2)}
      </pre>
    </div>
  )
}
