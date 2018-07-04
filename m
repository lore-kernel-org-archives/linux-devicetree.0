From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Subject: Re: [PATCH 03/14] dmaengine: dma-jz4780: Use 4-word descriptors
Date: Wed, 4 Jul 2018 22:10:00 +0530
Message-ID: <CANc+2y6iT=cDuzHibBuSvhp4s-e3y+Y4TcC_LBev+WXPaE_1rg@mail.gmail.com>
References: <20180703123214.23090-1-paul@crapouillou.net> <20180703123214.23090-4-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703123214.23090-4-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Mathieu Malaterre <malat@debian.org>, Daniel Silsby <dansilsby@gmail.com>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org

Hi Paul,

On 3 July 2018 at 18:02, Paul Cercueil <paul@crapouillou.net> wrote:
> The only information we use in the 8-word version of the hardware DMA
> descriptor that is not present in the 4-word version is the transfer
> type, aka. the ID of the source or recipient device.
>
> Since the transfer type will never change for a DMA channel in use,
> we can just set it once for all in the corresponding DMA register
> before starting any transfer.
>
> This has several benefits:
>
> * the driver will handle twice as many hardware DMA descriptors;
>
> * the driver is closer to support the JZ4740, which only supports 4-word
>   hardware DMA descriptors;
>
> * the JZ4770 SoC needs the transfer type to be set in the corresponding
>   DMA register anyway, even if 8-word descriptors are in use.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/dma/dma-jz4780.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
> index 4d234caf5d62..cd2cd70fd843 100644
> --- a/drivers/dma/dma-jz4780.c
> +++ b/drivers/dma/dma-jz4780.c
> @@ -93,17 +93,12 @@
>   * @dtc: transfer count (number of blocks of the transfer size specified in DCM
>   * to transfer) in the low 24 bits, offset of the next descriptor from the
>   * descriptor base address in the upper 8 bits.
> - * @sd: target/source stride difference (in stride transfer mode).
> - * @drt: request type
>   */
>  struct jz4780_dma_hwdesc {
>         uint32_t dcm;
>         uint32_t dsa;
>         uint32_t dta;
>         uint32_t dtc;
> -       uint32_t sd;
> -       uint32_t drt;
> -       uint32_t reserved[2];
>  };
>
>  /* Size of allocations for hardware descriptor blocks. */
> @@ -280,7 +275,6 @@ static int jz4780_dma_setup_hwdesc(struct jz4780_dma_chan *jzchan,
>                 desc->dcm = JZ_DMA_DCM_SAI;
>                 desc->dsa = addr;
>                 desc->dta = config->dst_addr;
> -               desc->drt = jzchan->transfer_type;
>
>                 width = config->dst_addr_width;
>                 maxburst = config->dst_maxburst;
> @@ -288,7 +282,6 @@ static int jz4780_dma_setup_hwdesc(struct jz4780_dma_chan *jzchan,
>                 desc->dcm = JZ_DMA_DCM_DAI;
>                 desc->dsa = config->src_addr;
>                 desc->dta = addr;
> -               desc->drt = jzchan->transfer_type;
>
>                 width = config->src_addr_width;
>                 maxburst = config->src_maxburst;
> @@ -433,9 +426,10 @@ static struct dma_async_tx_descriptor *jz4780_dma_prep_dma_memcpy(
>         tsz = jz4780_dma_transfer_size(dest | src | len,
>                                        &jzchan->transfer_shift);
>
> +       jzchan->transfer_type = JZ_DMA_DRT_AUTO;
> +
>         desc->desc[0].dsa = src;
>         desc->desc[0].dta = dest;
> -       desc->desc[0].drt = JZ_DMA_DRT_AUTO;
>         desc->desc[0].dcm = JZ_DMA_DCM_TIE | JZ_DMA_DCM_SAI | JZ_DMA_DCM_DAI |
>                             tsz << JZ_DMA_DCM_TSZ_SHIFT |
>                             JZ_DMA_WIDTH_32_BIT << JZ_DMA_DCM_SP_SHIFT |
> @@ -490,9 +484,12 @@ static void jz4780_dma_begin(struct jz4780_dma_chan *jzchan)
>                         (jzchan->curr_hwdesc + 1) % jzchan->desc->count;
>         }
>
> -       /* Use 8-word descriptors. */
> -       jz4780_dma_chn_writel(jzdma, jzchan->id,
> -                             JZ_DMA_REG_DCS, JZ_DMA_DCS_DES8);
> +       /* Use 4-word descriptors. */
> +       jz4780_dma_chn_writel(jzdma, jzchan->id, JZ_DMA_REG_DCS, 0);
> +
> +       /* Set transfer type. */
> +       jz4780_dma_chn_writel(jzdma, jzchan->id, JZ_DMA_REG_DRT,
> +                             jzchan->transfer_type);
>
>         /* Write descriptor address and initiate descriptor fetch. */
>         desc_phys = jzchan->desc->desc_phys +
> @@ -502,7 +499,7 @@ static void jz4780_dma_begin(struct jz4780_dma_chan *jzchan)
>
>         /* Enable the channel. */
>         jz4780_dma_chn_writel(jzdma, jzchan->id, JZ_DMA_REG_DCS,
> -                             JZ_DMA_DCS_DES8 | JZ_DMA_DCS_CTE);
> +                             JZ_DMA_DCS_CTE);
>  }
>
>  static void jz4780_dma_issue_pending(struct dma_chan *chan)
> --
> 2.18.0
>
>

Patch looks good to me.
Reviewed-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>

Regards,
PrasannaKumar
