From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: imx51: Fix inconsistent display port
 names
Date: Thu, 05 Oct 2017 16:09:13 +0200
Message-ID: <1507212553.8473.16.camel@pengutronix.de>
References: <1507207427-32424-1-git-send-email-marco.franchi@nxp.com>
         <1507207427-32424-2-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507207427-32424-2-git-send-email-marco.franchi-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marco,

On Thu, 2017-10-05 at 09:43 -0300, Marco Franchi wrote:
> The parallel display interface pad groups are called DISP0 and DISP1 in 
> the reference manuals, but in the i.MX51 dts files they are called DISP1 
> and DISP2.

To me, this sounds like they are called DISP0/1 also in the i.MX51
reference manual, but if I'm not mistaken, the i.MX51 reference manual
actually calls them DISP1/2.
I'd change the comment to say something to the effect of: "Contrary to
later SoCs, the parallel display interface pad groups on i.MX51 are
called DISP1 and DISP2, not DISP0 and DISP1."

> Fix this inconsistence by changing the DISP names in the i.mx51 dts.
> 
> Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>

For the patch itself,
Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

> ---
> Changes since v1:
> -newly introduced in this series
>  arch/arm/boot/dts/imx51-apf51dev.dts |  4 ++--
>  arch/arm/boot/dts/imx51-babbage.dts  | 12 ++++++------
>  arch/arm/boot/dts/imx51-ts4800.dts   |  6 +++---
>  arch/arm/boot/dts/imx51.dtsi         |  4 ++--
>  4 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx51-apf51dev.dts
> b/arch/arm/boot/dts/imx51-apf51dev.dts
> index f04d0df..2f1a9d2 100644
> --- a/arch/arm/boot/dts/imx51-apf51dev.dts
> +++ b/arch/arm/boot/dts/imx51-apf51dev.dts
> @@ -51,7 +51,7 @@
>  
>  		port {
>  			display_in: endpoint {
> -				remote-endpoint = <&ipu_di0_disp0>;
> +				remote-endpoint = <&ipu_di0_disp1>;
>  			};
>  		};
>  	};
> @@ -218,6 +218,6 @@
>  	};
>  };
>  
> -&ipu_di0_disp0 {
> +&ipu_di0_disp1 {
>  	remote-endpoint = <&display_in>;
>  };
> diff --git a/arch/arm/boot/dts/imx51-babbage.dts
> b/arch/arm/boot/dts/imx51-babbage.dts
> index 297953c..668c37b 100644
> --- a/arch/arm/boot/dts/imx51-babbage.dts
> +++ b/arch/arm/boot/dts/imx51-babbage.dts
> @@ -39,7 +39,7 @@
>  		};
>  	};
>  
> -	display0: disp0 {
> +	display1: disp1 {
>  		compatible = "fsl,imx-parallel-display";
>  		interface-pix-fmt = "rgb24";
>  		pinctrl-names = "default";
> @@ -61,12 +61,12 @@
>  
>  		port {
>  			display0_in: endpoint {
> -				remote-endpoint = <&ipu_di0_disp0>;
> +				remote-endpoint = <&ipu_di0_disp1>;
>  			};
>  		};
>  	};
>  
> -	display1: disp1 {
> +	display2: disp2 {
>  		compatible = "fsl,imx-parallel-display";
>  		interface-pix-fmt = "rgb565";
>  		pinctrl-names = "default";
> @@ -93,7 +93,7 @@
>  
>  		port {
>  			display1_in: endpoint {
> -				remote-endpoint = <&ipu_di1_disp1>;
> +				remote-endpoint = <&ipu_di1_disp2>;
>  			};
>  		};
>  	};
> @@ -348,11 +348,11 @@
>  	};
>  };
>  
> -&ipu_di0_disp0 {
> +&ipu_di0_disp1 {
>  	remote-endpoint = <&display0_in>;
>  };
>  
> -&ipu_di1_disp1 {
> +&ipu_di1_disp2 {
>  	remote-endpoint = <&display1_in>;
>  };
>  
> diff --git a/arch/arm/boot/dts/imx51-ts4800.dts
> b/arch/arm/boot/dts/imx51-ts4800.dts
> index e6be869..35a1112 100644
> --- a/arch/arm/boot/dts/imx51-ts4800.dts
> +++ b/arch/arm/boot/dts/imx51-ts4800.dts
> @@ -50,7 +50,7 @@
>  		power-supply = <&backlight_reg>;
>  	};
>  
> -	display0: disp0 {
> +	display1: disp1 {
>  		compatible = "fsl,imx-parallel-display";
>  		interface-pix-fmt = "rgb24";
>  		pinctrl-names = "default";
> @@ -73,7 +73,7 @@
>  
>  		port@0 {
>  			display0_in: endpoint {
> -				remote-endpoint = <&ipu_di0_disp0>;
> +				remote-endpoint = <&ipu_di0_disp1>;
>  			};
>  		};
>  	};
> @@ -107,7 +107,7 @@
>  	};
>  };
>  
> -&ipu_di0_disp0 {
> +&ipu_di0_disp1 {
>  	remote-endpoint = <&display0_in>;
>  };
>  
> diff --git a/arch/arm/boot/dts/imx51.dtsi
> b/arch/arm/boot/dts/imx51.dtsi
> index 1ee1d54..378be72 100644
> --- a/arch/arm/boot/dts/imx51.dtsi
> +++ b/arch/arm/boot/dts/imx51.dtsi
> @@ -148,14 +148,14 @@
>  			ipu_di0: port@2 {
>  				reg = <2>;
>  
> -				ipu_di0_disp0: endpoint {
> +				ipu_di0_disp1: endpoint {
>  				};
>  			};
>  
>  			ipu_di1: port@3 {
>  				reg = <3>;
>  
> -				ipu_di1_disp1: endpoint {
> +				ipu_di1_disp2: endpoint {
>  				};
>  			};
>  		};

regards
Philipp
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
