From: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: net: document Bluetooth bindings in
 one place
Date: Thu, 7 Sep 2017 08:14:32 +0200
Message-ID: <41A0C162-4AC5-4969-813D-9E2C7F5D5031@holtmann.org>
References: <1504699898-28011-1-git-send-email-loic.poulain@linaro.org>
 <20170906232610.GG1165@minitux>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170906232610.GG1165@minitux>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Loic Poulain <loic.poulain-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bluez mailing list <linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

>> In the same way as Ethernet, gather the Bluetooth related bindings in
>> one file. Introduce the bluetooth-bd-address property which can be used
>> to store the assigned BD address.
>> 
>> Signed-off-by: Loic Poulain <loic.poulain-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>> v2: Set device as unconfigured if default address detected
>>     Add warning if BD addr retrieved from DT
>> v3: if no addr retrieved from DT, unconditionally set
>>     the invalid BD addr flag.
>>     swap and set bdaddr in the platform probe
>> v4: Add dt-bindings documentation
>>     split patch in two parts (setup, dt prop)
>>     use local-bd-address name instead of local-mac-address
>> v5: remove 2/3 merged in bluetooth-next tree
>>     Add bluetooth.txt for common BT bindings
>>     expect local-bd-address in little-endian format
>> v6: use of_property_read_u8_array instead of of_get_property
>> 
>> Documentation/devicetree/bindings/net/bluetooth.txt | 5 +++++
>> 1 file changed, 5 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/net/bluetooth.txt
>> 
>> diff --git a/Documentation/devicetree/bindings/net/bluetooth.txt b/Documentation/devicetree/bindings/net/bluetooth.txt
>> new file mode 100644
>> index 0000000..94797df
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/bluetooth.txt
>> @@ -0,0 +1,5 @@
>> +The following properties are common to the Bluetooth controllers:
>> +
>> +- local-bd-address: array of 6 bytes, specifies the BD address that was
>> +  uniquely assigned to the Bluetooth device, formatted with least significant
>> +  byte first (little-endian).
> 
> Is there a good reason for making this little endian?
> 
> Sure it's only going to be read and written by computers, but for anyone
> reading the generated DT it sure looks like the values are reversed.

the Bluetooth spec has a string notation and defines how it is packed as 6 octet binary.

"On the baseband level the BD_ADDR is represented as 48 bits. On the Link Layer the public and random device address are represented as 48-bit addresses."

"On the UI level the Bluetooth address shall be represented as 12 hexadecimal characters, possibly divided into sub-parts separated by ‘:’ (e.g., ‘000C3E3A4B69’ or ‘00:0C:3E:3A:4B:69’). On the UI level any number shall have the MSB -> LSB (from left to right) ‘natural’ ordering.”

However on the wire level it is LSB -> MSB. See our ba2str function.

int str2ba(const char *str, bdaddr_t *ba)
{
	int i;
	
	for (i = 5; i >= 0; i--, str += 3)
		ba->b[i] = strtol(str, NULL, 16);

	return 0;
}

I would prefer the boot loader actually providing the BD Address in the correct byte order as the protocol expects and not yet another form. The string representation is just for reference since that is what most people have seen so far.

Regards

Marcel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
