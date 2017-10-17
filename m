From: Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] rtc: add support for NXP PCF85363 real-time clock
Date: Tue, 17 Oct 2017 15:24:35 -0700
Message-ID: <20602538-2164-e85c-33b6-31c99dfa8a5e@nelint.com>
References: <CAOMZO5C_boginn88C7zgXSBaikx==5FHJrgaE1ewYUyUgGfnFQ@mail.gmail.com>
 <1507737390-27818-1-git-send-email-eric@nelint.com>
 <20171017200622.7xs6hiw3y43mxi2k@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171017200622.7xs6hiw3y43mxi2k@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, otavio.salvador-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 10/17/2017 01:06 PM, Rob Herring wrote:
> On Wed, Oct 11, 2017 at 08:56:30AM -0700, Eric Nelson wrote:
>> Note that alarms are not currently implemented.
>>
>> 64 bytes of nvmem is supported and exposed in
>> sysfs (# is the instance number, starting with 0):
>>
>> 	/sys/bus/nvmem/devices/pcf85363-#/nvmem
>>
>> Signed-off-by: Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
>> ---
>> V2 addresses a couple of issues highlighted by Fabio Estevam
>>      1. Kconfig updated to select REGMAP_I2C
>>      2. Switch to of_device_id from i2c_device_id for driver matching
>>
>>   Documentation/devicetree/bindings/rtc/pcf85363.txt |  16 ++
>>   drivers/rtc/Kconfig                                |  13 ++
>>   drivers/rtc/Makefile                               |   1 +
>>   drivers/rtc/rtc-pcf85363.c                         | 221 +++++++++++++++++++++
>>   4 files changed, 251 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/rtc/pcf85363.txt
>>   create mode 100644 drivers/rtc/rtc-pcf85363.c
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt b/Documentation/devicetree/bindings/rtc/pcf85363.txt
>> new file mode 100644
>> index 0000000..5fddb9f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
>> @@ -0,0 +1,16 @@
>> +NXP PCF85363 Real Time Clock
>> +============================
>> +
>> +Required properties:
>> +- compatible: Should contain "nxp,pcf85363".
>> +- reg: I2C address for chip.
>> +
>> +Example:
>> +
>> +pcf85363: pcf85363@51 {
>> +	compatible = "nxp,pcf85363";
>> +	reg = <0x51>;
>> +};
>> +
>> +Note that alarms are not yet supported, so a specifier for
>> +"interrupts" will be ignored.
> 
> Irrelevant to the binding. That's a driver feature (or lack of). If the
> device has an interrupt line, you should document it. It can be optional
> though.
> 

That's what I was attempting do do in an awkward way.

Since the driver doesn't support interrupts or alarms at the moment,
I'll remove this note.

The chip does have an interrupt pin, but the board I have doesn't
have it connected.

Regards,


Eric
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
