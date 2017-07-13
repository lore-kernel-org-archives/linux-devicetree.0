From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: ls1012a: add USB host controller nodes
Date: Thu, 13 Jul 2017 16:07:18 +0800
Message-ID: <20170713080717.GP3172@dragon>
References: <1499223243-13253-1-git-send-email-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1499223243-13253-1-git-send-email-ran.wang_1-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Yuantian Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>, Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>, horia.geanta-3arQi8VN3Tc@public.gmane.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 05, 2017 at 10:54:03AM +0800, Ran Wang wrote:
> LS1012A has one USB 3.0(DWC3) controller and
> one USB 2.0 controller.
> 
> Signed-off-by: Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> index b497ac1..8aa2dcf 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
> @@ -411,6 +411,23 @@
>  				 <&clockgen 4 3>;
>  		};
>  
> +		usb0: usb3@2f00000 {
> +			compatible = "snps,dwc3";
> +			reg = <0x0 0x2f00000 0x0 0x10000>;
> +			interrupts = <0 60 0x4>;
> +			dr_mode = "host";
> +			snps,quirk-frame-length-adjustment = <0x20>;
> +			snps,dis_rxdet_inp3_quirk;
> +		};
> +
> +		usb1: usb2@8600000 {
> +			compatible = "fsl-usb2-dr-v2.5", "fsl-usb2-dr";
> +			reg = <0x0 0x8600000 0x0 0x1000>;
> +			interrupts = <0 139 0x4>;
> +			dr_mode = "host";
> +			phy_type = "ulpi";
> +		};

Please keep the nodes sorted in unit-address.

Shawn

> +
>  		sata: sata@3200000 {
>  			compatible = "fsl,ls1012a-ahci", "fsl,ls1043a-ahci";
>  			reg = <0x0 0x3200000 0x0 0x10000>,
> -- 
> 2.1.0.27.g96db324
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
