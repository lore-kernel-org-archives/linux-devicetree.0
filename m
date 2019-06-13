From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 10/16] dmaengine: ti: New driver for K3 UDMA - split#1:
 defines, structs, io func
Date: Thu, 13 Jun 2019 12:43:24 -0600
Message-ID: <20190613184324.GA26206@bogus>
References: <20190506123456.6777-1-peter.ujfalusi@ti.com>
 <20190506123456.6777-11-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190506123456.6777-11-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: vkoul@kernel.org, nm@ti.com, ssantosh@kernel.org, dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com, lokeshvutla@ti.com, t-kristo@ti.com, tony@atomide.com
List-Id: devicetree@vger.kernel.org

On Mon, May 06, 2019 at 03:34:50PM +0300, Peter Ujfalusi wrote:
> Split patch for review containing: defines, structs, io and low level
> functions and interrupt callbacks.

Not a useful comment for upstream.

> 
> DMA driver for
> Texas Instruments K3 NAVSS Unified DMA – Peripheral Root Complex (UDMA-P)
> 
> The UDMA-P is intended to perform similar (but significantly upgraded) functions
> as the packet-oriented DMA used on previous SoC devices. The UDMA-P module
> supports the transmission and reception of various packet types. The UDMA-P is
> architected to facilitate the segmentation and reassembly of SoC DMA data
> structure compliant packets to/from smaller data blocks that are natively
> compatible with the specific requirements of each connected peripheral. Multiple
> Tx and Rx channels are provided within the DMA which allow multiple segmentation
> or reassembly operations to be ongoing. The DMA controller maintains state
> information for each of the channels which allows packet segmentation and
> reassembly operations to be time division multiplexed between channels in order
> to share the underlying DMA hardware. An external DMA scheduler is used to
> control the ordering and rate at which this multiplexing occurs for Transmit
> operations. The ordering and rate of Receive operations is indirectly controlled
> by the order in which blocks are pushed into the DMA on the Rx PSI-L interface.
> 
> The UDMA-P also supports acting as both a UTC and UDMA-C for its internal
> channels. Channels in the UDMA-P can be configured to be either Packet-Based or
> Third-Party channels on a channel by channel basis.
> 
> The initial driver supports:
> - MEM_TO_MEM (TR mode)
> - DEV_TO_MEM (Packet / TR mode)
> - MEM_TO_DEV (Packet / TR mode)
> - Cyclic (Packet / TR mode)
> - Metadata for descriptors
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
>  drivers/dma/ti/k3-udma.c          | 1008 +++++++++++++++++++++++++++++
>  drivers/dma/ti/k3-udma.h          |  129 ++++
>  include/dt-bindings/dma/k3-udma.h |   26 +

This belongs in the binding patch.

>  3 files changed, 1163 insertions(+)
>  create mode 100644 drivers/dma/ti/k3-udma.c
>  create mode 100644 drivers/dma/ti/k3-udma.h
>  create mode 100644 include/dt-bindings/dma/k3-udma.h

> diff --git a/include/dt-bindings/dma/k3-udma.h b/include/dt-bindings/dma/k3-udma.h
> new file mode 100644
> index 000000000000..89ba6a9d4a8f
> --- /dev/null
> +++ b/include/dt-bindings/dma/k3-udma.h
> @@ -0,0 +1,26 @@
> +#ifndef __DT_TI_UDMA_H
> +#define __DT_TI_UDMA_H
> +
> +#define UDMA_TR_MODE		0
> +#define UDMA_PKT_MODE		1
> +
> +#define UDMA_DIR_TX		0
> +#define UDMA_DIR_RX		1
> +
> +#define PSIL_STATIC_TR_NONE	0
> +#define PSIL_STATIC_TR_XY	1
> +#define PSIL_STATIC_TR_MCAN	2
> +
> +#define UDMA_PDMA_TR_XY(id)				\
> +	ti,psil-config##id {				\
> +		linux,udma-mode = <UDMA_TR_MODE>;	\
> +		statictr-type = <PSIL_STATIC_TR_XY>;	\
> +	}

We don't accept this kind of complex macros in dts files. It obfuscates 
reading dts files.

Rob
