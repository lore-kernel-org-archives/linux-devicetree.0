From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] pcm051 inital support uart mmc pmic
Date: Mon, 16 Dec 2013 09:11:40 +0100
Message-ID: <20131216081139.GQ24559@pengutronix.de>
References: <1387005020-9739-1-git-send-email-putta.pv@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1387005020-9739-1-git-send-email-putta.pv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: p v sukesh <putta.pv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

You should have the Linux Arm Kernel Mailing list on Cc, Tony Lindgren
<tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, and probably somebody from Phytec, maybe Jan Weitzel
<J.Weitzel-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>.

On Sat, Dec 14, 2013 at 12:40:20PM +0530, p v sukesh wrote:
> ---
>  arch/arm/boot/dts/Makefile             |    1 +
>  arch/arm/boot/dts/am335x-openboard.dts |  169 ++++++++++++++++++++++++++++++++
>  2 files changed, 170 insertions(+)
>  create mode 100644 arch/arm/boot/dts/am335x-openboard.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index d57c1a6..d88b525 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -195,6 +195,7 @@ dtb-$(CONFIG_ARCH_OMAP2PLUS) += omap2420-h4.dtb \
>  	omap4-sdp-es23plus.dtb \
>  	omap5-uevm.dtb \
>  	am335x-evm.dtb \
> +	am335x-openboard.dtb\
>  	am335x-evmsk.dtb \
>  	am335x-bone.dtb \
>  	am335x-boneblack.dtb \
> diff --git a/arch/arm/boot/dts/am335x-openboard.dts b/arch/arm/boot/dts/am335x-openboard.dts

Why 'openboard' when it's a Phytec phyCORE board? This should be
am335x-phytec-phycore.dts.

> +/ {
> +	model = "phytec phyCORE-AM3359";
> +	compatible = "ti,pcm051", "ti,am33xx";

The pcm051 is not from TI, it's from phytec.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
