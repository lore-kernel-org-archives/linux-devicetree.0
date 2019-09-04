Return-Path: <vkoul@kernel.org>
Date: Wed, 4 Sep 2019 11:30:17 +0530
From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: milbeaut-m10v-xdmac: Add Socionext
 Milbeaut XDMAC bindings
Message-ID: <20190904060017.GE2672@vkoul-mobl>
References: <20190818052154.17789-1-jassisinghbrar@gmail.com>
 <20190818052224.17857-1-jassisinghbrar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190818052224.17857-1-jassisinghbrar@gmail.com>
To: jassisinghbrar@gmail.com
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Jassi Brar <jaswinder.singh@linaro.org>
List-ID: <devicetree@vger.kernel.org>

On 18-08-19, 00:22, jassisinghbrar@gmail.com wrote:
> From: Jassi Brar <jaswinder.singh@linaro.org>
> 
> Document the devicetree bindings for Socionext Milbeaut XDMAC
> controller. Controller only supports Mem->Mem transfers. Number
> of physical channels are determined by the number of irqs registered.
> 
> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
> ---
>  .../bindings/dma/milbeaut-m10v-xdmac.txt      | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/milbeaut-m10v-xdmac.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/milbeaut-m10v-xdmac.txt b/Documentation/devicetree/bindings/dma/milbeaut-m10v-xdmac.txt
> new file mode 100644
> index 000000000000..1f15512e3f19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/milbeaut-m10v-xdmac.txt
> @@ -0,0 +1,24 @@
> +* Milbeaut AXI DMA Controller
> +
> +Milbeaut AXI DMA controller has only memory to memory transfer capability.
> +
> +* DMA controller
> +
> +Required property:
> +- compatible: 	Should be  "socionext,milbeaut-m10v-xdmac"
> +- reg:		Should contain DMA registers location and length.
> +- interrupts: 	Should contain all of the per-channel DMA interrupts.
> +                Number of channels is configurable - 2, 4 or 8, so
> +                the number of interrupts specfied should be {2,4,8}.

s/specfied/specified

-- 
~Vinod
