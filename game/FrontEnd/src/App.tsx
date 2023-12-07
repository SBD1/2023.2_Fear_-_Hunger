import { useEffect, useState } from "react";
import { RouterProvider, createBrowserRouter } from "react-router-dom";
import "./App.css";
import api from "./api";
import Game from "./pages/Game";
import Home from "./pages/Home";
import Regiao from "./pages/Regiao";

function App() {
  // const [count, setCount] = useState(0);
  const [data, setData] = useState("");

  const testApi = async () => {
    const { data } = await api.get("/");
    setData(data.message);
  };

  useEffect(() => {
    testApi();
  }, []);

  const router = createBrowserRouter([
    {
      path: "/",
      element: (
        <>
          <Home />
          <p className="api">{data}</p>
        </>
      ),
    },
    {
      path: "/game/:idRegiao",
      element: <Game />,
    },
    {
      path: "/regiao",
      element: <Regiao />,
    },
  ]);

  return (
    <>
      <RouterProvider router={router} />
    </>
  );
}

export default App;
