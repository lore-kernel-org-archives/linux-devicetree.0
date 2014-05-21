From: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
Subject: Re: [Patch v4 4/5] ARM: dts: keystone: update reset node to work
 with reset driver
Date: Wed, 21 May 2014 19:05:21 +0300
Message-ID: <537CCEC1.1070801@ti.com>
References: <1400682454-24535-1-git-send-email-ivan.khoronzhuk@ti.com> <1400682454-24535-5-git-send-email-ivan.khoronzhuk@ti.com> <15259908.YoiO6LMEzV@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <15259908.YoiO6LMEzV@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, santosh.shilimkar-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, w-kwok2-l0cyMroinI0@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, m-karicheri2-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 05/21/2014 05:50 PM, Arnd Bergmann wrote:
> On Wednesday 21 May 2014 17:27:33 Ivan Khoronzhuk wrote:
>> The keystone driver requires the next additional properties:
>>
>> "ti,syscon-pll" - syscon register range used to access pll controller
>>                    registers in order to use reset control registers.
>> "ti,syscon-dev" - syscon register range used to access device state
>>                    control registers in order to use mux block
>>                    registers for all watchdogs.
>>
>> "ti,wdt_list"   - option to declare what watchdog are used to reboot
>>                    the SoC, so set "0" WDT as default.
>>
>> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk-l0cyMroinI0@public.gmane.org>
> Same comment as what I had for the binding: it's not a register range
> any more, but a phandle for a device.
>
>> ---
>>   arch/arm/boot/dts/keystone.dtsi | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
>> index 8b899ba..783da60 100644
>> --- a/arch/arm/boot/dts/keystone.dtsi
>> +++ b/arch/arm/boot/dts/keystone.dtsi
>> @@ -78,7 +78,9 @@
>>   
>>                  rstctrl: reset-controller {
>>                          compatible = "ti,keystone-reset";
>> -                       reg = <0x023100e8 4>;   /* pll reset control reg */
>> +                       ti,syscon-pll = <&pllctrl>;
>> +                       ti,syscon-dev = <&devctrl>;
>> +                       ti,wdt_list = <0>;
>>                  };
>>   
> I don't see a definition for the two labels, so this will cause a
> build error. It makes sense to add them in the same patch.
>
> 	Arnd

Thanks,

I'll correct

-- 
Regards,
Ivan Khoronzhuk

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
