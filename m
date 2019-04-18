From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 3/7] phy: qcom: Add Qualcomm PCIe2 PHY driver
Date: Thu, 18 Apr 2019 10:29:18 +0530
Message-ID: <20190418045918.GV28103@vkoul-mobl>
References: <20190219060407.15263-1-bjorn.andersson@linaro.org>
 <20190219060407.15263-4-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190219060407.15263-4-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 18-02-19, 22:04, Bjorn Andersson wrote:

> +static int qcom_pcie2_phy_power_on(struct phy *phy)
> +{
> +	struct qcom_phy *qphy = phy_get_drvdata(phy);
> +	int ret;
> +	u32 val;
> +
> +	/* Program REF_CLK source */
> +	val = readl(qphy->base + PCIE20_PARF_PHY_REFCLK_CTRL2);
> +	val &= ~BIT(1);
> +	writel(val, qphy->base + PCIE20_PARF_PHY_REFCLK_CTRL2);
> +
> +	usleep_range(1000, 2000);
> +
> +	/* Don't use PAD for refclock */
> +	val = readl(qphy->base + PCIE20_PARF_PHY_REFCLK_CTRL2);
> +	val &= ~BIT(0);
> +	writel(val, qphy->base + PCIE20_PARF_PHY_REFCLK_CTRL2);
> +
> +	/* Program SSP ENABLE */
> +	val = readl(qphy->base + PCIE20_PARF_PHY_REFCLK_CTRL3);
> +	val |= BIT(0);
> +	writel(val, qphy->base + PCIE20_PARF_PHY_REFCLK_CTRL3);

we have this readl, modify and writel pattern in the file. I guess it
makes sense to add a modifyl() with mask and value as args..

-- 
~Vinod
