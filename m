From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/3] ARM: imx6: adopt DT to new GPC binding
Date: Thu, 7 Apr 2016 10:50:42 +0800
Message-ID: <20160407025042.GB3111@x250>
References: <1458128514-9560-1-git-send-email-l.stach@pengutronix.de>
 <1458128514-9560-3-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458128514-9560-3-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 16, 2016 at 12:41:54PM +0100, Lucas Stach wrote:
> @@ -786,14 +787,29 @@
>  				interrupts = <0 89 IRQ_TYPE_LEVEL_HIGH>,
>  					     <0 90 IRQ_TYPE_LEVEL_HIGH>;
>  				interrupt-parent = <&intc>;
> -				pu-supply = <&reg_pu>;
> -				clocks = <&clks IMX6QDL_CLK_GPU3D_CORE>,
> -					 <&clks IMX6QDL_CLK_GPU3D_SHADER>,
> -					 <&clks IMX6QDL_CLK_GPU2D_CORE>,
> -					 <&clks IMX6QDL_CLK_GPU2D_AXI>,
> -					 <&clks IMX6QDL_CLK_OPENVG_AXI>,
> -					 <&clks IMX6QDL_CLK_VPU_AXI>;
> -				#power-domain-cells = <1>;
> +				clocks = <&clks IMX6QDL_CLK_IPG>;
> +				clock-names = "ipg";
> +
> +				pgc {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					power-domain@0 {
> +						reg = <0>;
> +						#power-domain-cells = <0>;
> +					};

Have a new line between nodes please.

Shawn

> +					pd_pu: power-domain@1 {
> +						reg = <1>;
> +						#power-domain-cells = <0>;
> +						domain-supply = <&reg_pu>;
> +						clocks = <&clks IMX6QDL_CLK_GPU3D_CORE>,
> +						         <&clks IMX6QDL_CLK_GPU3D_SHADER>,
> +						         <&clks IMX6QDL_CLK_GPU2D_CORE>,
> +						         <&clks IMX6QDL_CLK_GPU2D_AXI>,
> +						         <&clks IMX6QDL_CLK_OPENVG_AXI>,
> +						         <&clks IMX6QDL_CLK_VPU_AXI>;
> +					};
> +				};
>  			};
>  
>  			gpr: iomuxc-gpr@020e0000 {
> -- 
> 2.7.0
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
