*******************************Decentralized Blockchain, Cryptocurrency using Postman*******************************

1.Create multiple consoles on Python (i.e Console 1/A, Console 2/A, Console 3/A)

2.Run Node 5001 on Console 1/A, Run Node 5002 on Console 2/A,  Run Node 5003 on Console 3/A

3.Launch Postman (create 3 tabs).

4.Add IP/PORTNumber on Get request
  Example :
		GET > http://127.0.0.1:5001/get_chain [Send]

  Congratulations !! we have created the genesis block.

5.Do the same by other 2 also.

6.Check the Timestamp[Not accurate] will be fix once we apply consensus.

7.Now create POST request.

8.Change the GET to POST now and go back to python script. Copy Node.json file content and go back to POSTMAN.
  Please change : 
	Example :
		a.POST > http://127.0.0.1:5001/connect_node
		b.Go to Body > Go to Raw > select JSON (Application/json) [click on text to open drop down box].
		c.Paste the node.json content on the box 
		Important ====> [Remove the address of the node u are using respectively in the Node.js content while copying in respective POST request].
		d.ENTER

9.Do same for there nodes.

10.Check for consensus[Mining Block]:

	a.Change the POST TO GET.
	b.Enter ====> GET > http://127.0.0.1:5001/mine_block [Send]
	c.Press Enter and go back to GET request and see the changes.
	d.Check for other blocks without applying step b,c.
	e.To check GET > http://127.0.0.1:5001-3/get_chain.
	f.You'll see the changes are not being made on 5002-3.
	g.Fix: GET > http://127.0.0.1:5002/replace_chain
	       GET > http://127.0.0.1:5003/replace_chain
	h.Consensus issue solved.

11.Check for Transaction:

	a.POST > http://127.0.0.1:5001/add_transaction
	b.repeat step 8[b,c] but copy content from transaction.json file.
	c.Add sender,reciever,amount details on Body.
	d.Press Enter.

	To Welcome the transaction you need to mine the block first!
	
	e.Enter ====> GET > http://127.0.0.1:5001/mine_block
		you will get new block !!!
	d.Fix consensus:
		 GET > http://127.0.0.1:5002/replace_chain
	         GET > http://127.0.0.1:5003/replace_chain
	e.Transaction has been done.

Summary : Mine_block->Apply_consensus->Transaction->Apply_Consensus

for any issues you can contact me!