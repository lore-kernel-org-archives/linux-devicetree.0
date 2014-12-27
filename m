From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: mvebu: Add Armada 385 General Purpose
 Development Board support
Date: Sat, 27 Dec 2014 12:34:01 +0100
Message-ID: <20141227113401.GC21001@lunn.ch>
References: <1419678035-10658-1-git-send-email-gregory.clement@free-electrons.com>
 <1419678035-10658-4-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1419678035-10658-4-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Dec 27, 2014 at 12:00:35PM +0100, Gregory CLEMENT wrote:
> The A385-GP is a board produced by Marvell that holds
> 
> - 1 PCIe slot
> - 2 mini PCIe slot (one of them is multiplexed with the PCIe slot,
>   muxing is selected through the GPIO expander)
> - 1 16MB SPI-NOR
> - 2 Gigabit Ethernet ports
> - 4 SATA ports (2 of them are multiplexed with the mini PCIe slots,
>   muxing is selected through the GPIO expander)
> - 1 SDIO slot
> - 1 USB3 port
> - 2 USB2 port
> - 2 GPIO/interrupts expander on I2C
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm/boot/dts/Makefile          |   1 +
>  arch/arm/boot/dts/armada-385-gp.dts | 380 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 381 insertions(+)
>  create mode 100644 arch/arm/boot/dts/armada-385-gp.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 91bd5bd62857..d6d7bafac127 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -535,6 +535,7 @@ dtb-$(CONFIG_MACH_ARMADA_375) += \
>  	armada-375-db.dtb
>  dtb-$(CONFIG_MACH_ARMADA_38X) += \
>  	armada-385-db.dtb \
> +	armada-385-gp.dtb \
>  	armada-385-rd.dtb
>  dtb-$(CONFIG_MACH_ARMADA_XP) += \
>  	armada-xp-axpwifiap.dtb \
> diff --git a/arch/arm/boot/dts/armada-385-gp.dts b/arch/arm/boot/dts/armada-385-gp.dts
> new file mode 100644
> index 000000000000..c9a375674e7f
> --- /dev/null
> +++ b/arch/arm/boot/dts/armada-385-gp.dts
> @@ -0,0 +1,380 @@
> +/*
> + * Device Tree file for Marvell Armada 385 development board
> + * (RD-88F6820-GP)
> + *
> + * Copyright (C) 2014 Marvell
> + *
> + * Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.

Hi Gregory

I'm guessing here...

The file says Copyright Marvell. I guess Marvell released it GPL? Not
Dual license? So it would be nice to have a Signed-off-by: from
somebody in Marvell that they are O.K. with the dual license.

Thanks
	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
