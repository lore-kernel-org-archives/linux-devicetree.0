From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 3/6] msm8994 clocks: global clock support for msm8994 SOC.
Date: Thu, 27 Oct 2016 17:18:00 -0700
Message-ID: <20161028001800.GK26139@codeaurora.org>
References: <1477394221-30963-1-git-send-email-jeremymc@redhat.com>
 <1477394221-30963-4-git-send-email-jeremymc@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477394221-30963-4-git-send-email-jeremymc@redhat.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jeremy McNicoll <jeremymc@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, andy.gross@linaro.org, arnd@arndb.de, bjorn.andersson@linaro.org, mark.rutland@arm.com, michael.scott@linaro.org
List-Id: devicetree@vger.kernel.org

On 10/25, Jeremy McNicoll wrote:
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 0146d3c..3b78803 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -132,6 +132,15 @@ config MSM_MMCC_8974
>  	  Say Y if you want to support multimedia devices such as display,
>  	  graphics, video encode/decode, camera, etc.
>  
> +config MSM_GCC_8994
> +	tristate "MSM8994 Global Clock Controller"
> +	select QCOM_GDSC

But we aren't populating GDSCs so this is unnecessary right now.

> +	depends on COMMON_CLK_QCOM
> +	help
> +	  Support for the global clock controller on msm8994 devices.
> +	  Say Y if you want to use peripheral devices such as UART, SPI,
> +	  i2c, USB, SD/eMMC, SATA, PCIe, etc.

Is there a sata controller on 8994? Is there an emmc/sd
controller?

> +
>  config MSM_GCC_8996
>  	tristate "MSM8996 Global Clock Controller"
>  	select QCOM_GDSC
> diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
> new file mode 100644
> index 0000000..39b40d4
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-msm8994.c
> @@ -0,0 +1,2501 @@
> +/* Copyright (c) 2013-2016, The Linux Foundation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/err.h>
> +#include <linux/ctype.h>
> +#include <linux/io.h>
> +#include <linux/clk.h>

Is this include used? Should probably be clk-provider instead.

> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,gcc-msm8994.h>
> +
> +#include "common.h"
> +#include "clk-regmap.h"
> +#include "clk-pll.h"

Is this include used?

> +#include "clk-alpha-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-branch.h"
> +#include "reset.h"
> +
> +static struct clk_branch gcc_usb30_mock_utmi_clk = {
> +	.halt_reg = 0x03D0,

Lowercase hex everywhere please.

> +
> +
> +static void msm_gcc_8994v2_fixup(void)
> +{
> +	ufs_axi_clk_src.freq_tbl = ftbl_ufs_axi_clk_src_v2;
> +
> +	blsp1_qup1_spi_apps_clk_src.freq_tbl = ftbl_blspqup_spi_apps_clk_src_v2;
> +	blsp1_qup2_spi_apps_clk_src.freq_tbl = ftbl_blspqup_spi_apps_clk_src_v2;
> +	blsp1_qup3_spi_apps_clk_src.freq_tbl = ftbl_blspqup_spi_apps_clk_src_v2;
> +	blsp1_qup4_spi_apps_clk_src.freq_tbl = ftbl_blspqup_spi_apps_clk_src_v2;
> +	blsp1_qup5_spi_apps_clk_src.freq_tbl = ftbl_blspqup_spi_apps_clk_src_v2;
> +	blsp1_qup6_spi_apps_clk_src.freq_tbl = ftbl_blspqup_spi_apps_clk_src_v2;
> +	blsp2_qup1_spi_apps_clk_src.freq_tbl = ftbl_blspqup_spi_apps_clk_src_v2;
> +	blsp2_qup2_spi_apps_clk_src.freq_tbl = ftbl_blspqup_spi_apps_clk_src_v2;
> +	blsp2_qup3_spi_apps_clk_src.freq_tbl = ftbl_blspqup_spi_apps_clk_src_v2;
> +	blsp2_qup4_spi_apps_clk_src.freq_tbl = ftbl_blspqup_spi_apps_clk_src_v2;
> +	blsp2_qup5_spi_apps_clk_src.freq_tbl = ftbl_blspqup_spi_apps_clk_src_v2;
> +	blsp2_qup6_spi_apps_clk_src.freq_tbl = ftbl_blspqup_spi_apps_clk_src_v2;

Please no, just assume v2.

> +}
> +
> +static const struct regmap_config gcc_msm8994_regmap_config = {
> +	.reg_bits	= 32,
> +	.reg_stride	= 4,
> +	.val_bits	= 32,
> +	.max_register	= 0x2000,
> +	.fast_io	= true,
> +};
> +
> +static const struct qcom_cc_desc gcc_msm8994_desc = {
> +	.config = &gcc_msm8994_regmap_config,
> +	.clks = gcc_msm8994_clocks,
> +	.num_clks = ARRAY_SIZE(gcc_msm8994_clocks),
> +	.resets = NULL,
> +	.num_resets = 0,
> +	.gdscs = NULL,
> +	.num_gdscs = 0,

We don't have to be explicit. Does this even work? I thought
common.c expected there to be a reset list? I guess we would have
a reset controller with no resets. Should be possible to grab
some of the resets out of the android driver though.

> +};
> +
> +static const struct of_device_id gcc_msm8994_match_table[] = {
> +	{ .compatible = "qcom,gcc-8994" },
> +	{ .compatible = "qcom,gcc-8994v2" },

Please add msm and drop the v2 one.

> +	{}
> +}
> +
> +MODULE_DEVICE_TABLE(of, gcc_msm8994_match_table);
> +
> +static int gcc_msm8994_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct clk *clk;
> +	const char *compat = NULL;
> +	int compatlen = 0;
> +	bool is_v2 = false;
> +
> +	clk = devm_clk_register(dev, &xo.hw);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	compat = of_get_property(pdev->dev.of_node, "compatible", &compatlen);
> +	if (!compat || (compatlen <= 0))
> +		return -EINVAL;
> +
> +	is_v2 = !strcmp(compat, "qcom,gcc-8994v2");
> +	if (is_v2)
> +		msm_gcc_8994v2_fixup();

This should simplify greatly.

> +
> +	return qcom_cc_probe(pdev, &gcc_msm8994_desc);
> +}

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
