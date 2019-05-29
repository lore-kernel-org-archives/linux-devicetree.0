From: Ellie Reeves <ellierevves@gmail.com>
Subject: Re: [PATCH] arm64: dts: armada-3720-espressobin: correct spi node
Date: Wed, 29 May 2019 17:01:30 -0400
Message-ID: <ee0c69a8-d4fe-7a13-f193-0703dab543d1@gmail.com>
References: <20190527111614.3694-1-tmn505@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527111614.3694-1-tmn505@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Maciej Nowak <tmn505@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,
yes, I agree on this personally. I meant to correct this myself or at 
least try to, but I didn't have time, as I was the one that found out 
how they did their partition layout previously, this used to be good so 
I asked Uwe Kleine-König if he could get this patch upstreamed, but as 
it is I myself upgraded U-Boot and cannot make use of it anymore.
Thanks

Tomasz Maciej Nowak a écrit :
> The manufacturer of this board, ships it with various SPI NOR chips and
> increments U-Boot bootloader version along the time. There is no way to
> tell which is placed on the board since no revision bump takes place.
> This creates two issues.
> 
> The first, cosmetic. Since the NOR chip may differ, there's message on
> boot stating that kernel expected w25q32dw and found different one. To
> correct this, remove optional device-specific compatible string. Being
> here lets replace bogus "spi-flash" compatible string with proper one.
> 
> The second is linked to partitions layout, it changed after commit:
> 81e7251252 ("arm64: mvebu: config: move env to the end of the 4MB boot
> device") in Marvells downstream U-Boot fork [1], shifting environment
> location to the end of boot device. Since the new boards will have U-Boot
> with this change, it'll lead to improper results writing or reading from
> these partitions. We can't tell if users will update bootloader to recent
> version provided on manufacturer website, so lets drop partitons layout.
> 
> 1. https://github.com/MarvellEmbeddedProcessors/u-boot-marvell.git
> 
> Signed-off-by: Tomasz Maciej Nowak <tmn505@gmail.com>
> ---
>   .../dts/marvell/armada-3720-espressobin.dts    | 18 +-----------------
>   1 file changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
> index 6be019e1888e..fbcf03f86c96 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts
> @@ -95,25 +95,9 @@
>   
>   	flash@0 {
>   		reg = <0>;
> -		compatible = "winbond,w25q32dw", "jedec,spi-flash";
> +		compatible = "jedec,spi-nor";
>   		spi-max-frequency = <104000000>;
>   		m25p,fast-read;
> -
> -		partitions {
> -			compatible = "fixed-partitions";
> -			#address-cells = <1>;
> -			#size-cells = <1>;
> -
> -			partition@0 {
> -				label = "uboot";
> -				reg = <0 0x180000>;
> -			};
> -
> -			partition@180000 {
> -				label = "ubootenv";
> -				reg = <0x180000 0x10000>;
> -			};
> -		};
>   	};
>   };
>   
> 
