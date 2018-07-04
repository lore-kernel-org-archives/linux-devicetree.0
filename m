From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Subject: Re: [PATCH 06/14] dmaengine: dma-jz4780: Add support for the JZ4725B SoC
Date: Wed, 4 Jul 2018 22:25:01 +0530
Message-ID: <CANc+2y6HFNfbCtzfmfARJ4J6cnvGGZY0KGoeB_R=w-yj5MQYsw@mail.gmail.com>
References: <20180703123214.23090-1-paul@crapouillou.net> <20180703123214.23090-7-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703123214.23090-7-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org

On 3 July 2018 at 18:02, Paul Cercueil <paul@crapouillou.net> wrote:
> The JZ4725B has one DMA core starring six DMA channels.
> As for the JZ4770, each DMA channel's clock can be enabled with
> a register write, the difference here being that once started, it
> is not possible to turn it off.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  Documentation/devicetree/bindings/dma/jz4780-dma.txt | 1 +
>  drivers/dma/dma-jz4780.c                             | 6 ++++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/dma/jz4780-dma.txt b/Documentation/devicetree/bindings/dma/jz4780-dma.txt
> index d7ca3f925fdf..5d302b488e88 100644
> --- a/Documentation/devicetree/bindings/dma/jz4780-dma.txt
> +++ b/Documentation/devicetree/bindings/dma/jz4780-dma.txt
> @@ -5,6 +5,7 @@ Required properties:
>  - compatible: Should be one of:
>    * ingenic,jz4780-dma
>    * ingenic,jz4770-dma
> +  * ingenic,jz4725b-dma
>    * ingenic,jz4740-dma
>  - reg: Should contain the DMA channel registers location and length, followed
>    by the DMA controller registers location and length.
> diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
> index ccadbe61dde7..922e4031e70e 100644
> --- a/drivers/dma/dma-jz4780.c
> +++ b/drivers/dma/dma-jz4780.c
> @@ -134,6 +134,7 @@ struct jz4780_dma_chan {
>
>  enum jz_version {
>         ID_JZ4740,
> +       ID_JZ4725B,
>         ID_JZ4770,
>         ID_JZ4780,
>  };
> @@ -204,6 +205,8 @@ static inline void jz4780_dma_chan_enable(struct jz4780_dma_dev *jzdma,
>  {
>         if (jzdma->version == ID_JZ4770)
>                 jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DCKES, BIT(chn));
> +       else if (jzdma->version == ID_JZ4725B)
> +               jz4780_dma_ctrl_writel(jzdma, JZ_DMA_REG_DCKE, BIT(chn));
>  }
>
>  static inline void jz4780_dma_chan_disable(struct jz4780_dma_dev *jzdma,
> @@ -249,6 +252,7 @@ static void jz4780_dma_desc_free(struct virt_dma_desc *vdesc)
>
>  static const unsigned int jz4780_dma_ord_max[] = {
>         [ID_JZ4740] = 5,
> +       [ID_JZ4725B] = 5,
>         [ID_JZ4770] = 6,
>         [ID_JZ4780] = 7,
>  };
> @@ -804,12 +808,14 @@ static struct dma_chan *jz4780_of_dma_xlate(struct of_phandle_args *dma_spec,
>
>  static const unsigned int jz4780_dma_nb_channels[] = {
>         [ID_JZ4740] = 6,
> +       [ID_JZ4725B] = 6,
>         [ID_JZ4770] = 6,
>         [ID_JZ4780] = 32,
>  };
>
>  static const struct of_device_id jz4780_dma_dt_match[] = {
>         { .compatible = "ingenic,jz4740-dma", .data = (void *)ID_JZ4740 },
> +       { .compatible = "ingenic,jz4725b-dma", .data = (void *)ID_JZ4725B },
>         { .compatible = "ingenic,jz4770-dma", .data = (void *)ID_JZ4770 },
>         { .compatible = "ingenic,jz4780-dma", .data = (void *)ID_JZ4780 },
>         {},
> --
> 2.18.0
>
>

Reviewed-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
