From: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH 08/16] arm: dts: add spi nodes to the mt7623.dtsi file
Date: Wed, 25 Jan 2017 06:38:40 +0100
Message-ID: <80e1c119-2989-9c82-8d54-551f677613e1@phrozen.org>
References: <1485170975-51813-1-git-send-email-john@phrozen.org>
 <1485170975-51813-9-git-send-email-john@phrozen.org>
 <69d73342-d710-5f6d-567b-8e75a84fdb18@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <69d73342-d710-5f6d-567b-8e75a84fdb18-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 24/01/2017 23:39, Matthias Brugger wrote:
> 
> 
> On 01/23/2017 12:29 PM, John Crispin wrote:
>> Add SPI nodes to the mt7623.dtsi file.
>>
>> Signed-off-by: John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/mt7623.dtsi |   12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/mt7623.dtsi
>> b/arch/arm/boot/dts/mt7623.dtsi
>> index 8ac4569..c8f38e1 100644
>> --- a/arch/arm/boot/dts/mt7623.dtsi
>> +++ b/arch/arm/boot/dts/mt7623.dtsi
>> @@ -15,6 +15,7 @@
>>  #include <dt-bindings/interrupt-controller/irq.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/clock/mt2701-clk.h>
>> +#include <dt-bindings/phy/phy.h>
> 
> Why do you need this include here?
> 
> Regards,
> Matthias
> 

should be part of the ubs patch. V2 coming up in a tad

	John

>>  #include <dt-bindings/pinctrl/mt7623-pinfunc.h>
>>  #include <dt-bindings/power/mt2701-power.h>
>>  #include <dt-bindings/reset/mt2701-resets.h>
>> @@ -281,6 +282,17 @@
>>          status = "disabled";
>>      };
>>
>> +    spi: spi@1100a000 {
>> +        compatible = "mediatek,mt7623-spi",
>> +                 "mediatek,mt6589-spi";
>> +        reg = <0 0x1100a000 0 0x1000>;
>> +        interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_LOW>;
>> +        clocks = <&pericfg CLK_PERI_SPI0>;
>> +        clock-names = "main";
>> +
>> +        status = "disabled";
>> +    };
>> +
>>      hifsys: syscon@1a000000 {
>>          compatible = "mediatek,mt7623-hifsys",
>>                   "mediatek,mt2701-hifsys",
>>
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
