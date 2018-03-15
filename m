Return-Path: <SRS0=NaSz=GF=linaro.org=ulf.hansson@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1520470894-9114-3-git-send-email-shawn.guo@linaro.org>
References: <1520470894-9114-1-git-send-email-shawn.guo@linaro.org> <1520470894-9114-3-git-send-email-shawn.guo@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 15 Mar 2018 11:23:52 +0100
Message-ID: <CAPDyKFqg2feScbgH1XxZfnwLAAR6+CRucbMPMObPotQREizGnA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mmc: dw_mmc: add support for hi3798cv200 specific
 extensions of dw-mshc
Content-Type: text/plain; charset="UTF-8"
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, tianshuliang <tianshuliang@hisilicon.com>, Jiancheng Xue <xuejiancheng@hisilicon.com>, devicetree@vger.kernel.org, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 8 March 2018 at 02:01, Shawn Guo <shawn.guo@linaro.org> wrote:
> From: tianshuliang <tianshuliang@hisilicon.com>
>
> Hi3798CV200 SoC extends the dw-mshc controller for additional clock
> and bus control. Add support for these extensions.
>
> Signed-off-by: tianshuliang <tianshuliang@hisilicon.com>
> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Thanks, applied for next!

Kind regards
Uffe

> ---
>  drivers/mmc/host/Kconfig              |   9 ++
>  drivers/mmc/host/Makefile             |   1 +
>  drivers/mmc/host/dw_mmc-hi3798cv200.c | 202 ++++++++++++++++++++++++++++++++++
>  drivers/mmc/host/dw_mmc.h             |   6 +
>  4 files changed, 218 insertions(+)
>  create mode 100644 drivers/mmc/host/dw_mmc-hi3798cv200.c
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 620c2d90a646..de36fffe8225 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -718,6 +718,15 @@ config MMC_DW_EXYNOS
>           Synopsys DesignWare Memory Card Interface driver. Select this option
>           for platforms based on Exynos4 and Exynos5 SoC's.
>
> +config MMC_DW_HI3798CV200
> +       tristate "Hi3798CV200 specific extensions for Synopsys DW Memory Card Interface"
> +       depends on MMC_DW
> +       select MMC_DW_PLTFM
> +       help
> +         This selects support for HiSilicon Hi3798CV200 SoC specific extensions to the
> +         Synopsys DesignWare Memory Card Interface driver. Select this option
> +         for platforms based on HiSilicon Hi3798CV200 SoC.
> +
>  config MMC_DW_K3
>         tristate "K3 specific extensions for Synopsys DW Memory Card Interface"
>         depends on MMC_DW
> diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
> index 84cd1388abc3..00ec9a2f59be 100644
> --- a/drivers/mmc/host/Makefile
> +++ b/drivers/mmc/host/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_MMC_CAVIUM_THUNDERX) += thunderx-mmc.o
>  obj-$(CONFIG_MMC_DW)           += dw_mmc.o
>  obj-$(CONFIG_MMC_DW_PLTFM)     += dw_mmc-pltfm.o
>  obj-$(CONFIG_MMC_DW_EXYNOS)    += dw_mmc-exynos.o
> +obj-$(CONFIG_MMC_DW_HI3798CV200) += dw_mmc-hi3798cv200.o
>  obj-$(CONFIG_MMC_DW_K3)                += dw_mmc-k3.o
>  obj-$(CONFIG_MMC_DW_PCI)       += dw_mmc-pci.o
>  obj-$(CONFIG_MMC_DW_ROCKCHIP)  += dw_mmc-rockchip.o
> diff --git a/drivers/mmc/host/dw_mmc-hi3798cv200.c b/drivers/mmc/host/dw_mmc-hi3798cv200.c
> new file mode 100644
> index 000000000000..f9b333ff259e
> --- /dev/null
> +++ b/drivers/mmc/host/dw_mmc-hi3798cv200.c
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 HiSilicon Technologies Co., Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mmc/host.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include "dw_mmc.h"
> +#include "dw_mmc-pltfm.h"
> +
> +#define ALL_INT_CLR            0x1ffff
> +
> +struct hi3798cv200_priv {
> +       struct clk *sample_clk;
> +       struct clk *drive_clk;
> +};
> +
> +static void dw_mci_hi3798cv200_set_ios(struct dw_mci *host, struct mmc_ios *ios)
> +{
> +       struct hi3798cv200_priv *priv = host->priv;
> +       u32 val;
> +
> +       val = mci_readl(host, UHS_REG);
> +       if (ios->timing == MMC_TIMING_MMC_DDR52 ||
> +           ios->timing == MMC_TIMING_UHS_DDR50)
> +               val |= SDMMC_UHS_DDR;
> +       else
> +               val &= ~SDMMC_UHS_DDR;
> +       mci_writel(host, UHS_REG, val);
> +
> +       val = mci_readl(host, ENABLE_SHIFT);
> +       if (ios->timing == MMC_TIMING_MMC_DDR52)
> +               val |= SDMMC_ENABLE_PHASE;
> +       else
> +               val &= ~SDMMC_ENABLE_PHASE;
> +       mci_writel(host, ENABLE_SHIFT, val);
> +
> +       val = mci_readl(host, DDR_REG);
> +       if (ios->timing == MMC_TIMING_MMC_HS400)
> +               val |= SDMMC_DDR_HS400;
> +       else
> +               val &= ~SDMMC_DDR_HS400;
> +       mci_writel(host, DDR_REG, val);
> +
> +       if (ios->timing == MMC_TIMING_MMC_HS ||
> +           ios->timing == MMC_TIMING_LEGACY)
> +               clk_set_phase(priv->drive_clk, 180);
> +       else if (ios->timing == MMC_TIMING_MMC_HS200)
> +               clk_set_phase(priv->drive_clk, 135);
> +}
> +
> +static int dw_mci_hi3798cv200_execute_tuning(struct dw_mci_slot *slot,
> +                                            u32 opcode)
> +{
> +       int degrees[] = { 0, 45, 90, 135, 180, 225, 270, 315 };
> +       struct dw_mci *host = slot->host;
> +       struct hi3798cv200_priv *priv = host->priv;
> +       int raise_point = -1, fall_point = -1;
> +       int err, prev_err = -1;
> +       int found = 0;
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(degrees); i++) {
> +               clk_set_phase(priv->sample_clk, degrees[i]);
> +               mci_writel(host, RINTSTS, ALL_INT_CLR);
> +
> +               err = mmc_send_tuning(slot->mmc, opcode, NULL);
> +               if (!err)
> +                       found = 1;
> +
> +               if (i > 0) {
> +                       if (err && !prev_err)
> +                               fall_point = i - 1;
> +                       if (!err && prev_err)
> +                               raise_point = i;
> +               }
> +
> +               if (raise_point != -1 && fall_point != -1)
> +                       goto tuning_out;
> +
> +               prev_err = err;
> +               err = 0;
> +       }
> +
> +tuning_out:
> +       if (found) {
> +               if (raise_point == -1)
> +                       raise_point = 0;
> +               if (fall_point == -1)
> +                       fall_point = ARRAY_SIZE(degrees) - 1;
> +               if (fall_point < raise_point) {
> +                       if ((raise_point + fall_point) >
> +                           (ARRAY_SIZE(degrees) - 1))
> +                               i = fall_point / 2;
> +                       else
> +                               i = (raise_point + ARRAY_SIZE(degrees) - 1) / 2;
> +               } else {
> +                       i = (raise_point + fall_point) / 2;
> +               }
> +
> +               clk_set_phase(priv->sample_clk, degrees[i]);
> +               dev_dbg(host->dev, "Tuning clk_sample[%d, %d], set[%d]\n",
> +                       raise_point, fall_point, degrees[i]);
> +       } else {
> +               dev_err(host->dev, "No valid clk_sample shift! use default\n");
> +               err = -EINVAL;
> +       }
> +
> +       mci_writel(host, RINTSTS, ALL_INT_CLR);
> +       return err;
> +}
> +
> +static int dw_mci_hi3798cv200_init(struct dw_mci *host)
> +{
> +       struct hi3798cv200_priv *priv;
> +       int ret;
> +
> +       priv = devm_kzalloc(host->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->sample_clk = devm_clk_get(host->dev, "ciu-sample");
> +       if (IS_ERR(priv->sample_clk)) {
> +               dev_err(host->dev, "failed to get ciu-sample clock\n");
> +               return PTR_ERR(priv->sample_clk);
> +       }
> +
> +       priv->drive_clk = devm_clk_get(host->dev, "ciu-drive");
> +       if (IS_ERR(priv->drive_clk)) {
> +               dev_err(host->dev, "failed to get ciu-drive clock\n");
> +               return PTR_ERR(priv->drive_clk);
> +       }
> +
> +       ret = clk_prepare_enable(priv->sample_clk);
> +       if (ret) {
> +               dev_err(host->dev, "failed to enable ciu-sample clock\n");
> +               return ret;
> +       }
> +
> +       ret = clk_prepare_enable(priv->drive_clk);
> +       if (ret) {
> +               dev_err(host->dev, "failed to enable ciu-drive clock\n");
> +               goto disable_sample_clk;
> +       }
> +
> +       host->priv = priv;
> +       return 0;
> +
> +disable_sample_clk:
> +       clk_disable_unprepare(priv->sample_clk);
> +       return ret;
> +}
> +
> +static const struct dw_mci_drv_data hi3798cv200_data = {
> +       .init = dw_mci_hi3798cv200_init,
> +       .set_ios = dw_mci_hi3798cv200_set_ios,
> +       .execute_tuning = dw_mci_hi3798cv200_execute_tuning,
> +};
> +
> +static int dw_mci_hi3798cv200_probe(struct platform_device *pdev)
> +{
> +       return dw_mci_pltfm_register(pdev, &hi3798cv200_data);
> +}
> +
> +static int dw_mci_hi3798cv200_remove(struct platform_device *pdev)
> +{
> +       struct dw_mci *host = platform_get_drvdata(pdev);
> +       struct hi3798cv200_priv *priv = host->priv;
> +
> +       clk_disable_unprepare(priv->drive_clk);
> +       clk_disable_unprepare(priv->sample_clk);
> +
> +       return dw_mci_pltfm_remove(pdev);
> +}
> +
> +static const struct of_device_id dw_mci_hi3798cv200_match[] = {
> +       { .compatible = "hisilicon,hi3798cv200-dw-mshc", },
> +       {},
> +};
> +
> +MODULE_DEVICE_TABLE(of, dw_mci_hi3798cv200_match);
> +static struct platform_driver dw_mci_hi3798cv200_driver = {
> +       .probe = dw_mci_hi3798cv200_probe,
> +       .remove = dw_mci_hi3798cv200_remove,
> +       .driver = {
> +               .name = "dwmmc_hi3798cv200",
> +               .of_match_table = dw_mci_hi3798cv200_match,
> +       },
> +};
> +module_platform_driver(dw_mci_hi3798cv200_driver);
> +
> +MODULE_DESCRIPTION("HiSilicon Hi3798CV200 Specific DW-MSHC Driver Extension");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:dwmmc_hi3798cv200");
> diff --git a/drivers/mmc/host/dw_mmc.h b/drivers/mmc/host/dw_mmc.h
> index e3124f06a47e..d0c573dfe115 100644
> --- a/drivers/mmc/host/dw_mmc.h
> +++ b/drivers/mmc/host/dw_mmc.h
> @@ -318,6 +318,7 @@ struct dw_mci_board {
>  #define SDMMC_BUFADDR          0x098
>  #define SDMMC_CDTHRCTL         0x100
>  #define SDMMC_UHS_REG_EXT      0x108
> +#define SDMMC_DDR_REG          0x10c
>  #define SDMMC_ENABLE_SHIFT     0x110
>  #define SDMMC_DATA(x)          (x)
>  /*
> @@ -443,7 +444,12 @@ struct dw_mci_board {
>  #define SDMMC_CARD_WR_THR_EN           BIT(2)
>  #define SDMMC_CARD_RD_THR_EN           BIT(0)
>  /* UHS-1 register defines */
> +#define SDMMC_UHS_DDR                  BIT(16)
>  #define SDMMC_UHS_18V                  BIT(0)
> +/* DDR register defines */
> +#define SDMMC_DDR_HS400                        BIT(31)
> +/* Enable shift register defines */
> +#define SDMMC_ENABLE_PHASE             BIT(0)
>  /* All ctrl reset bits */
>  #define SDMMC_CTRL_ALL_RESET_FLAGS \
>         (SDMMC_CTRL_RESET | SDMMC_CTRL_FIFO_RESET | SDMMC_CTRL_DMA_RESET)
> --
> 1.9.1
>
