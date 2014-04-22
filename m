From: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND 4/5] ARM: BCM63XX: add BCM963138DVT Reference
 platform DTS
Date: Tue, 22 Apr 2014 11:41:27 -0400
Message-ID: <20140422154127.GA4164@beef>
References: <1398130758-19456-1-git-send-email-f.fainelli@gmail.com>
 <1398130758-19456-5-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398130758-19456-5-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jpeshkin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, aelder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 21, 2014 at 06:39:17PM -0700, Florian Fainelli wrote:
> Add a DTS file for the Broadcom BCM963138DVT reference platform board
> which leverages the bcm63138.dtsi SoC DTSi file.
> 
> Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile        |  3 +++
>  arch/arm/boot/dts/bcm63138dvt.dts | 18 ++++++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 arch/arm/boot/dts/bcm63138dvt.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 35c146f31e46..2738fa6e950d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -53,8 +53,11 @@ dtb-$(CONFIG_ARCH_ATLAS6) += atlas6-evb.dtb
>  dtb-$(CONFIG_ARCH_BCM2835) += bcm2835-rpi-b.dtb
>  dtb-$(CONFIG_ARCH_BCM_MOBILE) += bcm28155-ap.dtb \
>  	bcm21664-garnet.dtb
> +dtb-$(CONFIG_ARCH_BCM_MOBILE) += bcm11351-brt.dtb \
> +	bcm28155-ap.dtb

Remove this stray change.

>  dtb-$(CONFIG_ARCH_BCM2835) += bcm2835-rpi-b.dtb
>  dtb-$(CONFIG_ARCH_BCM_5301X) += bcm4708-netgear-r6250.dtb
> +dtb-$(CONFIG_ARCH_BCM_63XX) += bcm63138dvt.dtb
>  dtb-$(CONFIG_ARCH_BERLIN) += \
>  	berlin2-sony-nsz-gs7.dtb	\
>  	berlin2cd-google-chromecast.dtb
> diff --git a/arch/arm/boot/dts/bcm63138dvt.dts b/arch/arm/boot/dts/bcm63138dvt.dts
> new file mode 100644
> index 000000000000..e212b4731978
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm63138dvt.dts
> @@ -0,0 +1,18 @@
> +/*
> + * Broadcom BCM63138 Reference Board DTS
> + *
> + * Copyright (C) 2014 Broadcom Corporation
> + */
> +
> +/dts-v1/;
> +
> +#include "bcm63138.dtsi"
> +
> +/ {
> +	compatible = "BCM963138DVT", "brcm,bcm63138";

The specific board compatible string needs a vendor prefix. Also,
there's only some rare old examples that use upper case in their
compatible strings. Let's conform to what 99% of compatible strings
do here and have:

	compatible = "brcm,bcm963138dvt", "brcm,bcm63138";

Along the lines of Jonas' question? Is there really a "9" prepended in
this board name given that the filename is bcm63138dvt.dts? Either way,
this should be consistent between compatible and filename.

-Matt

> +	model = "Broadcom BCM963138DVT";
> +
> +	memory {
> +		reg = <0x0 0x08000000>;
> +	};
> +};
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
