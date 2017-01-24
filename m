From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] ARM: dts: imx53-qsb-common: fix FEC pinmux config
Date: Tue, 24 Jan 2017 21:19:59 +0800
Message-ID: <20170124131958.GX5662@dragon>
References: <20170123151459.29691-1-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170123151459.29691-1-linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 23, 2017 at 04:14:59PM +0100, linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org wrote:
> From: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
> 
> The pinmux configuration in device tree is different from manual
> muxing in <u-boot>/board/freescale/mx53loco/mx53loco.c
> It seems the device tree configuration is never used by any kernel
> driver and the correct setting, preconfigured by u-boot, was never
> overwritten. So this issue never showed up anywhere.

The change is fine.  But the commit log may need to be rewritten,
because pad config value 0x80000000 is defined as leaving the register
untouched, i.e. using whatever is in register, reset value or the one
configured by firmware.  See NO_PAD_CTL in
Documentation/devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt.

> 
> ---
> I stumbled upon this difference, while adding the imx53 based CX9020
> Embedded PC to u-boot bootloader. "New" boards are encouraged to use
> device tree for pinmuxing in u-boot, so I tried to reuse
> imx53-qsb-common.dtsi for that. That failed with a high packet loss on
> the fec_mxc device. With the attached patch that device tree based
> pinmuxing seems successful in u-boot. My suggestion is to apply it to
> imx53-qsb-common.dtsi, too. That will help other "late adopters" and
> prevent similar issues, in case any kernel driver starts using this
> pinmux configurations.
> 
> Signed-off-by: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>

Your SoB should be put into commit log, i.e. above the first occurrence
of "---".

Shawn

> ---
>  arch/arm/boot/dts/imx53-qsb-common.dtsi | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx53-qsb-common.dtsi b/arch/arm/boot/dts/imx53-qsb-common.dtsi
> index c05e7cfd0cbc..40b3e31935d0 100644
> --- a/arch/arm/boot/dts/imx53-qsb-common.dtsi
> +++ b/arch/arm/boot/dts/imx53-qsb-common.dtsi
> @@ -215,16 +215,16 @@
>  
>  		pinctrl_fec: fecgrp {
>  			fsl,pins = <
> -				MX53_PAD_FEC_MDC__FEC_MDC		0x80000000
> -				MX53_PAD_FEC_MDIO__FEC_MDIO		0x80000000
> -				MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x80000000
> -				MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x80000000
> -				MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x80000000
> -				MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x80000000
> -				MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x80000000
> -				MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x80000000
> -				MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x80000000
> -				MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x80000000
> +				MX53_PAD_FEC_MDC__FEC_MDC		0x4
> +				MX53_PAD_FEC_MDIO__FEC_MDIO		0x1fc
> +				MX53_PAD_FEC_REF_CLK__FEC_TX_CLK	0x180
> +				MX53_PAD_FEC_RX_ER__FEC_RX_ER		0x180
> +				MX53_PAD_FEC_CRS_DV__FEC_RX_DV		0x180
> +				MX53_PAD_FEC_RXD1__FEC_RDATA_1		0x180
> +				MX53_PAD_FEC_RXD0__FEC_RDATA_0		0x180
> +				MX53_PAD_FEC_TX_EN__FEC_TX_EN		0x4
> +				MX53_PAD_FEC_TXD1__FEC_TDATA_1		0x4
> +				MX53_PAD_FEC_TXD0__FEC_TDATA_0		0x4
>  			>;
>  		};
>  
> -- 
> 2.11.0
> 
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
