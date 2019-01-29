From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/2] phy: qualcomm: usb: Add Super-Speed PHY driver
Date: Tue, 29 Jan 2019 12:27:26 -0800
Message-ID: <20190129202726.GA3036@builder>
References: <1548761715-4004-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1548761715-4004-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548761715-4004-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com, jackp@codeaurora.org, andy.gross@linaro.org, swboyd@chromium.org, shawn.guo@linaro.org, vkoul@kernel.org, khasim.mohammed@linaro.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 29 Jan 03:35 PST 2019, Jorge Ramirez-Ortiz wrote:
> diff --git a/drivers/phy/qualcomm/phy-qcom-usb-ss.c b/drivers/phy/qualcomm/phy-qcom-usb-ss.c
> new file mode 100644
> index 0000000..e6ae96e
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-usb-ss.c
> @@ -0,0 +1,347 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2012-2014,2017 The Linux Foundation. All rights reserved.
> + * Copyright (c) 2018, Linaro Limited
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#define PHY_CTRL0			0x6C
> +#define PHY_CTRL1			0x70
> +#define PHY_CTRL2			0x74
> +#define PHY_CTRL4			0x7C
> +
> +/* PHY_CTRL bits */
> +#define REF_PHY_EN			BIT(0)
> +#define LANE0_PWR_ON			BIT(2)
> +#define SWI_PCS_CLK_SEL			BIT(4)
> +#define TST_PWR_DOWN			BIT(4)
> +#define PHY_RESET			BIT(7)
> +
> +enum phy_vdd_ctrl { ENABLE, DISABLE, };

Use bool to describe boolean values.

> +enum phy_regulator { VDD, VDDA1P8, };

It doesn't look like you need either of these if you remove the
set_voltage calls.

> +
> +struct ssphy_priv {
> +	void __iomem *base;
> +	struct device *dev;
> +	struct reset_control *reset_com;
> +	struct reset_control *reset_phy;
> +	struct regulator *vbus;
> +	struct regulator_bulk_data *regs;
> +	int num_regs;
> +	struct clk_bulk_data *clks;
> +	int num_clks;
> +	enum phy_mode mode;
> +};
> +
> +static inline void qcom_ssphy_updatel(void __iomem *addr, u32 mask, u32 val)
> +{
> +	writel((readl(addr) & ~mask) | val, addr);
> +}
> +
> +static inline int qcom_ssphy_vbus_enable(struct regulator *vbus)
> +{
> +	return !regulator_is_enabled(vbus) ? regulator_enable(vbus) : 0;

regulator_is_enabled() will check if the actual regulator is on, not if
you already voted for it.

So if something else is enabling the vbus regulator you will skip your
enable and be in the mercy of them not releasing it. Presumably there's
only one consumer of this particular regulator, but it's a bad habit.

Please keep track of this drivers requested state in this driver, if
qcom_ssphy_vbus_ctrl() is called not only for the state changes.

> +}
> +
> +static inline int qcom_ssphy_vbus_disable(struct regulator *vbus)
> +{
> +	return regulator_is_enabled(vbus) ? regulator_disable(vbus) : 0;
> +}
> +
> +static int qcom_ssphy_vdd_ctrl(struct ssphy_priv *priv, enum phy_vdd_ctrl ctrl)

As discussed on IRC, I think you should just leave the voltage
constraints to DeviceTree.

