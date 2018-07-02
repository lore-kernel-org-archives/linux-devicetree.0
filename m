From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v7 2/4] phy: General struct and field cleanup
Date: Mon, 2 Jul 2018 12:12:15 +0530
Message-ID: <CAFp+6iEP7jvT_UZ-ui6BrYOkOUAYPen3bTEwKURJ9zZBnWa=MA@mail.gmail.com>
References: <20180619083647.10116-1-cang@codeaurora.org> <20180619083647.10116-3-cang@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619083647.10116-3-cang@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Can Guo <cang@codeaurora.org>
Cc: Subhash Jadavani <subhashj@codeaurora.org>, asutoshd@codeaurora.org, Manu Gautam <mgautam@codeaurora.org>, kishon <kishon@ti.com>, robh+dt <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, open list <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Can,


On Tue, Jun 19, 2018 at 2:06 PM, Can Guo <cang@codeaurora.org> wrote:
> Move MSM8996 specific PHY vreg list struct name to a genernal one as it is
> used by all PHYs. Add a specific field to handle dual lane situation.
>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index ccb8578..9be9754 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -649,6 +649,8 @@ struct qmp_phy_cfg {
>
>         /* true, if PHY has a separate DP_COM control block */
>         bool has_phy_dp_com_ctrl;
> +       /* true, if PHY has secondary tx/rx lanes to be configured */
> +       bool is_dual_lane_phy;
>         /* Register offset of secondary tx/rx lanes for USB DP combo PHY */
>         unsigned int tx_b_lane_offset;
>         unsigned int rx_b_lane_offset;
> @@ -758,7 +760,7 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
>  };
>
>  /* list of regulators */
> -static const char * const msm8996_phy_vreg_l[] = {
> +static const char * const qmp_phy_vreg_l[] = {
>         "vdda-phy", "vdda-pll",
>  };
>
> @@ -778,8 +780,8 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
>         .num_clks               = ARRAY_SIZE(msm8996_phy_clk_l),
>         .reset_list             = msm8996_pciephy_reset_l,
>         .num_resets             = ARRAY_SIZE(msm8996_pciephy_reset_l),
> -       .vreg_list              = msm8996_phy_vreg_l,
> -       .num_vregs              = ARRAY_SIZE(msm8996_phy_vreg_l),
> +       .vreg_list              = qmp_phy_vreg_l,
> +       .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>         .regs                   = pciephy_regs_layout,
>
>         .start_ctrl             = PCS_START | PLL_READY_GATE_EN,
> @@ -809,8 +811,8 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
>         .num_clks               = ARRAY_SIZE(msm8996_phy_clk_l),
>         .reset_list             = msm8996_usb3phy_reset_l,
>         .num_resets             = ARRAY_SIZE(msm8996_usb3phy_reset_l),
> -       .vreg_list              = msm8996_phy_vreg_l,
> -       .num_vregs              = ARRAY_SIZE(msm8996_phy_vreg_l),
> +       .vreg_list              = qmp_phy_vreg_l,
> +       .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>         .regs                   = usb3phy_regs_layout,
>
>         .start_ctrl             = SERDES_START | PCS_START,
> @@ -870,8 +872,8 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
>         .num_clks               = ARRAY_SIZE(qmp_v3_phy_clk_l),
>         .reset_list             = msm8996_usb3phy_reset_l,
>         .num_resets             = ARRAY_SIZE(msm8996_usb3phy_reset_l),
> -       .vreg_list              = msm8996_phy_vreg_l,
> -       .num_vregs              = ARRAY_SIZE(msm8996_phy_vreg_l),
> +       .vreg_list              = qmp_phy_vreg_l,
> +       .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>         .regs                   = qmp_v3_usb3phy_regs_layout,
>
>         .start_ctrl             = SERDES_START | PCS_START,
> @@ -883,6 +885,7 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
>         .pwrdn_delay_max        = POWER_DOWN_DELAY_US_MAX,
>
>         .has_phy_dp_com_ctrl    = true,
> +       .is_dual_lane_phy       = true,
>         .tx_b_lane_offset       = 0x400,
>         .rx_b_lane_offset       = 0x400,
>  };
> @@ -903,8 +906,8 @@ static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
>         .num_clks               = ARRAY_SIZE(qmp_v3_phy_clk_l),
>         .reset_list             = msm8996_usb3phy_reset_l,
>         .num_resets             = ARRAY_SIZE(msm8996_usb3phy_reset_l),
> -       .vreg_list              = msm8996_phy_vreg_l,
> -       .num_vregs              = ARRAY_SIZE(msm8996_phy_vreg_l),
> +       .vreg_list              = qmp_phy_vreg_l,
> +       .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>         .regs                   = qmp_v3_usb3phy_regs_layout,
>
>         .start_ctrl             = SERDES_START | PCS_START,
> @@ -1116,12 +1119,12 @@ static int qcom_qmp_phy_init(struct phy *phy)
>         /* Tx, Rx, and PCS configurations */
>         qcom_qmp_phy_configure(tx, cfg->regs, cfg->tx_tbl, cfg->tx_tbl_num);
>         /* Configuration for other LANE for USB-DP combo PHY */
> -       if (cfg->has_phy_dp_com_ctrl)
> +       if (cfg->is_dual_lane_phy)
>                 qcom_qmp_phy_configure(tx + cfg->tx_b_lane_offset, cfg->regs,
>                                        cfg->tx_tbl, cfg->tx_tbl_num);
>
>         qcom_qmp_phy_configure(rx, cfg->regs, cfg->rx_tbl, cfg->rx_tbl_num);
> -       if (cfg->has_phy_dp_com_ctrl)
> +       if (cfg->is_dual_lane_phy)
>                 qcom_qmp_phy_configure(rx + cfg->rx_b_lane_offset, cfg->regs,
>                                        cfg->rx_tbl, cfg->rx_tbl_num);
>

Thanks for the patch. Looks good to me now.
Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>

Best regards
Vivek

> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
