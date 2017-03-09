From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 4/4] phy: qcom-qmp: new qmp phy driver for
 qcom-chipsets
Date: Thu, 9 Mar 2017 12:32:56 +0100
Message-ID: <20170309113256.GC53510@Bjorns-MacBook-Pro-2.local>
References: <1489050441-3240-1-git-send-email-vivek.gautam@codeaurora.org>
 <1489050441-3240-5-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1489050441-3240-5-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, sboyd@codeaurora.org, srinivas.kandagatla@linaro.org
List-Id: devicetree@vger.kernel.org

On Thu 09 Mar 10:07 CET 2017, Vivek Gautam wrote:

[..]
> +static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
> +{
> +	u32 reg;
> +
> +	reg = readl_relaxed(base + offset);
> +	reg |= val;
> +	writel_relaxed(reg, base + offset);
> +
> +	/* Make sure that above writes are completed */
> +	mb();

Same comments as on patch 2 wrt the use of _relaxed operations and
barriers (i.e. please don't).

> +}
> +
[..]
> +static int qcom_qmp_phy_poweron(struct phy *phy)
> +{
> +	struct qmp_phy *qphy = phy_get_drvdata(phy);
> +	struct qcom_qmp *qmp = qphy->qmp;
> +	int ret;
> +
> +	dev_vdbg(&phy->dev, "Powering on QMP phy\n");
> +
> +	ret = regulator_enable(qmp->vdda_phy);
> +	if (ret) {
> +		dev_err(qmp->dev, "%s: vdda-phy enable failed, err=%d\n",
> +				__func__, ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_enable(qmp->vdda_pll);
> +	if (ret) {
> +		dev_err(qmp->dev, "%s: vdda-pll enable failed, err=%d\n",
> +				__func__, ret);
> +		goto disable_vdda_phy;
> +	}
> +
> +	ret = regulator_enable(qmp->vddp_ref_clk);
> +	if (ret) {
> +		dev_err(qmp->dev,
> +			"%s: vdda-ref-clk enable failed, err=%d\n",
> +			__func__, ret);
> +		goto disable_vdda_pll;
> +	}

Please use the regulator_bulk interface here as well.

> +
> +	ret = clk_prepare_enable(qphy->pipe_clk);
> +	if (ret) {
> +		dev_err(qmp->dev, "%s: pipe_clk enable failed, err=%d\n",
> +				__func__, ret);
> +		goto disable_vddp_ref_clk;
> +	}
> +
> +	return 0;
> +
> +disable_vddp_ref_clk:
> +	regulator_disable(qmp->vddp_ref_clk);
> +disable_vdda_pll:
> +	regulator_disable(qmp->vdda_pll);
> +disable_vdda_phy:
> +	regulator_disable(qmp->vdda_phy);
> +	return ret;
> +}
> +
[..]
> +static int phy_pipe_clk_register(struct qcom_qmp *qmp, int id)
> +{
> +	char name[24];
> +	struct clk_fixed_rate *fixed;
> +	struct clk_init_data init = { };
> +	int ret;
> +
> +	switch (qmp->cfg->type) {
> +	case PHY_TYPE_USB3:
> +		snprintf(name, sizeof(name), "usb3_phy_pipe_clk_src");
> +		break;
> +	case PHY_TYPE_PCIE:
> +		snprintf(name, sizeof(name), "pcie_%d_pipe_clk_src", id);
> +		break;
> +	default:
> +		/* not all phys register pipe clocks, so return success */
> +		return 0;
> +	}
> +
> +	fixed = devm_kzalloc(qmp->dev, sizeof(*fixed), GFP_KERNEL);
> +	if (!fixed)
> +		return -ENOMEM;
> +
> +	init.name = name;
> +	init.ops = &clk_fixed_rate_ops;
> +
> +	/* controllers using QMP phys use 125MHz pipe clock interface */
> +	fixed->fixed_rate = 125000000;
> +	fixed->hw.init = &init;
> +
> +	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);

Drop "ret" and just return devm_clk_hw_register()

> +
> +	return ret;
> +}
> +
> +static const struct phy_ops qcom_qmp_phy_gen_ops = {
> +	.init		= qcom_qmp_phy_init,
> +	.exit		= qcom_qmp_phy_exit,
> +	.power_on	= qcom_qmp_phy_poweron,
> +	.power_off	= qcom_qmp_phy_poweroff,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static
> +int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id)
> +{
> +	struct qcom_qmp *qmp = dev_get_drvdata(dev);
> +	struct phy *generic_phy;
> +	struct qmp_phy *qphy;
> +	char prop_name[MAX_PROP_NAME];
> +	int ret;
> +
> +	qphy = devm_kzalloc(dev, sizeof(*qphy), GFP_KERNEL);
> +	if (!qphy)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Get memory resources for each phy lane:
> +	 * Resources are indexed as: tx -> 0; rx -> 1; pcs -> 2.
> +	 */
> +	qphy->tx = of_iomap(np, 0);
> +	if (IS_ERR(qphy->tx))
> +		return PTR_ERR(qphy->tx);
> +
> +	qphy->rx = of_iomap(np, 1);
> +	if (IS_ERR(qphy->rx))
> +		return PTR_ERR(qphy->rx);
> +
> +	qphy->pcs = of_iomap(np, 2);
> +	if (IS_ERR(qphy->pcs))
> +		return PTR_ERR(qphy->pcs);
> +
> +	/*
> +	 * Get PHY's Pipe clock, if any. USB3 and PCIe are PIPE3
> +	 * based phys, so they essentially have pipe clock. So,
> +	 * we return error in case phy is USB3 or PIPE type.
> +	 * Otherwise, we initialize pipe clock to NULL for
> +	 * all phys that don't need this.
> +	 */
> +	snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
> +	qphy->pipe_clk = of_clk_get_by_name(np, prop_name);
> +	if (IS_ERR(qphy->pipe_clk)) {
> +		if (qmp->cfg->type == PHY_TYPE_PCIE ||
> +		    qmp->cfg->type == PHY_TYPE_USB3) {
> +			ret = PTR_ERR(qphy->pipe_clk);
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev,
> +					"failed to get lane%d pipe_clk, %d\n",
> +					id, ret);
> +			return ret;
> +		}
> +		qphy->pipe_clk = NULL;
> +	}
> +
> +	/* Get lane reset, if any */
> +	if (qmp->cfg->has_lane_rst) {
> +		snprintf(prop_name, sizeof(prop_name), "lane%d", id);
> +		qphy->lane_rst = of_reset_control_get(np, prop_name);
> +		if (IS_ERR(qphy->lane_rst)) {
> +			dev_err(dev, "failed to get lane%d reset\n", id);
> +			return PTR_ERR(qphy->lane_rst);
> +		}
> +	}
> +
> +	generic_phy = devm_phy_create(dev, np, &qcom_qmp_phy_gen_ops);
> +	if (IS_ERR(generic_phy)) {
> +		ret = PTR_ERR(generic_phy);
> +		dev_err(dev, "failed to create qphy %d\n", ret);
> +		return ret;
> +	}
> +
> +	qphy->phy = generic_phy;
> +	qphy->index = id;
> +	qphy->qmp = qmp;
> +	qmp->phys[id] = qphy;
> +	phy_set_drvdata(generic_phy, qphy);
> +
> +	return ret;

Afaict "ret" might not be initialized here, just return 0;

> +}
> +
> +static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
> +	{
> +		.compatible = "qcom,msm8996-qmp-pcie-phy",
> +		.data = &msm8996_pciephy_cfg,
> +	}, {
> +		.compatible = "qcom,msm8996-qmp-usb3-phy",
> +		.data = &msm8996_usb3phy_cfg,
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, qcom_qmp_phy_of_match_table);
> +
> +static int qcom_qmp_phy_probe(struct platform_device *pdev)
> +{
> +	struct qcom_qmp *qmp;
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct device_node *child;
> +	struct phy_provider *phy_provider;
> +	void __iomem *base;
> +	int num, id;
> +	int ret;
> +
> +	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
> +	if (!qmp)
> +		return -ENOMEM;
> +
> +	qmp->dev = dev;
> +	dev_set_drvdata(dev, qmp);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	/* per PHY serdes; usually located at base address */
> +	qmp->serdes = base;
> +
> +	mutex_init(&qmp->phy_mutex);
> +
> +	/* Get the specific init parameters of QMP phy */
> +	qmp->cfg = of_device_get_match_data(dev);
> +
> +	ret = qcom_qmp_phy_clk_init(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = qcom_qmp_phy_regulator_init(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = qcom_qmp_phy_reset_init(dev);
> +	if (ret)
> +		return ret;
> +
> +	num = of_get_available_child_count(dev->of_node);
> +	/* do we have a rogue child node ? */
> +	if (num > qmp->cfg->nlanes)
> +		return -EINVAL;
> +
> +	qmp->phys = devm_kcalloc(dev, num, sizeof(*qmp->phys), GFP_KERNEL);
> +	if (!qmp->phys)
> +		return -ENOMEM;
> +
> +	id = 0;
> +	for_each_available_child_of_node(dev->of_node, child) {
> +		/* Create per-lane phy */
> +		ret = qcom_qmp_phy_create(dev, child, id);
> +		if (ret) {
> +			dev_err(dev, "failed to create lane%d phy, %d\n",
> +				id, ret);
> +			return ret;
> +		}
> +
> +		/*
> +		 * Register the pipe clock provided by phy.
> +		 * See function description to see details of this pipe clock.
> +		 */
> +		ret = phy_pipe_clk_register(qmp, id);
> +		if (ret) {
> +			dev_err(qmp->dev,
> +				"failed to register pipe clock source\n");
> +			return ret;
> +		}
> +		id++;
> +	}
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (IS_ERR(phy_provider)) {
> +		ret = PTR_ERR(phy_provider);
> +		dev_err(dev, "failed to register qphy, %d\n", ret);
> +	}
> +
> +	return ret;

Replace this as well with return 0, to not just rely on the fact that
you 45 lines up will leave ret 0.

> +}

Regards,
Bjorn
