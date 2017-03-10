From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v5 2/4] phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom
 chips
Date: Fri, 10 Mar 2017 14:12:04 +0530
Message-ID: <d394f667-f0e3-944f-9afc-5b6d645fcac8@codeaurora.org>
References: <1489050441-3240-1-git-send-email-vivek.gautam@codeaurora.org>
 <1489050441-3240-3-git-send-email-vivek.gautam@codeaurora.org>
 <20170309110147.GA53510@Bjorns-MacBook-Pro-2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170309110147.GA53510-iTMlPVAvTYNoL7IsjepNBwq4bfNCki47rNQQ6b5fDX0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,


On 03/09/2017 04:31 PM, Bjorn Andersson wrote:
> On Thu 09 Mar 10:07 CET 2017, Vivek Gautam wrote:
>
> [..]
>> +static inline void qusb2_setbits(void __iomem *base, u32 offset, u32 val)
>> +{
>> +	u32 reg;
>> +
>> +	reg = readl_relaxed(base + offset);
>> +	reg |= val;
>> +	writel_relaxed(reg, base + offset);
>> +
>> +	/* Ensure above write is completed */
>> +	mb();
> mb() does not ensure that the operation is completed, it only ensures
> ordering between this write and subsequent memory accesses.
>
> Unless you have specific reasons to you should not use the _relaxed()
> versions of read and write operations. Using the non-relaxed versions
> will ensure that your memory operations are not reordered.

Right, I think this is something i took from downstream and didn't
change. I should rather be using readl()/writel() and then readl()
again to ensure writes are through.
Thanks for pointing out.

>
>> +}
>> +
>> +static inline void qusb2_clrbits(void __iomem *base, u32 offset, u32 val)
>> +{
>> +	u32 reg;
>> +
>> +	reg = readl_relaxed(base + offset);
>> +	reg &= ~val;
>> +	writel_relaxed(reg, base + offset);
>> +
>> +	/* Ensure above write is completed */
>> +	mb();
> Dito.

Sure, will change it.

>
>> +}
>> +
>> +static inline void qcom_qusb2_phy_configure(void __iomem *base,
>> +				const struct qusb2_phy_init_tbl tbl[],
>> +				int num)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < num; i++)
>> +		writel_relaxed(tbl[i].val, base + tbl[i].offset);
>> +
>> +	/* flush buffered writes */
>> +	mb();
> Dito.

will correct it.

>
>> +}
>> +
>> +static int qusb2_phy_toggle_power(struct qusb2_phy *qphy, bool on)
>> +{
>> +	struct device *dev = &qphy->phy->dev;
>> +	int ret;
>> +
>> +	if (!on) {
>> +		ret = 0;
>> +		goto disable_vdda_phy_dpdm;
>> +	}
> This is an ugly hack.

Right, it sort of minimized the code. :)
It just jumps to disable code for an 'off' call.

But, will amend it to use regulator_bulk_*() apis.

>
>> +
>> +	ret = regulator_enable(qphy->vdd_phy);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable vdd-phy, %d\n", ret);
>> +		goto err_vdd_phy;
>> +	}
>> +
>> +	ret = regulator_enable(qphy->vdda_pll);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable vdda-pll, %d\n", ret);
>> +		goto disable_vdd_phy;
>> +	}
>> +
>> +	ret = regulator_enable(qphy->vdda_phy_dpdm);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable vdda-phy-dpdm, %d\n", ret);
>> +		goto disable_vdda_pll;
>> +	}
>> +
>> +	dev_vdbg(dev, "%s(): regulators are turned on\n", __func__);
>> +
>> +	return ret;
>> +
>> +disable_vdda_phy_dpdm:
>> +	regulator_disable(qphy->vdda_phy_dpdm);
>> +disable_vdda_pll:
>> +	regulator_disable(qphy->vdda_pll);
>> +disable_vdd_phy:
>> +	regulator_disable(qphy->vdd_phy);
>> +err_vdd_phy:
>> +	dev_vdbg(dev, "%s(): regulators are turned off\n", __func__);
>> +	return ret;
>> +}
> If you use the regulator_bulk interface for your regulators you can
> replace this entire function with a call to regulator_bulk_enable() and
> regulator_bulk_disable().

Sure, will change this as suggested.

