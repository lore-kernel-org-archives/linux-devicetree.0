From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: max3421: Add bindings documentation
Date: Mon, 16 Oct 2017 23:21:53 +0300
Message-ID: <6a3f35f1-dae9-063d-963e-812a7341f612@cogentembedded.com>
References: <cover.1508108927.git.jules.maselbas@grenoble-inp.org>
 <832170edafa26b7b2bed76afe170f1c9c4f7b9ae.1508108927.git.jules.maselbas@grenoble-inp.org>
 <a064c008-2268-26ef-edee-47bda38b117b@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a064c008-2268-26ef-edee-47bda38b117b-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Content-Language: en-MW
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jules Maselbas <jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: julia.lawall-L2FTfq7BK8M@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/16/2017 12:04 PM, Sergei Shtylyov wrote:

>> Adds bindings documentation for the max3421 driver.
>>
>> Signed-off-by: Jules Maselbas <jules.maselbas-l+/54qjP3hgoQXW8ST3Jvw@public.gmane.org>
>> ---
>>   .../devicetree/bindings/usb/maxim,max3421.txt      | 24 
>> ++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/maxim,max3421.txt
>>
>> diff --git a/Documentation/devicetree/bindings/usb/maxim,max3421.txt 
>> b/Documentation/devicetree/bindings/usb/maxim,max3421.txt
>> new file mode 100644
>> index 000000000000..7536c3ab3e5a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/maxim,max3421.txt
>> @@ -0,0 +1,24 @@
>> +Maxim Integrated SPI-based USB 2.0 host controller MAX3421E
>> +
>> +Required properties:
>> + - compatible: "maxim,max3421"
>> + - spi-max-frequency: maximum frequency for this device must not exceed 26 
>> MHz.
>> + - reg: chip select number to which this device is connected.
>> + - maxim,vbus-en-pin: <GPOUTx ACTIVE_LEVEL>
>> +   GPOUTx is the number (1-8) of the GPOUT pin of MAX3421E to drive Vbus.
>> +   ACTIVE_LEVEL is 0 or 1.
>> + - interrupt-parent: the phandle of the associated interrupt controller.
> 
>     This is never a required prob, it may be inherited from the parent nodes.

   Prop, sorry. :-)

[...]

MBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
