From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 2/2] phy: qualcomm: Add Synopsys High-Speed USB PHY driver
Date: Fri, 9 Nov 2018 10:52:17 +0530
Message-ID: <20181109052217.GL12092@vkoul-mobl>
References: <20181108070449.23572-1-shawn.guo@linaro.org>
 <20181108070449.23572-3-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181108070449.23572-3-shawn.guo@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Sriharsha Allenki <sallenki@codeaurora.org>, Anu Ramanathan <anur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08-11-18, 15:04, Shawn Guo wrote:
> +static int qcom_snps_hsphy_config_regulators(struct hsphy_priv *priv, int high)
> +{
> +	int min, ret, i;
> +
> +	min = high ? 1 : 0; /* low or none? */
> +
> +	for (i = 0; i < VREG_NUM; i++) {
> +		ret = regulator_set_voltage(priv->vregs[i].consumer,
> +					    priv->voltages[i][min],
> +					    priv->voltages[i][VOL_MAX]);
> +		if (ret)
> +			return ret;

should we not roll back the set voltages on error?

> +static int qcom_snps_hsphy_por_reset(struct hsphy_priv *priv)
> +{
> +	int ret;
> +
> +	ret = reset_control_assert(priv->por_reset);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * The Femto PHY is POR reset in the following scenarios.

POR?

> +static int qcom_snps_hsphy_init(struct phy *phy)
> +{
> +	struct hsphy_priv *priv = phy_get_drvdata(phy);
> +	int state;
> +	int ret;

perhaps they can be in a single line :)

> +static int qcom_snps_hsphy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct phy_provider *provider;
> +	struct hsphy_priv *priv;
> +	struct resource *res;
> +	struct phy *phy;
> +	int size;
> +	int ret;
> +	int i;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	priv->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->num_clks = ARRAY_SIZE(qcom_snps_hsphy_clks);
> +	priv->clks = devm_kcalloc(dev, priv->num_clks, sizeof(*priv->clks),
> +				  GFP_KERNEL);
> +	if (!priv->clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < priv->num_clks; i++)
> +		priv->clks[i].id = qcom_snps_hsphy_clks[i];
> +
> +	ret = devm_clk_bulk_get(dev, priv->num_clks, priv->clks);
> +	if (ret)
> +		return ret;
> +
> +	priv->phy_reset = devm_reset_control_get(dev, "phy");
> +	if (IS_ERR(priv->phy_reset))
> +		return PTR_ERR(priv->phy_reset);
> +
> +	priv->por_reset = devm_reset_control_get(dev, "por");
> +	if (IS_ERR(priv->por_reset))
> +		return PTR_ERR(priv->por_reset);
> +
> +	priv->vregs[VDD].supply = "vdd";
> +	priv->vregs[VDDA_1P8].supply = "vdda1p8";
> +	priv->vregs[VDDA_3P3].supply = "vdda3p3";
> +
> +	ret = devm_regulator_bulk_get(dev, VREG_NUM, priv->vregs);
> +	if (ret)
> +		return ret;
> +
> +	priv->voltages[VDDA_1P8][VOL_NONE] = 0;
> +	priv->voltages[VDDA_1P8][VOL_MIN] = 1800000;
> +	priv->voltages[VDDA_1P8][VOL_MAX] = 1800000;
> +
> +	priv->voltages[VDDA_3P3][VOL_NONE] = 0;
> +	priv->voltages[VDDA_3P3][VOL_MIN] = 3050000;
> +	priv->voltages[VDDA_3P3][VOL_MAX] = 3300000;
> +
> +	ret = of_property_read_u32_array(dev->of_node, "qcom,vdd-voltage-level",
> +					 priv->voltages[VDD], VOL_NUM);
> +	if (ret) {
> +		dev_err(dev, "failed to read qcom,vdd-voltage-level\n");
> +		return ret;
> +	}
> +
> +	size = of_property_count_u32_elems(dev->of_node, "qcom,init-seq");
> +	if (size < 0)
> +		size = 0;
> +
> +	priv->init_seq = devm_kcalloc(dev, (size / 3) + 1,

size/3? I think it would be good to add a common explaining this
-- 
~Vinod
