From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH 1/2] phy: qcom-qusb2: New driver for QUSB2 PHY on Qcom chips
Date: Wed, 2 Nov 2016 14:29:27 +0530
Message-ID: <CAFp+6iH_M-a=jP3Lip=Daj9bHTVfGXZwLZOz=UgOXsCo9-ZbHQ@mail.gmail.com>
References: <1476873827-7191-1-git-send-email-vivek.gautam@codeaurora.org>
 <1476873827-7191-2-git-send-email-vivek.gautam@codeaurora.org> <12a93817-0d3c-b35c-2e02-91f8ed2ee2a6@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <12a93817-0d3c-b35c-2e02-91f8ed2ee2a6@ti.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: robh+dt <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Kishon,


On Thu, Oct 27, 2016 at 1:26 AM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
> Hi,

I am currently on vacation, so the responses are delayed a bit.
Please bear with me.

>
> On Wednesday 19 October 2016 04:13 PM, Vivek Gautam wrote:
>> PHY transceiver driver for QUSB2 phy controller that provides
>> HighSpeed functionality for DWC3 controller present on
>> Qualcomm chipsets.
>>
>> This driver is based on phy-msm-qusb driver available in
>> msm-4.4 kernel @codeaurora[1]
>>
>> [1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/log/?h=caf/3.18/msm-3.18
>
> I'd prefer only LKML links in commit msg. This can be part of the comment
> section below ---.

Sure, will use LKML links only.

>>
>> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>> Cc: Kishon Vijay Abraham I <kishon@ti.com>
>> ---
>>  .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  37 ++
>>  drivers/phy/Kconfig                                |  10 +
>>  drivers/phy/Makefile                               |   1 +
>>  drivers/phy/phy-qcom-qusb2.c                       | 577 +++++++++++++++++++++
>>  4 files changed, 625 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
>>  create mode 100644 drivers/phy/phy-qcom-qusb2.c

[snip]

>> +struct qusb2_phy_init_tbl {
>> +     unsigned int reg_offset;
>> +     unsigned int cfg_val;
>> +};
>> +#define QCOM_QUSB2_PHY_INIT_CFG(reg, val) \
>> +     {                               \
>> +             .reg_offset = reg,      \
>> +             .cfg_val = val,         \
>> +     }
>> +
>> +static struct qusb2_phy_init_tbl msm8996_phy_init_tbl[] = {
>> +     QCOM_QUSB2_PHY_INIT_CFG(QUSB2PHY_PORT_TUNE1, 0xF8),
>> +     QCOM_QUSB2_PHY_INIT_CFG(QUSB2PHY_PORT_TUNE2, 0xB3),
>> +     QCOM_QUSB2_PHY_INIT_CFG(QUSB2PHY_PORT_TUNE3, 0x83),
>> +     QCOM_QUSB2_PHY_INIT_CFG(QUSB2PHY_PORT_TUNE4, 0xC0),
>> +     QCOM_QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_TUNE, 0x30),
>> +     QCOM_QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL1, 0x79),
>> +     QCOM_QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_USER_CTL2, 0x21),
>> +     QCOM_QUSB2_PHY_INIT_CFG(QUSB2PHY_PORT_TEST2, 0x14),
>> +     QCOM_QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_AUTOPGM_CTL1, 0x9F),
>> +     QCOM_QUSB2_PHY_INIT_CFG(QUSB2PHY_PLL_PWR_CTRL, 0x00),
>> +};
> we should generalize this so that it could be used for any phys. All these
> tuning parameters can come from dt.
>
> phy,tx-swing = <reg_offset> <swing value>;
> phy,rx-swing = <reg_offset> <swing value>;
> phy,tx-compensation = <reg_offset> <swing value>;
> phy,rx-compensation = <reg_offset> <swing value>;
> ..
>
> We have to identify all the calibration parameters and add a dt property for
> each parameter. The phy-core can just use these properties to calibrate or tune
> the PHY.

Yes, that will make life easier.

Things look simpler with this qusb2 phy driver.
But, same is not the case with the qmp-phy driver
that supports few other phys on msm chipsets.
That qmp phy driver has a list of ~100 odd registers that
need to be programmed during initialization.
We, then, don't need to touch those settings any time later.
The settings include, the common PLL settings, tx, rx and the
pcs settings.

I will take a look at these drivers once again, and see if we can group
the settings and make few generic bindings that can be utilized
but the phy drivers in general.

