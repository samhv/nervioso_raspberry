echo "###Limpiar los posibles residuos de cerrar mal una ejecucion anterior###"
echo "Limpiando pines de B+... (ignora los write error: Invalid argument)"
echo 1 > /sys/class/gpio/unexport
echo 2 > /sys/class/gpio/unexport
echo 3 > /sys/class/gpio/unexport
echo 4 > /sys/class/gpio/unexport
echo 5 > /sys/class/gpio/unexport
echo 6 > /sys/class/gpio/unexport
echo 7 > /sys/class/gpio/unexport
echo 8 > /sys/class/gpio/unexport
echo 9 > /sys/class/gpio/unexport
echo 10 > /sys/class/gpio/unexport
echo 11 > /sys/class/gpio/unexport
echo 12 > /sys/class/gpio/unexport
echo 13 > /sys/class/gpio/unexport
echo 14 > /sys/class/gpio/unexport
echo 15 > /sys/class/gpio/unexport
echo 16 > /sys/class/gpio/unexport
echo 17 > /sys/class/gpio/unexport
echo 18 > /sys/class/gpio/unexport
echo 19 > /sys/class/gpio/unexport
echo 20 > /sys/class/gpio/unexport
echo 21 > /sys/class/gpio/unexport
echo 22 > /sys/class/gpio/unexport
echo 23 > /sys/class/gpio/unexport
echo 24 > /sys/class/gpio/unexport
echo 25 > /sys/class/gpio/unexport
echo 26 > /sys/class/gpio/unexport
echo 27 > /sys/class/gpio/unexport
echo 28 > /sys/class/gpio/unexport
echo 29 > /sys/class/gpio/unexport
echo 30 > /sys/class/gpio/unexport
echo "Done."

echo "###Iniciando Game###"
rbenv sudo ruby /home/pi/nervioso_raspberry/Main.rb
