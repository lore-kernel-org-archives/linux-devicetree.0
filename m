From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 3/6] phy: qcom-qusb2: Add QUSB2 PHY support for msm8998
Date: Tue, 15 Jan 2019 10:11:14 -0800
Message-ID: <20190115181114.GE28907@builder>
References: <1547483802-5408-1-git-send-email-jhugo@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547483802-5408-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: kishon@ti.com, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, balbi@kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon 14 Jan 08:36 PST 2019, Jeffrey Hugo wrote:

> MSM8998 contains one QUSB2 PHY which is very similar to the existing
> sdm845 support.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 41 +++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index 9177989f..e5e4f36 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -152,6 +152,32 @@ enum qusb2phy_reg_layout {
>  	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
>  };
>  
> +static const unsigned int msm8998_regs_layout[] = {
> +	[QUSB2PHY_PLL_CORE_INPUT_OVERRIDE] = 0xa8,
> +	[QUSB2PHY_PLL_STATUS]              = 0x1a0,
> +	[QUSB2PHY_PORT_TUNE1]              = 0x23c,
> +	[QUSB2PHY_PORT_TUNE2]              = 0x240,
> +	[QUSB2PHY_PORT_TUNE3]              = 0x244,
> +	[QUSB2PHY_PORT_TUNE4]              = 0x248,
> +	[QUSB2PHY_PORT_TEST1]              = 0x24c,
> +	[QUSB2PHY_PORT_TEST2]              = 0x250,
> +	[QUSB2PHY_PORT_POWERDOWN]          = 0x210,
> +	[QUSB2PHY_INTR_CTRL]               = 0x22c,
> +};
> +
> +static const struct qusb2_phy_init_tbl msm8998_init_tbl[] = {
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_ANALOG_CONTROLS_TWO, 0x13),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_CLOCK_INVERTERS, 0x7c),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_CMODE, 0x80),
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_LOCK_DELAY, 0x0a),
> +
> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE1, 0xa5),
> +	QUSB2_PHY_INIT_CFG_L(QUSB2PHY_PORT_TUNE2, 0x09),
> +
> +	QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_DIGITAL_TIMERS_TWO, 0x19),
> +};
> +
> +
>  static const unsigned int sdm845_regs_layout[] = {
>  	[QUSB2PHY_PLL_CORE_INPUT_OVERRIDE] = 0xa8,
>  	[QUSB2PHY_PLL_STATUS]		= 0x1a0,
> @@ -221,6 +247,18 @@ struct qusb2_phy_cfg {
>  	.autoresume_en	 = BIT(3),
>  };
>  
> +static const struct qusb2_phy_cfg msm8998_phy_cfg = {
> +	.tbl            = msm8998_init_tbl,
> +	.tbl_num        = ARRAY_SIZE(msm8998_init_tbl),
> +	.regs           = msm8998_regs_layout,
> +
> +	.disable_ctrl   = POWER_DOWN,
> +	.mask_core_ready = CORE_READY_STATUS,
> +	.has_pll_override = true,
> +	.autoresume_en   = BIT(0),
> +	.update_tune1_with_efuse = true,
> +};
> +
>  static const struct qusb2_phy_cfg sdm845_phy_cfg = {
>  	.tbl		= sdm845_init_tbl,
>  	.tbl_num	= ARRAY_SIZE(sdm845_init_tbl),
> @@ -734,6 +772,9 @@ static int qusb2_phy_exit(struct phy *phy)
>  		.compatible	= "qcom,msm8996-qusb2-phy",
>  		.data		= &msm8996_phy_cfg,
>  	}, {
> +		.compatible	= "qcom,msm8998-qusb2-phy",
> +		.data		= &msm8998_phy_cfg,
> +	}, {
>  		.compatible	= "qcom,sdm845-qusb2-phy",
>  		.data		= &sdm845_phy_cfg,
>  	},
> -- 
> Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