>
>> +
>> +struct qusb2_phy_init_cfg {
>> +     struct qusb2_phy_init_tbl *phy_init_tbl;
>> +     int phy_init_tbl_sz;
>> +};
>> +
>> +const struct qusb2_phy_init_cfg msm8996_phy_init_cfg = {
>> +     .phy_init_tbl = msm8996_phy_init_tbl,
>> +     .phy_init_tbl_sz = ARRAY_SIZE(msm8996_phy_init_tbl),
>> +};
>> +
>> +/**
>> + * struct qusb2_phy: Structure holding qusb2 phy attributes.
>> + *
>> + * @phy: pointer to generic phy.
>> + * @base: pointer to iomapped memory space for qubs2 phy.
>> + *
>> + * @cfg_ahb_clk: pointer to AHB2PHY interface clock.
>> + * @ref_clk: pointer to reference clock.
>> + * @ref_clk_src: pointer to source to reference clock.
>> + * @iface_src: pointer to phy interface clock.
>> + * @clk_enabled: check if clocks are enabled.
>
> Why is this needed? IMO this should not be used. clk framework can handle this
> better since it maintains a reference count for clk_enable/clk_disable.

Ok, will remove this.

>> + *
>> + * @phy_reset: Pointer to phy reset control
>> + *
>> + * @vdda_phy: vdd supply to the phy core block.
>> + * @vdda_pll: 1.8V vdd supply to ref_clk block.
>> + * @vdda_phy_dpdm: 3.1V vdd supply to Dp/Dm port signals.
>> + * @pwr_enabled: check if the regulators are enabled.
>
> same here.

will remove this as well.

>> + * @tcsr: pointer to TCSR syscon register map.
>> + * @clk_scheme_offset: offset to PHY_CLK_SCHEME register in TCSR map.
>> + * @cfg: phy initialization config data
>> + */
>> +struct qusb2_phy {
>> +     struct phy *phy;
>> +     void __iomem *base;
>> +
>> +     struct clk *cfg_ahb_clk;
>> +     struct clk *ref_clk;
>> +     struct clk *ref_clk_src;
>> +     struct clk *iface_clk;
>> +     bool clk_enabled;
>> +
>> +     struct reset_control *phy_reset;
>> +
>> +     struct regulator *vdd_phy;
>> +     struct regulator *vdda_pll;
>> +     struct regulator *vdda_phy_dpdm;
>> +     bool pwr_enabled;
>> +
>> +     struct regmap *tcsr;
>> +     unsigned int clk_scheme_offset;
>> +
>> +     const struct qusb2_phy_init_cfg *cfg;
>> +};
>> +
>> +static inline void qusb2_set_bits(void __iomem *reg, u32 mask)
>
> mask is misleading. just use val.

Ok, will modify this.

