From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH][v3] arm64: Add flash node for ls1088a qds and rdb
Date: Fri, 12 May 2017 11:21:41 +0800
Message-ID: <20170512032140.GD8471@dragon>
References: <1494409403-22369-1-git-send-email-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1494409403-22369-1-git-send-email-prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 10, 2017 at 03:13:23PM +0530, Prabhakar Kushwaha wrote:
> LS1088AQDS consist of NOR, NAND and FPGA connected over IFC
> LS1088ARDB consist of NAND and FPGA connected over IFC.
> 
> So add flash information in ifc node of device tree.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>

The subject prefix should be like 'arm64: dts: ...'.

> ---
> changes for v2: Incorporated Shawn's comments
> changes for v3: Incorporated Shawn's further comments
> 
>  arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts | 24 +++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts | 16 +++++++++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi    |  5 +----
>  3 files changed, 41 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
> index 8c3cae5..82e1615 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts
> @@ -110,6 +110,30 @@
>  	};
>  };
>  
> +&ifc {
> +	ranges = <0 0 0x5 0x80000000 0x08000000
> +		  2 0 0x5 0x30000000 0x00010000
> +		  3 0 0x5 0x20000000 0x00010000>;
> +	status = "okay";
> +
> +	nor@0,0 {
> +		compatible = "cfi-flash";
> +		reg = <0x0 0x0 0x8000000>;
> +		bank-width = <2>;
> +		device-width = <1>;
> +	};
> +
> +	nand@2,0 {
> +		compatible = "fsl,ifc-nand";
> +		reg = <0x2 0x0 0x10000>;
> +	};
> +
> +	fpga: board-control@3,0 {
> +		compatible = "fsl,ls1088aqds-fpga", "fsl,fpga-qixis";
> +		reg = <0x3 0x0 0x0000100>;
> +	};
> +};
> +
>  &duart0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> index 8a04fbb..a93a588 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> @@ -94,6 +94,22 @@
>  	};
>  };
>  
> +&ifc {
> +	ranges = <0 0 0x5 0x30000000 0x00010000
> +		  2 0 0x5 0x20000000 0x00010000>;
> +	status = "okay";
> +
> +	nand@0,0 {
> +		compatible = "fsl,ifc-nand";
> +		reg = <0x0 0x0 0x10000>;
> +	};
> +
> +	fpga: board-control@2,0 {
> +		compatible = "fsl,ls1088ardb-fpga", "fsl,fpga-qixis";
> +		reg = <0x2 0x0 0x0000100>;
> +	};
> +};
> +
>  &duart0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index 2946fd7..e852b22 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -216,11 +216,8 @@
>  			little-endian;
>  			#address-cells = <2>;
>  			#size-cells = <1>;
> -
> -			ranges = <0 0 0x5 0x80000000 0x08000000
> -				  2 0 0x5 0x30000000 0x00010000
> -				  3 0 0x5 0x20000000 0x00010000>;
>  			status = "disabled";
> +

This is an unrelated change, and should be dropped.

I fixed those up and applied patch.

Shawn

>  		};
>  
>  		i2c0: i2c@2000000 {
> -- 
> 2.7.4
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
