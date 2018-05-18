Return-Path: <robherring2@gmail.com>
Date: Fri, 18 May 2018 16:26:05 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [v4 3/6] dt-bindings: fsl-qdma: Add NXP Layerscpae qDMA
 controller bindings
Message-ID: <20180518212605.GA1119@rob-hp-laptop>
References: <20180514120307.15592-1-wen.he_1@nxp.com>
 <20180514120307.15592-3-wen.he_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180514120307.15592-3-wen.he_1@nxp.com>
To: Wen He <wen.he_1@nxp.com>
Cc: vinod.koul@intel.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, leoyang.li@nxp.com, jiafei.pan@nxp.com, jiaheng.fan@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Mon, May 14, 2018 at 08:03:04PM +0800, Wen He wrote:
> Document the devicetree bindings for NXP Layerscape qDMA controller
> which could be found on NXP QorIQ Layerscape SoCs.
> 
> Signed-off-by: Wen He <wen.he_1@nxp.com>
> ---
> change in v4:
> 	- Rewrite the bindings document that follows generic DMA bindings file
> 
> change in v3:
> 	- no change
> 
> change in v2:
> 	- Remove indentation
> 	- Add "Should be" before 'fsl,ls1021a-qdma'
> 	- Replace 'channels' by 'dma-channels'
> 	- Replace 'qdma@8390000' by 'dma-controller@8390000'
> 
>  Documentation/devicetree/bindings/dma/fsl-qdma.txt |   41 ++++++++++++++++++++
>  1 files changed, 41 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/fsl-qdma.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/fsl-qdma.txt b/Documentation/devicetree/bindings/dma/fsl-qdma.txt
> new file mode 100644
> index 0000000..368c4e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl-qdma.txt
> @@ -0,0 +1,41 @@
> +NXP Layerscape SoC qDMA Controller
> +==================================
> +
> +This device follows the generic DMA bindings defined in dma/dma.txt.
> +
> +Required properties:
> +
> +- compatible:		Must be one of
> +			 "fsl,ls1021a-qdma": for LS1021A Board
> +			 "fsl,ls1043a-qdma": for ls1043A Board
> +			 "fsl,ls1046a-qdma": for ls1046A Board
> +- reg:			Should contain the register's base address and length.
> +- interrupts:		Should contain a reference to the interrupt used by this
> +			device.
> +- interrupt-names:	Should contain interrupt names:
> +			 "qdma-error": the error interrupt
> +			 "qdma-queue": the queue interrupt
> +- queues:		Should contain number of queues supported.

Needs a vendor prefix.

> +
> +Optional properties:
> +
> +- dma-channels:		Number of DMA channels supported by the controller.
> +- big-endian:		If present registers and hardware scatter/gather descriptors
> +			of the qDMA are implemented in big endian mode, otherwise in little
> +			mode.
> +
> +Examples:
> +
> +	qdma: dma-controller@8390000 {
> +		compatible = "fsl,ls1021a-qdma";
> +		reg = <0x0 0x8398000 0x0 0x2000 /* Controller registers */
> +		       0x0 0x839a000 0x0 0x2000>; /* Block registers */
> +		interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "qdma-error", "qdma-queue";
> +		dma-channels = <8>;
> +		queues = <2>;
> +		big-endian;
> +	};
> +
> +DMA clients must use the format described in dma/dma.txt file.
> -- 
> 1.7.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
