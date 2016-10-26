From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 2/2] phy: qcom-qmp: new qmp phy driver for qcom-chipsets
Date: Thu, 27 Oct 2016 01:41:53 +0530
Message-ID: <ca4054a8-a813-0f50-3224-1e418eaa7095@ti.com>
References: <1476873827-7191-1-git-send-email-vivek.gautam@codeaurora.org>
 <1476873827-7191-3-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1476873827-7191-3-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wednesday 19 October 2016 04:13 PM, Vivek Gautam wrote:
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

use only lkml links here.
> 
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
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
> +
> +/* QMP PHY QSERDES COM registers */
> +#define QSERDES_COM_BG_TIMER				0x00c
> +#define QSERDES_COM_SSC_EN_CENTER			0x010
> +#define QSERDES_COM_SSC_ADJ_PER1			0x014
> +#define QSERDES_COM_SSC_ADJ_PER2			0x018
> +#define QSERDES_COM_SSC_PER1				0x01c
> +#define QSERDES_COM_SSC_PER2				0x020
> +#define QSERDES_COM_SSC_STEP_SIZE1			0x024
> +#define QSERDES_COM_SSC_STEP_SIZE2			0x028
> +#define QSERDES_COM_BIAS_EN_CLKBUFLR_EN			0x034
> +#define QSERDES_COM_CLK_ENABLE1				0x038
> +#define QSERDES_COM_SYS_CLK_CTRL			0x03c
> +#define QSERDES_COM_SYSCLK_BUF_ENABLE			0x040
> +#define QSERDES_COM_PLL_IVCO				0x048
> +#define QSERDES_COM_LOCK_CMP1_MODE0			0x04c
> +#define QSERDES_COM_LOCK_CMP2_MODE0			0x050
> +#define QSERDES_COM_LOCK_CMP3_MODE0			0x054
> +#define QSERDES_COM_LOCK_CMP1_MODE1			0x058
> +#define QSERDES_COM_LOCK_CMP2_MODE1			0x05c
> +#define QSERDES_COM_LOCK_CMP3_MODE1			0x060
> +#define QSERDES_COM_BG_TRIM				0x070
> +#define QSERDES_COM_CLK_EP_DIV				0x074
> +#define QSERDES_COM_CP_CTRL_MODE0			0x078
> +#define QSERDES_COM_CP_CTRL_MODE1			0x07c
> +#define QSERDES_COM_PLL_RCTRL_MODE0			0x084
> +#define QSERDES_COM_PLL_RCTRL_MODE1			0x088
> +#define QSERDES_COM_PLL_CCTRL_MODE0			0x090
> +#define QSERDES_COM_PLL_CCTRL_MODE1			0x094
> +#define QSERDES_COM_SYSCLK_EN_SEL			0x0ac
> +#define QSERDES_COM_RESETSM_CNTRL			0x0b4
> +#define QSERDES_COM_RESTRIM_CTRL			0x0bc
> +#define QSERDES_COM_RESCODE_DIV_NUM			0x0c4
> +#define QSERDES_COM_LOCK_CMP_EN				0x0c8
> +#define QSERDES_COM_LOCK_CMP_CFG			0x0cc
> +#define QSERDES_COM_DEC_START_MODE0			0x0d0
> +#define QSERDES_COM_DEC_START_MODE1			0x0d4
> +#define QSERDES_COM_DIV_FRAC_START1_MODE0		0x0dc
> +#define QSERDES_COM_DIV_FRAC_START2_MODE0		0x0e0
> +#define QSERDES_COM_DIV_FRAC_START3_MODE0		0x0e4
> +#define QSERDES_COM_DIV_FRAC_START1_MODE1		0x0e8
> +#define QSERDES_COM_DIV_FRAC_START2_MODE1		0x0ec
> +#define QSERDES_COM_DIV_FRAC_START3_MODE1		0x0f0
> +#define QSERDES_COM_INTEGLOOP_GAIN0_MODE0		0x108
> +#define QSERDES_COM_INTEGLOOP_GAIN1_MODE0		0x10c
> +#define QSERDES_COM_INTEGLOOP_GAIN0_MODE1		0x110
> +#define QSERDES_COM_INTEGLOOP_GAIN1_MODE1		0x114
> +#define QSERDES_COM_VCO_TUNE_CTRL			0x124
> +#define QSERDES_COM_VCO_TUNE_MAP			0x128
> +#define QSERDES_COM_VCO_TUNE1_MODE0			0x12c
> +#define QSERDES_COM_VCO_TUNE2_MODE0			0x130
> +#define QSERDES_COM_VCO_TUNE1_MODE1			0x134
> +#define QSERDES_COM_VCO_TUNE2_MODE1			0x138
> +#define QSERDES_COM_VCO_TUNE_TIMER1			0x144
> +#define QSERDES_COM_VCO_TUNE_TIMER2			0x148
> +#define QSERDES_COM_BG_CTRL				0x170
> +#define QSERDES_COM_CLK_SELECT				0x174
> +#define QSERDES_COM_HSCLK_SEL				0x178
> +#define QSERDES_COM_CORECLK_DIV				0x184
> +#define QSERDES_COM_CORE_CLK_EN				0x18c
> +#define QSERDES_COM_C_READY_STATUS			0x190
> +#define QSERDES_COM_CMN_CONFIG				0x194
> +#define QSERDES_COM_SVS_MODE_CLK_SEL			0x19c
> +#define QSERDES_COM_DEBUG_BUS0				0x1a0
> +#define QSERDES_COM_DEBUG_BUS1				0x1a4
> +#define QSERDES_COM_DEBUG_BUS2				0x1a8
> +#define QSERDES_COM_DEBUG_BUS3				0x1ac
> +#define QSERDES_COM_DEBUG_BUS_SEL			0x1b0
> +#define QSERDES_COM_CORECLK_DIV_MODE1			0x1bc
> +
> +/* QMP PHY TX registers */
> +#define QSERDES_TX_RES_CODE_LANE_OFFSET			0x054
> +#define QSERDES_TX_DEBUG_BUS_SEL			0x064
> +#define QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN	0x068
> +#define QSERDES_TX_LANE_MODE				0x094
> +#define QSERDES_TX_RCV_DETECT_LVL_2			0x0ac
> +
> +/* QMP PHY RX registers */
> +#define QSERDES_RX_UCDR_SO_GAIN_HALF			0x010
> +#define QSERDES_RX_UCDR_SO_GAIN				0x01c
> +#define QSERDES_RX_UCDR_FASTLOCK_FO_GAIN		0x040
> +#define QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE	0x048
> +#define QSERDES_RX_RX_TERM_BW				0x090
> +#define QSERDES_RX_RX_EQ_GAIN1_LSB			0x0c4
> +#define QSERDES_RX_RX_EQ_GAIN1_MSB			0x0c8
> +#define QSERDES_RX_RX_EQ_GAIN2_LSB			0x0cc
> +#define QSERDES_RX_RX_EQ_GAIN2_MSB			0x0d0
> +#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2		0x0d8
> +#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3		0x0dc
> +#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4		0x0e0
> +#define QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1		0x108
> +#define QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2		0x10c
> +#define QSERDES_RX_SIGDET_ENABLES			0x110
> +#define QSERDES_RX_SIGDET_CNTRL				0x114
> +#define QSERDES_RX_SIGDET_LVL				0x118
> +#define QSERDES_RX_SIGDET_DEGLITCH_CNTRL		0x11c
> +#define QSERDES_RX_RX_BAND				0x120
> +#define QSERDES_RX_RX_INTERFACE_MODE			0x12c
> +
> +/* QMP PHY PCS registers */
> +#define QPHY_SW_RESET					0x00
> +#define QPHY_POWER_DOWN_CONTROL				0x04
> +#define QPHY_START_CTRL					0x08
> +#define QPHY_TXDEEMPH_M6DB_V0				0x24
> +#define QPHY_TXDEEMPH_M3P5DB_V0				0x28
> +#define QPHY_ENDPOINT_REFCLK_DRIVE			0x54
> +#define QPHY_RX_IDLE_DTCT_CNTRL				0x58
> +#define QPHY_POWER_STATE_CONFIG1			0x60
> +#define QPHY_POWER_STATE_CONFIG2			0x64
> +#define QPHY_POWER_STATE_CONFIG4			0x6c
> +#define QPHY_LOCK_DETECT_CONFIG1			0x80
> +#define QPHY_LOCK_DETECT_CONFIG2			0x84
> +#define QPHY_LOCK_DETECT_CONFIG3			0x88
> +#define QPHY_PWRUP_RESET_DLY_TIME_AUXCLK		0xa0
> +#define QPHY_LP_WAKEUP_DLY_TIME_AUXCLK			0xa4
> +
> +/* PHY_SW_RESET bit */
> +#define PHY_SW_RESET				BIT(0)
> +/* PHY_POWER_DOWN_CONTROL */
> +#define PHY_SW_PWRDN				BIT(0)
> +#define PHY_REFCLK_DRV_DSBL			BIT(1)
> +/* PHY_START_CONTROL bits */
> +#define PHY_SERDES_START			BIT(0)
> +#define PHY_PCS_START				BIT(1)
> +#define PHY_PLL_READY_GATE_EN			BIT(3)
> +/* PHY_PCS_STATUS bit */
> +#define MASK_PHYSTATUS				BIT(6)
> +/* PCS_READY_STATUS bit */
> +#define MASK_COM_PCS_READY			BIT(0)
> +
> +#define REFCLK_STABILIZATION_DELAY_US_MIN	1000
> +#define REFCLK_STABILIZATION_DELAY_US_MAX	1005
> +#define PHY_READY_TIMEOUT_COUNT			10
> +#define POWER_DOWN_DELAY_US_MIN			10
> +#define POWER_DOWN_DELAY_US_MAX			11
> +
> +#define MAX_PROP_NAME		32
> +
> +struct qmp_phy_init_tbl {
> +	unsigned int reg_offset;
> +	unsigned int cfg_val;
> +	/*
> +	 * register part of layout ?
> +	 * if yes, then reg_offset gives index in the reg-layout
> +	 */
> +	int in_layout;
> +};
> +#define QCOM_QMP_PHY_INIT_CFG(reg, val) \
> +	{				\
> +		.reg_offset = reg,	\
> +		.cfg_val = val,		\
> +	}
> +#define QCOM_QMP_PHY_INIT_CFG_L(reg, val) \
> +	{				  \
> +		.reg_offset = reg,	  \
> +		.cfg_val = val,		  \
> +		.in_layout = 1,		  \
> +	}
> +
> +/* set of registers with offsets different per-PHY */
> +enum qphy_reg_layout {
> +	/* Common block control registers */
> +	QPHY_COM_SW_RESET,
> +	QPHY_COM_POWER_DOWN_CONTROL,
> +	QPHY_COM_START_CONTROL,
> +	QPHY_COM_PCS_READY_STATUS,
> +	/* PCS registers */
> +	QPHY_PLL_LOCK_CHK_DLY_TIME,
> +	QPHY_FLL_CNTRL1,
> +	QPHY_FLL_CNTRL2,
> +	QPHY_FLL_CNT_VAL_L,
> +	QPHY_FLL_CNT_VAL_H_TOL,
> +	QPHY_FLL_MAN_CODE,
> +	QPHY_PCS_READY_STATUS,
> +};
> +
> +unsigned int pciephy_regs_layout[] = {
> +	[QPHY_COM_SW_RESET]		= 0x400,
> +	[QPHY_COM_POWER_DOWN_CONTROL]	= 0x404,
> +	[QPHY_COM_START_CONTROL]	= 0x408,
> +	[QPHY_COM_PCS_READY_STATUS]	= 0x448,
> +	[QPHY_PLL_LOCK_CHK_DLY_TIME]	= 0xa8,
> +	[QPHY_FLL_CNTRL1]		= 0xc4,
> +	[QPHY_FLL_CNTRL2]		= 0xc8,
> +	[QPHY_FLL_CNT_VAL_L]		= 0xcc,
> +	[QPHY_FLL_CNT_VAL_H_TOL]	= 0xd0,
> +	[QPHY_FLL_MAN_CODE]		= 0xd4,
> +	[QPHY_PCS_READY_STATUS]		= 0x174,
> +};
> +
> +unsigned int usb3phy_regs_layout[] = {
> +	[QPHY_FLL_CNTRL1]		= 0xc0,
> +	[QPHY_FLL_CNTRL2]		= 0xc4,
> +	[QPHY_FLL_CNT_VAL_L]		= 0xc8,
> +	[QPHY_FLL_CNT_VAL_H_TOL]	= 0xcc,
> +	[QPHY_FLL_MAN_CODE]		= 0xd0,
> +	[QPHY_PCS_READY_STATUS]		= 0x17c,
> +};
> +
> +static struct qmp_phy_init_tbl pciephy_serdes_init_tbl[] = {
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x1c),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x10),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x33),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x06),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_EN, 0x42),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x00),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER1, 0xff),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_TIMER2, 0x1f),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x01),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x01),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x00),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV, 0x0a),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x09),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x82),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x03),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x55),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x55),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x1a),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x0a),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x33),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x02),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_BUF_ENABLE, 0x1f),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x04),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_EN_CENTER, 0x01),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER1, 0x31),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER2, 0x01),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER1, 0x02),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER2, 0x00),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE1, 0x2f),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE2, 0x19),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_RESCODE_DIV_NUM, 0x15),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_BG_TRIM, 0x0f),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_PLL_IVCO, 0x0f),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_CLK_EP_DIV, 0x19),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x10),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x00),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_RESCODE_DIV_NUM, 0x40),
> +};
> +
> +static struct qmp_phy_init_tbl pciephy_tx_init_tbl[] = {
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x06),
> +};
> +
> +static struct qmp_phy_init_tbl pciephy_rx_init_tbl[] = {
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_ENABLES, 0x1c),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x01),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x00),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0xdb),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_RX_BAND, 0x18),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN, 0x04),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN_HALF, 0x04),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x4b),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x19),
> +};
> +
> +static struct qmp_phy_init_tbl pciephy_pcs_init_tbl[] = {
> +	QCOM_QMP_PHY_INIT_CFG(QPHY_RX_IDLE_DTCT_CNTRL, 0x4c),
> +	QCOM_QMP_PHY_INIT_CFG(QPHY_PWRUP_RESET_DLY_TIME_AUXCLK, 0x00),
> +	QCOM_QMP_PHY_INIT_CFG(QPHY_LP_WAKEUP_DLY_TIME_AUXCLK, 0x01),
> +
> +	QCOM_QMP_PHY_INIT_CFG_L(QPHY_PLL_LOCK_CHK_DLY_TIME, 0x05),
> +
> +	QCOM_QMP_PHY_INIT_CFG(QPHY_ENDPOINT_REFCLK_DRIVE, 0x05),
> +	QCOM_QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x02),
> +	QCOM_QMP_PHY_INIT_CFG(QPHY_POWER_STATE_CONFIG4, 0x00),
> +	QCOM_QMP_PHY_INIT_CFG(QPHY_POWER_STATE_CONFIG1, 0xa3),
> +	QCOM_QMP_PHY_INIT_CFG(QPHY_TXDEEMPH_M3P5DB_V0, 0x0e),
> +};
> +
> +static struct qmp_phy_init_tbl usb3phy_serdes_init_tbl[] = {
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x14),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x08),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x06),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x01),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x00),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_BG_TRIM, 0x0f),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_PLL_IVCO, 0x0f),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x04),
> +	/* PLL and Loop filter settings */
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x82),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x55),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x55),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x03),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x80),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x00),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x15),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x34),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x00),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP_CFG, 0x00),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x00),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x0a),
> +	/* SSC settings */
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_EN_CENTER, 0x01),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER1, 0x31),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_PER2, 0x01),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER1, 0x00),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_ADJ_PER2, 0x00),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE1, 0xde),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_COM_SSC_STEP_SIZE2, 0x07),
> +};
> +
> +static struct qmp_phy_init_tbl usb3phy_tx_init_tbl[] = {
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_TX_RCV_DETECT_LVL_2, 0x12),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x06),
> +};
> +
> +static struct qmp_phy_init_tbl usb3phy_rx_init_tbl[] = {
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0b),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_UCDR_SO_GAIN, 0x04),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x02),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4c),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0xbb),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x77),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x03),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x18),
> +	QCOM_QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x16),
> +};
> +
> +static struct qmp_phy_init_tbl usb3phy_pcs_init_tbl[] = {
> +	/* FLL settings */
> +	QCOM_QMP_PHY_INIT_CFG_L(QPHY_FLL_CNTRL2, 0x03),
> +	QCOM_QMP_PHY_INIT_CFG_L(QPHY_FLL_CNTRL1, 0x02),
> +	QCOM_QMP_PHY_INIT_CFG_L(QPHY_FLL_CNT_VAL_L, 0x09),
> +	QCOM_QMP_PHY_INIT_CFG_L(QPHY_FLL_CNT_VAL_H_TOL, 0x42),
> +	QCOM_QMP_PHY_INIT_CFG_L(QPHY_FLL_MAN_CODE, 0x85),
> +
> +	/* Lock Det settings */
> +	QCOM_QMP_PHY_INIT_CFG(QPHY_LOCK_DETECT_CONFIG1, 0xd1),
> +	QCOM_QMP_PHY_INIT_CFG(QPHY_LOCK_DETECT_CONFIG2, 0x1f),
> +	QCOM_QMP_PHY_INIT_CFG(QPHY_LOCK_DETECT_CONFIG3, 0x47),
> +	QCOM_QMP_PHY_INIT_CFG(QPHY_POWER_STATE_CONFIG2, 0x08),
> +};

