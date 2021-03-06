#!/usr/bin/haserl
<?
	# This program is copyright � 2008 Eric Bishop and is distributed under the terms of the GNU GPL 
	# version 2.0 with a special clarification/exception that permits adapting the program to 
	# configure proprietary "back end" software provided that all modifications to the web interface
	# itself remain covered by the GPL. 
	# See http://gargoyle-router.com/faq.html#qfoss for more information
	eval $( gargoyle_session_validator -c "$COOKIE_hash" -e "$COOKIE_exp" -a "$HTTP_USER_AGENT" -i "$REMOTE_ADDR" -r "login.sh" -t $(uci get gargoyle.global.session_timeout) -b "$COOKIE_browser_time"  )	
	gargoyle_header_footer -m -c "internal.css" -j "qos.js"
?>
<fieldset id="edit_container">
	<legend class="sectionheader">Edit QoS Classification Rule</legend>
	<div>
		<div class='leftcolumn'>
			<input type='checkbox'  id='use_source_ip' onclick='enableAssociatedField(this,"source_ip", "")' />
			<label id="source_ip_label" for='source_ip'>Source IP:</label>
		</div>	
		<input class='rightcolumn' type='text' id='source_ip' onkeyup='proofreadIpRange(this)' size='17' maxlength='31' />	
	</div>
	<div>
		<div class='leftcolumn'>
			<input type='checkbox'  id='use_source_port' onclick='enableAssociatedField(this,"source_port", "")'/>
			<label id="source_port_label" for='source_port'>Source Port(s):</label>
		</div>	
		<input class='rightcolumn' type='text' id='source_port' onkeyup='proofreadPortOrPortRange(this)' size='17' maxlength='11' />	
	</div>
	<div>
		<div class='leftcolumn'>
			<input type='checkbox'  id='use_dest_ip' onclick='enableAssociatedField(this,"dest_ip", "")' />
			<label id="dest_ip_label" for='dest_ip'>Destination IP:</label>
		</div>	
		<input class='rightcolumn' type='text' id='dest_ip' onkeyup='proofreadIpRange(this)' size='17' maxlength='31' />	
	</div>
	<div>
		<div class='leftcolumn'>
			<input type='checkbox'  id='use_dest_port' onclick='enableAssociatedField(this,"dest_port", "")'  />
			<label id="dest_port_label" for='dest_port'>Destination Port(s):</label>
		</div>	
		<input class='rightcolumn' type='text' id='dest_port' onkeyup='proofreadPortOrPortRange(this)' size='17' maxlength='11' />	
	</div>
	
	<div>
		<div class='leftcolumn'>
			<input type='checkbox'  id='use_max_pktsize' onclick='enableAssociatedField(this,"max_pktsize", "")'  />
			<label id="max_pktsize_label" for='max_pktsize'>Maximum Packet Length:</label>
		</div>	
		<input class='rightcolumn' type='text' id='max_pktsize' onkeyup='proofreadNumericRange(this,1,1500)' size='17' maxlength='4' />
		<em>bytes</em>
	</div>
	<div>
		<div class='leftcolumn'>
			<input type='checkbox'  id='use_min_pktsize' onclick='enableAssociatedField(this,"min_pktsize", "")'  />
			<label id="min_pktsize_label" for='min_pktsize'>Minimum Packet Length:</label>
		</div>	
		<input class='rightcolumn' type='text' id='min_pktsize' onkeyup='proofreadNumericRange(this,1,1500)' size='17' maxlength='4' />
		<em>bytes</em>	
	</div>


	<div>
		<div class='leftcolumn'>
			<input type='checkbox'  id='use_transport_protocol' onclick='enableAssociatedField(this,"transport_protocol", "")'  />
			<label id="transport_protocol_label" for='transport_protocol'>Transport Protocol:</label>
		</div>	
		<select class='rightcolumn' id="transport_protocol"/>
			<option value="TCP">TCP</option>
			<option value="UDP">UDP</option>
			<option value="ICMP">ICMP</option>
		</select>
	</div>
	<div>
		<div class='leftcolumn'>
			<input type='checkbox'  id='use_connbytes' onclick='enableAssociatedField(this,"connbytes", "")'  />
			<label id="connbytes_label" for='connbytes'>Connection bytes reach:</label>
		</div>
		<input class='rightcolumn' type='text' id='connbytes' onkeyup='proofreadNumeric(this)' size='17' maxlength='7' />
		<em>MB</em>
	</div>
	<div>
		<div class='leftcolumn'>
			<input type='checkbox'  id='use_app_protocol' onclick='enableAssociatedField(this,"app_protocol", "")' />
			<label id="app_protocol_label" for='app_protocol'>Application (Layer7) Protocol:</label>
		</div>	
		<select class='rightcolumn' id="app_protocol">
		<?
		sed -e '/^#/ d' -e "s/\([^ ]* \)\(.*\)/<option value='\1'>\2<\/option>/" /etc/l7-protocols/l7index
		?>
		</select>
	</div>

	<div>	
		<label class='leftcolumn' id="classification_label" for='class_name' >Set Service Class To:</label>
		<select class='rightcolumn' id="classification">
		</select>
	</div>

</fieldset>
<div id="bottom_button_container"></div>

</body>
</html>
