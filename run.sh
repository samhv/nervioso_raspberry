echo "###Limpiar los posibles residuos de cerrar mal una ejecucion anterior###"
echo "Limpiando pines de B+... (ignora los write error: Invalid argument)"
echo 5 > /sys/class/gpio/unexport
echo 6 > /sys/class/gpio/unexport
echo 12 > /sys/class/gpio/unexport
echo 13 > /sys/class/gpio/unexport
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
echo "Done."

echo "###Iniciando Game###"
rvmsudo ruby main.rb
