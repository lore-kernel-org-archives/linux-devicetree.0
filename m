From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] arm64: dts: ls1088a: Add qspi device node for
 ls1088a-rdb
Date: Mon, 5 Feb 2018 16:17:23 +0800
Message-ID: <20180205081722.GS31354@dragon>
References: <1517334262-17969-1-git-send-email-yogeshnarayan.gaur@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1517334262-17969-1-git-send-email-yogeshnarayan.gaur-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yogesh Gaur <yogeshnarayan.gaur-3arQi8VN3Tc@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org, suresh.gupta-3arQi8VN3Tc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, han.xu-3arQi8VN3Tc@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 30, 2018 at 11:14:22PM +0530, Yogesh Gaur wrote:
> Add nodes and properties for QSPI controller.
> Add support for spansion flash, s25fs512s, as slave device for
> QSPI controller.
> 
> Added entry of "fsl,ls1088a-qspi" in fsl-quadspi.txt binding file.
> 
> Signed-off-by: Suresh Gupta <suresh.gupta-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur-3arQi8VN3Tc@public.gmane.org>
> ---
> Depends on
>  https://patchwork.ozlabs.org/project/linux-mtd/list/?series=26084

Send me dts patch only after driver and bindings doc get merged.

> 
> Changes for v2:
> - Move property spi-rx-bus-width and spi-tx-bus-width from controller
>   to connected slave device node.
> 
>  .../devicetree/bindings/mtd/fsl-quadspi.txt        |  1 +

The bindings doc shouldn't be part of dts patch.

Shawn

>  arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts  | 23 ++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     | 12 +++++++++++
>  3 files changed, 36 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> index 811da0e..956c23c 100644
> --- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> @@ -7,6 +7,7 @@ Required properties:
>  		 or
>  		 "fsl,ls2080a-qspi" followed by "fsl,ls1021a-qspi",
>  		 "fsl,ls1043a-qspi" followed by "fsl,ls1021a-qspi"
> +		 "fsl,ls2080a-qspi" followed by "fsl,ls1088a-qspi",
>    - reg : the first contains the register location and length,
>            the second contains the memory mapping address and length
>    - reg-names: Should contain the reg names "QuadSPI" and "QuadSPI-memory"
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> index 0f6fcda..8afe536 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
> @@ -94,6 +94,29 @@
>  	};
>  };
>  
> +&qspi {
> +	status = "okay";
> +	fsl,qspi-has-second-chip;
> +	qflash0: s25fs512s@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		spi-max-frequency = <20000000>;
> +		reg = <0>;
> +		spi-rx-bus-width = <4>;
> +		spi-tx-bus-width = <4>;
> +	};
> +
> +	qflash1: s25fs512s@1 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		spi-max-frequency = <20000000>;
> +		reg = <1>;
> +		spi-rx-bus-width = <4>;
> +		spi-tx-bus-width = <4>;
> +	};
> +
> +};
> +
>  &ifc {
>  	ranges = <0 0 0x5 0x30000000 0x00010000
>  		  2 0 0x5 0x20000000 0x00010000>;
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index bd80e9a..b45a522 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -394,6 +394,18 @@
>  			status = "disabled";
>  		};
>  
> +		qspi: quadspi@20c0000 {
> +			compatible = "fsl,ls2080a-qspi", "fsl,ls1088a-qspi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0x0 0x20c0000 0x0 0x10000>,
> +				<0x0 0x20000000 0x0 0x10000000>;
> +			reg-names = "QuadSPI", "QuadSPI-memory";
> +			interrupts = <0 25 0x4>; /* Level high type */
> +			clocks = <&clockgen 4 3>, <&clockgen 4 3>;
> +			clock-names = "qspi_en", "qspi";
> +		};
> +
>  		sata: sata@3200000 {
>  			compatible = "fsl,ls1088a-ahci";
>  			reg = <0x0 0x3200000 0x0 0x10000>,
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
