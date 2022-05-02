docker update minecraft --restart no
echo stop | socat EXEC:"docker attach minecraft",pty STDIN
docker attach minecraft