if you can implement the dt mechanism I mentioned in your other patch, all
these tables can be got rid of and the code to initialize these can also be
removed.
> +
> +/**
> + * struct qmp_phy_init_cfg:- per-PHY init config.
> + */
> +struct qmp_phy_init_cfg {
> +	/*
> +	 * @type: phy-type - PCIE/UFS/USB
> +	 * @nlanes: number of lanes provided by phy
> +	 * @tx_offsets: array of offsets of Tx block from PHY base
> +	 * @rx_offsets: array of offsets of Rx block from PHY base
> +	 * @pcs_offsets: array of offsets of PCS block from PHY base
> +	 */
> +	unsigned int type;
> +	int nlanes;
> +	unsigned int *tx_offsets;
> +	unsigned int *rx_offsets;
> +	unsigned int *pcs_offsets;
> +
> +	/* Initialization sequence for PHY blocks - Serdes, tx, rx, pcs */
> +	struct qmp_phy_init_tbl *phy_init_serdes_tbl;
> +	int phy_init_serdes_tbl_sz;
> +	struct qmp_phy_init_tbl *phy_init_tx_tbl;
> +	int phy_init_tx_tbl_sz;
> +	struct qmp_phy_init_tbl *phy_init_rx_tbl;
> +	int phy_init_rx_tbl_sz;
> +	struct qmp_phy_init_tbl *phy_init_pcs_tbl;
> +	int phy_init_pcs_tbl_sz;
> +
> +	/* array of registers with different offsets */
> +	unsigned int *regs;
> +
> +	unsigned int mask_start_ctrl;
> +	unsigned int mask_pwr_dn_ctrl;
> +	/* true, if PHY has a separate PHY_COM_CNTRL block */
> +	bool has_phy_com_ctrl;
> +};
> +
> +/**
> + * struct qmp_phy_desc:- per-lane phy-descriptor.
> + *
> + * @phy: pointer to generic phy
> + * @tx: pointer to iomapped memory space for PHY's tx
> + * @rx: pointer to iomapped memory space for PHY's rx
> + * @pcs: pointer to iomapped memory space for PHY's pcs
> + * @pipe_clk: pointer to pipe lock
> + * @index: lane index
> + * @qphy: pointer to QMP phy to which this lane belongs
> + * @lane_rst: pointer to lane's reset controller
> + */
> +struct qmp_phy_desc {
> +	struct phy *phy;
> +	void __iomem *tx;
> +	void __iomem *rx;
> +	void __iomem *pcs;
> +	struct clk *pipe_clk;
> +	unsigned int index;
> +	struct qcom_qmp_phy *qphy;
> +	struct reset_control *lane_rst;
> +};
> +
> +/**
> + * struct qcom_qmp_phy:- structure holding QMP PHY attributes.
> + *
> + * @dev: pointer to device
> + * @serdes: pointer to iomapped memory space for phy's serdes
> + *
> + * @aux_clk: pointer to phy core clock
> + * @cfg_ahb_clk: pointer to AHB2PHY interface clock
> + * @ref_clk: pointer to reference clock
> + * @ref_clk_src: pointer to source to reference clock
> + * @clk_enabled: check if clocks are enabled or not
> + *
> + * @vdda_phy: vdd supply to the phy core block
> + * @vdda_pll: 1.8V vdd supply to ref_clk block
> + * @vddp_ref_clk: vdd supply to specific ref_clk block
> + *
> + * @phy_rst: Pointer to phy reset control
> + * @phycom_rst: Pointer to phy common reset control
> + * @phycfg_rst: Pointer to phy ahb cfg reset control (Optional)
> + *
> + * @cfg: pointer to init config for each phys
> + * @phys: array of pointer to per-lane phy descriptors
> + * @phy_mutex: mutex lock for PHY common block initialization
> + * @init_count: Phy common block initialization count
> + */
> +struct qcom_qmp_phy {
> +	struct device *dev;
> +	void __iomem *serdes;
> +
> +	struct clk *aux_clk;
> +	struct clk *cfg_ahb_clk;
> +	struct clk *ref_clk;
> +	struct clk *ref_clk_src;
> +	bool clk_enabled;
> +
> +	struct regulator *vdda_phy;
> +	struct regulator *vdda_pll;
> +	struct regulator *vddp_ref_clk;
> +
> +	struct reset_control *phy_rst;
> +	struct reset_control *phycom_rst;
> +	struct reset_control *phycfg_rst;
> +
> +	const struct qmp_phy_init_cfg *cfg;
> +	struct qmp_phy_desc **phys;
> +
> +	struct mutex phy_mutex;
> +	int init_count;
> +};
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

you can have a separate reg map for each lane and all these can come from dt.
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

lot of my comments on the previous PHY driver is applicable here. For example
the clk_enabled is not required.
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

finding a PHY based on index is not required. Just have a different label for
each sub-node and using this label in the controller node should be enough.

Thanks
Kishon
