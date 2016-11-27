From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: mvebu: Add Armada 38x labels and clean up
 Turris Omnia
Date: Sun, 27 Nov 2016 19:57:00 +0100
Message-ID: <e7cdf277-2d16-2f10-4e53-a0f15e32a4ab@suse.de>
References: <1fc18002-0144-8300-1888-09f456860ef0@kleine-koenig.org>
 <1480272700-28888-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480272700-28888-1-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>, Michal Hrusecki <Michal.Hrusecky-x+rMaJPWets@public.gmane.org>, Tomas Hlavacek <tomas.hlavacek-x+rMaJPWets@public.gmane.org>, =?UTF-8?B?QmVkxZlpY2hhIEtvxaFhdHU=?= <bedrich.kosata-x+rMaJPWets@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 27.11.2016 um 19:51 schrieb Andreas Färber:
> To more consistently reference nodes by label, add labels for sata,
> usb2, sdhci and usb3 nodes.

s/usb2/usb/ to be fully correct.

> 
> Convert all other 38x boards for consistency. Add labels for nfc and rtc.
> 
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
>  arch/arm/boot/dts/armada-385-db-ap.dts             | 334 +++++++------
>  arch/arm/boot/dts/armada-385-linksys-caiman.dts    |  98 ++--
>  arch/arm/boot/dts/armada-385-linksys-cobra.dts     |  98 ++--
>  arch/arm/boot/dts/armada-385-linksys.dtsi          | 294 ++++++-----
>  arch/arm/boot/dts/armada-385-turris-omnia.dts      |  97 ++--
>  arch/arm/boot/dts/armada-385.dtsi                  |  20 +-
>  arch/arm/boot/dts/armada-388-clearfog.dts          | 550 ++++++++++-----------
>  arch/arm/boot/dts/armada-388-db.dts                | 236 ++++-----
>  arch/arm/boot/dts/armada-388-gp.dts                | 403 ++++++++-------
>  arch/arm/boot/dts/armada-388-rd.dts                | 115 +++--
>  arch/arm/boot/dts/armada-388.dtsi                  |  19 +-
>  .../arm/boot/dts/armada-38x-solidrun-microsom.dtsi | 111 ++---
>  arch/arm/boot/dts/armada-38x.dtsi                  |  16 +-
>  13 files changed, 1170 insertions(+), 1221 deletions(-)
[...]
> diff --git a/arch/arm/boot/dts/armada-388.dtsi b/arch/arm/boot/dts/armada-388.dtsi
> index 564fa59..1a7fc5d 100644
> --- a/arch/arm/boot/dts/armada-388.dtsi
> +++ b/arch/arm/boot/dts/armada-388.dtsi
> @@ -50,21 +50,8 @@
>  	model = "Marvell Armada 388 family SoC";
>  	compatible = "marvell,armada388", "marvell,armada385",
>  		"marvell,armada380";
> +};
>  
> -	soc {
> -		internal-regs {
> -			pinctrl@18000 {
> -				compatible = "marvell,mv88f6828-pinctrl";
> -			};
> -
> -			sata@e0000 {
> -				compatible = "marvell,armada-380-ahci";
> -				reg = <0xe0000 0x2000>;
> -				interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> -				clocks = <&gateclk 30>;
> -				status = "disabled";
> -			};

Note that this sata node is redundant with armada-38x.dtsi by my
reading, therefore dropped.

> -
> -		};
> -	};
> +&pinctrl {
> +	compatible = "marvell,mv88f6828-pinctrl";
>  };

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
