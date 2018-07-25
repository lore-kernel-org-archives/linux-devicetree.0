Return-Path: <SRS0=02mJ=KJ=gmail.com=pku.leo@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180725112919.31340-4-wen.he_1@nxp.com>
References: <20180725112919.31340-1-wen.he_1@nxp.com> <20180725112919.31340-4-wen.he_1@nxp.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 25 Jul 2018 16:19:02 -0500
Message-ID: <CADRPPNTGODG7h0n8sXv3FQOpL54m6o4rteObR7cnmBymfcRZxg@mail.gmail.com>
Subject: Re: [v7 4/7] dt-bindings: fsl-qdma: Add NXP Layerscpae qDMA
 controller bindings
Content-Type: text/plain; charset="UTF-8"
To: Wen He <wen.he_1@nxp.com>
Cc: Vinod <vkoul@kernel.org>, dmaengine@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Jiafei Pan <jiafei.pan@nxp.com>, Jiaheng Fan <jiaheng.fan@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jul 25, 2018 at 6:29 AM, Wen He <wen.he_1@nxp.com> wrote:
> Document the devicetree bindings for NXP Layerscape qDMA controller
> which could be found on NXP QorIQ Layerscape SoCs.
>
> Signed-off-by: Wen He <wen.he_1@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/dma/fsl-qdma.txt |   41 ++++++++++++++++++++
>  1 files changed, 41 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/fsl-qdma.txt
>
> diff --git a/Documentation/devicetree/bindings/dma/fsl-qdma.txt b/Documentation/devicetree/bindings/dma/fsl-qdma.txt
> new file mode 100644
> index 0000000..99b3d74
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/fsl-qdma.txt
> @@ -0,0 +1,41 @@
> +NXP Layerscape SoC qDMA Controller
> +==================================
> +
> +This device follows the generic DMA bindings defined in dma/dma.txt.
> +
> +Required properties:
> +
> +- compatible:          Must be one of
> +                        "fsl,ls1021a-qdma": for LS1021A Board
> +                        "fsl,ls1043a-qdma": for ls1043A Board
> +                        "fsl,ls1046a-qdma": for ls1046A Board

Can you align on the case of "ls"?

> +- reg:                 Should contain the register's base address and length.
> +- interrupts:          Should contain a reference to the interrupt used by this
> +                       device.
> +- interrupt-names:     Should contain interrupt names:
> +                        "qdma-error": the error interrupt
> +                        "qdma-queue": the queue interrupt
> +- fsl,queues:          Should contain number of queues supported.

This property name looks very general.  Not sure if making it a little
bit more specific will be better such as "fsl,dma-queues".

> +
> +Optional properties:
> +
> +- dma-channels:                Number of DMA channels supported by the controller.
> +- big-endian:          If present registers and hardware scatter/gather descriptors
> +                       of the qDMA are implemented in big endian mode, otherwise in little
> +                       mode.
> +
> +Examples:
> +
> +       qdma: dma-controller@8390000 {
> +               compatible = "fsl,ls1021a-qdma";
> +               reg = <0x0 0x8398000 0x0 0x2000 /* Controller registers */
> +                      0x0 0x839a000 0x0 0x2000>; /* Block registers */
> +               interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
> +                               <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupt-names = "qdma-error", "qdma-queue";
> +               dma-channels = <8>;
> +               queues = <2>;

Not updated after the binding is updated.

> +               big-endian;
> +       };
> +
> +DMA clients must use the format described in dma/dma.txt file.
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
