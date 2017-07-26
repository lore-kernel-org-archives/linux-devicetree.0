From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] usb: dts: fix the issue that usb is not detected on
 ls1088ardb
Date: Wed, 26 Jul 2017 10:24:16 +0800
Message-ID: <20170726022414.GH29754@dragon>
References: <1500518306-9879-1-git-send-email-yinbo.zhu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1500518306-9879-1-git-send-email-yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: yinbo.zhu-3arQi8VN3Tc@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mihai Bantea <mihai.bantea-3arQi8VN3Tc@public.gmane.org>, Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta-3arQi8VN3Tc@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Liu Gang <Gang.Liu-3arQi8VN3Tc@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>, Tang Yuantian <Yuantian.Tang-3arQi8VN3Tc@public.gmane.org>, York Sun <york.sun-3arQi8VN3Tc@public.gmane.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 20, 2017 at 10:38:26AM +0800, yinbo.zhu-3arQi8VN3Tc@public.gmane.org wrote:
> From: "yinbo.zhu" <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
> 
> Signed-off-by: yinbo.zhu <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>

The subject should be prefixed like 'arm64: dts: ls1088a: ...'.  And
the current subject is confusing.  You are adding USB support rather
than fixing something.

Also empty commit log is not really good.

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts |  8 ++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi    | 18 ++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> index e9276a5..d5c3d96 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> @@ -149,6 +149,14 @@
>  	status = "okay";
>  };
>  
> +&usb0 {
> +	status = "okay";
> +};
> +
> +&usb1 {
> +	status = "okay";
> +};
> +
>  &emdio1 {
>  	/* Freescale F104 PHY1 */
>  	mdio1_phy1: emdio1_phy@1 {

What tree is your patch generated against?  I do not see this 'emdio1'
device in my tree.

Remember to sort the node alphabetically in label name when adding new
labelled nodes.

> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index 3a3be87..65b3059 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -566,6 +566,24 @@
>  			fsl,qspi-has-second-chip;
>  		};
>  
> +		usb0: usb3@3100000 {
> +			compatible = "snps,dwc3";
> +			reg = <0x0 0x3100000 0x0 0x10000>;
> +			interrupts = <0 80 0x4>; /* Level high type */

Use IRQ_TYPE_LEVEL_HIGH, so that you can save the comment here.

> +			dr_mode = "host";
> +			configure-gfladj;

What is this property?

Shawn

> +			snps,dis_rxdet_inp3_quirk;
> +		};
> +
> +		usb1: usb3@3110000 {
> +			compatible = "snps,dwc3";
> +			reg = <0x0 0x3110000 0x0 0x10000>;
> +			interrupts = <0 81 0x4>; /* Level high type */
> +			dr_mode = "host";
> +			configure-gfladj;
> +			snps,dis_rxdet_inp3_quirk;
> +		};
> +
>  		pcie@3400000 {
>  			compatible = "fsl,ls2088a-pcie", "fsl,ls1088a-pcie",
>  				     "snps,dw-pcie";
> -- 
> 2.1.0.27.g96db324
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
