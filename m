From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 4/4] phy: qcom-qmp: new qmp phy driver for
 qcom-chipsets
Date: Thu, 5 Jan 2017 23:18:34 -0800
Message-ID: <20170106071834.GP10531@minitux>
References: <1482253431-23160-1-git-send-email-vivek.gautam@codeaurora.org>
 <1482253431-23160-5-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1482253431-23160-5-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: robh+dt@kernel.org, kishon@ti.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 20 Dec 09:03 PST 2016, Vivek Gautam wrote:

> diff --git a/drivers/phy/phy-qcom-qmp.c b/drivers/phy/phy-qcom-qmp.c
[..]
> +static int qcom_qmp_phy_poweron(struct phy *phy)
[..]
> +
> +err3:

Rather than naming your labels errX, it's idiomatic to give them
descriptive names, e.g. "disable_ref_clk" here.

> +	clk_disable_unprepare(qphy->ref_clk);
> +err2:
> +	regulator_disable(qphy->vddp_ref_clk);
> +err1:
> +	regulator_disable(qphy->vdda_pll);
> +err:
> +	regulator_disable(qphy->vdda_phy);
> +	return ret;
> +}
[..]
> +static int qcom_qmp_phy_com_init(struct qcom_qmp_phy *qphy)
> +{
> +	const struct qmp_phy_cfg *cfg = qphy->cfg;
> +	void __iomem *serdes = qphy->serdes;
> +	int ret;
> +
> +	mutex_lock(&qphy->phy_mutex);
> +	if (qphy->init_count++) {
> +		mutex_unlock(&qphy->phy_mutex);
> +		return 0;
> +	}

As far as I can see phy_init() and phy_exit() already keep reference
count on the initialization and you only call this function from
phy_ops->init, so you should be able to drop this.

[..]
> +
> +/* PHY Initialization */
> +static int qcom_qmp_phy_init(struct phy *phy)
> +{
[..]
> +	/* phy power down delay; given in PCIE phy programming guide only */
> +	if (qphy->cfg->type == PHY_TYPE_PCIE)

Rather than basing this off "is this pcie" it's preferred if you have a
bool power_down_delay; (or optionally carrying the timeout value) to
control this.

> +		usleep_range(POWER_DOWN_DELAY_US_MIN, POWER_DOWN_DELAY_US_MAX);
> +
> +	/* start SerDes and Phy-Coding-Sublayer */
> +	qphy_setbits(pcs + QPHY_START_CTRL, cfg->start_ctrl);
> +
> +	/* Pull PHY out of reset state */
> +	qphy_clrbits(pcs + QPHY_SW_RESET, SW_RESET);
> +
> +	status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
> +	mask = cfg->mask_pcs_ready;
> +
> +	ret = !mask ? 0 : readl_poll_timeout(status, val, !(val & mask), 1,
> +						PHY_INIT_COMPLETE_TIMEOUT);

I presume it's not okay to read the status register even once for pcie?
If it is you can skip the conditional as !(val & 0) will break the poll
after the first read.

[..]
> +static int qcom_qmp_phy_exit(struct phy *phy)
> +{
[..]
> +}
> +
> +

Extra blank line

> +static int qcom_qmp_phy_regulator_init(struct device *dev)
[..]
> +static
> +struct qmp_phy_desc *qcom_qmp_phy_create(struct platform_device *pdev, int id)
> +{
[..]
> +	phy_desc->pipe_clk = devm_clk_get(dev, prop_name);
> +	if (IS_ERR(phy_desc->pipe_clk)) {
> +		if (qphy->cfg->type == PHY_TYPE_PCIE ||
> +		    qphy->cfg->type == PHY_TYPE_USB3) {

Is this check adding any value?

> +			ret = PTR_ERR(phy_desc->pipe_clk);
> +			if (ret != -EPROBE_DEFER)
> +				dev_err(dev,
> +					"failed to get lane%d pipe_clk, %d\n",
> +					id, ret);
> +			return ERR_PTR(ret);
> +		}
> +		phy_desc->pipe_clk = NULL;

Regards,
Bjorn
