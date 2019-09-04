From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: milbeaut-m10v-hdmac: Add Socionext
 Milbeaut HDMAC bindings
Date: Wed, 4 Sep 2019 11:20:37 +0530
Message-ID: <20190904055037.GC2672@vkoul-mobl>
References: <20190818051647.17475-1-jassisinghbrar@gmail.com>
 <20190818051754.17548-1-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190818051754.17548-1-jassisinghbrar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jassisinghbrar@gmail.com
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

On 18-08-19, 00:17, jassisinghbrar@gmail.com wrote:
> From: Jassi Brar <jaswinder.singh@linaro.org>
> 
> Document the devicetree bindings for Socionext Milbeaut HDMAC
> controller. Controller has upto 8 floating channels, that need
> a predefined slave-id to work from a set of slaves.
> 
> Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
> ---
>  .../bindings/dma/milbeaut-m10v-hdmac.txt      | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt b/Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt
> new file mode 100644
> index 000000000000..f0960724f1c7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/milbeaut-m10v-hdmac.txt
> @@ -0,0 +1,32 @@
> +* Milbeaut AHB DMA Controller
> +
> +Milbeaut AHB DMA controller has transfer capability bellow.

s/bellow/below:

> + - device to memory transfer
> + - memory to device transfer
> +
> +Required property:
> +- compatible:       Should be  "socionext,milbeaut-m10v-hdmac"
> +- reg:              Should contain DMA registers location and length.
> +- interrupts:       Should contain all of the per-channel DMA interrupts.
> +                     Number of channels is configurable - 2, 4 or 8, so
> +                     the number of interrupts specfied should be {2,4,8}.

s/specfied/specified

-- 
~Vinod
