From: Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: dmaengine: sf-pdma: add bindins for
 SiFive PDMA
Date: Fri, 20 Sep 2019 15:31:35 +0530
Message-ID: <CAN8ut8Lfo3zm2mjoiH3o4FSTkHexagwUFT=V3MpgcE=arm5c4g@mail.gmail.com>
References: <20190920090033.19438-1-green.wan@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190920090033.19438-1-green.wan@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Green Wan <green.wan@sifive.com>
Cc: linux-hackers@sifive.com, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 20, 2019 at 2:30 PM Green Wan <green.wan@sifive.com> wrote:
>
> Add DT bindings document for Platform DMA(PDMA) driver of board,
> HiFive Unleashed Rev A00.
>
> Signed-off-by: Green Wan <green.wan@sifive.com>
> ---
>  .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 55 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++
>  2 files changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
>
> diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> new file mode 100644
> index 000000000000..3ed015f2b83a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/sifive,fu540-c000-pdma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive Unleashed Rev C000 Platform DMA
> +
> +maintainers:
> +  - Green Wan <green.wan@sifive.com>
> +  - Palmer Debbelt <palmer@sifive.com>
> +  - Paul Walmsley <paul.walmsley@sifive.com>
> +
> +description: |
> +  Platform DMA is a DMA engine of SiFive Unleashed. It supports 4
> +  channels. Each channel has 2 interrupts. One is for DMA done and
> +  the other is for DME error.
> +
> +  In different SoC, DMA could be attached to different IRQ line.
> +  DT file need to be changed to meet the difference. For technical
> +  doc,
> +
> +  https://static.dev.sifive.com/FU540-C000-v1.0.pdf
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sifive,fu540-c000-pdma
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 8
> +    maxItems: 8

"make dt_binding_check" should give you the error that interrupts is too short.

When you say minItems: 8 then interrupts property should be like this:
interrupts = <23>, <24>,  <25>,  <26>,  <27>,  <28>,  <29>,  <30>;

So,  remove the minItems: 8 and change maxItems: 1 for interrupts =
<23 24 25 26 27 28 29 30>;

> +
> +  '#dma-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - '#dma-cells'
> +
> +examples:
> +  - |
> +    dma@3000000 {
> +      compatible = "sifive,fu540-c000-pdma";
> +      reg = <0x0 0x3000000 0x0 0x8000>;
> +      interrupts = <23 24 25 26 27 28 29 30>;
> +      #dma-cells = <1>;
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 49f75d1b7b51..d0caa09a479e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14591,6 +14591,11 @@ F:     drivers/media/usb/siano/
>  F:     drivers/media/usb/siano/
>  F:     drivers/media/mmc/siano/
>
> +SIFIVE PDMA DRIVER
> +M:     Green Wan <green.wan@sifive.com>
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
> +
>  SIFIVE DRIVERS
>  M:     Palmer Dabbelt <palmer@sifive.com>
>  M:     Paul Walmsley <paul.walmsley@sifive.com>
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "linux-hackers" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-hackers+unsubscribe@sifive.com.
> To view this discussion on the web visit https://groups.google.com/a/sifive.com/d/msgid/linux-hackers/20190920090033.19438-1-green.wan%40sifive.com.
