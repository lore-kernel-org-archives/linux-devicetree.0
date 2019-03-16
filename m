From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: arm64: allwinner: h6: Add binding for
 DMA controller
Date: Sat, 16 Mar 2019 16:27:11 +0530
Message-ID: <20190316105711.GG5348@vkoul-mobl>
References: <20190307165829.9086-1-jernej.skrabec@siol.net>
 <20190307165829.9086-2-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190307165829.9086-2-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: maxime.ripard@bootlin.com, wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On 07-03-19, 17:58, Jernej Skrabec wrote:
> DMA in H6 is similar to other DMA controller, except it is first which
> supports more than 32 request sources and has 16 channels. It also needs
> additional clock to be enabled.

Please see DT folks on this patch, when in doubt, use get_maintainers.pl
Need an ack on this patch before applying

> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  Documentation/devicetree/bindings/dma/sun6i-dma.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/sun6i-dma.txt b/Documentation/devicetree/bindings/dma/sun6i-dma.txt
> index 7fccc20d8331..cae31f4e77ba 100644
> --- a/Documentation/devicetree/bindings/dma/sun6i-dma.txt
> +++ b/Documentation/devicetree/bindings/dma/sun6i-dma.txt
> @@ -28,12 +28,17 @@ Example:
>  	};
>  
>  ------------------------------------------------------------------------------
> -For A64 DMA controller:
> +For A64 and H6 DMA controller:
>  
>  Required properties:
> -- compatible:	"allwinner,sun50i-a64-dma"
> +- compatible:	Must be one of
> +		  "allwinner,sun50i-a64-dma"
> +		  "allwinner,sun50i-h6-dma"
>  - dma-channels: Number of DMA channels supported by the controller.
>  		Refer to Documentation/devicetree/bindings/dma/dma.txt
> +- clocks:	In addition to parent AHB clock, it should also contain mbus
> +		clock (H6 only)
> +- clock-names:	Should contain "bus" and "mbus" (H6 only)
>  - all properties above, i.e. reg, interrupts, clocks, resets and #dma-cells
>  
>  Optional properties:
> -- 
> 2.21.0

-- 
~Vinod