> +{
> +	const int vdd_min = ctrl == ENABLE ? 1050000 : 0;
> +	const int vdd_max = 1050000;
> +	int ret;
> +
> +	ret = regulator_set_voltage(priv->regs[VDD].consumer, vdd_min, vdd_max);
> +	if (ret)
> +		dev_err(priv->dev, "Failed to set regulator vdd to %d\n",
> +			vdd_min);
> +
> +	return ret;
> +}
[..]
> +static int qcom_ssphy_power_on(struct phy *phy)
> +{
> +	struct ssphy_priv *priv = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = qcom_ssphy_vdd_ctrl(priv, ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	ret = regulator_bulk_enable(priv->num_regs, priv->regs);
> +	if (ret)
> +		goto err1;
> +
> +	ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
> +	if (ret)
> +		goto err2;
> +
> +	ret = qcom_ssphy_vbus_ctrl(priv->vbus, priv->mode);
> +	if (ret)
> +		goto err3;
> +
> +	ret = qcom_ssphy_do_reset(priv);
> +	if (ret)
> +		goto err4;
> +
> +	writeb(SWI_PCS_CLK_SEL, priv->base + PHY_CTRL0);
> +	qcom_ssphy_updatel(priv->base + PHY_CTRL4, LANE0_PWR_ON, LANE0_PWR_ON);
> +	qcom_ssphy_updatel(priv->base + PHY_CTRL2, REF_PHY_EN, REF_PHY_EN);
> +	qcom_ssphy_updatel(priv->base + PHY_CTRL4, TST_PWR_DOWN, 0);
> +
> +	return 0;
> +err4:

Name your labels based on what they do, e.g. err_disable_vbus.

> +	if (priv->vbus && priv->mode != PHY_MODE_INVALID)
> +		qcom_ssphy_vbus_disable(priv->vbus);

qcom_ssphy_vbus_ctrl() above was either enabling or disabling vbus, but
here you're directly calling disable to unroll that. It think the result
is correct (in host this reverts to disabled and in gadget it's a
no-op), but I'm not sure I like the design of sometimes calling straight
to the vbus enable/disable and sometimes to the wrapper function.

> +err3:

err_clk_disable

> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
> +err2:
> +	regulator_bulk_disable(priv->num_regs, priv->regs);
> +err1:
> +	qcom_ssphy_vdd_ctrl(priv, DISABLE);
> +
> +	return ret;
> +}
> +
> +static int qcom_ssphy_power_off(struct phy *phy)
> +{
> +	struct ssphy_priv *priv = phy_get_drvdata(phy);
> +
> +	qcom_ssphy_updatel(priv->base + PHY_CTRL4, LANE0_PWR_ON, 0);
> +	qcom_ssphy_updatel(priv->base + PHY_CTRL2, REF_PHY_EN, 0);
> +	qcom_ssphy_updatel(priv->base + PHY_CTRL4, TST_PWR_DOWN, TST_PWR_DOWN);
> +
> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
> +	regulator_bulk_disable(priv->num_regs, priv->regs);
> +
> +	if (priv->vbus && priv->mode != PHY_MODE_INVALID)
> +		qcom_ssphy_vbus_disable(priv->vbus);
> +
> +	qcom_ssphy_vdd_ctrl(priv, DISABLE);
> +
> +	return 0;
> +}
> +
> +static int qcom_ssphy_init_clock(struct ssphy_priv *priv)
> +{
> +	const char * const clk_id[] = { "ref", "phy", "pipe", };
> +	int i;
> +
> +	priv->num_clks = ARRAY_SIZE(clk_id);
> +	priv->clks = devm_kcalloc(priv->dev, priv->num_clks,
> +				  sizeof(*priv->clks), GFP_KERNEL);

You know num_clks is 3, so I would suggest that you just change the
sshphy_priv to clks[3] and skip the dynamic allocation.


Also, as num_clks always is ARRAY_SIZE(priv->clks) I would suggest using
the latter, to make that clear throughout the driver.

> +	if (!priv->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < priv->num_clks; i++)
> +		priv->clks[i].id = clk_id[i];

There's no harm in just writing this on three lines:

	priv->clks[0].id = "ref";
	priv->clks[1].id = "phy";
	priv->clks[2].id = "pipe";

> +
> +	return devm_clk_bulk_get(priv->dev, priv->num_clks, priv->clks);
> +}
> +
> +static int qcom_ssphy_init_regulator(struct ssphy_priv *priv)
> +{
> +	const char * const reg_supplies[] = {
> +		[VDD] = "vdd",
> +		[VDDA1P8] = "vdda1p8",
> +	};
> +	int ret, i;
> +
> +	priv->num_regs = ARRAY_SIZE(reg_supplies);
> +	priv->regs = devm_kcalloc(priv->dev, priv->num_regs,
> +				  sizeof(*priv->regs), GFP_KERNEL);

As with clocks, you know there will only be 2 of these, make it fixed
size in ssphy_priv.

And as with clocks, I would suggest using ARRAY_SIZE(priv->regs)
throughout the driver to make it obvious that's it's a static number. 

> +	if (!priv->regs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < priv->num_regs; i++)
> +		priv->regs[i].supply = reg_supplies[i];

As with clocks, just unroll this and fill in the 2 supplies directly.

> +
> +	ret = devm_regulator_bulk_get(priv->dev, priv->num_regs, priv->regs);
> +	if (ret)
> +		return ret;
> +
> +	priv->vbus = devm_regulator_get_optional(priv->dev, "vbus");

get_optional means that if vbus-supply is not found, rather than
returning a dummy regulator object this will fail with -ENODEV.

Given the rest of the logic related to vbus you should set vbus to NULL
if the returned PTR_ERR(value) is -ENODEV, and fail for other errors.


Or just drop the _optional, and let your vbus controls operate on the
dummy regulator you get back.

(Right now vbus can't be NULL, so these checks are not very useful)

> +	if (IS_ERR(priv->vbus))
> +		return PTR_ERR(priv->vbus);
> +
> +	return 0;

return PTR_ERR_OR_ZERO(priv->vbus)

(Although that might change based on above comment)

> +}

Regards,
Bjorn
