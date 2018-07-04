From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Subject: Re: [PATCH 05/14] dmaengine: dma-jz4780: Add support for the JZ4740 SoC
Date: Wed, 4 Jul 2018 22:22:27 +0530
Message-ID: <CANc+2y4L3WPUn39fmy+D=vYT7jwYcc+0Ox3sZ8V6cyM511UmhQ@mail.gmail.com>
References: <20180703123214.23090-1-paul@crapouillou.net> <20180703123214.23090-6-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703123214.23090-6-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org

On 3 July 2018 at 18:02, Paul Cercueil <paul@crapouillou.net> wrote:
> The JZ4740 SoC has a single DMA core starring six DMA channels.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  Documentation/devicetree/bindings/dma/jz4780-dma.txt | 1 +
>  drivers/dma/Kconfig                                  | 2 +-
>  drivers/dma/dma-jz4780.c                             | 4 ++++
>  3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/jz4780-dma.txt b/Documentation/devicetree/bindings/dma/jz4780-dma.txt
> index 0fd0759053be..d7ca3f925fdf 100644
> --- a/Documentation/devicetree/bindings/dma/jz4780-dma.txt
> +++ b/Documentation/devicetree/bindings/dma/jz4780-dma.txt
> @@ -5,6 +5,7 @@ Required properties:
>  - compatible: Should be one of:
>    * ingenic,jz4780-dma
>    * ingenic,jz4770-dma
> +  * ingenic,jz4740-dma
>  - reg: Should contain the DMA channel registers location and length, followed
>    by the DMA controller registers location and length.
>  - interrupts: Should contain the interrupt specifier of the DMA controller.
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 48d25dccedb7..a935d15ec581 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -143,7 +143,7 @@ config DMA_JZ4740
>
>  config DMA_JZ4780
>         tristate "JZ4780 DMA support"
> -       depends on MACH_JZ4780 || MACH_JZ4770 || COMPILE_TEST
> +       depends on MACH_INGENIC || COMPILE_TEST
>         select DMA_ENGINE
>         select DMA_VIRTUAL_CHANNELS
>         help
> diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
> index 7b8b2dcd119e..ccadbe61dde7 100644
> --- a/drivers/dma/dma-jz4780.c
> +++ b/drivers/dma/dma-jz4780.c
> @@ -133,6 +133,7 @@ struct jz4780_dma_chan {
>  };
>
>  enum jz_version {
> +       ID_JZ4740,
>         ID_JZ4770,
>         ID_JZ4780,
>  };
> @@ -247,6 +248,7 @@ static void jz4780_dma_desc_free(struct virt_dma_desc *vdesc)
>  }
>
>  static const unsigned int jz4780_dma_ord_max[] = {
> +       [ID_JZ4740] = 5,
>         [ID_JZ4770] = 6,
>         [ID_JZ4780] = 7,
>  };
> @@ -801,11 +803,13 @@ static struct dma_chan *jz4780_of_dma_xlate(struct of_phandle_args *dma_spec,
>  }
>
>  static const unsigned int jz4780_dma_nb_channels[] = {
> +       [ID_JZ4740] = 6,
>         [ID_JZ4770] = 6,
>         [ID_JZ4780] = 32,
>  };
>
>  static const struct of_device_id jz4780_dma_dt_match[] = {
> +       { .compatible = "ingenic,jz4740-dma", .data = (void *)ID_JZ4740 },
>         { .compatible = "ingenic,jz4770-dma", .data = (void *)ID_JZ4770 },
>         { .compatible = "ingenic,jz4780-dma", .data = (void *)ID_JZ4780 },
>         {},
> --
> 2.18.0
>
>

Patch looks good to me.
Reviewed-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>/
