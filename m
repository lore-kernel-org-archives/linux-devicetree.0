From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 1/2] dt-bindings: dmaengine: add DT binding for UniPhier
 MIO DMAC
Date: Tue, 21 Aug 2018 18:47:59 +0900
Message-ID: <CAK7LNASr=rf_foQ7PDTNS440rx3TLuY_TBagfQ-gCHxXpFB2vw@mail.gmail.com>
References: <1534843809-4137-1-git-send-email-yamada.masahiro@socionext.com> <1534843809-4137-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1534843809-4137-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

(+CC Rob, DT, LKML)

I forgot to CC this to DT community...


2018-08-21 18:30 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> The MIO DMAC (Media IO DMA Controller) is used in UniPhier LD4,
> Pro4, and sLD8 SoCs.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  .../devicetree/bindings/dma/uniphier-mio-dmac.txt  | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt
>
> diff --git a/Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt b/Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt
> new file mode 100644
> index 0000000..a9e969e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/uniphier-mio-dmac.txt
> @@ -0,0 +1,28 @@
> +UniPhier Media IO DMA controller
> +
> +This works as an external DMA engine for SD/eMMC controllers etc.
> +found in UniPhier LD4, Pro4, sLD8 SoCs.
> +
> +Required properties:
> +- compatible: should be "socionext,uniphier-mio-dmac".
> +- reg: offset and length of the register set for the device.
> +- interrupts: a list of interrupt specifiers associated with the DMA channels.
> +- clocks: a single clock specifier
> +- #dma-cells: should be <1>. The single cell represents the channel number.
> +- dma-channels: specify the number of the DMA channels. This should match to
> +  the number of tuples in the interrupts property.
> +
> +Example:
> +       dmac: dmac@5a000000 {
> +               compatible = "socionext,uniphier-mio-dmac";
> +               reg = <0x5a000000 0x1000>;
> +               interrupts = <0 68 4>, <0 68 4>, <0 69 4>, <0 70 4>,
> +                            <0 71 4>, <0 72 4>, <0 73 4>, <0 74 4>;
> +               clocks = <&mio_clk 7>;
> +               #dma-cells = <1>;
> +               dma-channels = <8>;
> +       };
> +
> +Note:
> +In the example above, "interrupts = <0 68 4>, <0 68 4>, ..." is not a typo.
> +The first two channels share a single interrupt line.
> --
> 2.7.4
>



-- 
Best Regards
Masahiro Yamada
