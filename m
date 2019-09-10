From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v2 08/14] dmaengine: ti: New driver for K3 UDMA - split#1:
 defines, structs, io func
Date: Tue, 10 Sep 2019 10:27:16 +0300
Message-ID: <2081d1fb-dfa5-d7ca-2dd3-bdf42b60e51c@ti.com>
References: <20190730093450.12664-1-peter.ujfalusi@ti.com>
 <20190730093450.12664-9-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730093450.12664-9-peter.ujfalusi@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, vkoul@kernel.org, robh+dt@kernel.org, nm@ti.com, ssantosh@kernel.org
Cc: dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, lokeshvutla@ti.com, t-kristo@ti.com, tony@atomide.com, j-keerthy@ti.com
List-Id: devicetree@vger.kernel.org



On 30/07/2019 12:34, Peter Ujfalusi wrote:
> Split patch for review containing: defines, structs, io and low level
> functions and interrupt callbacks.
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

[...]

> +
> +/* Generic register access functions */
> +static inline u32 udma_read(void __iomem *base, int reg)
> +{
> +	return __raw_readl(base + reg);
> +}
> +
> +static inline void udma_write(void __iomem *base, int reg, u32 val)
> +{
> +	__raw_writel(val, base + reg);
> +}
> +
> +static inline void udma_update_bits(void __iomem *base, int reg,
> +				    u32 mask, u32 val)
> +{
> +	u32 tmp, orig;
> +
> +	orig = __raw_readl(base + reg);
> +	tmp = orig & ~mask;
> +	tmp |= (val & mask);
> +
> +	if (tmp != orig)
> +		__raw_writel(tmp, base + reg);
> +}

Pls, do not use  _raw APIs in drivers.

[...]

-- 
Best regards,
grygorii
