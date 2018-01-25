From: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6sx: add pu power domain support
Date: Thu, 25 Jan 2018 23:30:25 +0800
Message-ID: <20180125153025.GC24622@b29396-OptiPlex-7040>
References: <1516720343-21933-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1516720343-21933-1-git-send-email-Anson.Huang-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <Anson.Huang-3arQi8VN3Tc@public.gmane.org>
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, aisheng.dong-3arQi8VN3Tc@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, Linux-imx-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 23, 2018 at 11:12:23PM +0800, Anson Huang wrote:
> Add PU power domain support, GPU is the only
> module inside PU power domain, and PU power
> is supplied by LDO_SOC.
> 
> Signed-off-by: Anson Huang <Anson.Huang-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6sx.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
> index fd78793..42ef4c6 100644
> --- a/arch/arm/boot/dts/imx6sx.dtsi
> +++ b/arch/arm/boot/dts/imx6sx.dtsi
> @@ -188,6 +188,7 @@
>  				 <&clks IMX6SX_CLK_GPU>,
>  				 <&clks IMX6SX_CLK_GPU>;
>  			clock-names = "bus", "core", "shader";
> +			power-domains = <&pd_pu>;
>  		};
>  
>  		dma_apbh: dma-apbh@1804000 {
> @@ -767,6 +768,13 @@
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> +					pd_pu: power-domain@1 {
> +						reg = <1>;
> +						#power-domain-cells = <0>;
> +						power-supply = <&reg_soc>;

I wonder we may not need this as it's a non-stop domain
just like we did for arm domain, right?

Otherwise, the patch looks fine to me.

Acked-by: Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>

Regards
Dong Aisheng

> +						clocks = <&clks IMX6SX_CLK_GPU>;
> +					};
> +
>  					pd_pci: power-domain@3 {
>  						reg = <3>;
>  						#power-domain-cells = <0>;
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
