From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 12/12] ARM: dts: imx6: add Vivante GPU nodes
Date: Fri, 11 Dec 2015 15:02:59 +0800
Message-ID: <20151211070258.GA11252@tiger>
References: <1449237604-19064-1-git-send-email-l.stach@pengutronix.de>
 <1449237604-19064-13-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449237604-19064-13-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 04, 2015 at 03:00:04PM +0100, Lucas Stach wrote:
> This adds the device nodes for 2D, 3D and VG GPU cores.
> 
> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6dl.dtsi  |  5 +++++
>  arch/arm/boot/dts/imx6q.dtsi   | 15 +++++++++++++++
>  arch/arm/boot/dts/imx6qdl.dtsi | 22 ++++++++++++++++++++++
>  3 files changed, 42 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6dl.dtsi b/arch/arm/boot/dts/imx6dl.dtsi
> index 4b0ec0703825..51c517a5cafd 100644
> --- a/arch/arm/boot/dts/imx6dl.dtsi
> +++ b/arch/arm/boot/dts/imx6dl.dtsi
> @@ -104,6 +104,11 @@
>  		compatible = "fsl,imx-display-subsystem";
>  		ports = <&ipu1_di0>, <&ipu1_di1>;
>  	};
> +
> +	gpu-subsystem {
> +		compatible = "fsl,imx-gpu-subsystem";
> +		cores = <&gpu_2d>, <&gpu_3d>;
> +	};
>  };
>  
>  &gpt {
> diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
> index 399103b8e2c9..77d618b2870c 100644
> --- a/arch/arm/boot/dts/imx6q.dtsi
> +++ b/arch/arm/boot/dts/imx6q.dtsi
> @@ -153,6 +153,16 @@
>  			status = "disabled";
>  		};
>  
> +		gpu_vg: gpu@02204000 {
> +			compatible = "vivante,gc";
> +			reg = <0x02204000 0x4000>;
> +			interrupts = <0 11 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks IMX6QDL_CLK_OPENVG_AXI>,
> +				 <&clks IMX6QDL_CLK_GPU2D_CORE>;
> +			clock-names = "bus", "core";
> +			power-domains = <&gpc 1>;

Shouldn't property 'power-domains' be mentioned a bit in bindings doc?

> +		};
> +
>  		ipu2: ipu@02800000 {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> @@ -225,6 +235,11 @@
>  		compatible = "fsl,imx-display-subsystem";
>  		ports = <&ipu1_di0>, <&ipu1_di1>, <&ipu2_di0>, <&ipu2_di1>;
>  	};
> +
> +	gpu-subsystem {
> +		compatible = "fsl,imx-gpu-subsystem";
> +		cores = <&gpu_2d>, <&gpu_3d>, <&gpu_vg>;
> +	};
>  };
>  
>  &hdmi {
> diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
> index 2b6cc8bf3c5c..018975b867e1 100644
> --- a/arch/arm/boot/dts/imx6qdl.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl.dtsi
> @@ -119,6 +119,28 @@
>  			status = "disabled";
>  		};
>  
> +
> +		gpu_2d: gpu@00134000 {
> +			compatible = "vivante,gc";
> +			reg = <0x00134000 0x4000>;
> +			interrupts = <0 10 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks IMX6QDL_CLK_GPU2D_AXI>,
> +				 <&clks IMX6QDL_CLK_GPU2D_CORE>;
> +			clock-names = "bus", "core";
> +			power-domains = <&gpc 1>;
> +		};
> +
> +		gpu_3d: gpu@00130000 {
> +			compatible = "vivante,gc";
> +			reg = <0x00130000 0x4000>;
> +			interrupts = <0 9 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks IMX6QDL_CLK_GPU3D_AXI>,
> +				 <&clks IMX6QDL_CLK_GPU3D_CORE>,
> +				 <&clks IMX6QDL_CLK_GPU3D_SHADER>;
> +			clock-names = "bus", "core", "shader";
> +			power-domains = <&gpc 1>;
> +		};
> +

Please keep these added nodes sorted in unit-address.

Shawn

>  		hdmi: hdmi@0120000 {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> -- 
> 2.6.2
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
