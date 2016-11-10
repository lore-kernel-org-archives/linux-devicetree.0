From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/2] phy: qcom-qmp: new qmp phy driver for qcom-chipsets
Date: Thu, 10 Nov 2016 14:33:32 +0530
Message-ID: <CAFp+6iGMp9pkt5NVTG9f-xjF5VOmj3Om5ngvMboyjdcR94Bhag@mail.gmail.com>
References: <1476873827-7191-1-git-send-email-vivek.gautam@codeaurora.org>
 <1476873827-7191-3-git-send-email-vivek.gautam@codeaurora.org> <ca4054a8-a813-0f50-3224-1e418eaa7095@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ca4054a8-a813-0f50-3224-1e418eaa7095-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: robh+dt <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kishon,


On Thu, Oct 27, 2016 at 1:41 AM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
> On Wednesday 19 October 2016 04:13 PM, Vivek Gautam wrote:
>> Qualcomm SOCs have QMP phy controller that provides support
>> to a number of controller, viz. PCIe, UFS, and USB.
>> Add a new driver, based on generic phy framework, for this
>> phy controller.
>>
>> USB3-phy changes: Based on phy-msm-ssusb-qmp driver available on
>> msm-4.4 kernel @codeaurora[1].
>> PCIe-phy changes: Based on msm8996-pcie-phy driver posted by
>> Srinivas [2].
>>
>> [1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/log/?h=caf/3.18/msm-3.18
>> [2] https://patchwork.kernel.org/patch/9318947/
>
> use only lkml links here.

Ok.

>>
>> Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
>> ---
>>  .../devicetree/bindings/phy/qcom-qmp-phy.txt       |   61 ++
>>  drivers/phy/Kconfig                                |    8 +
>>  drivers/phy/Makefile                               |    1 +
>>  drivers/phy/phy-qcom-qmp.c                         | 1154 ++++++++++++++++++++
>>  4 files changed, 1224 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>>  create mode 100644 drivers/phy/phy-qcom-qmp.c
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>> new file mode 100644
>> index 0000000..90214aa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>> @@ -0,0 +1,61 @@
>> +Qualcomm QMP PHY
>> +----------------
>> +
>> +QMP phy controller supports physical layer functionality for a number of
>> +controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
>> +
>> +Required properties:
>> + - compatible: compatible list, contains:
>> +            "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
>> +            "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996.
>> + - reg: offset and length of the PHY register set.
>> + - #phy-cells: must be 1
>> +    - Cell after phy phandle should be the port (lane) number.
>> + - clocks: a list of phandles and clock-specifier pairs,
>> +        one for each entry in clock-names.
>> + - clock-names: must be "cfg_ahb" for phy config clock,
>> +                     "aux" for phy aux clock,
>> +                     "ref_clk" for 19.2 MHz ref clk,
>> +                     "ref_clk_src" for reference clock source,
>> +                     "pipe<port-number>" for pipe clock specific to
>> +                     each port/lane (Optional).
>> + - resets: a list of phandles and reset controller specifier pairs,
>> +        one for each entry in reset-names.
>> + - reset-names: must be "phy" for reset of phy block,
>> +                     "common" for phy common block reset,
>> +                     "cfg" for phy's ahb cfg block reset (Optional).
>> +                     "port<port-number>" for reset specific to
>> +                     each port/lane. (Optional)
>> + - vdda-phy-supply: Phandle to a regulator supply to PHY core block.
>> + - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
>> +
>> +Optional properties:
>> + - vddp-ref-clk-supply: Phandle to a regulator supply to any specific refclk
>> +                     pll block.
>> +
>> +Example:
>> +     pcie_phy: pciephy@34000 {
>> +             compatible = "qcom,qmp-14nm-pcie-phy";
>> +             reg = <0x034000 0x3fff>;
>> +             #phy-cells = <1>;
>> +
>> +             clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
>> +                     <&gcc GCC_PCIE_PHY_CFG_AHB_CLK>,
>> +                     <&gcc GCC_PCIE_0_PIPE_CLK>,
>> +                     <&gcc GCC_PCIE_1_PIPE_CLK>,
>> +                     <&gcc GCC_PCIE_2_PIPE_CLK>;
>> +             clock-names = "aux", "cfg_ahb",
>> +                             "pipe0", "pipe1", "pipe2";
>> +
>> +             vdda-phy-supply = <&pm8994_l28>;
>> +             vdda-pll-supply = <&pm8994_l12>;
>> +
>> +             resets = <&gcc GCC_PCIE_PHY_BCR>,
>> +                     <&gcc GCC_PCIE_PHY_COM_BCR>,
>> +                     <&gcc GCC_PCIE_PHY_COM_NOCSR_BCR>,
>> +                     <&gcc GCC_PCIE_0_PHY_BCR>,
>> +                     <&gcc GCC_PCIE_1_PHY_BCR>,
>> +                     <&gcc GCC_PCIE_2_PHY_BCR>;
>> +             reset-names = "phy", "common", "cfg",
>> +                             "lane0", "lane1", "lane2";
>> +     };
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index 5547984..d5e2b50f 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -446,6 +446,14 @@ config PHY_STIH41X_USB
>>         Enable this to support the USB transceiver that is part of
>>         STMicroelectronics STiH41x SoC series.
>>
>> +config PHY_QCOM_QMP
>> +     tristate "Qualcomm QMP PHY Driver"
>> +     depends on OF && (ARCH_QCOM || COMPILE_TEST)
>> +     select GENERIC_PHY
>> +     help
>> +       Enable this to support the QMP PHY transceiver that is used
>> +       with controllers such as PCIe, UFS, and USB on Qualcomm chips.
>> +
>>  config PHY_QCOM_QUSB2
>>       tristate "Qualcomm QUSB2 PHY Driver"
>>       depends on OF && (ARCH_QCOM || COMPILE_TEST)
>> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
>> index 848489d..fde9fba 100644
>> --- a/drivers/phy/Makefile
>> +++ b/drivers/phy/Makefile
>> @@ -51,6 +51,7 @@ obj-$(CONFIG_PHY_ST_SPEAR1340_MIPHY)        += phy-spear1340-miphy.o
>>  obj-$(CONFIG_PHY_XGENE)                      += phy-xgene.o
>>  obj-$(CONFIG_PHY_STIH407_USB)                += phy-stih407-usb.o
>>  obj-$(CONFIG_PHY_STIH41X_USB)                += phy-stih41x-usb.o
>> +obj-$(CONFIG_PHY_QCOM_QMP)   += phy-qcom-qmp.o
>>  obj-$(CONFIG_PHY_QCOM_QUSB2)         += phy-qcom-qusb2.o
>>  obj-$(CONFIG_PHY_QCOM_UFS)   += phy-qcom-ufs.o
>>  obj-$(CONFIG_PHY_QCOM_UFS)   += phy-qcom-ufs-qmp-20nm.o
>> diff --git a/drivers/phy/phy-qcom-qmp.c b/drivers/phy/phy-qcom-qmp.c
>> new file mode 100644
>> index 0000000..7e89179
>> --- /dev/null
>> +++ b/drivers/phy/phy-qcom-qmp.c
>> @@ -0,0 +1,1154 @@
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

[snip]

>> +
>> +static struct qmp_phy_init_tbl usb3phy_serdes_init_tbl[] = {
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x14),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x06),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x01),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x00),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_BG_TRIM, 0x0f),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_PLL_IVCO, 0x0f),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x04),
>> +     /* PLL and Loop filter settings */
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x82),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x55),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x55),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x03),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x00),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x15),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x34),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x00),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_CFG, 0x00),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x00),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x0a),
>> +     /* SSC settings */
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_EN_CENTER, 0x01),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER1, 0x31),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER2, 0x01),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER1, 0x00),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER2, 0x00),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE1, 0xde),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE2, 0x07),
>> +};
>> +
>> +static struct qmp_phy_init_tbl usb3phy_tx_init_tbl[] = {
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_TX_RCV_DETECT_LVL_2, 0x12),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x06),
>> +};
>> +
>> +static struct qmp_phy_init_tbl usb3phy_rx_init_tbl[] = {
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN, 0x04),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x02),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4c),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0xbb),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x03),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x18),
>> +     QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x16),
>> +};
>> +
>> +static struct qmp_phy_init_tbl usb3phy_pcs_init_tbl[] = {
>> +     /* FLL settings */
>> +     QCOM_QMP_PHY_INIT_CFG_L(QPHY_FLL_CNTRL2, 0x03),
>> +     QCOM_QMP_PHY_INIT_CFG_L(QPHY_FLL_CNTRL1, 0x02),
>> +     QCOM_QMP_PHY_INIT_CFG_L(QPHY_FLL_CNT_VAL_L, 0x09),
>> +     QCOM_QMP_PHY_INIT_CFG_L(QPHY_FLL_CNT_VAL_H_TOL, 0x42),
>> +     QCOM_QMP_PHY_INIT_CFG_L(QPHY_FLL_MAN_CODE, 0x85),
>> +
>> +     /* Lock Det settings */
>> +     QCOM_QMP_PHY_INIT_CFG(QPHY_LOCK_DETECT_CONFIG1, 0xd1),
>> +     QCOM_QMP_PHY_INIT_CFG(QPHY_LOCK_DETECT_CONFIG2, 0x1f),
>> +     QCOM_QMP_PHY_INIT_CFG(QPHY_LOCK_DETECT_CONFIG3, 0x47),
>> +     QCOM_QMP_PHY_INIT_CFG(QPHY_POWER_STATE_CONFIG2, 0x08),
>> +};
>
> if you can implement the dt mechanism I mentioned in your other patch, all
> these tables can be got rid of and the code to initialize these can also be
> removed.

