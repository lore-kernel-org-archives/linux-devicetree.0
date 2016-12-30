From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: imx: Add ocotp node for imx6ul
Date: Fri, 30 Dec 2016 10:25:29 +0800
Message-ID: <20161230022527.GH6177@dragon>
References: <1479344899-3141-1-git-send-email-ping.bai@nxp.com>
 <1479344899-3141-3-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479344899-3141-3-git-send-email-ping.bai-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 17, 2016 at 09:08:19AM +0800, Bai Ping wrote:
> Add ocotp node for i.MX6UL SOC.
> 
> Signed-off-by: Bai Ping <ping.bai-3arQi8VN3Tc@public.gmane.org>

The DTS change looks good to me.  But I cannot apply it until the driver
and bindings part get accepted.  You should figure out who is collecting
nvmem patches.  It seems to be Greg Kroah-Hartman, who is not on copy.

Shawn

> ---
>  arch/arm/boot/dts/imx6ul.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
> index c5c05fd..c6f6613 100644
> --- a/arch/arm/boot/dts/imx6ul.dtsi
> +++ b/arch/arm/boot/dts/imx6ul.dtsi
> @@ -849,6 +849,12 @@
>  				reg = <0x021b0000 0x4000>;
>  			};
>  
> +			ocotp: ocotp-ctrl@021bc000 {
> +				compatible = "fsl,imx6ul-ocotp", "syscon";
> +				reg = <0x021bc000 0x4000>;
> +				clocks = <&clks IMX6UL_CLK_OCOTP>;
> +			};
> +
>  			lcdif: lcdif@021c8000 {
>  				compatible = "fsl,imx6ul-lcdif", "fsl,imx28-lcdif";
>  				reg = <0x021c8000 0x4000>;
> -- 
> 1.9.1
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
