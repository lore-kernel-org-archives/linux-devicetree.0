From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v7 3/4] phy: Add QMP phy based UFS phy support for sdm845
Date: Wed, 27 Jun 2018 13:17:32 -0700
Message-ID: <CAE=gft4153GviYtYuoREgyPkwxwnejHG+t+H8MB+Jv1TXTouSA@mail.gmail.com>
References: <20180619083647.10116-1-cang@codeaurora.org> <20180619083647.10116-4-cang@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619083647.10116-4-cang@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: cang@codeaurora.org
Cc: subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, Manu Gautam <mgautam@codeaurora.org>, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 19, 2018 at 1:38 AM Can Guo <cang@codeaurora.org> wrote:
>
> Add UFS PHY support to make SDM845 UFS work with common PHY framework.
>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 173 +++++++++++++++++++++++++++++++++++-
>  drivers/phy/qualcomm/phy-qcom-qmp.h |  15 ++++
>  2 files changed, 187 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 9be9754..852792d 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
...
>  static void qcom_qmp_phy_configure(void __iomem *base,
>                                    const unsigned int *regs,
>                                    const struct qmp_phy_init_tbl tbl[],
> @@ -1131,6 +1249,15 @@ static int qcom_qmp_phy_init(struct phy *phy)
>         qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
>
>         /*
> +        * UFS PHY requires the deassert of software reset before serdes start.
> +        * For UFS PHY that has not software reset control bits in its address

This line of the comment is unclear. Maybe:
"For UFS PHYs that do not have software reset control bits, defer
starting serdes until the power on callback"

> +        * space, it should skip starting serdes here. UFS PHY Serdes shall
> +        * start when UFS explicitly calls PHY power on.
> +        */
> +       if ((cfg->type == PHY_TYPE_UFS) && cfg->no_pcs_sw_reset)
> +               goto out;
> +
> +       /*
>          * Pull out PHY from POWER DOWN state.
>          * This is active low enable signal to power-down PHY.
>          */
> @@ -1159,6 +1286,7 @@ static int qcom_qmp_phy_init(struct phy *phy)
>         }
>         qmp->phy_initialized = true;
>
> +out:
>         return ret;
>
>  err_pcs_ready:
> @@ -1181,7 +1309,8 @@ static int qcom_qmp_phy_exit(struct phy *phy)
>         clk_disable_unprepare(qphy->pipe_clk);
>
>         /* PHY reset */
> -       qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> +       if (!cfg->no_pcs_sw_reset)
> +               qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>
>         /* stop SerDes and Phy-Coding-Sublayer */
>         qphy_clrbits(qphy->pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
> @@ -1199,6 +1328,44 @@ static int qcom_qmp_phy_exit(struct phy *phy)
>         return 0;
>  }
>
> +static int qcom_qmp_phy_poweron(struct phy *phy)
> +{
> +       struct qmp_phy *qphy = phy_get_drvdata(phy);
> +       struct qcom_qmp *qmp = qphy->qmp;
> +       const struct qmp_phy_cfg *cfg = qmp->cfg;
> +       void __iomem *pcs = qphy->pcs;
> +       void __iomem *status;
> +       unsigned int mask, val;
> +       int ret = 0;
> +
> +       if (cfg->type != PHY_TYPE_UFS)
> +               return 0;
> +
> +       /*
> +        * For UFS PHY that has not software reset control, serdes start
> +        * should only happen when UFS driver explicitly calls phy_power_on
> +        * after it deasserts software reset.
> +        */
> +       if (cfg->no_pcs_sw_reset && !qmp->phy_initialized &&
> +           (qmp->init_count != 0)) {
> +               /* start SerDes and Phy-Coding-Sublayer */
> +               qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
> +
> +               status = pcs + cfg->regs[QPHY_PCS_READY_STATUS];
> +               mask = cfg->mask_pcs_ready;
> +
> +               ret = readl_poll_timeout(status, val, !(val & mask), 1,
> +                                        PHY_INIT_COMPLETE_TIMEOUT);
> +               if (ret) {
> +                       dev_err(qmp->dev, "phy initialization timed-out\n");
> +                       return ret;
> +               }
> +               qmp->phy_initialized = true;
> +       }
> +
> +       return ret;
> +}
> +
>  static int qcom_qmp_phy_set_mode(struct phy *phy, enum phy_mode mode)
>  {
>         struct qmp_phy *qphy = phy_get_drvdata(phy);
> @@ -1428,6 +1595,7 @@ static int phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
>  static const struct phy_ops qcom_qmp_phy_gen_ops = {
>         .init           = qcom_qmp_phy_init,
>         .exit           = qcom_qmp_phy_exit,
> +       .power_on       = qcom_qmp_phy_poweron,

The USB pipe clk discussion earlier this year got me on the lookout
for asymmetric phy init functions. If we're flipping on START_CTRL in
phy_poweron, shouldn't we be flipping it back off in phy_poweroff?
>From the comments, it seems like this was done so that some sort of
UFS reset step could happen. Would that sequencing still happen
correctly if the PHY did:

phy_init
phy_power_on
(phy_power_off)
phy_power_on

I'm unsure. Does suspend/resume work?

-Evan