These are lot of configurations for PLL, TX, RX and PCS. I think it's
hard to take
out common bindings that can serve purpose of other PHYs as well.


[snip]

>> +unsigned int msm8996_pciephy_tx_offsets[] = { 0x1000, 0x2000, 0x3000 };
>
> you can have a separate reg map for each lane and all these can come from dt.

The idea is to avoid the any child nodes for lanes. So, we have the complete
ioremaped region and these offsets to tx, rx and pcs blocks.

>> +unsigned int msm8996_pciephy_rx_offsets[] = { 0x1200, 0x2200, 0x3200 };
>> +unsigned int msm8996_pciephy_pcs_offsets[] = { 0x1400, 0x2400, 0x3400 };

[snip]

>> +static int qcom_qmp_phy_poweron(struct phy *phy)
>> +{
>> +     struct qmp_phy_desc *phydesc = phy_get_drvdata(phy);
>> +     struct qcom_qmp_phy *qphy = phydesc->qphy;
>> +     int ret;
>> +
>> +     dev_info(&phy->dev, "Powering on QMP phy\n");
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
>> +     if (!qphy->clk_enabled) {
>
> lot of my comments on the previous PHY driver is applicable here. For example
> the clk_enabled is not required.

Sure, will remove this and take care of other things similar to
qusb2 phy driver.

>> +             clk_prepare_enable(qphy->ref_clk_src);
>> +             clk_prepare_enable(qphy->ref_clk);
>> +             clk_prepare_enable(phydesc->pipe_clk);
>> +             qphy->clk_enabled = true;
>> +     }

[snip]

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
>
> finding a PHY based on index is not required. Just have a different label for
> each sub-node and using this label in the controller node should be enough.

Like i said in my comment above, the idea is to avoid any kind of sub-nodes
(child nodes) of the PHY device node. So each lane is registered at
separate indices.


Regards
Vivek

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
