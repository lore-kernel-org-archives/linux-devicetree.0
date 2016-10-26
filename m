From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] phy: qcom-qmp: new qmp phy driver for qcom-chipsets
Date: Wed, 26 Oct 2016 14:57:06 +0100
Message-ID: <a969a6be-472d-a463-790b-1e2f373d19b2@linaro.org>
References: <1476873827-7191-1-git-send-email-vivek.gautam@codeaurora.org>
 <1476873827-7191-3-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476873827-7191-3-git-send-email-vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Vivek,

Thanks for consolidating qmp phy support for both usb and pcie.

On 19/10/16 11:43, Vivek Gautam wrote:
> Qualcomm SOCs have QMP phy controller that provides support
> to a number of controller, viz. PCIe, UFS, and USB.
> Add a new driver, based on generic phy framework, for this
> phy controller.
>
> USB3-phy changes: Based on phy-msm-ssusb-qmp driver available on
> msm-4.4 kernel @codeaurora[1].
> PCIe-phy changes: Based on msm8996-pcie-phy driver posted by
> Srinivas [2].
>
> [1] https://source.codeaurora.org/quic/la/kernel/msm-4.4/log/?h=caf/3.18/msm-3.18
> [2] https://patchwork.kernel.org/patch/9318947/
>
> Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>

very few minor nits which needs fixing in next version.

I have tested this patch on DB820c PCIE with ethernet and SATA ports.

Tested-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> ---
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt       |   61 ++
>  drivers/phy/Kconfig                                |    8 +
>  drivers/phy/Makefile                               |    1 +
>  drivers/phy/phy-qcom-qmp.c                         | 1154 ++++++++++++++++++++
>  4 files changed, 1224 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>  create mode 100644 drivers/phy/phy-qcom-qmp.c
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> new file mode 100644
> index 0000000..90214aa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> @@ -0,0 +1,61 @@
> +Qualcomm QMP PHY
> +----------------
> +
> +QMP phy controller supports physical layer functionality for a number of
> +controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
> +
> +Required properties:
> + - compatible: compatible list, contains:
> +	       "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
> +	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996.
> + - reg: offset and length of the PHY register set.
> + - #phy-cells: must be 1
> +    - Cell after phy phandle should be the port (lane) number.
> + - clocks: a list of phandles and clock-specifier pairs,
> +	   one for each entry in clock-names.
> + - clock-names: must be "cfg_ahb" for phy config clock,
> +			"aux" for phy aux clock,
> +			"ref_clk" for 19.2 MHz ref clk,
> +			"ref_clk_src" for reference clock source,
> +			"pipe<port-number>" for pipe clock specific to
> +			each port/lane (Optional).

