for i in {1..5}; do mkdir "DIR"$i; for ii in {1..20}; do touch "DIR"$i/"file"$ii; done; done;
