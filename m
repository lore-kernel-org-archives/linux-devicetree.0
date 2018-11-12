Return-Path: <SRS0=ZvLY=NX=linaro.org=ulf.hansson@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20181024222301.21455-3-chris.brandt@renesas.com>
References: <20181024222301.21455-1-chris.brandt@renesas.com> <20181024222301.21455-3-chris.brandt@renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 12 Nov 2018 12:05:08 +0100
Message-ID: <CAPDyKFpMAH+528BouQiepHbi55uF=EEQqNoXxMUhQctMdoJu_A@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] mmc: renesas_sdhi_internal_dmac: Add R7S9210 support
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-clk <linux-clk@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 25 October 2018 at 00:23, Chris Brandt <chris.brandt@renesas.com> wrote:
> The SDHI/MMC controller in the RZ/A2 is almost the same as R-Car gen3, but
> with some minor differences.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
> v5:
>  * Rebased against -next to fix conficts with RZ/G1C patches
>  * Changed Kconfig message to say "found in some RZ" instead of just
>    "found in RZ/A"
> v4:
>  * Fixed spelling in #define
> v3:
>  * Removed extra space in Kconfig
>  * Removed unneeded parentheses
> v2:
>  * Made comment clearer
> ---
>  drivers/mmc/host/Kconfig                      |  7 ++++---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 28 +++++++++++++++++++++++++--
>  2 files changed, 30 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 1b58739d9744..720311ece714 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -646,13 +646,14 @@ config MMC_SDHI_SYS_DMAC
>
>  config MMC_SDHI_INTERNAL_DMAC
>         tristate "DMA for SDHI SD/SDIO controllers using on-chip bus mastering"
> -       depends on ARM64 || ARCH_R8A77470 || COMPILE_TEST
> +       depends on ARM64 || ARCH_R7S9210 || ARCH_R8A77470 || COMPILE_TEST
>         depends on MMC_SDHI
> -       default MMC_SDHI if (ARM64 || ARCH_R8A77470)
> +       default MMC_SDHI if (ARM64 || ARCH_R7S9210 || ARCH_R8A77470)
>         help
>           This provides DMA support for SDHI SD/SDIO controllers
>           using on-chip bus mastering. This supports the controllers
> -         found in arm64 based SoCs.
> +         found in arm64 based SoCs. This controller is also found in
> +         some RZ family SoCs.
>
>  config MMC_UNIPHIER
>         tristate "UniPhier SD/eMMC Host Controller support"
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index b6f54102bfdd..b9d83d6ed346 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -34,7 +34,7 @@
>  #define DTRAN_MODE_CH_NUM_CH0  0       /* "downstream" = for write commands */
>  #define DTRAN_MODE_CH_NUM_CH1  BIT(16) /* "upstream" = for read commands */
>  #define DTRAN_MODE_BUS_WIDTH   (BIT(5) | BIT(4))
> -#define DTRAN_MODE_ADDR_MODE   BIT(0)  /* 1 = Increment address */
> +#define DTRAN_MODE_ADDR_MODE   BIT(0)  /* 1 = Increment address, 0 = Fixed */
>
>  /* DM_CM_DTRAN_CTRL */
>  #define DTRAN_CTRL_DM_START    BIT(0)
> @@ -73,6 +73,9 @@ static unsigned long global_flags;
>  #define SDHI_INTERNAL_DMAC_ONE_RX_ONLY 0
>  #define SDHI_INTERNAL_DMAC_RX_IN_USE   1
>
> +/* RZ/A2 does not have the ADRR_MODE bit */
> +#define SDHI_INTERNAL_DMAC_ADDR_MODE_FIXED_ONLY 2
> +
>  /* Definitions for sampling clocks */
>  static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
>         {
> @@ -81,6 +84,21 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
>         },
>  };
>
> +static const struct renesas_sdhi_of_data of_rza2_compatible = {
> +       .tmio_flags     = TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
> +                         TMIO_MMC_HAVE_CBSY,
> +       .tmio_ocr_mask  = MMC_VDD_32_33,
> +       .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> +                         MMC_CAP_CMD23,
> +       .bus_shift      = 2,
> +       .scc_offset     = 0 - 0x1000,
> +       .taps           = rcar_gen3_scc_taps,
> +       .taps_num       = ARRAY_SIZE(rcar_gen3_scc_taps),
> +       /* DMAC can handle 0xffffffff blk count but only 1 segment */
> +       .max_blk_count  = 0xffffffff,
> +       .max_segs       = 1,
> +};
> +
>  static const struct renesas_sdhi_of_data of_rcar_r8a7795_compatible = {
>         .tmio_flags     = TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
>                           TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
> @@ -113,6 +131,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
>  };
>
>  static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
> +       { .compatible = "renesas,sdhi-r7s9210", .data = &of_rza2_compatible, },
>         { .compatible = "renesas,sdhi-mmc-r8a77470", .data = &of_rcar_gen3_compatible, },
>         { .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_r8a7795_compatible, },
>         { .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_r8a7795_compatible, },
> @@ -172,7 +191,10 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
>                                      struct mmc_data *data)
>  {
>         struct scatterlist *sg = host->sg_ptr;
> -       u32 dtran_mode = DTRAN_MODE_BUS_WIDTH | DTRAN_MODE_ADDR_MODE;
> +       u32 dtran_mode = DTRAN_MODE_BUS_WIDTH;
> +
> +       if (!test_bit(SDHI_INTERNAL_DMAC_ADDR_MODE_FIXED_ONLY, &global_flags))
> +               dtran_mode |= DTRAN_MODE_ADDR_MODE;
>
>         if (!dma_map_sg(&host->pdev->dev, sg, host->sg_len,
>                         mmc_get_dma_dir(data)))
> @@ -292,6 +314,8 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
>   */
>  static const struct soc_device_attribute soc_whitelist[] = {
>         /* specific ones */
> +       { .soc_id = "r7s9210",
> +         .data = (void *)BIT(SDHI_INTERNAL_DMAC_ADDR_MODE_FIXED_ONLY) },
>         { .soc_id = "r8a7795", .revision = "ES1.*",
>           .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
>         { .soc_id = "r8a7796", .revision = "ES1.0",
> --
> 2.16.1
>
