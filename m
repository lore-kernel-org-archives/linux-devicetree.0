From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v2 4/4] phy: qcom-qmp: new qmp phy driver for qcom-chipsets
Date: Tue, 20 Dec 2016 11:12:12 +0530
Message-ID: <CAFp+6iEcyHbzs4EyJ2RAoVPwN0MaHSTREb0j0+2_OoPPg0DYLQ@mail.gmail.com>
References: <1479816163-5260-1-git-send-email-vivek.gautam@codeaurora.org>
 <1479816163-5260-5-git-send-email-vivek.gautam@codeaurora.org> <20161129003522.GP6095@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161129003522.GP6095@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: kishon <kishon@ti.com>, robh+dt <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Nov 29, 2016 at 6:05 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:

Thanks for a thorough review. Please find my comments inline.

> On 11/22, Vivek Gautam wrote:
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index f1dcec1..8970d9e 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -430,6 +430,15 @@ config PHY_STIH407_USB
>>         Enable this support to enable the picoPHY device used by USB2
>>         and USB3 controllers on STMicroelectronics STiH407 SoC families.
>>
>> +config PHY_QCOM_QMP
>> +     tristate "Qualcomm QMP PHY Driver"
>> +     depends on OF && (ARCH_QCOM || COMPILE_TEST)
>> +     select GENERIC_PHY
>> +     select RESET_CONTROLLER
>
> Again, probably should be dropped as we're not providing resets
> here, just using them.

Sure, will drop in v3.