>> +{
>> +     u32 val;
>> +
>> +     val = readl_relaxed(reg);
>> +     val |= mask;
>> +     writel_relaxed(val, reg);
>> +
>> +     /* Ensure above write is completed */
>> +     mb();
>> +}
>> +
>> +static inline void qusb2_clr_bits(void __iomem *reg, u32 mask)
>> +{
>> +     u32 val;
>> +
>> +     val = readl_relaxed(reg);
>> +     val &= ~mask;
>> +     writel_relaxed(val, reg);
>> +
>> +     /* Ensure above write is completed */
>> +     mb();
>> +}
>> +
>> +static void qcom_qusb2_phy_configure(void __iomem *base,
>> +                             struct qusb2_phy_init_tbl init_tbl[],
>> +                             int init_tbl_sz)
>> +{
>> +     int i;
>> +
>> +     for (i = 0; i < init_tbl_sz; i++) {
>> +             writel_relaxed(init_tbl[i].cfg_val,
>> +                             base + init_tbl[i].reg_offset);
>> +     }
>> +
>> +     /* flush buffered writes */
>> +     mb();
>> +}
>> +
>> +static void qusb2_phy_enable_clocks(struct qusb2_phy *qphy, bool on)
>> +{
>> +     dev_dbg(&qphy->phy->dev, "%s(): clocks_enabled:%d on:%d\n",
>> +                     __func__, qphy->clk_enabled, on);
>
> unnecessary debug print IMO, given that there is another debug print before the
> function returns.

Will remove this.

>> +
>> +     if (!qphy->clk_enabled && on) {
>> +             clk_prepare_enable(qphy->cfg_ahb_clk);
>> +             if (qphy->iface_clk)
>> +                     clk_prepare_enable(qphy->iface_clk);
>> +             clk_prepare_enable(qphy->ref_clk_src);
>> +             qphy->clk_enabled = true;
>> +     }
>> +
>> +     if (qphy->clk_enabled && !on) {
>> +             clk_disable_unprepare(qphy->ref_clk_src);
>> +             if (qphy->iface_clk)
>> +                     clk_disable_unprepare(qphy->iface_clk);
>> +             clk_disable_unprepare(qphy->cfg_ahb_clk);
>> +             qphy->clk_enabled = false;
>> +     }
>> +
>> +     dev_dbg(&qphy->phy->dev, "%s(): clocks_enabled:%d\n", __func__,
>> +                                             qphy->clk_enabled);
>
> even this should be dev_vdbg.

Ok, will use dev_vdbg.

>> +}
>> +
>> +static int qusb2_phy_enable_power(struct qusb2_phy *qphy, bool on)
>> +{
>> +     int ret = 0;
>> +     struct device *dev = &qphy->phy->dev;
>> +
>> +     dev_dbg(dev, "%s(): turn %s regulators. power_enabled:%d\n",
>> +                     __func__, on ? "on" : "off", qphy->pwr_enabled);
>> +
>> +     if (qphy->pwr_enabled == on)
>> +             return 0;
>> +
>> +     if (!on)
>> +             goto disable_vdda_phy_dpdm;
>> +
>> +     ret = regulator_enable(qphy->vdd_phy);
>> +     if (ret) {
>> +             dev_err(dev, "Unable to enable vdd-phy:%d\n", ret);
>> +             goto err_vdd_phy;
>> +     }
>> +
>> +     ret = regulator_enable(qphy->vdda_pll);
>> +     if (ret) {
>> +             dev_err(dev, "Unable to enable vdda-pll:%d\n", ret);
>> +             goto disable_vdd_phy;
>> +     }
>> +
>> +     ret = regulator_enable(qphy->vdda_phy_dpdm);
>> +     if (ret) {
>> +             dev_err(dev, "Unable to enable vdda-phy-dpdm:%d\n", ret);
>> +             goto disable_vdda_pll;
>> +     }
>> +
>> +     qphy->pwr_enabled = true;
>> +     dev_dbg(dev, "%s() regulators are turned on.\n", __func__);
>> +
>> +     return ret;
>> +
>> +disable_vdda_phy_dpdm:
>> +     regulator_disable(qphy->vdda_phy_dpdm);
>> +disable_vdda_pll:
>> +     regulator_disable(qphy->vdda_pll);
>> +disable_vdd_phy:
>> +     regulator_disable(qphy->vdd_phy);
>> +err_vdd_phy:
>> +     qphy->pwr_enabled = false;
>> +     dev_dbg(dev, "%s() regulators are turned off.\n", __func__);
>> +     return ret;
>> +}
>> +
>> +/*
>> + * Fetches HS Tx tuning value from e-fuse and sets QUSB2PHY_PORT_TUNE2
>> + * register.
>> + * For any error case, skip setting the value and use the default value.
>> + */
>> +static int qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
>> +{
>> +     struct device *dev = &qphy->phy->dev;
>> +     struct nvmem_cell *cell;
>> +     unsigned int bit_mask;
>> +     u32 tune2_val;
>> +     int bit_offset = 0;
>> +     int bit_len = 0;
>> +     ssize_t len;
>> +     u32 *val;
>> +     int ret;
>> +
>> +     /*
>> +      * Read EFUSE register having TUNE2 parameter's high nibble.
>> +      * If efuse register shows value as 0x0, or if we fail to find
>> +      * a valid efuse register settings, then use default value
>> +      * as 0xB for high nibble that we have already set while
>> +      * configuring phy.
>> +      */
>> +     cell = devm_nvmem_cell_get(dev, "tune2_hstx_trim_efuse");
>> +     if (IS_ERR(cell)) {
>> +             if (PTR_ERR(cell) == -EPROBE_DEFER)
>> +                     return PTR_ERR(cell);
>> +             goto skip;
>> +     }
>> +
>> +     val = (u32 *)nvmem_cell_read(cell, &len);
>> +     if (!IS_ERR(val)) {
>> +             ret = of_property_read_u32(dev->of_node,
>> +                                             "qcom,hstx-trim-bit-offset",
>> +                                             &bit_offset);
>> +             if (ret) {
>> +                     dev_dbg(dev, "hstx-trim bit offset is invalid.\n");
>> +                     goto skip;
>> +             }
>> +
>> +             ret = of_property_read_u32(dev->of_node,
>> +                                             "qcom,hstx-trim-bit-len",
>> +                                             &bit_len);
>> +             if (ret) {
>> +                     dev_dbg(dev, "hstx-trim bit length is invalid.\n");
>> +                     goto skip;
>> +             }
>> +
>> +             bit_mask = (1 << bit_len) - 1;
>> +             dev_dbg(dev,
>> +                     "%s(): efuse value:%x, bit_mask:%x, bit_offset: %d\n",
>> +                     __func__, val[0], bit_mask, bit_offset);
>> +             tune2_val = TUNE2_HIGH_NIBBLE_VAL(val[0], bit_offset, bit_mask);
>> +             if (!tune2_val) {
>> +                     dev_dbg(dev, "hstx-trim bit length is invalid.\n");
>> +                     goto skip;
>> +             }
>> +
>> +             /* Fused TUNE2 value is the higher nibble only */
>> +             tune2_val = tune2_val << 0x4;
>> +             qusb2_set_bits(qphy->base + QUSB2PHY_PORT_TUNE2, tune2_val);
>> +     } else {
>> +             dev_dbg(dev, "failed reading hs-tx trim value: %d\n", ret);
>> +     }
>> +
>> +skip:
>> +     return 0;
>> +}
>> +
>> +static int qusb2_phy_init(struct phy *phy)
>> +{
>> +     struct qusb2_phy *qphy = phy_get_drvdata(phy);
>> +     unsigned int reset_val;
>> +     unsigned int clk_scheme;
>> +     bool is_se_clk = false;
>> +     int ret;
>> +
>> +     dev_info(&phy->dev, "Initializing QUSB2 phy\n");
>
> dev_vdbg here..

okay.

>> +
>> +     ret = qusb2_phy_enable_power(qphy, true);
>> +     if (ret)
>> +             return ret;
>
> shouldn't this be done in power_on?

Okay, will add power_on/off() callbacks and move this code there.

>> +
>> +     qusb2_phy_enable_clocks(qphy, true);
>> +
>> +     /* Perform phy reset */
>> +     ret = reset_control_assert(qphy->phy_reset);
>> +     if (ret) {
>> +             dev_err(&phy->dev, "Failed to assert phy_reset\n");
>> +             return ret;
>> +     }
>> +     usleep_range(100, 150);
>
> add a comment for the above delay.

sure.

>> +     ret = reset_control_deassert(qphy->phy_reset);
>> +     if (ret) {
>> +             dev_err(&phy->dev, "Failed to de-assert phy_reset\n");
>> +             return ret;
>> +     }
>> +
>> +     /* Disable the PHY */
>> +     qusb2_set_bits(qphy->base + QUSB2PHY_PORT_POWERDOWN,
>> +                     CLAMP_N_EN | FREEZIO_N | POWER_DOWN);
>> +
>> +     /* save reset value to override based on clk scheme */
>> +     reset_val = readl_relaxed(qphy->base + QUSB2PHY_PLL_TEST);
>> +
>> +     qcom_qusb2_phy_configure(qphy->base, qphy->cfg->phy_init_tbl,
>> +                             qphy->cfg->phy_init_tbl_sz);
>> +
>> +     /* Check for efuse value for tuning the PHY */
>> +     ret = qusb2_phy_set_tune2_param(qphy);
>> +     if (ret)
>> +             return ret;
>> +
>> +     /* Enable the PHY */
>> +     qusb2_clr_bits(qphy->base + QUSB2PHY_PORT_POWERDOWN, POWER_DOWN);
>> +
>> +     /* Require to get phy pll lock successfully */
>> +     usleep_range(150, 160);
>> +
>> +     /*
>> +      * Use differential clk by default; later we read TCSR_PHY_CLK_SCHEME
>> +      * register to check if Single-ended clock scheme is selected. If yes,
>> +      * then disable differential ref_clk and use single-ended clock.
>> +      */
>> +
>> +     if (qphy->tcsr) {
>> +             ret = regmap_read(qphy->tcsr, qphy->clk_scheme_offset,
>> +                                                     &clk_scheme);
>> +             /* is SE-clk available ? */
>> +             if (clk_scheme & PHY_CLK_SCHEME_SEL) {
>> +                     dev_dbg(&phy->dev, "%s: select single-ended clk src\n",
>> +                                                             __func__);
>> +                     is_se_clk = true;
>> +             }
>> +     }
>> +
>> +     if (is_se_clk) {
>> +             reset_val |= CLK_REF_SEL;
>> +             clk_disable_unprepare(qphy->ref_clk);
>> +     } else {
>> +             reset_val &= ~CLK_REF_SEL;
>> +             clk_prepare_enable(qphy->ref_clk);
>> +     }
>> +
>> +     writel_relaxed(reset_val, qphy->base + QUSB2PHY_PLL_TEST);
>> +
>> +     /* Make sure that above write is completed to get PLL source clock */
>> +     wmb();
>> +
>> +     /* Required to get PHY PLL lock successfully */
>> +     usleep_range(100, 110);
>> +
>> +     if (!(readb_relaxed(qphy->base + QUSB2PHY_PLL_STATUS) &
>> +                                     PLL_LOCKED)) {
>> +             dev_err(&phy->dev, "QUSB PHY PLL LOCK fails:%x\n",
>> +                     readb_relaxed(qphy->base + QUSB2PHY_PLL_STATUS));
>> +             return -EBUSY;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int qusb2_phy_exit(struct phy *phy)
>> +{
>> +     struct qusb2_phy *qphy = phy_get_drvdata(phy);
>> +
>> +     /* Disable the PHY */
>> +     qusb2_set_bits(qphy->base + QUSB2PHY_PORT_POWERDOWN,
>> +                     CLAMP_N_EN | FREEZIO_N | POWER_DOWN);
>> +
>> +     qusb2_phy_enable_clocks(qphy, false);
>> +     qusb2_phy_enable_power(qphy, false);
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct phy_ops qusb2_phy_gen_ops = {
>> +     .init           = qusb2_phy_init,
>> +     .exit           = qusb2_phy_exit,
>
> you can add callbacks for power_on and power_off and add then enable clocks and
> power here?

Yes, will do that.

>
>> +     .owner          = THIS_MODULE,
>> +};
>> +
>> +static const struct of_device_id qusb2_phy_of_match_table[] = {
>> +     {
>> +             .compatible     = "qcom,msm8996-qusb2-phy",
>> +             .data           = &msm8996_phy_init_cfg,
>> +     },
>> +     { },
>> +};
>> +MODULE_DEVICE_TABLE(of, qusb2_phy_of_match_table);
>> +
>> +static int qusb2_phy_probe(struct platform_device *pdev)
>> +{
>> +     struct device *dev = &pdev->dev;
>> +     struct qusb2_phy *qphy;
>> +     struct phy_provider *phy_provider;
>> +     struct phy *generic_phy;
>> +     const struct of_device_id *match;
>> +     struct resource *res;
>> +     int ret = 0;
>> +
>> +     qphy = devm_kzalloc(dev, sizeof(*qphy), GFP_KERNEL);
>> +     if (!qphy)
>> +             return -ENOMEM;
>> +
>> +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +     if (!res)
>> +             return -ENODEV;
>
> the above check is not required. ioremap will take care.

okay, will remove this.

>> +     qphy->base = devm_ioremap_resource(dev, res);
>> +     if (IS_ERR(qphy->base))
>> +             return PTR_ERR(qphy->base);
>> +
>> +     qphy->cfg_ahb_clk = devm_clk_get(dev, "cfg_ahb_clk");
>> +     if (IS_ERR(qphy->cfg_ahb_clk)) {
>> +             ret = PTR_ERR(qphy->cfg_ahb_clk);
>> +             if (ret != -EPROBE_DEFER)
>> +                     dev_err(dev, "failed to get cfg_ahb_clk\n");
>> +             return ret;
>> +     }
>> +
>> +     qphy->ref_clk_src = devm_clk_get(dev, "ref_clk_src");
>> +     if (IS_ERR(qphy->ref_clk_src)) {
>> +             qphy->ref_clk_src = NULL;
>> +             ret = PTR_ERR(qphy->ref_clk_src);
>> +             if (ret != -EPROBE_DEFER)
>> +                     dev_dbg(dev, "clk get failed for ref_clk_src\n");
>
> don't we have to return on PROBE_DEFER?

yes, we do need to return here.

>> +     }
>> +
>> +     qphy->ref_clk = devm_clk_get(dev, "ref_clk");
>> +     if (IS_ERR(qphy->ref_clk)) {
>> +             qphy->ref_clk = NULL;
>> +             ret = PTR_ERR(qphy->ref_clk);
>> +             if (ret != -EPROBE_DEFER)
>> +                     dev_dbg(dev, "clk get failed for ref_clk\n");
>
> same here.

right, will return on EPROBE_DEFER.

>> +     } else {
>> +             clk_set_rate(qphy->ref_clk, 19200000);
>> +     }
>> +
>> +     qphy->iface_clk = devm_clk_get(dev, "iface_clk");
>> +     if (IS_ERR(qphy->iface_clk)) {
>> +             qphy->iface_clk = NULL;
>> +             ret = PTR_ERR(qphy->iface_clk);
>> +             if (ret != -EPROBE_DEFER)
>> +                     dev_dbg(dev, "clk get failed for iface_clk\n");
>
> here..

yup.

>> +     }
>> +
>> +     qphy->phy_reset = devm_reset_control_get(&pdev->dev, "phy");
>> +     if (IS_ERR(qphy->phy_reset)) {
>> +             dev_err(dev, "failed to get phy core reset\n");
>> +             return PTR_ERR(qphy->phy_reset);
>> +     }
>> +
>> +     qphy->vdd_phy = devm_regulator_get(dev, "vdd-phy");
>> +     if (IS_ERR(qphy->vdd_phy)) {
>> +             dev_err(dev, "unable to get vdd-phy supply\n");
>> +             return PTR_ERR(qphy->vdd_phy);
>> +     }
>> +
>> +     qphy->vdda_pll = devm_regulator_get(dev, "vdda-pll");
>> +     if (IS_ERR(qphy->vdda_pll)) {
>> +             dev_err(dev, "unable to get vdda-pll supply\n");
>> +             return PTR_ERR(qphy->vdda_pll);
>> +     }
>> +
>> +     qphy->vdda_phy_dpdm = devm_regulator_get(dev, "vdda-phy-dpdm");
>> +     if (IS_ERR(qphy->vdda_phy_dpdm)) {
>> +             dev_err(dev, "unable to get vdda-phy-dpdm supply\n");
>> +             return PTR_ERR(qphy->vdda_phy_dpdm);
>> +     }
>> +
>> +     /* Get the specific init parameters of QMP phy */
>> +     match = of_match_node(qusb2_phy_of_match_table, dev->of_node);
>> +     qphy->cfg = match->data;
>> +
>> +     qphy->tcsr = syscon_regmap_lookup_by_phandle(dev->of_node,
>> +                                                     "qcom,tcsr-syscon");
>> +     if (!IS_ERR(qphy->tcsr)) {
>> +             ret = of_property_read_u32(dev->of_node, "qcom,phy-clk-scheme",
>> +                                             &qphy->clk_scheme_offset);
>> +             if (ret) {
>> +                     dev_err(dev, "phy-clk-scheme reg offset is invalid\n");
>> +                     qphy->tcsr = NULL;
>> +                     return ret;
>> +             }
>> +     } else {
>> +             dev_dbg(dev, "Failed to lookup TCSR regmap\n");
>> +             qphy->tcsr = NULL;
>> +     }
>> +
>> +     phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>> +     if (IS_ERR(phy_provider)) {
>> +             ret = PTR_ERR(phy_provider);
>> +             dev_err(dev, "%s: failed to register phy %d\n", __func__, ret);
>> +             return ret;
>> +     }
>> +
>> +     generic_phy = devm_phy_create(dev, NULL, &qusb2_phy_gen_ops);
>> +     if (IS_ERR(generic_phy)) {
>> +             ret = PTR_ERR(generic_phy);
>> +             dev_err(dev, "%s: failed to create phy %d\n", __func__, ret);
>> +             generic_phy = NULL;
>> +             return ret;
>> +     }
>
> phy should be created before registering the PHY.
>> +     qphy->phy = generic_phy;
>> +
>> +     dev_set_drvdata(dev, qphy);
>> +     phy_set_drvdata(generic_phy, qphy);
>
> this should be done before phy_provider_register.

will move the code as suggested.


Thanks
Vivek

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
