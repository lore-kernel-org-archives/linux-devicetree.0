From: m18063 <Claudiu.Beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: Re: [PATCH] ATM: dts: at91: sama5d2_xplained: add pwm controller
Date: Thu, 23 Feb 2017 10:43:55 +0200
Message-ID: <056978cb-f4af-aa0e-5c64-32b0bceddcf0@microchip.com>
References: <1487838778-13473-1-git-send-email-claudiu.beznea@microchip.com>
 <20170223084241.6eqm5jxe4t7fpn6a@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170223084241.6eqm5jxe4t7fpn6a-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

I will correct it asap.

Thank you,
Claudiu Beznea

On 23.02.2017 10:42, Alexandre Belloni wrote:
> Hi,
>
> There is a typo in your subject, please fix.
>
> On 23/02/2017 at 10:32:58 +0200, Claudiu Beznea wrote:
>> Add pwm controller bindings for sam5d2_xplained
>> and enable it.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/at91-sama5d2_xplained_common.dtsi | 4 ++++
>>  arch/arm/boot/dts/sama5d2.dtsi                      | 8 ++++++++
>>  2 files changed, 12 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/at91-sama5d2_xplained_common.dtsi b/arch/arm/boot/dts/at91-sama5d2_xplained_common.dtsi
>> index 9fc270f..493ea29 100644
>> --- a/arch/arm/boot/dts/at91-sama5d2_xplained_common.dtsi
>> +++ b/arch/arm/boot/dts/at91-sama5d2_xplained_common.dtsi
>> @@ -318,6 +318,10 @@
>>  				};
>>  			};
>>  
>> +			pwm0: pwm@f802c000 {
>> +				status = "okay";
>> +			};
>> +
>>  			flx0: flexcom@f8034000 {
>>  				atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
>>  				status = "disabled"; /* conflict with ISC_D2 & ISC_D3 data pins */
>> diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
>> index cd459e8..e88785e 100644
>> --- a/arch/arm/boot/dts/sama5d2.dtsi
>> +++ b/arch/arm/boot/dts/sama5d2.dtsi
>> @@ -1098,6 +1098,14 @@
>>  				status = "disabled";
>>  			};
>>  
>> +			pwm0: pwm@f802c000 {
>> +				compatible = "atmel,sama5d2-pwm";
> This compatible is not documented and is not used in any driver. Is that
> really working?
>
>> +				reg = <0xf802c000 0x4000>;
>> +				interrupts = <38 IRQ_TYPE_LEVEL_HIGH 7>;
>> +				#pwm-cells = <3>;
>> +				clocks = <&pwm_clk>;
>> +			};
>> +
>>  			sfr: sfr@f8030000 {
>>  				compatible = "atmel,sama5d2-sfr", "syscon";
>>  				reg = <0xf8030000 0x98>;
>> -- 
>> 2.7.4
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