>
>> diff --git a/drivers/phy/phy-qcom-qmp.c b/drivers/phy/phy-qcom-qmp.c
>> new file mode 100644
>> index 0000000..f85289e
>> --- /dev/null
>> +++ b/drivers/phy/phy-qcom-qmp.c
>> @@ -0,0 +1,1141 @@
>> +/*
>> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 and
>> + * only version 2 as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regulator/consumer.h>
>> +#include <linux/reset.h>
>> +#include <linux/slab.h>
>> +
>> +#include <dt-bindings/phy/phy.h>
>> +
> [...]
>> +
>> +/* set of registers with offsets different per-PHY */
>> +enum qphy_reg_layout {
>> +     /* Common block control registers */
>> +     QPHY_COM_SW_RESET,
>> +     QPHY_COM_POWER_DOWN_CONTROL,
>> +     QPHY_COM_START_CONTROL,
>> +     QPHY_COM_PCS_READY_STATUS,
>> +     /* PCS registers */
>> +     QPHY_PLL_LOCK_CHK_DLY_TIME,
>> +     QPHY_FLL_CNTRL1,
>> +     QPHY_FLL_CNTRL2,
>> +     QPHY_FLL_CNT_VAL_L,
>> +     QPHY_FLL_CNT_VAL_H_TOL,
>> +     QPHY_FLL_MAN_CODE,
>> +     QPHY_PCS_READY_STATUS,
>> +};
>> +
>> +unsigned int pciephy_regs_layout[] = {
>
> static? const?

Will take care of these in v3.
[...]

>> +
>> +/**
>> + * struct qmp_phy_init_cfg:- per-PHY init config.
>
> The colon and dash can't be right. One is kernel-doc, but of
> course there aren't any other member descriptions.

Right, will convert this to a one-line comment.

>
>> + */
>> +struct qmp_phy_init_cfg {
>> +     /* phy-type - PCIE/UFS/USB */
>> +     unsigned int type;
>> +     /* number of lanes provided by phy */
>> +     int nlanes;
>> +
>> +     /* Initialization sequence for PHY blocks - Serdes, tx, rx, pcs */
>> +     struct qmp_phy_init_tbl *phy_init_serdes_tbl;
>> +     int phy_init_serdes_tbl_sz;
>> +     struct qmp_phy_init_tbl *phy_init_tx_tbl;
>> +     int phy_init_tx_tbl_sz;
>> +     struct qmp_phy_init_tbl *phy_init_rx_tbl;
>> +     int phy_init_rx_tbl_sz;
>> +     struct qmp_phy_init_tbl *phy_init_pcs_tbl;
>> +     int phy_init_pcs_tbl_sz;
>
> _sz makes it sound like bytes, perhaps _num instead.

sure.

>
>> +
>> +     /* array of registers with different offsets */
>> +     unsigned int *regs;
>
> const?

taking care of these in v3.

>
>> +
>> +     unsigned int mask_start_ctrl;
>> +     unsigned int mask_pwr_dn_ctrl;
>> +     /* true, if PHY has a separate PHY_COM_CNTRL block */
>> +     bool has_phy_com_ctrl;
>> +     /* true, if PHY has a reset for individual lanes */
>> +     bool has_lane_rst;
>> +};
>> +
>> +/**
>> + * struct qmp_phy_desc:- per-lane phy-descriptor.
>
> Also kernel-doc requests full stop is left out on one line
> descriptions.

sure, will remove it from here and from other places where a full-stop
is not required.

>
>> + *
>> + * @phy: pointer to generic phy
>> + * @tx: pointer to iomapped memory space for PHY's tx
>> + * @rx: pointer to iomapped memory space for PHY's rx
>> + * @pcs: pointer to iomapped memory space for PHY's pcs
>> + * @pipe_clk: pointer to pipe lock
>> + * @index: lane index
>> + * @qphy: pointer to QMP phy to which this lane belongs
>> + * @lane_rst: pointer to lane's reset controller
>
> Not sure we care about "pointer to" as types can be figured out
> other ways.

will drop "pointer to" string.

>
>> + */
>> +struct qmp_phy_desc {
>> +     struct phy *phy;
>> +     void __iomem *tx;
>> +     void __iomem *rx;
>> +     void __iomem *pcs;
>> +     struct clk *pipe_clk;
>> +     unsigned int index;
>> +     struct qcom_qmp_phy *qphy;
>> +     struct reset_control *lane_rst;
>> +};
>> +
>> +/**
>> + * struct qcom_qmp_phy:- structure holding QMP PHY attributes.
>> + *
>> + * @dev: pointer to device
>> + * @serdes: pointer to iomapped memory space for phy's serdes
>> + *
>> + * @aux_clk: pointer to phy core clock
>> + * @cfg_ahb_clk: pointer to AHB2PHY interface clock
>> + * @ref_clk: pointer to reference clock
>> + * @ref_clk_src: pointer to source to reference clock
>> + *
>> + * @vdda_phy: vdd supply to the phy core block
>> + * @vdda_pll: 1.8V vdd supply to ref_clk block
>> + * @vddp_ref_clk: vdd supply to specific ref_clk block (Optional)
>> + *
>> + * @phy_rst: Pointer to phy reset control
>> + * @phycom_rst: Pointer to phy common reset control
>> + * @phycfg_rst: Pointer to phy ahb cfg reset control (Optional)
>> + *
>> + * @cfg: pointer to init config for each phys
>> + * @phys: array of pointer to per-lane phy descriptors
>> + * @phy_mutex: mutex lock for PHY common block initialization
>> + * @init_count: Phy common block initialization count
>> + */
>> +struct qcom_qmp_phy {
>> +     struct device *dev;
>> +     void __iomem *serdes;
>> +
>> +     struct clk *aux_clk;
>> +     struct clk *cfg_ahb_clk;
>> +     struct clk *ref_clk;
>> +     struct clk *ref_clk_src;
>> +
>> +     struct regulator *vdda_phy;
>> +     struct regulator *vdda_pll;
>> +     struct regulator *vddp_ref_clk;
>> +
>> +     struct reset_control *phy_rst;
>> +     struct reset_control *phycom_rst;
>> +     struct reset_control *phycfg_rst;
>> +
>> +     const struct qmp_phy_init_cfg *cfg;
>> +     struct qmp_phy_desc **phys;
>> +
>> +     struct mutex phy_mutex;
>> +     int init_count;
>> +};
>> +
>> +static inline void qphy_setbits(void __iomem *reg, u32 val)
>> +{
>> +     u32 reg_val;
>> +
>> +     reg_val = readl_relaxed(reg);
>> +     reg_val |= val;
>> +     writel_relaxed(reg_val, reg);
>> +}
>> +
>> +static inline void qphy_clrbits(void __iomem *reg, u32 val)
>> +{
>> +     u32 reg_val;
>> +
>> +     reg_val = readl_relaxed(reg);
>> +     reg_val &= ~val;
>> +     writel_relaxed(reg_val, reg);
>> +}
>> +
>> +const struct qmp_phy_init_cfg msm8996_pciephy_init_cfg = {
>
> static?
>
>> +     .type                   = PHY_TYPE_PCIE,
>> +     .nlanes                 = 3,
>> +
>> +     .phy_init_serdes_tbl    = pciephy_serdes_init_tbl,
>> +     .phy_init_serdes_tbl_sz = ARRAY_SIZE(pciephy_serdes_init_tbl),
>> +     .phy_init_tx_tbl        = pciephy_tx_init_tbl,
>> +     .phy_init_tx_tbl_sz     = ARRAY_SIZE(pciephy_tx_init_tbl),
>> +     .phy_init_rx_tbl        = pciephy_rx_init_tbl,
>> +     .phy_init_rx_tbl_sz     = ARRAY_SIZE(pciephy_rx_init_tbl),
>> +     .phy_init_pcs_tbl       = pciephy_pcs_init_tbl,
>> +     .phy_init_pcs_tbl_sz    = ARRAY_SIZE(pciephy_pcs_init_tbl),
>> +     .regs                   = pciephy_regs_layout,
>> +     .mask_start_ctrl        = (PHY_PCS_START | PHY_PLL_READY_GATE_EN),
>> +     .mask_pwr_dn_ctrl       = (PHY_SW_PWRDN | PHY_REFCLK_DRV_DSBL),
>> +
>> +     .has_phy_com_ctrl       = true,
>> +     .has_lane_rst           = true,
>> +};
>> +
>> +const struct qmp_phy_init_cfg msm8996_usb3phy_init_cfg = {
>
> static? Try running sparse.

Right, will do that from now on.

>
>> +     .type                   = PHY_TYPE_USB3,
>> +     .nlanes                 = 1,
>> +
>> +     .phy_init_serdes_tbl    = usb3phy_serdes_init_tbl,
>> +     .phy_init_serdes_tbl_sz = ARRAY_SIZE(usb3phy_serdes_init_tbl),
>> +     .phy_init_tx_tbl        = usb3phy_tx_init_tbl,
>> +     .phy_init_tx_tbl_sz     = ARRAY_SIZE(usb3phy_tx_init_tbl),
>> +     .phy_init_rx_tbl        = usb3phy_rx_init_tbl,
>> +     .phy_init_rx_tbl_sz     = ARRAY_SIZE(usb3phy_rx_init_tbl),
>> +     .phy_init_pcs_tbl       = usb3phy_pcs_init_tbl,
>> +     .phy_init_pcs_tbl_sz    = ARRAY_SIZE(usb3phy_pcs_init_tbl),
>
> Do we really need phy_init as a prefix. Could just be serdes_tbl,
> tx_tbl, etc?

Right, shorter names improve readability.

>
>> +     .regs                   = usb3phy_regs_layout,
>> +     .mask_start_ctrl        = (PHY_SERDES_START | PHY_PCS_START),
>> +     .mask_pwr_dn_ctrl       = PHY_SW_PWRDN,
>> +};
>> +
>> +static void qcom_qmp_phy_configure(void __iomem *base,
>> +                             unsigned int *regs_layout,
>> +                             struct qmp_phy_init_tbl init_tbl[],
>> +                             int init_tbl_sz)
>
> Shorter variable names would make this easier to read.

ditto.

>
>> +{
>> +     int i;
>> +
>> +     for (i = 0; i < init_tbl_sz; i++) {
>> +             if (init_tbl[i].in_layout)
>> +                     writel_relaxed(init_tbl[i].cfg_val,
>> +                             base + regs_layout[init_tbl[i].reg_offset]);
>> +             else
>> +                     writel_relaxed(init_tbl[i].cfg_val,
>> +                             base + init_tbl[i].reg_offset);
>> +     }
>> +
>         const struct qmp_phy_init_tbl *t = tbl;
>
>         for (i = 0; i < num; i++, t++)
>                 if (t->in_layout)
>                         writel_relaxed(t->val, base + regs[t->offset]);
>                 else
>                         writel_relaxed(t->val, base + t->offset);
>

Updating this in v3.

>> +     /* flush buffered writes */
>> +     mb();
>> +}
>> +
>> +static int qcom_qmp_phy_poweron(struct phy *phy)
>> +{
>> +     struct qmp_phy_desc *phydesc = phy_get_drvdata(phy);
>> +     struct qcom_qmp_phy *qphy = phydesc->qphy;
>> +     int ret;
>> +
>> +     dev_vdbg(&phy->dev, "Powering on QMP phy\n");
>> +
>> +     ret = regulator_enable(qphy->vdda_phy);
>> +     if (ret) {
>> +             dev_err(qphy->dev, "%s: vdda-phy enable failed, err=%d\n",
>> +                             __func__, ret);
>> +             return ret;
>> +     }
>> +
>> +     ret = regulator_enable(qphy->vdda_pll);
>> +     if (ret) {
>> +             dev_err(qphy->dev, "%s: vdda-pll enable failed, err=%d\n",
>> +                             __func__, ret);
>> +             goto err_vdda_pll;
>> +     }
>> +
>> +     if (qphy->vddp_ref_clk) {
>> +             ret = regulator_enable(qphy->vddp_ref_clk);
>> +             if (ret) {
>> +                     dev_err(qphy->dev, "%s: vdda-ref-clk enable failed, err=%d\n",
>> +                                     __func__, ret);
>> +                     goto err_vddp_refclk;
>> +             }
>> +     }
>> +
>> +     clk_prepare_enable(qphy->ref_clk_src);
>> +     clk_prepare_enable(qphy->ref_clk);
>> +     clk_prepare_enable(phydesc->pipe_clk);
>
> And if these fail?

Will add error handling for all instances of clk_prepare_enable()
across the driver in next patch version.

>
>> +
>> +     return 0;
>> +
>> +err_vddp_refclk:
>> +     regulator_disable(qphy->vdda_pll);
>> +err_vdda_pll:
>> +     regulator_disable(qphy->vdda_phy);
>> +     return ret;
>> +}
>> +
>> +static int qcom_qmp_phy_poweroff(struct phy *phy)
>> +{
>> +     struct qmp_phy_desc *phydesc = phy_get_drvdata(phy);
>> +     struct qcom_qmp_phy *qphy = phydesc->qphy;
>> +
>> +     clk_disable_unprepare(qphy->ref_clk_src);
>> +     clk_disable_unprepare(qphy->ref_clk);
>> +     clk_disable_unprepare(phydesc->pipe_clk);
>> +
>> +     if (qphy->vddp_ref_clk)
>> +             regulator_disable(qphy->vddp_ref_clk);
>> +
>> +     regulator_disable(qphy->vdda_pll);
>> +     regulator_disable(qphy->vdda_phy);
>> +
>> +     return 0;
>> +}
>> +
>> +static int qcom_qmp_phy_is_ready(struct qcom_qmp_phy *qphy,
>> +                             void __iomem *pcs_status, u32 mask)
>> +{
>> +     unsigned int init_timeout;
>> +
>> +     init_timeout = PHY_READY_TIMEOUT_COUNT;
>> +     do {
>> +             if (readl_relaxed(pcs_status) & mask)
>> +                     break;
>> +
>> +             usleep_range(REFCLK_STABILIZATION_DELAY_US_MIN,
>> +                              REFCLK_STABILIZATION_DELAY_US_MAX);
>> +     } while (--init_timeout);
>
> readl_poll_timeout?

Right, will use that.

>
>> +
>> +     if (!init_timeout)
>> +             return -EBUSY;
>> +
>> +     return 0;
>> +}
>> +
> [...]
>> +
>> +/* PHY Initialization */
>> +static int qcom_qmp_phy_init(struct phy *phy)
>> +{
>> +     struct qmp_phy_desc *phydesc = phy_get_drvdata(phy);
>> +     struct qcom_qmp_phy *qphy = phydesc->qphy;
>> +     const struct qmp_phy_init_cfg *cfg = qphy->cfg;
>> +     void __iomem *tx = phydesc->tx;
>> +     void __iomem *rx = phydesc->rx;
>> +     void __iomem *pcs = phydesc->pcs;
>> +     int ret;
>> +
>> +     dev_vdbg(qphy->dev, "Initializing QMP phy\n");
>> +
>> +     /* enable interface clocks to program phy */
>> +     clk_prepare_enable(qphy->aux_clk);
>> +     clk_prepare_enable(qphy->cfg_ahb_clk);
>> +
>> +     ret = qcom_qmp_phy_com_init(qphy);
>> +     if (ret)
>> +             goto err;
>> +
>> +     if (phydesc->lane_rst) {
>> +             ret = reset_control_deassert(phydesc->lane_rst);
>> +             if (ret) {
>> +                     dev_err(qphy->dev, "lane<%d> reset deassert failed\n",
>
> Drop the brackets?
sure.

>
>> +                                     phydesc->index);
>> +                     goto err_lane_rst;
>> +             }
>> +     }
>> +
>> +     /* Tx, Rx, and PCS configurations */
>> +     qcom_qmp_phy_configure(tx, cfg->regs, cfg->phy_init_tx_tbl,
>> +                             cfg->phy_init_tx_tbl_sz);
>> +     qcom_qmp_phy_configure(rx, cfg->regs, cfg->phy_init_rx_tbl,
>> +                             cfg->phy_init_rx_tbl_sz);
>> +     qcom_qmp_phy_configure(pcs, cfg->regs, cfg->phy_init_pcs_tbl,
>> +                             cfg->phy_init_pcs_tbl_sz);
>> +
>> +     /*
>> +      * Pull out PHY from POWER DOWN state:
>> +      * This is active low enable signal to power-down PHY.
>> +      */
>> +     qphy_setbits(pcs + QPHY_POWER_DOWN_CONTROL, cfg->mask_pwr_dn_ctrl);
>> +     /* XXX: 10 us delay; given in PCIE phy programming guide only */
>
> Is this a todo?

No, this delay seems to be required by the pcie phy only. USB3 phy guide
doesn't mention anything about this delay. Neither the downstream
USB3 qmp phy driver uses this delay.
Can add a check for the phy type to use this delay.

>
>> +     usleep_range(POWER_DOWN_DELAY_US_MIN, POWER_DOWN_DELAY_US_MAX);
>> +
>> +     /* start SerDes and Phy-Coding-Sublayer */
>> +     qphy_setbits(pcs + QPHY_START_CTRL, cfg->mask_start_ctrl);
>> +
>> +     /* Pull PHY out of reset state */
>> +     qphy_clrbits(pcs + QPHY_SW_RESET, PHY_SW_RESET);
>> +     /* Make sure that above writes are completed */
>> +     mb();
>> +
>> +     ret = qcom_qmp_phy_is_ready(qphy, pcs +
>> +                                     cfg->regs[QPHY_PCS_READY_STATUS],
>> +                                     MASK_PHYSTATUS);
>> +     if (ret) {
>> +             dev_err(qphy->dev, "phy initialization timed-out\n");
>> +             goto err_pcs_ready;
>> +     }
>> +
>> +     return 0;
>> +
>> +err_pcs_ready:
>> +     if (phydesc->lane_rst)
>> +             reset_control_assert(phydesc->lane_rst);
>> +err_lane_rst:
>> +     qcom_qmp_phy_com_exit(qphy);
>> +err:
>> +     clk_disable_unprepare(qphy->cfg_ahb_clk);
>> +     clk_disable_unprepare(qphy->aux_clk);
>> +     return ret;
>> +}
>> +
>> +static int qcom_qmp_phy_exit(struct phy *phy)
>> +{
>> +     struct qmp_phy_desc *phydesc = phy_get_drvdata(phy);
>> +     struct qcom_qmp_phy *qphy = phydesc->qphy;
>> +     const struct qmp_phy_init_cfg *cfg = qphy->cfg;
>> +
>> +     /* PHY reset */
>> +     qphy_setbits(phydesc->pcs + QPHY_SW_RESET, PHY_SW_RESET);
>> +
>> +     /* stop SerDes and Phy-Coding-Sublayer */
>> +     qphy_clrbits(phydesc->pcs + QPHY_START_CTRL, cfg->mask_start_ctrl);
>> +
>> +     /* Put PHY into POWER DOWN state: active low */
>> +     qphy_clrbits(phydesc->pcs + QPHY_POWER_DOWN_CONTROL,
>> +                     cfg->mask_pwr_dn_ctrl);
>> +
>> +     /* Make sure that above writes are completed */
>> +     mb();
>> +
>> +     if (phydesc->lane_rst)
>> +             reset_control_assert(phydesc->lane_rst);
>> +
>> +     qcom_qmp_phy_com_exit(qphy);
>> +
>> +     clk_disable_unprepare(qphy->aux_clk);
>> +     clk_disable_unprepare(qphy->cfg_ahb_clk);
>> +
>> +     return 0;
>> +}
>> +
>> +
>> +static int qcom_qmp_phy_regulator_init(struct device *dev)
>> +{
>> +     struct qcom_qmp_phy *qphy = dev_get_drvdata(dev);
>> +     int ret;
>> +
>> +     qphy->vdda_phy = devm_regulator_get(dev, "vdda-phy");
>> +     if (IS_ERR(qphy->vdda_phy)) {
>> +             ret = PTR_ERR(qphy->vdda_phy);
>> +             if (ret != -EPROBE_DEFER)
>> +                     dev_err(dev, "failed to get vdda-phy, %d\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     qphy->vdda_pll = devm_regulator_get(dev, "vdda-pll");
>> +     if (IS_ERR(qphy->vdda_pll)) {
>> +             ret = PTR_ERR(qphy->vdda_pll);
>> +             if (ret != -EPROBE_DEFER)
>> +                     dev_err(dev, "failed to get vdda-pll, %d\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     /* optional regulator */
>> +     qphy->vddp_ref_clk = devm_regulator_get(dev, "vddp-ref-clk");
>> +     if (IS_ERR(qphy->vddp_ref_clk)) {
>> +             ret = PTR_ERR(qphy->vddp_ref_clk);
>> +             if (ret != -EPROBE_DEFER) {
>> +                     dev_dbg(dev, "failed to get vddp-ref-clk, %d\n", ret);
>> +                     qphy->vddp_ref_clk = NULL;
>> +             } else {
>> +                     return ret;
>> +             }
>> +     }
>
> Regulator framework should insert a dummy regulator if this is
> missing in DT. So we shouldn't need to do anything complicated
> here right?

Right, we don't need to set regulator to NULL. Will simplify this
error handling.

>
>> +
>> +     return 0;
>> +}
>> +
>> +static int qcom_qmp_phy_clk_init(struct device *dev)
>> +{
>> +     struct qcom_qmp_phy *qphy = dev_get_drvdata(dev);
>> +     int ret;
>> +
>> +     qphy->aux_clk = devm_clk_get(dev, "aux");
>> +     if (IS_ERR(qphy->aux_clk)) {
>> +             ret = PTR_ERR(qphy->aux_clk);
>> +             if (ret != -EPROBE_DEFER)
>> +                     dev_err(dev, "failed to get aux_clk\n");
>> +             return ret;
>> +     }
>> +
>> +     qphy->cfg_ahb_clk = devm_clk_get(dev, "cfg_ahb");
>> +     if (IS_ERR(qphy->cfg_ahb_clk)) {
>> +             ret = PTR_ERR(qphy->cfg_ahb_clk);
>> +             if (ret != -EPROBE_DEFER)
>> +                     dev_err(dev, "failed to get cfg_ahb_clk\n");
>> +             return ret;
>> +     }
>> +
>> +     qphy->ref_clk_src = devm_clk_get(dev, "ref_clk_src");
>> +     if (IS_ERR(qphy->ref_clk_src)) {
>> +             ret = PTR_ERR(qphy->ref_clk_src);
>> +             if (ret != -EPROBE_DEFER)
>> +                     dev_err(dev, "failed to get ref_clk_src\n");
>> +             return ret;
>> +     }
>> +
>> +     qphy->ref_clk = devm_clk_get(dev, "ref_clk");
>> +     if (IS_ERR(qphy->ref_clk)) {
>> +             ret = PTR_ERR(qphy->ref_clk);
>> +             if (ret != -EPROBE_DEFER)
>> +                     dev_err(dev, "failed to get ref_clk\n");
>> +             return ret;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static struct phy *qcom_qmp_phy_xlate(struct device *dev,
>> +                                     struct of_phandle_args *args)
>> +{
>> +     struct qcom_qmp_phy *qphy = dev_get_drvdata(dev);
>> +     int i;
>> +
>> +     if (WARN_ON(args->args[0] >= qphy->cfg->nlanes))
>> +             return ERR_PTR(-ENODEV);
>> +
>> +     for (i = 0; i < qphy->cfg->nlanes; i++) {
>> +             if (qphy->phys[i]->index == args->args[0])
>> +                     break;
>> +     }
>
> Drop the braces please.

sure.

>
>> +
>> +     if (i == qphy->cfg->nlanes)
>> +             return ERR_PTR(-ENODEV);
>> +
>> +     return qphy->phys[i]->phy;
>
> Could be simplified:
>
>
>         for (i = 0; i < qphy->cfg->nlanes; i++)
>                 if (qphy->phys[i]->index == args->args[0])
>                         return qphy->phys[i]->phy;
>
>         return ERR_PTR(-ENODEV);
>
>
> Also, isn't i == phys[i]->index so this could be a direct lookup?

Thanks. Will modify this as suggested, and will use
if (i == args->args[0]) as the condition.

>
>> +}
>> +
>> +static const struct phy_ops qcom_qmp_phy_gen_ops = {
>> +     .init           = qcom_qmp_phy_init,
>> +     .exit           = qcom_qmp_phy_exit,
>> +     .power_on       = qcom_qmp_phy_poweron,
>> +     .power_off      = qcom_qmp_phy_poweroff,
>> +     .owner          = THIS_MODULE,
>> +};
>> +
>> +static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
>> +     {
>> +             .compatible = "qcom,msm8996-qmp-pcie-phy",
>> +             .data = &msm8996_pciephy_init_cfg,
>> +     }, {
>> +             .compatible = "qcom,msm8996-qmp-usb3-phy",
>> +             .data = &msm8996_usb3phy_init_cfg,
>> +     },
>> +     { },
>> +};
>> +MODULE_DEVICE_TABLE(of, qcom_qmp_phy_of_match_table);
>> +
>> +static int qcom_qmp_phy_probe(struct platform_device *pdev)
>> +{
>> +     struct qcom_qmp_phy *qphy;
>> +     struct device *dev = &pdev->dev;
>> +     struct phy_provider *phy_provider;
>> +     struct resource *res;
>> +     const struct of_device_id *match;
>> +     void __iomem *base;
>> +     int ret = 0;
>
> Shouldn't need a default assignment here.
will remove the assignment.

>
>> +     int id;
>> +
>> +     qphy = devm_kzalloc(dev, sizeof(*qphy), GFP_KERNEL);
>> +     if (!qphy)
>> +             return -ENOMEM;
>> +
>> +     qphy->dev = dev;
>> +     dev_set_drvdata(dev, qphy);
>> +
>> +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +     base = devm_ioremap_resource(dev, res);
>> +     if (IS_ERR(base))
>> +             return PTR_ERR(base);
>> +
>> +     /* per PHY serdes; usually located at base address */
>> +     qphy->serdes = base;
>> +
>> +     mutex_init(&qphy->phy_mutex);
>> +
>> +     /* Get the specific init parameters of QMP phy */
>> +     match = of_match_node(qcom_qmp_phy_of_match_table, dev->of_node);
>> +     qphy->cfg = match->data;
>> +
>> +     ret = qcom_qmp_phy_clk_init(dev);
>> +     if (ret) {
>> +             dev_err(dev, "clock init failed\n");
>> +             return ret;
>> +     }
>> +
>> +     ret = qcom_qmp_phy_regulator_init(dev);
>> +     if (ret) {
>> +             dev_err(dev, "regulator init failed\n");
>> +             return ret;
>> +     }
>> +
>> +     qphy->phy_rst = devm_reset_control_get(dev, "phy");
>> +     if (IS_ERR(qphy->phy_rst)) {
>> +             dev_err(dev, "failed to get phy core reset\n");
>> +             return PTR_ERR(qphy->phy_rst);
>> +     }
>> +
>> +     qphy->phycom_rst = devm_reset_control_get(dev, "common");
>> +     if (IS_ERR(qphy->phycom_rst)) {
>> +             dev_err(dev, "failed to get phy common reset\n");
>> +             return PTR_ERR(qphy->phycom_rst);
>> +     }
>> +
>> +     qphy->phycfg_rst = devm_reset_control_get(dev, "cfg");
>> +     if (IS_ERR(qphy->phycfg_rst)) {
>> +             dev_dbg(dev, "failed to get phy ahb cfg reset\n");
>> +             qphy->phycfg_rst = NULL;
>> +     }
>> +
>> +     qphy->phys = devm_kcalloc(dev, qphy->cfg->nlanes,
>> +                                     sizeof(*qphy->phys), GFP_KERNEL);
>> +     if (!qphy->phys)
>> +             return -ENOMEM;
>> +
>> +     for (id = 0; id < qphy->cfg->nlanes; id++) {
>> +             struct phy *generic_phy;
>> +             struct qmp_phy_desc *phy_desc;
>> +             char prop_name[MAX_PROP_NAME];
>> +             unsigned int lane_offsets[3];
>> +
>> +             /* mem resources from index 1 to N for N number of lanes */
>> +             res = platform_get_resource(pdev, IORESOURCE_MEM, id + 1);
>> +             base = devm_ioremap_resource(dev, res);
>> +             if (IS_ERR(base))
>> +                     return PTR_ERR(base);
>> +
>> +             phy_desc = devm_kzalloc(dev, sizeof(*phy_desc), GFP_KERNEL);
>> +             if (!phy_desc)
>> +                     return -ENOMEM;
>> +
>> +             /*
>> +              * read offsets to Tx, Rx, and PCS blocks into a u32 array:
>> +              *  ------------------------------------
>> +              * | tx offset | rx offset | pcs offset |
>> +              *  ------------------------------------
>> +              */
>> +             ret = of_property_read_u32_array(dev->of_node, "lane-offsets",
>> +                                                        lane_offsets, 3);
>> +             if (ret) {
>> +                     dev_err(dev,
>> +                             "failed to get tx/rx/pcs offsets for lane%d\n",
>> +                             id);
>> +                             return ret;
>> +             }
>> +
>> +             phy_desc->tx = base + lane_offsets[0];
>> +             phy_desc->rx = base + lane_offsets[1];
>> +             phy_desc->pcs = base + lane_offsets[2];
>> +
>> +             /*
>> +              * Get PHY's Pipe clock, if any; USB3 and PCIe are PIPE3
>> +              * based phys, so they essentially have pipe clock. So,
>> +              * we return error in case phy is USB3 or PIPE type.
>> +              * Otherwise, we initialize pipe clock to NULL for
>> +              * all phys that don't need this.
>> +              */
>> +             memset(&prop_name, 0, sizeof(prop_name));
>> +             snprintf(prop_name, MAX_PROP_NAME, "pipe%d", id);
>> +             phy_desc->pipe_clk = devm_clk_get(dev, prop_name);
>> +             if (IS_ERR(phy_desc->pipe_clk)) {
>> +                     if (qphy->cfg->type == PHY_TYPE_PCIE ||
>> +                         qphy->cfg->type == PHY_TYPE_USB3) {
>> +                             ret = PTR_ERR(phy_desc->pipe_clk);
>> +                             if (ret != -EPROBE_DEFER)
>> +                                     dev_err(dev,
>> +                                     "failed to get lane%d pipe_clk\n", id);
>> +                             return ret;
>> +                     } else {
>> +                             phy_desc->pipe_clk = NULL;
>> +                     }
>
> Drop the else part.

sure.

>
>> +             }
>> +
>> +             /* Get lane reset, if any */
>> +             if (qphy->cfg->has_lane_rst) {
>> +                     memset(&prop_name, 0, sizeof(prop_name));
>> +                     snprintf(prop_name, MAX_PROP_NAME, "lane%d", id);
>> +                     phy_desc->lane_rst = devm_reset_control_get(dev,
>> +                                                                 prop_name);
>> +                     if (IS_ERR(phy_desc->lane_rst)) {
>> +                             dev_err(dev, "failed to get lane%d reset\n",
>> +                                     id);
>> +                             return PTR_ERR(phy_desc->lane_rst);
>> +                     }
>> +             }
>> +
>> +             generic_phy = devm_phy_create(dev, NULL, &qcom_qmp_phy_gen_ops);
>> +             if (IS_ERR(generic_phy)) {
>> +                     ret = PTR_ERR(generic_phy);
>> +                     dev_err(dev, "failed to create qphy %d\n", ret);
>> +                     return ret;
>> +             }
>> +
>> +             phy_desc->phy = generic_phy;
>> +             phy_desc->index = id;
>> +             phy_desc->qphy = qphy;
>> +             phy_set_drvdata(generic_phy, phy_desc);
>> +             qphy->phys[id] = phy_desc;
>
> Probably should make the above part of this loop a function that
> returns a phy for each lane (or an  error code on failure). This
> probe function is long.

Sure, will take this phy creation part to a separate function.


Best Regards
Vivek

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