>
>> +
>> +/*
>> + * Fetches HS Tx tuning value from nvmem and sets the
>> + * QUSB2PHY_PORT_TUNE2 register.
>> + * For error case, skip setting the value and use the default value.
>> + */
>> +static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
>> +{
>> +	struct device *dev = &qphy->phy->dev;
>> +	u8 *val;
>> +
>> +	/*
>> +	 * Read efuse register having TUNE2 parameter's high nibble.
>> +	 * If efuse register shows value as 0x0, or if we fail to find
>> +	 * a valid efuse register settings, then use default value
>> +	 * as 0xB for high nibble that we have already set while
>> +	 * configuring phy.
>> +	 */
>> +	val = nvmem_cell_read(qphy->cell, NULL);
>> +	if (IS_ERR(val) || !val[0]) {
>> +		dev_dbg(dev, "failed to read a valid hs-tx trim value\n");
>> +		return;
>> +	}
>> +
>> +	/* Fused TUNE2 value is the higher nibble only */
>> +	qusb2_setbits(qphy->base, QUSB2PHY_PORT_TUNE2, val[0] << 0x4);
>> +}
>> +
>> +static int qusb2_phy_poweron(struct phy *phy)
>> +{
>> +	struct qusb2_phy *qphy = phy_get_drvdata(phy);
>> +	int ret;
>> +
>> +	dev_vdbg(&phy->dev, "%s(): Powering-on QUSB2 phy\n", __func__);
>> +
>> +	/* turn on regulator supplies */
>> +	ret = qusb2_phy_toggle_power(qphy, true);
> Call regulator_bulk_enable()

Sure.

>
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = clk_prepare_enable(qphy->iface_clk);
>> +	if (ret)
>> +		dev_err(&phy->dev, "failed to enable iface_clk, %d\n", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int qusb2_phy_poweroff(struct phy *phy)
>> +{
>> +	struct qusb2_phy *qphy = phy_get_drvdata(phy);
>> +
>> +	clk_disable_unprepare(qphy->iface_clk);
>> +
>> +	qusb2_phy_toggle_power(qphy, false);
> Call regulator_bulk_disable()

Right, will do that.

>
>> +
>> +	return 0;
>> +}
>> +
>> +static int qusb2_phy_init(struct phy *phy)
>> +{
>> +	struct qusb2_phy *qphy = phy_get_drvdata(phy);
>> +	unsigned int val;
>> +	unsigned int clk_scheme;
>> +	int ret;
>> +
>> +	dev_vdbg(&phy->dev, "%s(): Initializing QUSB2 phy\n", __func__);
>> +
>> +	/* enable ahb interface clock to program phy */
>> +	ret = clk_prepare_enable(qphy->cfg_ahb_clk);
>> +	if (ret) {
>> +		dev_err(&phy->dev, "failed to enable cfg ahb clock, %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	/* Perform phy reset */
>> +	ret = reset_control_assert(qphy->phy_reset);
>> +	if (ret) {
>> +		dev_err(&phy->dev, "failed to assert phy_reset, %d\n", ret);
>> +		goto disable_ahb_clk;
>> +	}
>> +
>> +	/* 100 us delay to keep PHY in reset mode */
>> +	usleep_range(100, 150);
>> +
>> +	ret = reset_control_deassert(qphy->phy_reset);
>> +	if (ret) {
>> +		dev_err(&phy->dev, "failed to de-assert phy_reset, %d\n", ret);
>> +		goto disable_ahb_clk;
>> +	}
>> +
>> +	/* Disable the PHY */
>> +	qusb2_setbits(qphy->base, QUSB2PHY_PORT_POWERDOWN,
>> +			CLAMP_N_EN | FREEZIO_N | POWER_DOWN);
>> +
>> +	/* save reset value to override reference clock scheme later */
>> +	val = readl_relaxed(qphy->base + QUSB2PHY_PLL_TEST);
>> +
>> +	qcom_qusb2_phy_configure(qphy->base, qphy->cfg->tbl,
>> +					qphy->cfg->tbl_num);
>> +
>> +	/* Set efuse value for tuning the PHY */
>> +	qusb2_phy_set_tune2_param(qphy);
>> +
>> +	/* Enable the PHY */
>> +	qusb2_clrbits(qphy->base, QUSB2PHY_PORT_POWERDOWN, POWER_DOWN);
>> +
> The mb() in clrbits will not ensure that the write is finished before
> the sleep, it will only ensure that above write is done before any later
> memory operations. If you want to ensure that the value has hit the
> hardware before the sleep you should simply read back the value from the
> register.

Right. Will add a read back in qusb2_clrbits() and qusb2_setbits().

>
>> +	/* Required to get phy pll lock successfully */
>> +	usleep_range(150, 160);
>> +
>> +	/* Default is single-ended clock on msm8996 */
>> +	qphy->has_se_clk_scheme = true;
>> +	/*
>> +	 * read TCSR_PHY_CLK_SCHEME register to check if single-ended
>> +	 * clock scheme is selected. If yes, then disable differential
>> +	 * ref_clk and use single-ended clock, otherwise use differential
>> +	 * ref_clk only.
>> +	 */
>> +	if (qphy->tcsr) {
>> +		ret = regmap_read(qphy->tcsr, qphy->cfg->clk_scheme_offset,
>> +							&clk_scheme);
>> +		if (ret) {
>> +			dev_err(&phy->dev, "failed to read clk scheme reg\n");
>> +			goto assert_phy_reset;
>> +		}
>> +
>> +		/* is it a differential clock scheme ? */
>> +		if (!(clk_scheme & PHY_CLK_SCHEME_SEL)) {
>> +			dev_vdbg(&phy->dev, "%s(): select differential clk\n",
>> +								__func__);
>> +			qphy->has_se_clk_scheme = false;
>> +		} else {
>> +			dev_vdbg(&phy->dev, "%s(): select single-ended clk\n",
>> +								__func__);
>> +		}
>> +	}
>> +
>> +	if (!qphy->has_se_clk_scheme) {
>> +		val &= ~CLK_REF_SEL;
>> +		ret = clk_prepare_enable(qphy->ref_clk);
>> +		if (ret) {
>> +			dev_err(&phy->dev, "failed to enable ref clk, %d\n",
>> +									ret);
>> +			goto assert_phy_reset;
>> +		}
>> +	} else {
>> +		val |= CLK_REF_SEL;
>> +	}
>> +
>> +	writel_relaxed(val, qphy->base + QUSB2PHY_PLL_TEST);
>> +
>> +	/* Make sure that above write is completed to get PLL source clock */
>> +	wmb();
>> +
> As above.

Sure, will change this.

>> +	/* Required to get phy pll lock successfully */
>> +	usleep_range(100, 110);
>> +
> Regards,
> Bjorn


Regards
Vivek

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
