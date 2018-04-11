From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [RFC 1/6] dt-bindings: dma: xilinx_dma: Add optional property
 has_axieth_connected
Date: Wed, 11 Apr 2018 14:35:26 +0530
Message-ID: <20180411090525.GX6014@localhost>
References: <1522665546-10035-1-git-send-email-radheys@xilinx.com>
 <1522665546-10035-2-git-send-email-radheys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1522665546-10035-2-git-send-email-radheys@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc: dan.j.williams@intel.com, michal.simek@xilinx.com, appana.durga.rao@xilinx.com, radheys@xilinx.com, lars@metafoo.de, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 02, 2018 at 04:09:01PM +0530, Radhey Shyam Pandey wrote:
> Add an optional AXI DMA property 'has_axieth_connected'. This can be
> specified to indicate that AXI DMA is connected to AXI Ethernet in
> hardware design and dma driver needs to do some additional handling.

1. why are DT people and list not added to this? I have added that
2. should we have a property for a specific peripheral? Wouldn't it help to have
a generic property for peripheral connected which can be scaled to more IPs
being connected in future?
3. Please use right subsystem name, it damengine: not dma:

> 
> Signed-off-by: Radhey Shyam Pandey <radheys@xilinx.com>
> ---
>  .../devicetree/bindings/dma/xilinx/xilinx_dma.txt  |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> index a2b8bfa..5d592e3 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_dma.txt
> @@ -42,6 +42,7 @@ Optional properties:
>  	the hardware.
>  Optional properties for AXI DMA:
>  - xlnx,mcdma: Tells whether configured for multi-channel mode in the hardware.
> +- xlnx,axieth-connected: Tells whether AXI DMA is connected to AXI Ethernet.
>  Optional properties for VDMA:
>  - xlnx,flush-fsync: Tells which channel to Flush on Frame sync.
>  	It takes following values:
> -- 
> 1.7.1
> 

-- 
~Vinod
