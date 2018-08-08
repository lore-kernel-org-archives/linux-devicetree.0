From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v8 3/5] phy: Add QMP phy based UFS phy support for sdm845
Date: Wed, 8 Aug 2018 14:55:35 -0700
Message-ID: <CAE=gft6cdE+oMYf779VGrQHfYQ5Xb1v+Qr6cAznTtAovehCOxw@mail.gmail.com>
References: <20180731100914.19856-1-cang@codeaurora.org> <20180731100914.19856-4-cang@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180731100914.19856-4-cang@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: cang@codeaurora.org
Cc: subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, Manu Gautam <mgautam@codeaurora.org>, kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 31, 2018 at 3:09 AM Can Guo <cang@codeaurora.org> wrote:
>
> Add UFS PHY support to make SDM845 UFS work with common PHY framework.
>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 172 +++++++++++++++++++++++++++++++++++-
>  drivers/phy/qualcomm/phy-qcom-qmp.h |  15 ++++
>  2 files changed, 186 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 9be9754..de7ff18 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
...
>  static void qcom_qmp_phy_configure(void __iomem *base,
>                                    const unsigned int *regs,
>                                    const struct qmp_phy_init_tbl tbl[],
> @@ -1131,6 +1249,14 @@ static int qcom_qmp_phy_init(struct phy *phy)
>         qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
>
>         /*
> +        * UFS PHY requires the deassert of software reset before serdes start.
> +        * For UFS PHYs that do not have software reset control bits, defer
> +        * starting serdes until the power on callback.
> +        */

I'm relatively thick when it comes to PHYs, but I'm a little confused.
The sequence of code right below this (not shown) looks like it is
deasserting reset before starting serdes, seemingly doing what the
comment wants. I guess the problem is the lack of SW reset? So then
you defer serdes start until UFS does... something. Can you explain
how deferring to after UFS HC init actually helps? Is it the UFS HC
that releases reset on the PHY?

I was hoping the next patch would help, but I'm still confused. It
looks like you've added a call to phy_power_on in
ufs_qcom_setup_clocks, but there's also one still in
ufs_qcom_power_up_sequence. What does the original phy_power_on in
ufs_qcom_power_up_sequence do now? It seems like that one would do the
power on too early, and then your new added call in
ufs_qcom_setup_clocks would do nothing.


> +       if ((cfg->type == PHY_TYPE_UFS) && cfg->no_pcs_sw_reset)
> +               goto out;
> +
> +       /*
>          * Pull out PHY from POWER DOWN state.
>          * This is active low enable signal to power-down PHY.
>          */
> @@ -1159,6 +1285,7 @@ static int qcom_qmp_phy_init(struct phy *phy)
>         }
>         qmp->phy_initialized = true;
>
> +out:
>         return ret;
>
>  err_pcs_ready:
> @@ -1181,7 +1308,8 @@ static int qcom_qmp_phy_exit(struct phy *phy)
>         clk_disable_unprepare(qphy->pipe_clk);
>
>         /* PHY reset */
> -       qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> +       if (!cfg->no_pcs_sw_reset)
> +               qphy_setbits(qphy->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>
>         /* stop SerDes and Phy-Coding-Sublayer */
>         qphy_clrbits(qphy->pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
> @@ -1199,6 +1327,44 @@ static int qcom_qmp_phy_exit(struct phy *phy)
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
> @@ -1428,6 +1594,7 @@ static int phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
>  static const struct phy_ops qcom_qmp_phy_gen_ops = {
>         .init           = qcom_qmp_phy_init,
>         .exit           = qcom_qmp_phy_exit,
> +       .power_on       = qcom_qmp_phy_poweron,

The power_on function without corresponding power_off still makes me
nervous. But with phy_initialized and init_count members, I guess this
works.

>         .set_mode       = qcom_qmp_phy_set_mode,
>         .owner          = THIS_MODULE,
>  };
> @@ -1533,6 +1700,9 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id)
>         }, {
>                 .compatible = "qcom,sdm845-qmp-usb3-uni-phy",
>                 .data = &qmp_v3_usb3_uniphy_cfg,
> +       }, {
> +               .compatible = "qcom,sdm845-qmp-ufs-phy",
> +               .data = &sdm845_ufsphy_cfg,
>         },
>         { },
>  };
