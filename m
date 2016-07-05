From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [RFC PATCH] dt/bindings: Add bindings for JC-42.4 compatible
 temperature sensors
Date: Tue, 5 Jul 2016 09:30:09 -0700
Message-ID: <577BE091.2050200@roeck-us.net>
References: <1467479142-8249-1-git-send-email-linux@roeck-us.net>
 <20160705154811.GA3982@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160705154811.GA3982@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/05/2016 08:48 AM, Rob Herring wrote:
> On Sat, Jul 02, 2016 at 10:05:42AM -0700, Guenter Roeck wrote:
>> Provide generic bindings for all Jedec JC-42.4 compatible temperature
>> sensor chips.
>>
>> Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>> ---
>> RFC to address:
>> - Is "jc-42-4" ok to use for JC-42.4 ?
>> - JC42.4 really specifies an SPD EEPROM with included temperature sensor.
>
> That would be at a different address?
>
Yes. The EEPROM is at address 0x5[0-7], the temperature sensor is at 0x1[8-f].

>>    Is "jedec,jc42-4" appropriate, or should it rather be something like
>>    "jedec,jc-42-4-sensor" ?
>
> If yes, then probably the latter. Though I would do "temp" rather than
> "sensor".
>
> Also, "-42.4" is fine.
>
Ok, I'll use "jedec,jc-42.4-temp".

>>   Documentation/devicetree/bindings/hwmon/jc42.txt | 42 ++++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/jc42.txt
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/jc42.txt b/Documentation/devicetree/bindings/hwmon/jc42.txt
>> new file mode 100644
>> index 000000000000..2bd604a93430
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/jc42.txt
>> @@ -0,0 +1,42 @@
>> +Properties for Jedec JC-42.4 compatible temperature sensors
>> +
>> +Required properties:
>> +- compatible: May include a device-specific string consisting of the
>> +	      manufacturer and the name of the chip. A list of supported
>> +	      chip names follows.
>> +	      Must include "jedec,jc-42-4" for any Jedec JC-42.4 compatible
>> +	      temperature sensor.
>> +
>> +	      Supported chip names:
>> +		adt7408
>> +		at30ts00
>> +		at30tse004
>> +		cat6095
>> +		cat34ts02
>> +		max6604
>> +		mcp9804
>> +		mcp9805
>> +		mcp9808
>> +		mcp98243
>> +		mcp98244
>> +		mcp9843
>> +		se97
>> +		se98
>> +		stts2002
>> +		stts2004
>> +		stts3000
>> +		stts424
>> +		stts424e
>> +		tse2002
>> +		tse2004
>> +		ts3000
>> +		ts3001
>
> These are all vendor independent names?
>
No. se97/se98 would be NXP, for example. I'll add the vendor prefixes.

Thanks,
Guenter

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
