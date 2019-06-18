From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 2/4] arm64: dts: fsl: ls1028a: Add eDMA node
Date: Tue, 18 Jun 2019 21:13:20 +0800
Message-ID: <20190618131319.GC1959@dragon>
References: <20190506090344.37784-1-peng.ma@nxp.com>
 <20190506090344.37784-2-peng.ma@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190506090344.37784-2-peng.ma@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Ma <peng.ma@nxp.com>
Cc: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, leoyang.li@nxp.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, May 06, 2019 at 09:03:42AM +0000, Peng Ma wrote:
> Add the eDMA device tree nodes for LS1028A devices
> 
> Signed-off-by: Peng Ma <peng.ma@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi |   15 +++++++++++++++
>  1 files changed, 15 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> index 8116fb3..71b87cb 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -235,6 +235,21 @@
>  			status = "disabled";
>  		};
>  
> +		edma0: edma@22c0000 {
> +			#dma-cells = <2>;
> +			compatible = "fsl,vf610-edma";
> +			reg = <0x0 0x22c0000 0x0 0x10000>,
> +			      <0x0 0x22d0000 0x0 0x10000>,
> +			      <0x0 0x22e0000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "edma-tx", "edma-err";
> +			dma-channels = <32>;
> +			clock-names = "dmamux0", "dmamux1";
> +			clocks = <&clockgen 4 1>,
> +				 <&clockgen 4 1>;
> +		};
> +

The edma@22c0000 node had already been added by commit below:

  f54f7be5c5ac ("arm64: dts: ls1028a: Add Audio DT nodes")

Shawn

>  		gpio1: gpio@2300000 {
>  			compatible = "fsl,qoriq-gpio";
>  			reg = <0x0 0x2300000 0x0 0x10000>;
> -- 
> 1.7.1
> 
