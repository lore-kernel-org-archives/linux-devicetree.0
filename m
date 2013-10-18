From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [Patch v2][ 20/37] arm/dts: imx25.dtsi: Add some pinmux pins.
Date: Fri, 18 Oct 2013 09:02:31 +0200
Message-ID: <20131018070231.GU30088@pengutronix.de>
References: <1382022155-21954-1-git-send-email-denis@eukrea.com>
 <1382022155-21954-21-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382022155-21954-21-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eric =?iso-8859-15?Q?B=E9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 17, 2013 at 05:02:18PM +0200, Denis Carikli wrote:
> Uart1, fec, i2c1,esdhc1 and audmux were added.
> 
> +				fec {
> +					pinctrl_fec_1: fecgrp-1 {
> +						fsl,pins = <
> +							MX25_PAD_FEC_MDC__FEC_MDC       0x80000000
> +							MX25_PAD_FEC_MDIO__FEC_MDIO     0x400001e0
> +							MX25_PAD_FEC_TDATA0__FEC_TDATA0 0x80000000
> +							MX25_PAD_FEC_TDATA1__FEC_TDATA1 0x80000000
> +							MX25_PAD_FEC_TX_EN__FEC_TX_EN   0x80000000
> +							MX25_PAD_FEC_RDATA0__FEC_RDATA0 0x800000c0
> +							MX25_PAD_FEC_RDATA1__FEC_RDATA1 0x800000c0
> +							MX25_PAD_FEC_RX_DV__FEC_RX_DV   0x800000c0

The 0x8000xxxx values don't make sense:

NO_PAD_CTL(1 << 31): indicate this pin does not need config.

So by setting bit 31 you ask to ignore the settings, still you set other
bits.

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
