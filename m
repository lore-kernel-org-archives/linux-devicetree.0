From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH 2/2] phy: msm8996-pcie-phy: Add support to msm8996 pcie
 phy
Date: Fri, 16 Sep 2016 17:14:55 +0300
Message-ID: <2afe8523-925f-b538-f217-23ea7a267e11@linaro.org>
References: <1473245733-17260-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1473245733-17260-3-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473245733-17260-3-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Srini,

<cut>

> +
> +static int qcom_msm8996_phy_common_power_off(struct phy *phy)
> +{
> +	struct phy_msm8996_desc *phydesc = phy_get_drvdata(phy);
> +	struct phy_msm8996_priv *priv = phydesc->priv;
> +	void __iomem *base = priv->base;
> +
> +	mutex_lock(&priv->phy_mutex);
> +	if (--priv->init_count) {
> +		mutex_unlock(&priv->phy_mutex);
> +		return 0;
> +	}
> +
> +	writel_relaxed(0x01, base + PCIE_COM_SW_RESET);
> +	writel_relaxed(0x0, base + PCIE_COM_POWER_DOWN_CONTROL);
> +
> +	reset_control_assert(priv->phy_rstc);
> +	reset_control_assert(priv->phycom_rstc);
> +	clk_disable_unprepare(priv->cfg_clk);
> +	clk_disable_unprepare(priv->aux_clk);
> +	clk_disable_unprepare(priv->ref_clk);
> +	clk_disable_unprepare(priv->ref_clk_src);
> +
> +	mutex_unlock(&priv->phy_mutex);
> +
> +	return 0;
> +}
> +
> +static int qcom_msm8996_phy_common_power_on(struct phy *phy)
> +{
> +	struct phy_msm8996_desc *phydesc = phy_get_drvdata(phy);
> +	struct phy_msm8996_priv *priv = phydesc->priv;
> +	void __iomem *base = priv->base;
> +	int ret;
> +
> +	mutex_lock(&priv->phy_mutex);
> +	if (priv->init_count++) {
> +		mutex_unlock(&priv->phy_mutex);
> +		return 0;
> +	}
> +
> +	clk_prepare_enable(priv->cfg_clk);
> +	clk_prepare_enable(priv->aux_clk);
> +	clk_prepare_enable(priv->ref_clk);
> +	clk_prepare_enable(priv->ref_clk_src);
> +
> +	reset_control_deassert(priv->phy_rstc);
> +	reset_control_deassert(priv->phycom_rstc);
> +
> +	writel_relaxed(0x01, base + PCIE_COM_POWER_DOWN_CONTROL);
> +	writel_relaxed(0x1c, base + QSERDES_COM_BIAS_EN_CLKBUFLR_EN);
> +	writel_relaxed(0x10, base + QSERDES_COM_CLK_ENABLE1);
> +	writel_relaxed(0x33, base + QSERDES_COM_CLK_SELECT);
> +	writel_relaxed(0x06, base + QSERDES_COM_CMN_CONFIG);
> +	writel_relaxed(0x42, base + QSERDES_COM_LOCK_CMP_EN);
> +	writel_relaxed(0x00, base + QSERDES_COM_VCO_TUNE_MAP);
> +	writel_relaxed(0xff, base + QSERDES_COM_VCO_TUNE_TIMER1);
> +	writel_relaxed(0x1f, base + QSERDES_COM_VCO_TUNE_TIMER2);
> +	writel_relaxed(0x01, base + QSERDES_COM_HSCLK_SEL);
> +	writel_relaxed(0x01, base + QSERDES_COM_SVS_MODE_CLK_SEL);
> +	writel_relaxed(0x00, base + QSERDES_COM_CORE_CLK_EN);
> +	writel_relaxed(0x0a, base + QSERDES_COM_CORECLK_DIV);
> +	writel_relaxed(0x09, base + QSERDES_COM_BG_TIMER);
> +	writel_relaxed(0x82, base + QSERDES_COM_DEC_START_MODE0);
> +	writel_relaxed(0x03, base + QSERDES_COM_DIV_FRAC_START3_MODE0);
> +	writel_relaxed(0x55, base + QSERDES_COM_DIV_FRAC_START2_MODE0);
> +	writel_relaxed(0x55, base + QSERDES_COM_DIV_FRAC_START1_MODE0);
> +	writel_relaxed(0x00, base + QSERDES_COM_LOCK_CMP3_MODE0);
> +	writel_relaxed(0x1a, base + QSERDES_COM_LOCK_CMP2_MODE0);
> +	writel_relaxed(0x0a, base + QSERDES_COM_LOCK_CMP1_MODE0);
> +	writel_relaxed(0x33, base + QSERDES_COM_CLK_SELECT);
> +	writel_relaxed(0x02, base + QSERDES_COM_SYS_CLK_CTRL);
> +	writel_relaxed(0x1f, base + QSERDES_COM_SYSCLK_BUF_ENABLE);
> +	writel_relaxed(0x04, base + QSERDES_COM_SYSCLK_EN_SEL);
> +	writel_relaxed(0x0b, base + QSERDES_COM_CP_CTRL_MODE0);
> +	writel_relaxed(0x16, base + QSERDES_COM_PLL_RCTRL_MODE0);
> +	writel_relaxed(0x28, base + QSERDES_COM_PLL_CCTRL_MODE0);
> +	writel_relaxed(0x00, base + QSERDES_COM_INTEGLOOP_GAIN1_MODE0);
> +	writel_relaxed(0x80, base + QSERDES_COM_INTEGLOOP_GAIN0_MODE0);
> +	writel_relaxed(0x01, base + QSERDES_COM_SSC_EN_CENTER);
> +	writel_relaxed(0x31, base + QSERDES_COM_SSC_PER1);
> +	writel_relaxed(0x01, base + QSERDES_COM_SSC_PER2);
> +	writel_relaxed(0x02, base + QSERDES_COM_SSC_ADJ_PER1);
> +	writel_relaxed(0x00, base + QSERDES_COM_SSC_ADJ_PER2);
> +	writel_relaxed(0x2f, base + QSERDES_COM_SSC_STEP_SIZE1);
> +	writel_relaxed(0x19, base + QSERDES_COM_SSC_STEP_SIZE2);
> +	writel_relaxed(0x15, base + QSERDES_COM_RESCODE_DIV_NUM);
> +	writel_relaxed(0x0f, base + QSERDES_COM_BG_TRIM);
> +	writel_relaxed(0x0f, base + QSERDES_COM_PLL_IVCO);
> +	writel_relaxed(0x19, base + QSERDES_COM_CLK_EP_DIV);
> +	writel_relaxed(0x10, base + QSERDES_COM_CLK_ENABLE1);
> +	writel_relaxed(0x00, base + QSERDES_COM_HSCLK_SEL);
> +	writel_relaxed(0x40, base + QSERDES_COM_RESCODE_DIV_NUM);
> +	writel_relaxed(0x00, base + PCIE_COM_SW_RESET);
> +	writel_relaxed(0x03, base + PCIE_COM_START_CONTROL);

I'd make an array with register/value pair and write the registers with
a for () loop. IMO it will be more readable.

Probably 3 arrays - power_on, power_on_common and power_off.


-- 
regards,
Stan
