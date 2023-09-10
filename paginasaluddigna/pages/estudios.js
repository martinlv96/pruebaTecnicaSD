import React, { useState, useEffect  } from 'react';
import styles from './EstudiosPage.module.css';

const EstudiosPage = () => {
  const [estudios, setEstudios] = useState([]);
  const [sucursales, setSucursales] = useState([]);
  const [loading, setLoading] = useState(false);
  const [loading2, setLoading2] = useState(false);
  const [userLocation, setUserLocation] = useState(null);

  const fetchEstudios = async () => {
    setLoading(true);
    try {
      const response = await fetch('https://localhost:7186/bdSaludDigna/EstudiosActivos');
      const data = await response.json();
      setEstudios(data.result.estudiosActivos);
    } catch (error) {
      console.error('Error al obtener estudios:', error);
    }
    setLoading(false);
  };

  const fetchSucursales = async () => {
    setLoading2(true);
    try {
      const response = await fetch('https://localhost:7186/bdSaludDigna/SucursalesActivas');
      const data = await response.json();
      setSucursales(data.result.sucursalesActivas);
    } catch (error) {
      console.error('Error al obtener estudios:', error);
    }
    setLoading2(false);
  };

  useEffect(() => {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          const { latitude, longitude } = position.coords;
          setUserLocation({ lat: latitude, lng: longitude });
        },
        (error) => {
          console.error('Error al obtener la ubicación:', error);
        }
      );
    }
  }, []);

  return (
    <div className={styles.container}>
      <div className={styles.section}>
        <h1>Lista de Estudios</h1>
        <button onClick={fetchEstudios}>Obtener Estudios</button>
        {loading ? (
          <p>Cargando...</p>
        ) : (
          <ul>
            {estudios.map((estudio) => (
              <li key={estudio.id}>{estudio.estudio}</li>
            ))}
          </ul>
        )}
      </div>

      <div className={styles.section}>
        <h1>Lista de Sucursales</h1>
        <button onClick={fetchSucursales}>Obtener Sucursales Activas</button>
        {loading2 ? (
          <p>Cargando...</p>
        ) : (
          <ul>
            {sucursales.map((sucursal) => (
              <li key={sucursal.id}>{sucursal.sucursal}</li>
            ))}
          </ul>
        )}
      </div>

      <div className={styles.section}>
        <h1>Ubicación Actual</h1>
        {userLocation && (
          <p>
            Latitud: {userLocation.lat}, Longitud: {userLocation.lng}
          </p>
        )}
      </div>
    </div>
  );
};

export default EstudiosPage;
