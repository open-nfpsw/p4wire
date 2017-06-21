echo '============================================================= '
echo                Starting Test for P4 Wire 
echo '============================================================= '
echo ' '

tcpdump -U -nnvv -i $1 2>/dev/null &
sleep 1
echo 'Listening on' $1':'
tcpreplay -i $2 in2.pcap > /dev/null 2> /dev/null
pid=$(ps -e | pgrep tcpdump)
sleep 1
kill -2 $pid
sleep 1

#echo ' '
echo '------------------------------------------------------------- '
echo ' '
tcpdump -U -nnvv -i $2 2>/dev/null &
sleep 1
echo 'Listening on' $2':'
tcpreplay -i $1 in1.pcap > /dev/null 2> /dev/null
pid=$(ps -e | pgrep tcpdump)
sleep 1
kill -2 $pid
sleep 1

#echo ' '
echo '------------------------------------------------------------- '
echo ' '

echo 'If a total of 2 packets were received the test setup is correct.'
