From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [v11 6/7] arm64: dts: ls1046a: add qdma device tree nodes
Date: Thu, 6 Dec 2018 09:05:33 +0800
Message-ID: <20181206010531.GR3987@dragon>
References: <20181030023604.34027-1-peng.ma@nxp.com>
 <20181030023604.34027-6-peng.ma@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181030023604.34027-6-peng.ma@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Ma <peng.ma@nxp.com>
Cc: vkoul@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, leoyang.li@nxp.com, dan.j.williams@intel.com, zw@zh-kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Wen He <wen.he_1@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 30, 2018 at 10:36:03AM +0800, Peng Ma wrote:
> add the qDMA device tree nodes for LS1046A devices.
> 
> Signed-off-by: Wen He <wen.he_1@nxp.com>
> Signed-off-by: Peng Ma <peng.ma@nxp.com>
> ---
> change in v11:
> 	- no
> 
>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   21 +++++++++++++++++++++
>  1 files changed, 21 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> index ef83786..dc65318 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> @@ -704,6 +704,27 @@
>  					<0000 0 0 4 &gic GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		qdma: dma-controller@8380000 {
> +			compatible = "fsl,ls1046a-qdma", "fsl,ls1021a-qdma";
> +			reg = <0x0 0x8380000 0x0 0x1000>, /* Controller regs */
> +			      <0x0 0x8390000 0x0 0x10000>, /* Status regs */
> +			      <0x0 0x83a0000 0x0 0x40000>; /* Block regs */
> +			interrupts = <0 153 0x4>,
> +				     <0 39 0x4>,
> +				     <0 40 0x4>,
> +				     <0 41 0x4>,
> +				     <0 42 0x4>;

Use GIC_SPI and IRQ_TYPE_xxx defines.

Shawn

> +			interrupt-names = "qdma-error", "qdma-queue0",
> +				"qdma-queue1", "qdma-queue2", "qdma-queue3";
> +			dma-channels = <8>;
> +			block-number = <1>;
> +			block-offset = <0x10000>;
> +			fsl,dma-queues = <2>;
> +			status-sizes = <64>;
> +			queue-sizes = <64 64>;
> +			big-endian;
> +		};
> +
>  	};
>  
>  	reserved-memory {
> -- 
> 1.7.1
> 
