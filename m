Return-Path: <SRS0=Bz/z=T7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lelv0143.ext.ti.com ([198.47.23.248]:41434 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfEaMFz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 May 2019 08:05:55 -0400
Subject: Re: [PATCH] ARM: dts: Drop bogus CLKSEL for timer12 on dra7
References: <20190530065635.42811-1-tony@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <89884096-cda4-ea67-6776-4fb25abc65e3@ti.com>
Date: Fri, 31 May 2019 15:05:50 +0300
MIME-Version: 1.0
In-Reply-To: <20190530065635.42811-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc: =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Tero Kristo <t-kristo@ti.com>
List-ID: <devicetree@vger.kernel.org>

On 30/05/2019 09:56, Tony Lindgren wrote:
> There is no CLKSEL for timer12 on dra6 unlike for timer1. This

dra7

> causes issues on booting the device that Tomi noticed if
> DEBUG_SLAB is enabled and the clkctrl clock does not properly
> handle non-existing clock. Let's drop the bogus CLKSEL clock,
> the clkctrl clock handling gets fixed separately.
> 
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Fixes: 4ed0dfe3cf39 ("ARM: dts: dra7: Move l4 child devices to probe them with ti-sysc")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   arch/arm/boot/dts/dra7-l4.dtsi | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
> --- a/arch/arm/boot/dts/dra7-l4.dtsi
> +++ b/arch/arm/boot/dts/dra7-l4.dtsi
> @@ -4450,8 +4450,6 @@
>   			timer12: timer@0 {
>   				compatible = "ti,omap5430-timer";
>   				reg = <0x0 0x80>;
> -				clocks = <&wkupaon_clkctrl DRA7_WKUPAON_TIMER12_CLKCTRL 24>;
> -				clock-names = "fck";
>   				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
>   				ti,timer-alwon;
>   				ti,timer-secure;
> 

Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
