From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v11 6/6] clk: qcom: Add APCS clock controller support
Date: Tue, 5 Dec 2017 09:21:01 -0800
Message-ID: <20171205172101.GO28761@minitux>
References: <20171205154701.27730-1-georgi.djakov@linaro.org>
 <20171205154701.27730-7-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171205154701.27730-7-georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue 05 Dec 07:47 PST 2017, Georgi Djakov wrote:

> Add a driver for the APCS clock controller. It is part of the APCS
> hardware block, which among other things implements also a combined
> mux and half integer divider functionality. It can choose between a
> fixed-rate clock or the dedicated APCS (A53) PLL. The source and the
> divider can be set both at the same time.
> 
> This is required for enabling CPU frequency scaling on MSM8916-based
> platforms.
> 

Acked-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Regards,
Bjorn

> Signed-off-by: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/clk/qcom/Kconfig        |  11 +++
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/apcs-msm8916.c | 149 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 161 insertions(+)
>  create mode 100644 drivers/clk/qcom/apcs-msm8916.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 81ac7b9378fe..255023b439c9 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -22,6 +22,17 @@ config QCOM_A53PLL
>  	  Say Y if you want to support higher CPU frequencies on MSM8916
>  	  devices.
>  
> +config QCOM_CLK_APCS_MSM8916
> +	bool "MSM8916 APCS Clock Controller"
> +	depends on COMMON_CLK_QCOM
> +	depends on QCOM_APCS_IPC
> +	default ARCH_QCOM
> +	help
> +	  Support for the APCS Clock Controller on msm8916 devices. The
> +	  APCS is managing the mux and divider which feeds the CPUs.
> +	  Say Y if you want to support CPU frequency scaling on devices
> +	  such as msm8916.
> +
>  config QCOM_CLK_RPM
>  	tristate "RPM based Clock Controller"
>  	depends on COMMON_CLK_QCOM && MFD_QCOM_RPM
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 7c51d877f967..0408cebf38d4 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -34,5 +34,6 @@ obj-$(CONFIG_MSM_MMCC_8960) += mmcc-msm8960.o
>  obj-$(CONFIG_MSM_MMCC_8974) += mmcc-msm8974.o
>  obj-$(CONFIG_MSM_MMCC_8996) += mmcc-msm8996.o
>  obj-$(CONFIG_QCOM_A53PLL) += a53-pll.o
> +obj-$(CONFIG_QCOM_CLK_APCS_MSM8916) += apcs-msm8916.o
>  obj-$(CONFIG_QCOM_CLK_RPM) += clk-rpm.o
>  obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
> diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
> new file mode 100644
> index 000000000000..832172c2fc8b
> --- /dev/null
> +++ b/drivers/clk/qcom/apcs-msm8916.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm APCS clock controller driver
> + *
> + * Copyright (c) 2017, Linaro Limited
> + * Author: Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/kernel.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/module.h>
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include "clk-regmap.h"
> +#include "clk-regmap-mux-div.h"
> +
> +enum {
> +	P_GPLL0,
> +	P_A53PLL,
> +};
> +
> +static const struct parent_map gpll0_a53cc_map[] = {
> +	{ P_GPLL0, 4 },
> +	{ P_A53PLL, 5 },
> +};
> +
> +static const char * const gpll0_a53cc[] = {
> +	"gpll0_vote",
> +	"a53pll",
> +};
> +
> +/*
> + * We use the notifier function for switching to a temporary safe configuration
> + * (mux and divider), while the A53 PLL is reconfigured.
> + */
> +static int a53cc_notifier_cb(struct notifier_block *nb, unsigned long event,
> +			     void *data)
> +{
> +	int ret = 0;
> +	struct clk_regmap_mux_div *md = container_of(nb,
> +						     struct clk_regmap_mux_div,
> +						     clk_nb);
> +	if (event == PRE_RATE_CHANGE)
> +		/* set the mux and divider to safe frequency (400mhz) */
> +		ret = __mux_div_set_src_div(md, 4, 3);
> +
> +	return notifier_from_errno(ret);
> +}
> +
> +static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device *parent = dev->parent;
> +	struct clk_regmap_mux_div *a53cc;
> +	struct regmap *regmap;
> +	struct clk_init_data init = { };
> +	int ret;
> +
> +	regmap = dev_get_regmap(parent, NULL);
> +	if (IS_ERR(regmap)) {
> +		ret = PTR_ERR(regmap);
> +		dev_err(dev, "failed to get regmap: %d\n", ret);
> +		return ret;
> +	}
> +
> +	a53cc = devm_kzalloc(dev, sizeof(*a53cc), GFP_KERNEL);
> +	if (!a53cc)
> +		return -ENOMEM;
> +
> +	init.name = "a53mux";
> +	init.parent_names = gpll0_a53cc;
> +	init.num_parents = ARRAY_SIZE(gpll0_a53cc);
> +	init.ops = &clk_regmap_mux_div_ops;
> +	init.flags = CLK_SET_RATE_PARENT;
> +
> +	a53cc->clkr.hw.init = &init;
> +	a53cc->clkr.regmap = regmap;
> +	a53cc->reg_offset = 0x50;
> +	a53cc->hid_width = 5;
> +	a53cc->hid_shift = 0;
> +	a53cc->src_width = 3;
> +	a53cc->src_shift = 8;
> +	a53cc->parent_map = gpll0_a53cc_map;
> +
> +	a53cc->pclk = devm_clk_get(parent, NULL);
> +	if (IS_ERR(a53cc->pclk)) {
> +		ret = PTR_ERR(a53cc->pclk);
> +		dev_err(dev, "failed to get clk: %d\n", ret);
> +		return ret;
> +	}
> +
> +	a53cc->clk_nb.notifier_call = a53cc_notifier_cb;
> +	ret = clk_notifier_register(a53cc->pclk, &a53cc->clk_nb);
> +	if (ret) {
> +		dev_err(dev, "failed to register clock notifier: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = devm_clk_register_regmap(dev, &a53cc->clkr);
> +	if (ret) {
> +		dev_err(dev, "failed to register regmap clock: %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret = of_clk_add_hw_provider(parent->of_node, of_clk_hw_simple_get,
> +				     &a53cc->clkr.hw);
> +	if (ret) {
> +		dev_err(dev, "failed to add clock provider: %d\n", ret);
> +		goto err;
> +	}
> +
> +	platform_set_drvdata(pdev, a53cc);
> +
> +	return 0;
> +
> +err:
> +	clk_notifier_unregister(a53cc->pclk, &a53cc->clk_nb);
> +	return ret;
> +}
> +
> +static int qcom_apcs_msm8916_clk_remove(struct platform_device *pdev)
> +{
> +	struct clk_regmap_mux_div *a53cc = platform_get_drvdata(pdev);
> +	struct device *parent = pdev->dev.parent;
> +
> +	clk_notifier_unregister(a53cc->pclk, &a53cc->clk_nb);
> +	of_clk_del_provider(parent->of_node);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver qcom_apcs_msm8916_clk_driver = {
> +	.probe = qcom_apcs_msm8916_clk_probe,
> +	.remove = qcom_apcs_msm8916_clk_remove,
> +	.driver = {
> +		.name = "qcom-apcs-msm8916-clk",
> +	},
> +};
> +module_platform_driver(qcom_apcs_msm8916_clk_driver);
> +
> +MODULE_AUTHOR("Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Qualcomm MSM8916 APCS clock driver");
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
