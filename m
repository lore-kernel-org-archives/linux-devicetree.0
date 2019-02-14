From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: dmaengine: Add MediaTek Command-Queue
 DMA controller bindings
Date: Thu, 14 Feb 2019 10:19:38 +0100
Message-ID: <17980f11-dcbf-b033-c525-613a3b3ed62c@gmail.com>
References: <1550130892-19488-1-git-send-email-shun-chih.yu@mediatek.com>
 <1550130892-19488-2-git-send-email-shun-chih.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550130892-19488-2-git-send-email-shun-chih.yu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: shun-chih.yu@mediatek.com, Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, srv_wsdupstream@mediatek.com
List-Id: devicetree@vger.kernel.org



On 14/02/2019 08:54, shun-chih.yu@mediatek.com wrote:
> From: Shun-Chih Yu <shun-chih.yu@mediatek.com>
> 
> Document the devicetree bindings for MediaTek Command-Queue DMA controller
> which could be found on MT6765 SoC or other similar Mediatek SoCs.
> 
> Signed-off-by: Shun-Chih Yu <shun-chih.yu@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Sean Wang <sean.wang@kernel.org>
> ---
>  .../devicetree/bindings/dma/mtk-cqdma.txt          |   31 ++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/mtk-cqdma.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/mtk-cqdma.txt b/Documentation/devicetree/bindings/dma/mtk-cqdma.txt
> new file mode 100644
> index 0000000..fb12927
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/mtk-cqdma.txt
> @@ -0,0 +1,31 @@
> +MediaTek Command-Queue DMA Controller
> +==================================
> +
> +Required properties:
> +
> +- compatible:	Must be "mediatek,mt6765-cqdma" for MT6765.
> +- reg:		Should contain the base address and length for each channel.
> +- interrupts:	Should contain references to the interrupts for each channel.
> +- clocks:	Should be the clock specifiers corresponding to the entry in
> +		clock-names property.
> +- clock-names:	Should contain "cqdma" entries.

entries -> entry. There is only one clock

> +- dma-channels: The number of DMA channels supported by the controller.
> +- dma-requests: The number of DMA request supported by the controller.

The driver handles these as optional and uses MTK_CQDMA_NR_VCHANS and
MTK_CQDMA_NR_PCHANS in case the property is not present.

> +- #dma-cells: 	The length of the DMA specifier, must be <1>. This one cell
> +		in dmas property of a client device represents the channel
> +		number.
> +Example:
> +
> +        cqdma: dma-controller@10212000 {
> +		compatible = "mediatek,mt6765-cqdma";
> +		reg = <0 0x10212000 0 0x1000>;

Does this mean that you have to resources at base = 0x0 with different length?

For the next time, please send driver and binding description in one series (two
patches). That makes things easier to review.

Thanks,
Matthias

> +		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>,
> +			<GIC_SPI 114 IRQ_TYPE_LEVEL_LOW>;
> +		clocks = <&infracfg CLK_IFR_CQ_DMA>;
> +		clock-names = "cqdma";
> +		dma-channels = <2>;
> +		dma-requests = <32>;
> +		#dma-cells = <1>;
> +	};
> +
> +DMA clients must use the format described in dma/dma.txt file.
> 
