**Este es un ejercicio para el examen del banco galicia**

Se nos pide un pipeline que se conecte al nuestro repositorio de codigo, haga un checkout, se baje las páginas, 
y luego como se nos pide correr el toolkit s2i, que si bien forma parte del OCP, se puede utilizar en forma independiente,
para crear artifacts
El builder que usaremos será php7, la imagen, una imagen de centos 7.1, y con eso generaremos la imagen ( Etapa de build )

Para la etapa de testing, ejecutamos un script de bash que haga un curl al puerto 8080, para ver que haya levantado correctamente el contenedor.