> + - resets: a list of phandles and reset controller specifier pairs,
> +	   one for each entry in reset-names.
> + - reset-names: must be "phy" for reset of phy block,
> +			"common" for phy common block reset,
> +			"cfg" for phy's ahb cfg block reset (Optional).
> +			"port<port-number>" for reset specific to
> +			each port/lane. (Optional)
> + - vdda-phy-supply: Phandle to a regulator supply to PHY core block.
> + - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
> +Optional properties:
> + - vddp-ref-clk-supply: Phandle to a regulator supply to any specific refclk
> +			pll block.
> +
> +Example:
> +	pcie_phy: pciephy@34000 {
> +		compatible = "qcom,qmp-14nm-pcie-phy";

Fix this according to the compatibilities listed above.

> +		reg = <0x034000 0x3fff>;
> +		#phy-cells = <1>;
> +
> +		clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
> +			<&gcc GCC_PCIE_PHY_CFG_AHB_CLK>,
> +			<&gcc GCC_PCIE_0_PIPE_CLK>,
> +			<&gcc GCC_PCIE_1_PIPE_CLK>,
> +			<&gcc GCC_PCIE_2_PIPE_CLK>;
> +		clock-names = "aux", "cfg_ahb",
> +				"pipe0", "pipe1", "pipe2";
> +
> +		vdda-phy-supply = <&pm8994_l28>;
> +		vdda-pll-supply = <&pm8994_l12>;
> +
> +		resets = <&gcc GCC_PCIE_PHY_BCR>,
> +			<&gcc GCC_PCIE_PHY_COM_BCR>,
> +			<&gcc GCC_PCIE_PHY_COM_NOCSR_BCR>,
> +			<&gcc GCC_PCIE_0_PHY_BCR>,
> +			<&gcc GCC_PCIE_1_PHY_BCR>,
> +			<&gcc GCC_PCIE_2_PHY_BCR>;
> +		reset-names = "phy", "common", "cfg",
> +				"lane0", "lane1", "lane2";
> +	};
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 5547984..d5e2b50f 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -446,6 +446,14 @@ config PHY_STIH41X_USB
>  	  Enable this to support the USB transceiver that is part of
>  	  STMicroelectronics STiH41x SoC series.
>
> +config PHY_QCOM_QMP
> +	tristate "Qualcomm QMP PHY Driver"
> +	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support the QMP PHY transceiver that is used
> +	  with controllers such as PCIe, UFS, and USB on Qualcomm chips.
> +
>  config PHY_QCOM_QUSB2
>  	tristate "Qualcomm QUSB2 PHY Driver"
>  	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index 848489d..fde9fba 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_PHY_ST_SPEAR1340_MIPHY)	+= phy-spear1340-miphy.o
>  obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
>  obj-$(CONFIG_PHY_STIH407_USB)		+= phy-stih407-usb.o
>  obj-$(CONFIG_PHY_STIH41X_USB)		+= phy-stih41x-usb.o
> +obj-$(CONFIG_PHY_QCOM_QMP) 	+= phy-qcom-qmp.o
>  obj-$(CONFIG_PHY_QCOM_QUSB2) 	+= phy-qcom-qusb2.o
>  obj-$(CONFIG_PHY_QCOM_UFS) 	+= phy-qcom-ufs.o
>  obj-$(CONFIG_PHY_QCOM_UFS) 	+= phy-qcom-ufs-qmp-20nm.o
> diff --git a/drivers/phy/phy-qcom-qmp.c b/drivers/phy/phy-qcom-qmp.c
> new file mode 100644
> index 0000000..7e89179
> --- /dev/null
> +++ b/drivers/phy/phy-qcom-qmp.c
> @@ -0,0 +1,1154 @@
> +/*
> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#include <dt-bindings/phy/phy.h>
We would not need this once you have proper flags in cfg.

> +
> +
> +static inline void qphy_setbits(u32 bitmask, void __iomem *reg)
> +{
> +	u32 val;
> +
> +	val = readl_relaxed(reg);
> +	val |= bitmask;
> +	writel_relaxed(val, reg);
> +}
> +
> +static inline void qphy_clrbits(u32 bitmask, void __iomem *reg)
> +{
> +	u32 val;
> +
> +	val = readl_relaxed(reg);
> +	val &= ~bitmask;
> +	writel_relaxed(val, reg);
> +}
> +
> +unsigned int msm8996_pciephy_tx_offsets[] = { 0x1000, 0x2000, 0x3000 };
> +unsigned int msm8996_pciephy_rx_offsets[] = { 0x1200, 0x2200, 0x3200 };
> +unsigned int msm8996_pciephy_pcs_offsets[] = { 0x1400, 0x2400, 0x3400 };
> +
> +unsigned int msm8996_usb3phy_tx_offsets[] = { 0x200 };
> +unsigned int msm8996_usb3phy_rx_offsets[] = { 0x400 };
> +unsigned int msm8996_usb3phy_pcs_offsets[] = { 0x600 };
> +
> +const struct qmp_phy_init_cfg pciephy_init_cfg = {
> +	.type			= PHY_TYPE_PCIE,
> +	.nlanes			= 3,
> +	.tx_offsets		= msm8996_pciephy_tx_offsets,
> +	.rx_offsets		= msm8996_pciephy_rx_offsets,
> +	.pcs_offsets		= msm8996_pciephy_pcs_offsets,
> +
> +	.phy_init_serdes_tbl	= pciephy_serdes_init_tbl,
> +	.phy_init_serdes_tbl_sz	= ARRAY_SIZE(pciephy_serdes_init_tbl),
> +	.phy_init_tx_tbl	= pciephy_tx_init_tbl,
> +	.phy_init_tx_tbl_sz	= ARRAY_SIZE(pciephy_tx_init_tbl),
> +	.phy_init_rx_tbl	= pciephy_rx_init_tbl,
> +	.phy_init_rx_tbl_sz	= ARRAY_SIZE(pciephy_rx_init_tbl),
> +	.phy_init_pcs_tbl	= pciephy_pcs_init_tbl,
> +	.phy_init_pcs_tbl_sz	= ARRAY_SIZE(pciephy_pcs_init_tbl),
> +	.has_phy_com_ctrl	= true,
> +	.regs			= pciephy_regs_layout,
> +	.mask_start_ctrl	= (PHY_PCS_START | PHY_PLL_READY_GATE_EN),
> +	.mask_pwr_dn_ctrl	= (PHY_SW_PWRDN | PHY_REFCLK_DRV_DSBL),
> +};
> +
> +const struct qmp_phy_init_cfg usb3phy_init_cfg = {
> +	.type			= PHY_TYPE_USB3,
> +	.nlanes			= 1,
> +	.tx_offsets		= msm8996_usb3phy_tx_offsets,
> +	.rx_offsets		= msm8996_usb3phy_rx_offsets,
> +	.pcs_offsets		= msm8996_usb3phy_pcs_offsets,
> +
> +	.phy_init_serdes_tbl	= usb3phy_serdes_init_tbl,
> +	.phy_init_serdes_tbl_sz	= ARRAY_SIZE(usb3phy_serdes_init_tbl),
> +	.phy_init_tx_tbl	= usb3phy_tx_init_tbl,
> +	.phy_init_tx_tbl_sz	= ARRAY_SIZE(usb3phy_tx_init_tbl),
> +	.phy_init_rx_tbl	= usb3phy_rx_init_tbl,
> +	.phy_init_rx_tbl_sz	= ARRAY_SIZE(usb3phy_rx_init_tbl),
> +	.phy_init_pcs_tbl	= usb3phy_pcs_init_tbl,
> +	.phy_init_pcs_tbl_sz	= ARRAY_SIZE(usb3phy_pcs_init_tbl),
> +	.regs			= usb3phy_regs_layout,
> +	.mask_start_ctrl	= (PHY_SERDES_START | PHY_PCS_START),
> +	.mask_pwr_dn_ctrl	= PHY_SW_PWRDN,
> +};
> +
> +static void qcom_qmp_phy_configure(void __iomem *base,
> +				unsigned int *regs_layout,
> +				struct qmp_phy_init_tbl init_tbl[],
> +				int init_tbl_sz)
> +{
> +	int i;
> +
> +	for (i = 0; i < init_tbl_sz; i++) {
> +		if (init_tbl[i].in_layout)
> +			writel_relaxed(init_tbl[i].cfg_val,
> +				base + regs_layout[init_tbl[i].reg_offset]);
> +		else
> +			writel_relaxed(init_tbl[i].cfg_val,
> +				base + init_tbl[i].reg_offset);
> +	}
> +
> +	/* flush buffered writes */
> +	mb();
> +}
> +
> +static int qcom_qmp_phy_poweron(struct phy *phy)
> +{
> +	struct qmp_phy_desc *phydesc = phy_get_drvdata(phy);
> +	struct qcom_qmp_phy *qphy = phydesc->qphy;
> +	int ret;
> +
> +	dev_info(&phy->dev, "Powering on QMP phy\n");
> +
> +	ret = regulator_enable(qphy->vdda_phy);
> +	if (ret) {
> +		dev_err(qphy->dev, "%s: vdda-phy enable failed, err=%d\n",
> +				__func__, ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_enable(qphy->vdda_pll);
> +	if (ret) {
> +		dev_err(qphy->dev, "%s: vdda-pll enable failed, err=%d\n",
> +				__func__, ret);
> +		goto err_vdda_pll;
> +	}
> +
> +	if (qphy->vddp_ref_clk) {
> +		ret = regulator_enable(qphy->vddp_ref_clk);
> +		if (ret) {
> +			dev_err(qphy->dev, "%s: vdda-ref-clk enable failed, err=%d\n",
> +					__func__, ret);
> +			goto err_vddp_refclk;
> +		}
> +	}
> +
> +	if (!qphy->clk_enabled) {
> +		clk_prepare_enable(qphy->ref_clk_src);
> +		clk_prepare_enable(qphy->ref_clk);
> +		clk_prepare_enable(phydesc->pipe_clk);
> +		qphy->clk_enabled = true;
> +	}
> +
> +	return 0;
> +
> +err_vddp_refclk:
> +	regulator_disable(qphy->vdda_pll);
> +err_vdda_pll:
> +	regulator_disable(qphy->vdda_phy);
> +	return ret;
> +}
> +
> +static int qcom_qmp_phy_poweroff(struct phy *phy)
> +{
> +	struct qmp_phy_desc *phydesc = phy_get_drvdata(phy);
> +	struct qcom_qmp_phy *qphy = phydesc->qphy;
> +
> +	if (qphy->clk_enabled) {
> +		clk_disable_unprepare(qphy->ref_clk_src);
> +		clk_disable_unprepare(qphy->ref_clk);
> +		clk_disable_unprepare(phydesc->pipe_clk);
> +		qphy->clk_enabled = false;
> +	}
> +
> +	if (qphy->vddp_ref_clk)
> +		regulator_disable(qphy->vddp_ref_clk);
> +
> +	regulator_disable(qphy->vdda_pll);
> +	regulator_disable(qphy->vdda_phy);
> +
> +	return 0;
> +}
> +
> +static int qcom_qmp_phy_is_ready(struct qcom_qmp_phy *qphy,
> +				void __iomem *pcs_status, u32 mask)
> +{
> +	unsigned int init_timeout;
> +
> +	init_timeout = PHY_READY_TIMEOUT_COUNT;
> +	do {
> +		if (readl_relaxed(pcs_status) & mask)
> +			break;
> +
> +		usleep_range(REFCLK_STABILIZATION_DELAY_US_MIN,
> +				 REFCLK_STABILIZATION_DELAY_US_MAX);
> +	} while (--init_timeout);
> +
> +	if (!init_timeout)
> +		return -EBUSY;
> +
> +	return 0;
> +}
> +
> +static int qcom_qmp_phy_com_init(struct qcom_qmp_phy *qphy)
> +{
> +	const struct qmp_phy_init_cfg *cfg = qphy->cfg;
> +	void __iomem *serdes = qphy->serdes;
> +	int ret;
> +
> +	mutex_lock(&qphy->phy_mutex);
> +	if (qphy->init_count++) {
> +		mutex_unlock(&qphy->phy_mutex);
> +		return 0;
> +	}
> +
> +	ret = reset_control_deassert(qphy->phy_rst);
> +	if (ret) {
> +		dev_err(qphy->dev, "phy reset deassert failed\n");
mutex unlock
> +		return ret;
> +	}
> +
> +	ret = reset_control_deassert(qphy->phycom_rst);
> +	if (ret) {
> +		dev_err(qphy->dev, "common reset deassert failed\n");
> +		goto err_phycom_rst;
> +	}
> +
> +	if (qphy->phycfg_rst) {
> +		ret = reset_control_deassert(qphy->phycfg_rst);
> +		if (ret) {
> +			dev_err(qphy->dev, "common reset deassert failed\n");
> +			goto err_phycfg_rst;
> +		}
> +	}
> +
> +	if (cfg->has_phy_com_ctrl) {
> +		qphy_setbits(PHY_SW_PWRDN,
> +			serdes + cfg->regs[QPHY_COM_POWER_DOWN_CONTROL]);
> +		/* Make sure that above write is completed */
> +		mb();
> +	}
> +
> +	/* Serdes configuration */
> +	qcom_qmp_phy_configure(serdes, cfg->regs, cfg->phy_init_serdes_tbl,
> +				cfg->phy_init_serdes_tbl_sz);
> +
> +	if (cfg->has_phy_com_ctrl) {
> +		qphy_clrbits(PHY_SW_RESET, serdes +
> +					cfg->regs[QPHY_COM_SW_RESET]);
> +		qphy_setbits(PHY_SERDES_START | PHY_PCS_START,
> +				serdes + cfg->regs[QPHY_COM_START_CONTROL]);
> +		/* Make sure that above write is completed */
> +		mb();
> +
> +		ret = qcom_qmp_phy_is_ready(qphy, serdes +
> +					cfg->regs[QPHY_COM_PCS_READY_STATUS],
> +					MASK_COM_PCS_READY);
> +		if (ret) {
> +			dev_err(qphy->dev,
> +				"common control block init timed-out\n");
> +			goto err_phy_comctrl;
> +		}
> +	}
> +
> +	mutex_unlock(&qphy->phy_mutex);
> +
> +	return 0;
> +
> +err_phy_comctrl:
mutex unlock
> +	if (qphy->phycfg_rst)
> +		reset_control_assert(qphy->phycfg_rst);
> +err_phycfg_rst:
> +	reset_control_assert(qphy->phycom_rst);
> +err_phycom_rst:
> +	reset_control_assert(qphy->phy_rst);
> +	return ret;
> +}
> +
> +static int qcom_qmp_phy_com_exit(struct qcom_qmp_phy *qphy)
> +{
> +	const struct qmp_phy_init_cfg *cfg = qphy->cfg;
> +	void __iomem *serdes = qphy->serdes;
> +
> +	mutex_lock(&qphy->phy_mutex);
> +	if (--qphy->init_count) {
> +		mutex_unlock(&qphy->phy_mutex);
> +		return 0;
> +	}
> +
> +	if (cfg->has_phy_com_ctrl) {
> +		qphy_setbits(PHY_SERDES_START | PHY_PCS_START,
> +				serdes + cfg->regs[QPHY_COM_START_CONTROL]);
> +		qphy_clrbits(PHY_SW_RESET, serdes +
> +					cfg->regs[QPHY_COM_SW_RESET]);
> +		qphy_setbits(PHY_SW_PWRDN,
> +			serdes + cfg->regs[QPHY_COM_POWER_DOWN_CONTROL]);
> +
> +		/* Make sure that above writes are completed */
> +		mb();
> +	}
> +
> +	reset_control_assert(qphy->phy_rst);
> +	reset_control_assert(qphy->phycom_rst);
> +	if (qphy->phycfg_rst)
> +		reset_control_assert(qphy->phycfg_rst);
> +
> +	mutex_unlock(&qphy->phy_mutex);
> +
> +	return 0;
> +}
> +
> +/* PHY Initialization */
> +static int qcom_qmp_phy_init(struct phy *phy)
> +{
> +	struct qmp_phy_desc *phydesc = phy_get_drvdata(phy);
> +	struct qcom_qmp_phy *qphy = phydesc->qphy;
> +	const struct qmp_phy_init_cfg *cfg = qphy->cfg;
> +	void __iomem *tx = phydesc->tx;
> +	void __iomem *rx = phydesc->rx;
> +	void __iomem *pcs = phydesc->pcs;
> +	int ret;
> +
> +	dev_info(qphy->dev, "Initializing QMP phy\n");
> +
> +	/* enable interface clocks to program phy */
> +	clk_prepare_enable(qphy->aux_clk);
> +	clk_prepare_enable(qphy->cfg_ahb_clk);
> +
> +	ret = qcom_qmp_phy_com_init(qphy);
> +	if (ret)
> +		goto err;
> +
> +	if (phydesc->lane_rst) {
> +		ret = reset_control_deassert(phydesc->lane_rst);
> +		if (ret) {
> +			dev_err(qphy->dev, "lane<%d> reset deassert failed\n",
> +					phydesc->index);
> +			goto err_lane_rst;
> +		}
> +	}
> +
> +	/* Tx, Rx, and PCS configurations */
> +	qcom_qmp_phy_configure(tx, cfg->regs, cfg->phy_init_tx_tbl,
> +				cfg->phy_init_tx_tbl_sz);
> +	qcom_qmp_phy_configure(rx, cfg->regs, cfg->phy_init_rx_tbl,
> +				cfg->phy_init_rx_tbl_sz);
> +	qcom_qmp_phy_configure(pcs, cfg->regs, cfg->phy_init_pcs_tbl,
> +				cfg->phy_init_pcs_tbl_sz);
> +
> +	/*
> +	 * Pull out PHY from POWER DOWN state:
> +	 * This is active low enable signal to power-down PHY.
> +	 */
> +	qphy_setbits(cfg->mask_pwr_dn_ctrl,
> +			pcs + QPHY_POWER_DOWN_CONTROL);
> +	/* XXX: 10 us delay; given in PCIE HPG only */
> +	usleep_range(POWER_DOWN_DELAY_US_MIN, POWER_DOWN_DELAY_US_MAX);
> +
> +	/* start SerDes and Phy-Coding-Sublayer */
> +	qphy_setbits(cfg->mask_start_ctrl, pcs + QPHY_START_CTRL);
> +
> +	/* Pull PHY out of reset state */
> +	qphy_clrbits(PHY_SW_RESET, pcs + QPHY_SW_RESET);
> +	/* Make sure that above writes are completed */
> +	mb();
> +
> +	ret = qcom_qmp_phy_is_ready(qphy, pcs +
> +					cfg->regs[QPHY_PCS_READY_STATUS],
> +					MASK_PHYSTATUS);
> +	if (ret) {
> +		dev_err(qphy->dev, "phy initialization timed-out\n");
> +		goto err_pcs_ready;
> +	}
> +
> +	return 0;
> +
> +err_pcs_ready:
> +	if (phydesc->lane_rst)
> +		reset_control_assert(phydesc->lane_rst);
> +err_lane_rst:
> +	qcom_qmp_phy_com_exit(qphy);
> +err:
> +	clk_disable_unprepare(qphy->cfg_ahb_clk);
> +	clk_disable_unprepare(qphy->aux_clk);
> +	return ret;
> +}
> +
> +static int qcom_qmp_phy_exit(struct phy *phy)
> +{
> +	struct qmp_phy_desc *phydesc = phy_get_drvdata(phy);
> +	struct qcom_qmp_phy *qphy = phydesc->qphy;
> +	const struct qmp_phy_init_cfg *cfg = qphy->cfg;
> +
> +	/* PHY reset */
> +	qphy_setbits(PHY_SW_RESET, phydesc->pcs + QPHY_SW_RESET);
> +
> +	/* stop SerDes and Phy-Coding-Sublayer */
> +	qphy_clrbits(cfg->mask_start_ctrl, phydesc->pcs + QPHY_START_CTRL);
> +
> +	/* Put PHY into POWER DOWN state: active low */
> +	qphy_clrbits(cfg->mask_pwr_dn_ctrl,
> +			phydesc->pcs + QPHY_POWER_DOWN_CONTROL);
> +
> +	/* Make sure that above writes are completed */
> +	mb();
> +
> +	if (phydesc->lane_rst)
> +		reset_control_assert(phydesc->lane_rst);
> +
> +	qcom_qmp_phy_com_exit(qphy);
> +
> +	clk_disable_unprepare(qphy->aux_clk);
> +	clk_disable_unprepare(qphy->cfg_ahb_clk);
> +
> +	return 0;
> +}
> +
> +
> +static int qcom_qmp_phy_regulator_init(struct device *dev)
> +{
> +	struct qcom_qmp_phy *qphy = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	qphy->vdda_phy = devm_regulator_get(dev, "vdda-phy");
> +	if (IS_ERR(qphy->vdda_phy)) {
> +		ret = PTR_ERR(qphy->vdda_phy);
> +		dev_err(dev, "failed to get vdda-phy, %d\n", ret);
> +		return ret;
> +	}
> +
> +	qphy->vdda_pll = devm_regulator_get(dev, "vdda-pll");
> +	if (IS_ERR(qphy->vdda_pll)) {
> +		ret = PTR_ERR(qphy->vdda_pll);
> +		dev_err(dev, "failed to get vdda-pll, %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* optional regulator */
> +	qphy->vddp_ref_clk = devm_regulator_get(dev, "vddp-ref-clk");

Should mention this in bindings too.

> +	if (IS_ERR(qphy->vddp_ref_clk)) {
> +		ret = PTR_ERR(qphy->vddp_ref_clk);
> +		dev_info(dev, "failed to get vddp-ref-clk, %d\n", ret);
> +		qphy->vddp_ref_clk = NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_qmp_phy_clk_init(struct device *dev)
> +{
> +	struct qcom_qmp_phy *qphy = dev_get_drvdata(dev);
> +	int ret;
> +
> +	qphy->aux_clk = devm_clk_get(dev, "aux");
> +	if (IS_ERR(qphy->aux_clk)) {
> +		ret = PTR_ERR(qphy->aux_clk);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "failed to get aux_clk\n");
> +		return ret;
> +	}
> +
> +	qphy->cfg_ahb_clk = devm_clk_get(dev, "cfg_ahb");
> +	if (IS_ERR(qphy->cfg_ahb_clk)) {
> +		ret = PTR_ERR(qphy->cfg_ahb_clk);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "failed to get cfg_ahb_clk\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * ref_clk and ref_clk_src handles may not be available in
> +	 * all hardwares. So we don't return error in these cases.
> +	 */

This thing has to be mentioned in the bindings too.

> +	qphy->ref_clk_src = devm_clk_get(dev, "ref_clk_src");
> +	if (IS_ERR(qphy->ref_clk_src)) {
> +		ret = PTR_ERR(qphy->ref_clk_src);
> +		if (ret != -EPROBE_DEFER) {
> +			qphy->ref_clk_src = NULL;
> +			dev_dbg(dev, "failed to get ref_clk_src\n");
> +		} else {
> +			return ret;
> +		}
> +	}
> +
> +	qphy->ref_clk = devm_clk_get(dev, "ref_clk");
> +	if (IS_ERR(qphy->ref_clk)) {
> +		ret = PTR_ERR(qphy->ref_clk);
> +		if (ret != -EPROBE_DEFER) {
> +			qphy->ref_clk = NULL;
> +			dev_dbg(dev, "failed to get ref_clk\n");
> +		} else {
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static struct phy *qcom_qmp_phy_xlate(struct device *dev,
> +					struct of_phandle_args *args)
> +{
> +	struct qcom_qmp_phy *qphy = dev_get_drvdata(dev);
> +	int i;
> +
> +	if (WARN_ON(args->args[0] >= qphy->cfg->nlanes))
> +		return ERR_PTR(-ENODEV);
> +
> +	for (i = 0; i < qphy->cfg->nlanes; i++) {
> +		if (qphy->phys[i]->index == args->args[0])
> +			break;
> +	}
> +
> +	if (i == qphy->cfg->nlanes)
> +		return ERR_PTR(-ENODEV);
> +
> +	return qphy->phys[i]->phy;
> +}
> +
> +static const struct phy_ops qcom_qmp_phy_gen_ops = {
> +	.init		= qcom_qmp_phy_init,
> +	.exit		= qcom_qmp_phy_exit,
> +	.power_on	= qcom_qmp_phy_poweron,
> +	.power_off	= qcom_qmp_phy_poweroff,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
> +	{
> +		.compatible = "qcom,msm8996-qmp-pcie-phy",
> +		.data = &pciephy_init_cfg,
> +	}, {
> +		.compatible = "qcom,msm8996-qmp-usb3-phy",
> +		.data = &usb3phy_init_cfg,
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, qcom_qmp_phy_of_match_table);
> +
> +static int qcom_qmp_phy_probe(struct platform_device *pdev)
> +{
> +	struct qcom_qmp_phy *qphy;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *child;
> +	struct phy_provider *phy_provider;
> +	struct resource *res;
> +	const struct of_device_id *match;
> +	void __iomem *base;
> +	int ret = 0;
> +	int id;
> +
> +	qphy = devm_kzalloc(dev, sizeof(*qphy), GFP_KERNEL);
> +	if (!qphy)
> +		return -ENOMEM;
new line
> +	qphy->dev = dev;
> +	dev_set_drvdata(dev, qphy);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;
new line
> +	base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	/* per PHY serdes; usually located at base address */
> +	qphy->serdes = base;
> +
> +	mutex_init(&qphy->phy_mutex);
> +
> +	/* Get the specific init parameters of QMP phy */
> +	match = of_match_node(qcom_qmp_phy_of_match_table, dev->of_node);
> +	qphy->cfg = match->data;
> +
> +	ret = qcom_qmp_phy_clk_init(dev);
> +	if (ret) {
> +		dev_err(dev, "clock init failed\n");
> +		return ret;
> +	}
> +
> +	ret = qcom_qmp_phy_regulator_init(dev);
> +	if (ret) {
> +		dev_err(dev, "regulator init failed\n");
> +		return ret;
> +	}
> +
> +	qphy->phy_rst = devm_reset_control_get(dev, "phy");
> +	if (IS_ERR(qphy->phy_rst)) {
> +		dev_err(dev, "failed to get phy core reset\n");
> +		return PTR_ERR(qphy->phy_rst);
> +	}
> +
> +	qphy->phycom_rst = devm_reset_control_get(dev, "common");
> +	if (IS_ERR(qphy->phycom_rst)) {
> +		dev_err(dev, "failed to get phy common reset\n");
> +		return PTR_ERR(qphy->phycom_rst);
> +	}
> +
> +	qphy->phycfg_rst = devm_reset_control_get(dev, "cfg");
> +	if (IS_ERR(qphy->phycfg_rst)) {
> +		dev_err(dev, "failed to get phy ahb cfg reset\n");
> +		qphy->phycfg_rst = NULL;
> +	}
> +
> +	qphy->phys = devm_kcalloc(dev, qphy->cfg->nlanes,
> +					sizeof(*qphy->phys), GFP_KERNEL);
> +	if (!qphy->phys)
> +		return -ENOMEM;
> +
> +	for (id = 0; id < qphy->cfg->nlanes; id++) {
> +		struct phy *generic_phy;
> +		struct qmp_phy_desc *phy_desc;
> +		char prop_name[MAX_PROP_NAME];
> +
> +		phy_desc = devm_kzalloc(dev, sizeof(*phy_desc), GFP_KERNEL);
> +		if (!phy_desc) {
> +			ret = -ENOMEM;
> +			goto put_child;
> +		}
> +
> +		phy_desc->tx = base + qphy->cfg->tx_offsets[id];
> +		phy_desc->rx = base + qphy->cfg->rx_offsets[id];
> +		phy_desc->pcs = base + qphy->cfg->pcs_offsets[id];
> +
> +		/*
> +		 * Get PHY's Pipe clock, if any; USB3 and PCIe are PIPE
> +		 * based phys, so they essentially have pipe clock
> +		 */
> +		memset(&prop_name, 0, sizeof(prop_name));
> +		snprintf(prop_name, MAX_PROP_NAME, "pipe%d", id);
> +		phy_desc->pipe_clk = devm_clk_get(dev, prop_name);
> +		if (IS_ERR(phy_desc->pipe_clk)) {
> +			if (qphy->cfg->type == PHY_TYPE_PCIE ||
> +			    qphy->cfg->type == PHY_TYPE_USB3) {
> +				ret = PTR_ERR(phy_desc->pipe_clk);
> +				if (ret != -EPROBE_DEFER)
> +					dev_err(dev,
> +					"failed to get lane%d pipe_clk\n", id);
> +				return ret;
> +			} else {
> +				phy_desc->pipe_clk = NULL;
> +			}
> +		}

Do we need to really need phy type for this?
You should proably make a flag in cfg to mark this rather then using phy 
type. Hopefully it will also simplify the logic.


> +
> +		/* Get lane reset, if any */
> +		memset(&prop_name, 0, sizeof(prop_name));
> +		snprintf(prop_name, MAX_PROP_NAME, "lane%d", id);
> +		phy_desc->lane_rst = devm_reset_control_get(dev, prop_name);
> +		if (IS_ERR(phy_desc->lane_rst)) {
> +			if (qphy->cfg->type == PHY_TYPE_PCIE) {
> +				dev_err(dev, "failed to get lane%d reset\n",
> +									id);
> +				ret = PTR_ERR(phy_desc->lane_rst);
> +				goto put_child;
> +			} else {
> +				phy_desc->lane_rst = NULL;
> +			}
> +		}

Same comment as above.


> +
> +		generic_phy = devm_phy_create(dev, NULL, &qcom_qmp_phy_gen_ops);
> +		if (IS_ERR(generic_phy)) {
> +			ret = PTR_ERR(generic_phy);
> +			dev_err(dev, "failed to create qphy %d\n", ret);
> +			goto put_child;
> +		}
> +
> +		phy_desc->phy = generic_phy;
> +		phy_desc->index = id;
> +		phy_desc->qphy = qphy;
> +		phy_set_drvdata(generic_phy, phy_desc);
> +		qphy->phys[id] = phy_desc;
> +	}
> +
> +	phy_provider = devm_of_phy_provider_register(dev, qcom_qmp_phy_xlate);
> +	if (IS_ERR(phy_provider)) {
> +		ret = PTR_ERR(phy_provider);
> +		dev_err(dev, "failed to register qphy %d\n", ret);
> +		goto put_child;
> +	}
> +
> +put_child:
> +	of_node_put(child);
> +	return ret;
> +}
> +
> +static struct platform_driver qcom_qmp_phy_driver = {
> +	.probe		= qcom_qmp_phy_probe,
> +	.driver = {
> +		.name	= "qcom_qmp_phy",
> +		.of_match_table = of_match_ptr(qcom_qmp_phy_of_match_table),
> +	},
> +};
> +
> +module_platform_driver(qcom_qmp_phy_driver);
> +
> +MODULE_AUTHOR("Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>");
> +MODULE_DESCRIPTION("Qualcomm QMP PHY driver");
> +MODULE_LICENSE("GPL v2");
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
