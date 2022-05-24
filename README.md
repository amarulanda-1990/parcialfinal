# parcialfinal

#Este parcial contiene 2 VM montadas en Centos 8 distribuidas de la siguiente manera:

#Maquina1: Contiene un servidor firewall con dos interfaces de red una privada con IP "192.168.50.1" que permite comunicarse internamente con el anfitrion y las otras maquinas virtuales en este caso el firewalll y una publica con IP "192.168.0.201" que nos sirve para que los equipos externos en este caso los equipos anclados a la red como dispositivos moviles puedan acceder, el Firewall va a recibir peticiones y las que llegue con protocolo hhtp por medio de los puertos 80 o 8080 seran redireccionados al servicio de Streama.

#Maquina2:  Contiente un servidor Streama en la ultima version 1.10.4 disponible, la direccion IP "192.168.50.2"
