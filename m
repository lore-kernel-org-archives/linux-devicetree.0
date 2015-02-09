From: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: at91: dts: sama5d4: add dts for sama5d4 xplained
 board
Date: Mon, 9 Feb 2015 17:49:04 +0800
Message-ID: <54D88290.6030501@atmel.com>
References: <1423473423-17798-1-git-send-email-josh.wu@atmel.com> <20150209102435.56f39b81@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150209102435.56f39b81@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Boris

On 2/9/2015 5:24 PM, Boris Brezillon wrote:
> Hi Josh,
>
> On Mon, 9 Feb 2015 17:17:03 +0800
> Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
>
>> Add at91 sama5d4 xplained board support.
>>
>> Signed-off-by: Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> ---
>>
>> Changes in v2:
>> - to be sorted by memory address, put the adc dt node after usart4.
>>
>>   arch/arm/boot/dts/Makefile                  |   1 +
>>   arch/arm/boot/dts/at91-sama5d4_xplained.dts | 232 ++++++++++++++++++++++++++++
>>   2 files changed, 233 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/at91-sama5d4_xplained.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 91bd5bd..bbfbad6 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -49,6 +49,7 @@ dtb-$(CONFIG_ARCH_AT91)	+= sama5d34ek.dtb
>>   dtb-$(CONFIG_ARCH_AT91)	+= sama5d35ek.dtb
>>   dtb-$(CONFIG_ARCH_AT91)	+= sama5d36ek.dtb
>>   # sama5d4
>> +dtb-$(CONFIG_ARCH_AT91)	+= at91-sama5d4_xplained.dtb
>>   dtb-$(CONFIG_ARCH_AT91)	+= at91-sama5d4ek.dtb
>>   
>>   dtb-$(CONFIG_ARCH_ATLAS6) += atlas6-evb.dtb
>> diff --git a/arch/arm/boot/dts/at91-sama5d4_xplained.dts b/arch/arm/boot/dts/at91-sama5d4_xplained.dts
>> new file mode 100644
>> index 0000000..a04c3c8
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/at91-sama5d4_xplained.dts
>> @@ -0,0 +1,232 @@
>> +/*
>> + * at91-sama5d4_xplained.dts - Device Tree file for SAMA5D4 Xplained board
>> + *
>> + *  Copyright (C) 2015 Atmel,
>> + *                2015 Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> + *
> [...]
>
>> +	ahb {
>> +		apb {
>> +			spi0: spi@f8010000 {
>> +				cs-gpios = <&pioC 3 0>, <0>, <0>, <0>;
>> +				status = "okay";
>> +				m25p80@0 {
>> +					compatible = "atmel,at25df321a";
>> +					spi-max-frequency = <50000000>;
>> +					reg = <0>;
>> +				};
>> +			};
>> +
>> +			macb0: ethernet@f8020000 {
>> +				phy-mode = "rmii";
>> +				status = "okay";
> Could you define the PHY device attached to this ethernet MAC IP ?
>
>
>                                  ethernet-phy@1 {
>                                          reg = <0x1>;
>                                          /*
> 					 * interrupt-parent = <&pioB>;
> 					 * interrupts = <25
> 					 *	   IRQ_TYPE_EDGE_FALLING>;
> 					 */
> 					/* ... */
> 				};
Ok, I will add this in next version. Thanks.

Best Regards,
Josh Wu

>
>
> Best Regards,
>
> Boris
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
