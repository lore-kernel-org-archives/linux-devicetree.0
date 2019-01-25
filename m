From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: dmaengine: Add MediaTek Command-Queue
 DMA controller bindings
Date: Thu, 24 Jan 2019 19:52:21 -0800
Message-ID: <CAGp9LzofToojhoXL9DpbrF-GKcxnGX7VBKrTq27SF8uGYnQOMg@mail.gmail.com>
References: <1548326680-16454-1-git-send-email-shun-chih.yu@mediatek.com> <1548326680-16454-2-git-send-email-shun-chih.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548326680-16454-2-git-send-email-shun-chih.yu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: shun-chih.yu@mediatek.com
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, srv_wsdupstream@mediatek.com, linux-mediatek@lists.infradead.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

You dropped the version tag that doesn't reflect that is a newer one
and that would be easily ignored by other people

On Thu, Jan 24, 2019 at 2:46 AM <shun-chih.yu@mediatek.com> wrote:
>
> From: Shun-Chih Yu <shun-chih.yu@mediatek.com>
>
> Document the devicetree bindings for MediaTek Command-Queue DMA controller
> which could be found on MT6765 SoC or other similar Mediatek SoCs.
>
> Signed-off-by: Shun-Chih Yu <shun-chih.yu@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

otherwise, Acked-by: Sean Wang <sean.wang@kernel.org>

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
> +- compatible:  Must be "mediatek,mt6765-cqdma" for MT6765.
> +- reg:         Should contain the base address and length for each channel.
> +- interrupts:  Should contain references to the interrupts for each channel.
> +- clocks:      Should be the clock specifiers corresponding to the entry in
> +               clock-names property.
> +- clock-names: Should contain "cqdma" entries.
> +- dma-channels: The number of DMA channels supported by the controller.
> +- dma-requests: The number of DMA request supported by the controller.
> +- #dma-cells:  The length of the DMA specifier, must be <1>. This one cell
> +               in dmas property of a client device represents the channel
> +               number.
> +Example:
> +
> +        cqdma: dma-controller@10212000 {
> +               compatible = "mediatek,mt6765-cqdma";
> +               reg = <0 0x10212000 0 0x1000>;
> +               interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_LOW>,
> +                       <GIC_SPI 114 IRQ_TYPE_LEVEL_LOW>;
> +               clocks = <&infracfg CLK_IFR_CQ_DMA>;
> +               clock-names = "cqdma";
> +               dma-channels = <2>;
> +               dma-requests = <32>;
> +               #dma-cells = <1>;
> +       };
> +
> +DMA clients must use the format described in dma/dma.txt file.
> --
> 1.7.9.5
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
