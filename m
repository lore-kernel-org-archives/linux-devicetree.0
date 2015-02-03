From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH v3 1/4] pinctrl: bcm: consolidate Broadcom pinctrl drivers
Date: Mon, 2 Feb 2015 18:01:31 -0800
Message-ID: <1422928894-20716-2-git-send-email-rjui@broadcom.com>
References: <Ray Jui <rjui@broadcom.com>
 <1422928894-20716-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422928894-20716-1-git-send-email-rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>
Cc: Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>
List-Id: devicetree@vger.kernel.org

Consolidate Broadcom pinctrl drivers into drivers/pinctrl/bcm/*

Signed-off-by: Ray Jui <rjui@broadcom.com>
---
 drivers/pinctrl/Kconfig                |   19 +-
 drivers/pinctrl/Makefile               |    4 +-
 drivers/pinctrl/bcm/Kconfig            |   21 +
 drivers/pinctrl/bcm/Makefile           |    4 +
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 1455 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm2835.c  | 1072 +++++++++++++++++++++++
 drivers/pinctrl/pinctrl-bcm281xx.c     | 1455 --------------------------------
 drivers/pinctrl/pinctrl-bcm2835.c      | 1072 -----------------------
 8 files changed, 2555 insertions(+), 2547 deletions(-)
 create mode 100644 drivers/pinctrl/bcm/Kconfig
 create mode 100644 drivers/pinctrl/bcm/Makefile
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm281xx.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm2835.c
 delete mode 100644 drivers/pinctrl/pinctrl-bcm281xx.c
 delete mode 100644 drivers/pinctrl/pinctrl-bcm2835.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index d014f22..6cfdad7 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -67,24 +67,6 @@ config PINCTRL_AT91
 	help
 	  Say Y here to enable the at91 pinctrl driver
 
-config PINCTRL_BCM2835
-	bool
-	select PINMUX
-	select PINCONF
-
-config PINCTRL_BCM281XX
-	bool "Broadcom BCM281xx pinctrl driver"
-	depends on OF && (ARCH_BCM_MOBILE || COMPILE_TEST)
-	select PINMUX
-	select PINCONF
-	select GENERIC_PINCONF
-	select REGMAP_MMIO
-	help
-	  Say Y here to support Broadcom BCM281xx pinctrl driver, which is used
-	  for the BCM281xx SoC family, including BCM11130, BCM11140, BCM11351,
-	  BCM28145, and BCM28155 SoCs.  This driver requires the pinctrl
-	  framework.  GPIO is provided by a separate GPIO driver.
-
 config PINCTRL_LANTIQ
 	bool
 	depends on LANTIQ
@@ -191,6 +173,7 @@ config PINCTRL_PALMAS
 	  open drain configuration for the Palmas series devices like
 	  TPS65913, TPS80036 etc.
 
+source "drivers/pinctrl/bcm/Kconfig"
 source "drivers/pinctrl/berlin/Kconfig"
 source "drivers/pinctrl/freescale/Kconfig"
 source "drivers/pinctrl/intel/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index c030b3d..c018bbf 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -14,8 +14,6 @@ obj-$(CONFIG_PINCTRL_AS3722)	+= pinctrl-as3722.o
 obj-$(CONFIG_PINCTRL_BF54x)	+= pinctrl-adi2-bf54x.o
 obj-$(CONFIG_PINCTRL_BF60x)	+= pinctrl-adi2-bf60x.o
 obj-$(CONFIG_PINCTRL_AT91)	+= pinctrl-at91.o
-obj-$(CONFIG_PINCTRL_BCM2835)	+= pinctrl-bcm2835.o
-obj-$(CONFIG_PINCTRL_BCM281XX)	+= pinctrl-bcm281xx.o
 obj-$(CONFIG_PINCTRL_FALCON)	+= pinctrl-falcon.o
 obj-$(CONFIG_PINCTRL_PALMAS)	+= pinctrl-palmas.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
@@ -36,6 +34,8 @@ obj-$(CONFIG_PINCTRL_LANTIQ)	+= pinctrl-lantiq.o
 obj-$(CONFIG_PINCTRL_TB10X)	+= pinctrl-tb10x.o
 obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
 
+obj-$(CONFIG_ARCH_BCM)		+= bcm/
+obj-$(CONFIG_ARCH_BCM2835)	+= bcm/
 obj-$(CONFIG_ARCH_BERLIN)	+= berlin/
 obj-y				+= freescale/
 obj-$(CONFIG_X86)		+= intel/
diff --git a/drivers/pinctrl/bcm/Kconfig b/drivers/pinctrl/bcm/Kconfig
new file mode 100644
index 0000000..bc6d048
--- /dev/null
+++ b/drivers/pinctrl/bcm/Kconfig
@@ -0,0 +1,21 @@
+#
+# Broadcom pinctrl drivers
+#
+
+config PINCTRL_BCM281XX
+	bool "Broadcom BCM281xx pinctrl driver"
+	depends on OF && (ARCH_BCM_MOBILE || COMPILE_TEST)
+	select PINMUX
+	select PINCONF
+	select GENERIC_PINCONF
+	select REGMAP_MMIO
+	help
+	  Say Y here to support Broadcom BCM281xx pinctrl driver, which is used
+	  for the BCM281xx SoC family, including BCM11130, BCM11140, BCM11351,
+	  BCM28145, and BCM28155 SoCs.  This driver requires the pinctrl
+	  framework.  GPIO is provided by a separate GPIO driver.
+
+config PINCTRL_BCM2835
+	bool
+	select PINMUX
+	select PINCONF
diff --git a/drivers/pinctrl/bcm/Makefile b/drivers/pinctrl/bcm/Makefile
new file mode 100644
index 0000000..7ba80a3
--- /dev/null
+++ b/drivers/pinctrl/bcm/Makefile
@@ -0,0 +1,4 @@
+# Broadcom pinctrl support
+
+obj-$(CONFIG_PINCTRL_BCM281XX)	+= pinctrl-bcm281xx.o
+obj-$(CONFIG_PINCTRL_BCM2835)	+= pinctrl-bcm2835.o
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
new file mode 100644
index 0000000..73d99076
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -0,0 +1,1455 @@
+/*
+ * Copyright (C) 2013 Broadcom Corporation
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation version 2.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether express or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include "../core.h"
+#include "../pinctrl-utils.h"
+
+/* BCM281XX Pin Control Registers Definitions */
+
+/* Function Select bits are the same for all pin control registers */
+#define BCM281XX_PIN_REG_F_SEL_MASK		0x0700
+#define BCM281XX_PIN_REG_F_SEL_SHIFT		8
+
+/* Standard pin register */
+#define BCM281XX_STD_PIN_REG_DRV_STR_MASK	0x0007
+#define BCM281XX_STD_PIN_REG_DRV_STR_SHIFT	0
+#define BCM281XX_STD_PIN_REG_INPUT_DIS_MASK	0x0008
+#define BCM281XX_STD_PIN_REG_INPUT_DIS_SHIFT	3
+#define BCM281XX_STD_PIN_REG_SLEW_MASK		0x0010
+#define BCM281XX_STD_PIN_REG_SLEW_SHIFT		4
+#define BCM281XX_STD_PIN_REG_PULL_UP_MASK	0x0020
+#define BCM281XX_STD_PIN_REG_PULL_UP_SHIFT	5
+#define BCM281XX_STD_PIN_REG_PULL_DN_MASK	0x0040
+#define BCM281XX_STD_PIN_REG_PULL_DN_SHIFT	6
+#define BCM281XX_STD_PIN_REG_HYST_MASK		0x0080
+#define BCM281XX_STD_PIN_REG_HYST_SHIFT		7
+
+/* I2C pin register */
+#define BCM281XX_I2C_PIN_REG_INPUT_DIS_MASK	0x0004
+#define BCM281XX_I2C_PIN_REG_INPUT_DIS_SHIFT	2
+#define BCM281XX_I2C_PIN_REG_SLEW_MASK		0x0008
+#define BCM281XX_I2C_PIN_REG_SLEW_SHIFT		3
+#define BCM281XX_I2C_PIN_REG_PULL_UP_STR_MASK	0x0070
+#define BCM281XX_I2C_PIN_REG_PULL_UP_STR_SHIFT	4
+
+/* HDMI pin register */
+#define BCM281XX_HDMI_PIN_REG_INPUT_DIS_MASK	0x0008
+#define BCM281XX_HDMI_PIN_REG_INPUT_DIS_SHIFT	3
+#define BCM281XX_HDMI_PIN_REG_MODE_MASK		0x0010
+#define BCM281XX_HDMI_PIN_REG_MODE_SHIFT	4
+
+/**
+ * bcm281xx_pin_type - types of pin register
+ */
+enum bcm281xx_pin_type {
+	BCM281XX_PIN_TYPE_UNKNOWN = 0,
+	BCM281XX_PIN_TYPE_STD,
+	BCM281XX_PIN_TYPE_I2C,
+	BCM281XX_PIN_TYPE_HDMI,
+};
+
+static enum bcm281xx_pin_type std_pin = BCM281XX_PIN_TYPE_STD;
+static enum bcm281xx_pin_type i2c_pin = BCM281XX_PIN_TYPE_I2C;
+static enum bcm281xx_pin_type hdmi_pin = BCM281XX_PIN_TYPE_HDMI;
+
+/**
+ * bcm281xx_pin_function- define pin function
+ */
+struct bcm281xx_pin_function {
+	const char *name;
+	const char * const *groups;
+	const unsigned ngroups;
+};
+
+/**
+ * bcm281xx_pinctrl_data - Broadcom-specific pinctrl data
+ * @reg_base - base of pinctrl registers
+ */
+struct bcm281xx_pinctrl_data {
+	void __iomem *reg_base;
+
+	/* List of all pins */
+	const struct pinctrl_pin_desc *pins;
+	const unsigned npins;
+
+	const struct bcm281xx_pin_function *functions;
+	const unsigned nfunctions;
+
+	struct regmap *regmap;
+};
+
+/*
+ * Pin number definition.  The order here must be the same as defined in the
+ * PADCTRLREG block in the RDB.
+ */
+#define BCM281XX_PIN_ADCSYNC		0
+#define BCM281XX_PIN_BAT_RM		1
+#define BCM281XX_PIN_BSC1_SCL		2
+#define BCM281XX_PIN_BSC1_SDA		3
+#define BCM281XX_PIN_BSC2_SCL		4
+#define BCM281XX_PIN_BSC2_SDA		5
+#define BCM281XX_PIN_CLASSGPWR		6
+#define BCM281XX_PIN_CLK_CX8		7
+#define BCM281XX_PIN_CLKOUT_0		8
+#define BCM281XX_PIN_CLKOUT_1		9
+#define BCM281XX_PIN_CLKOUT_2		10
+#define BCM281XX_PIN_CLKOUT_3		11
+#define BCM281XX_PIN_CLKREQ_IN_0	12
+#define BCM281XX_PIN_CLKREQ_IN_1	13
+#define BCM281XX_PIN_CWS_SYS_REQ1	14
+#define BCM281XX_PIN_CWS_SYS_REQ2	15
+#define BCM281XX_PIN_CWS_SYS_REQ3	16
+#define BCM281XX_PIN_DIGMIC1_CLK	17
+#define BCM281XX_PIN_DIGMIC1_DQ		18
+#define BCM281XX_PIN_DIGMIC2_CLK	19
+#define BCM281XX_PIN_DIGMIC2_DQ		20
+#define BCM281XX_PIN_GPEN13		21
+#define BCM281XX_PIN_GPEN14		22
+#define BCM281XX_PIN_GPEN15		23
+#define BCM281XX_PIN_GPIO00		24
+#define BCM281XX_PIN_GPIO01		25
+#define BCM281XX_PIN_GPIO02		26
+#define BCM281XX_PIN_GPIO03		27
+#define BCM281XX_PIN_GPIO04		28
+#define BCM281XX_PIN_GPIO05		29
+#define BCM281XX_PIN_GPIO06		30
+#define BCM281XX_PIN_GPIO07		31
+#define BCM281XX_PIN_GPIO08		32
+#define BCM281XX_PIN_GPIO09		33
+#define BCM281XX_PIN_GPIO10		34
+#define BCM281XX_PIN_GPIO11		35
+#define BCM281XX_PIN_GPIO12		36
+#define BCM281XX_PIN_GPIO13		37
+#define BCM281XX_PIN_GPIO14		38
+#define BCM281XX_PIN_GPS_PABLANK	39
+#define BCM281XX_PIN_GPS_TMARK		40
+#define BCM281XX_PIN_HDMI_SCL		41
+#define BCM281XX_PIN_HDMI_SDA		42
+#define BCM281XX_PIN_IC_DM		43
+#define BCM281XX_PIN_IC_DP		44
+#define BCM281XX_PIN_KP_COL_IP_0	45
+#define BCM281XX_PIN_KP_COL_IP_1	46
+#define BCM281XX_PIN_KP_COL_IP_2	47
+#define BCM281XX_PIN_KP_COL_IP_3	48
+#define BCM281XX_PIN_KP_ROW_OP_0	49
+#define BCM281XX_PIN_KP_ROW_OP_1	50
+#define BCM281XX_PIN_KP_ROW_OP_2	51
+#define BCM281XX_PIN_KP_ROW_OP_3	52
+#define BCM281XX_PIN_LCD_B_0		53
+#define BCM281XX_PIN_LCD_B_1		54
+#define BCM281XX_PIN_LCD_B_2		55
+#define BCM281XX_PIN_LCD_B_3		56
+#define BCM281XX_PIN_LCD_B_4		57
+#define BCM281XX_PIN_LCD_B_5		58
+#define BCM281XX_PIN_LCD_B_6		59
+#define BCM281XX_PIN_LCD_B_7		60
+#define BCM281XX_PIN_LCD_G_0		61
+#define BCM281XX_PIN_LCD_G_1		62
+#define BCM281XX_PIN_LCD_G_2		63
+#define BCM281XX_PIN_LCD_G_3		64
+#define BCM281XX_PIN_LCD_G_4		65
+#define BCM281XX_PIN_LCD_G_5		66
+#define BCM281XX_PIN_LCD_G_6		67
+#define BCM281XX_PIN_LCD_G_7		68
+#define BCM281XX_PIN_LCD_HSYNC		69
+#define BCM281XX_PIN_LCD_OE		70
+#define BCM281XX_PIN_LCD_PCLK		71
+#define BCM281XX_PIN_LCD_R_0		72
+#define BCM281XX_PIN_LCD_R_1		73
+#define BCM281XX_PIN_LCD_R_2		74
+#define BCM281XX_PIN_LCD_R_3		75
+#define BCM281XX_PIN_LCD_R_4		76
+#define BCM281XX_PIN_LCD_R_5		77
+#define BCM281XX_PIN_LCD_R_6		78
+#define BCM281XX_PIN_LCD_R_7		79
+#define BCM281XX_PIN_LCD_VSYNC		80
+#define BCM281XX_PIN_MDMGPIO0		81
+#define BCM281XX_PIN_MDMGPIO1		82
+#define BCM281XX_PIN_MDMGPIO2		83
+#define BCM281XX_PIN_MDMGPIO3		84
+#define BCM281XX_PIN_MDMGPIO4		85
+#define BCM281XX_PIN_MDMGPIO5		86
+#define BCM281XX_PIN_MDMGPIO6		87
+#define BCM281XX_PIN_MDMGPIO7		88
+#define BCM281XX_PIN_MDMGPIO8		89
+#define BCM281XX_PIN_MPHI_DATA_0	90
+#define BCM281XX_PIN_MPHI_DATA_1	91
+#define BCM281XX_PIN_MPHI_DATA_2	92
+#define BCM281XX_PIN_MPHI_DATA_3	93
+#define BCM281XX_PIN_MPHI_DATA_4	94
+#define BCM281XX_PIN_MPHI_DATA_5	95
+#define BCM281XX_PIN_MPHI_DATA_6	96
+#define BCM281XX_PIN_MPHI_DATA_7	97
+#define BCM281XX_PIN_MPHI_DATA_8	98
+#define BCM281XX_PIN_MPHI_DATA_9	99
+#define BCM281XX_PIN_MPHI_DATA_10	100
+#define BCM281XX_PIN_MPHI_DATA_11	101
+#define BCM281XX_PIN_MPHI_DATA_12	102
+#define BCM281XX_PIN_MPHI_DATA_13	103
+#define BCM281XX_PIN_MPHI_DATA_14	104
+#define BCM281XX_PIN_MPHI_DATA_15	105
+#define BCM281XX_PIN_MPHI_HA0		106
+#define BCM281XX_PIN_MPHI_HAT0		107
+#define BCM281XX_PIN_MPHI_HAT1		108
+#define BCM281XX_PIN_MPHI_HCE0_N	109
+#define BCM281XX_PIN_MPHI_HCE1_N	110
+#define BCM281XX_PIN_MPHI_HRD_N		111
+#define BCM281XX_PIN_MPHI_HWR_N		112
+#define BCM281XX_PIN_MPHI_RUN0		113
+#define BCM281XX_PIN_MPHI_RUN1		114
+#define BCM281XX_PIN_MTX_SCAN_CLK	115
+#define BCM281XX_PIN_MTX_SCAN_DATA	116
+#define BCM281XX_PIN_NAND_AD_0		117
+#define BCM281XX_PIN_NAND_AD_1		118
+#define BCM281XX_PIN_NAND_AD_2		119
+#define BCM281XX_PIN_NAND_AD_3		120
+#define BCM281XX_PIN_NAND_AD_4		121
+#define BCM281XX_PIN_NAND_AD_5		122
+#define BCM281XX_PIN_NAND_AD_6		123
+#define BCM281XX_PIN_NAND_AD_7		124
+#define BCM281XX_PIN_NAND_ALE		125
+#define BCM281XX_PIN_NAND_CEN_0		126
+#define BCM281XX_PIN_NAND_CEN_1		127
+#define BCM281XX_PIN_NAND_CLE		128
+#define BCM281XX_PIN_NAND_OEN		129
+#define BCM281XX_PIN_NAND_RDY_0		130
+#define BCM281XX_PIN_NAND_RDY_1		131
+#define BCM281XX_PIN_NAND_WEN		132
+#define BCM281XX_PIN_NAND_WP		133
+#define BCM281XX_PIN_PC1		134
+#define BCM281XX_PIN_PC2		135
+#define BCM281XX_PIN_PMU_INT		136
+#define BCM281XX_PIN_PMU_SCL		137
+#define BCM281XX_PIN_PMU_SDA		138
+#define BCM281XX_PIN_RFST2G_MTSLOTEN3G	139
+#define BCM281XX_PIN_RGMII_0_RX_CTL	140
+#define BCM281XX_PIN_RGMII_0_RXC	141
+#define BCM281XX_PIN_RGMII_0_RXD_0	142
+#define BCM281XX_PIN_RGMII_0_RXD_1	143
+#define BCM281XX_PIN_RGMII_0_RXD_2	144
+#define BCM281XX_PIN_RGMII_0_RXD_3	145
+#define BCM281XX_PIN_RGMII_0_TX_CTL	146
+#define BCM281XX_PIN_RGMII_0_TXC	147
+#define BCM281XX_PIN_RGMII_0_TXD_0	148
+#define BCM281XX_PIN_RGMII_0_TXD_1	149
+#define BCM281XX_PIN_RGMII_0_TXD_2	150
+#define BCM281XX_PIN_RGMII_0_TXD_3	151
+#define BCM281XX_PIN_RGMII_1_RX_CTL	152
+#define BCM281XX_PIN_RGMII_1_RXC	153
+#define BCM281XX_PIN_RGMII_1_RXD_0	154
+#define BCM281XX_PIN_RGMII_1_RXD_1	155
+#define BCM281XX_PIN_RGMII_1_RXD_2	156
+#define BCM281XX_PIN_RGMII_1_RXD_3	157
+#define BCM281XX_PIN_RGMII_1_TX_CTL	158
+#define BCM281XX_PIN_RGMII_1_TXC	159
+#define BCM281XX_PIN_RGMII_1_TXD_0	160
+#define BCM281XX_PIN_RGMII_1_TXD_1	161
+#define BCM281XX_PIN_RGMII_1_TXD_2	162
+#define BCM281XX_PIN_RGMII_1_TXD_3	163
+#define BCM281XX_PIN_RGMII_GPIO_0	164
+#define BCM281XX_PIN_RGMII_GPIO_1	165
+#define BCM281XX_PIN_RGMII_GPIO_2	166
+#define BCM281XX_PIN_RGMII_GPIO_3	167
+#define BCM281XX_PIN_RTXDATA2G_TXDATA3G1	168
+#define BCM281XX_PIN_RTXEN2G_TXDATA3G2	169
+#define BCM281XX_PIN_RXDATA3G0		170
+#define BCM281XX_PIN_RXDATA3G1		171
+#define BCM281XX_PIN_RXDATA3G2		172
+#define BCM281XX_PIN_SDIO1_CLK		173
+#define BCM281XX_PIN_SDIO1_CMD		174
+#define BCM281XX_PIN_SDIO1_DATA_0	175
+#define BCM281XX_PIN_SDIO1_DATA_1	176
+#define BCM281XX_PIN_SDIO1_DATA_2	177
+#define BCM281XX_PIN_SDIO1_DATA_3	178
+#define BCM281XX_PIN_SDIO4_CLK		179
+#define BCM281XX_PIN_SDIO4_CMD		180
+#define BCM281XX_PIN_SDIO4_DATA_0	181
+#define BCM281XX_PIN_SDIO4_DATA_1	182
+#define BCM281XX_PIN_SDIO4_DATA_2	183
+#define BCM281XX_PIN_SDIO4_DATA_3	184
+#define BCM281XX_PIN_SIM_CLK		185
+#define BCM281XX_PIN_SIM_DATA		186
+#define BCM281XX_PIN_SIM_DET		187
+#define BCM281XX_PIN_SIM_RESETN		188
+#define BCM281XX_PIN_SIM2_CLK		189
+#define BCM281XX_PIN_SIM2_DATA		190
+#define BCM281XX_PIN_SIM2_DET		191
+#define BCM281XX_PIN_SIM2_RESETN	192
+#define BCM281XX_PIN_SRI_C		193
+#define BCM281XX_PIN_SRI_D		194
+#define BCM281XX_PIN_SRI_E		195
+#define BCM281XX_PIN_SSP_EXTCLK		196
+#define BCM281XX_PIN_SSP0_CLK		197
+#define BCM281XX_PIN_SSP0_FS		198
+#define BCM281XX_PIN_SSP0_RXD		199
+#define BCM281XX_PIN_SSP0_TXD		200
+#define BCM281XX_PIN_SSP2_CLK		201
+#define BCM281XX_PIN_SSP2_FS_0		202
+#define BCM281XX_PIN_SSP2_FS_1		203
+#define BCM281XX_PIN_SSP2_FS_2		204
+#define BCM281XX_PIN_SSP2_FS_3		205
+#define BCM281XX_PIN_SSP2_RXD_0		206
+#define BCM281XX_PIN_SSP2_RXD_1		207
+#define BCM281XX_PIN_SSP2_TXD_0		208
+#define BCM281XX_PIN_SSP2_TXD_1		209
+#define BCM281XX_PIN_SSP3_CLK		210
+#define BCM281XX_PIN_SSP3_FS		211
+#define BCM281XX_PIN_SSP3_RXD		212
+#define BCM281XX_PIN_SSP3_TXD		213
+#define BCM281XX_PIN_SSP4_CLK		214
+#define BCM281XX_PIN_SSP4_FS		215
+#define BCM281XX_PIN_SSP4_RXD		216
+#define BCM281XX_PIN_SSP4_TXD		217
+#define BCM281XX_PIN_SSP5_CLK		218
+#define BCM281XX_PIN_SSP5_FS		219
+#define BCM281XX_PIN_SSP5_RXD		220
+#define BCM281XX_PIN_SSP5_TXD		221
+#define BCM281XX_PIN_SSP6_CLK		222
+#define BCM281XX_PIN_SSP6_FS		223
+#define BCM281XX_PIN_SSP6_RXD		224
+#define BCM281XX_PIN_SSP6_TXD		225
+#define BCM281XX_PIN_STAT_1		226
+#define BCM281XX_PIN_STAT_2		227
+#define BCM281XX_PIN_SYSCLKEN		228
+#define BCM281XX_PIN_TRACECLK		229
+#define BCM281XX_PIN_TRACEDT00		230
+#define BCM281XX_PIN_TRACEDT01		231
+#define BCM281XX_PIN_TRACEDT02		232
+#define BCM281XX_PIN_TRACEDT03		233
+#define BCM281XX_PIN_TRACEDT04		234
+#define BCM281XX_PIN_TRACEDT05		235
+#define BCM281XX_PIN_TRACEDT06		236
+#define BCM281XX_PIN_TRACEDT07		237
+#define BCM281XX_PIN_TRACEDT08		238
+#define BCM281XX_PIN_TRACEDT09		239
+#define BCM281XX_PIN_TRACEDT10		240
+#define BCM281XX_PIN_TRACEDT11		241
+#define BCM281XX_PIN_TRACEDT12		242
+#define BCM281XX_PIN_TRACEDT13		243
+#define BCM281XX_PIN_TRACEDT14		244
+#define BCM281XX_PIN_TRACEDT15		245
+#define BCM281XX_PIN_TXDATA3G0		246
+#define BCM281XX_PIN_TXPWRIND		247
+#define BCM281XX_PIN_UARTB1_UCTS	248
+#define BCM281XX_PIN_UARTB1_URTS	249
+#define BCM281XX_PIN_UARTB1_URXD	250
+#define BCM281XX_PIN_UARTB1_UTXD	251
+#define BCM281XX_PIN_UARTB2_URXD	252
+#define BCM281XX_PIN_UARTB2_UTXD	253
+#define BCM281XX_PIN_UARTB3_UCTS	254
+#define BCM281XX_PIN_UARTB3_URTS	255
+#define BCM281XX_PIN_UARTB3_URXD	256
+#define BCM281XX_PIN_UARTB3_UTXD	257
+#define BCM281XX_PIN_UARTB4_UCTS	258
+#define BCM281XX_PIN_UARTB4_URTS	259
+#define BCM281XX_PIN_UARTB4_URXD	260
+#define BCM281XX_PIN_UARTB4_UTXD	261
+#define BCM281XX_PIN_VC_CAM1_SCL	262
+#define BCM281XX_PIN_VC_CAM1_SDA	263
+#define BCM281XX_PIN_VC_CAM2_SCL	264
+#define BCM281XX_PIN_VC_CAM2_SDA	265
+#define BCM281XX_PIN_VC_CAM3_SCL	266
+#define BCM281XX_PIN_VC_CAM3_SDA	267
+
+#define BCM281XX_PIN_DESC(a, b, c) \
+	{ .number = a, .name = b, .drv_data = &c##_pin }
+
+/*
+ * Pin description definition.  The order here must be the same as defined in
+ * the PADCTRLREG block in the RDB, since the pin number is used as an index
+ * into this array.
+ */
+static const struct pinctrl_pin_desc bcm281xx_pinctrl_pins[] = {
+	BCM281XX_PIN_DESC(BCM281XX_PIN_ADCSYNC, "adcsync", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_BAT_RM, "bat_rm", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_BSC1_SCL, "bsc1_scl", i2c),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_BSC1_SDA, "bsc1_sda", i2c),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_BSC2_SCL, "bsc2_scl", i2c),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_BSC2_SDA, "bsc2_sda", i2c),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_CLASSGPWR, "classgpwr", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_CLK_CX8, "clk_cx8", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_CLKOUT_0, "clkout_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_CLKOUT_1, "clkout_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_CLKOUT_2, "clkout_2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_CLKOUT_3, "clkout_3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_CLKREQ_IN_0, "clkreq_in_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_CLKREQ_IN_1, "clkreq_in_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_CWS_SYS_REQ1, "cws_sys_req1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_CWS_SYS_REQ2, "cws_sys_req2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_CWS_SYS_REQ3, "cws_sys_req3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_DIGMIC1_CLK, "digmic1_clk", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_DIGMIC1_DQ, "digmic1_dq", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_DIGMIC2_CLK, "digmic2_clk", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_DIGMIC2_DQ, "digmic2_dq", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPEN13, "gpen13", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPEN14, "gpen14", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPEN15, "gpen15", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO00, "gpio00", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO01, "gpio01", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO02, "gpio02", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO03, "gpio03", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO04, "gpio04", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO05, "gpio05", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO06, "gpio06", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO07, "gpio07", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO08, "gpio08", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO09, "gpio09", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO10, "gpio10", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO11, "gpio11", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO12, "gpio12", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO13, "gpio13", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO14, "gpio14", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPS_PABLANK, "gps_pablank", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_GPS_TMARK, "gps_tmark", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_HDMI_SCL, "hdmi_scl", hdmi),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_HDMI_SDA, "hdmi_sda", hdmi),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_IC_DM, "ic_dm", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_IC_DP, "ic_dp", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_KP_COL_IP_0, "kp_col_ip_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_KP_COL_IP_1, "kp_col_ip_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_KP_COL_IP_2, "kp_col_ip_2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_KP_COL_IP_3, "kp_col_ip_3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_KP_ROW_OP_0, "kp_row_op_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_KP_ROW_OP_1, "kp_row_op_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_KP_ROW_OP_2, "kp_row_op_2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_KP_ROW_OP_3, "kp_row_op_3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_B_0, "lcd_b_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_B_1, "lcd_b_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_B_2, "lcd_b_2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_B_3, "lcd_b_3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_B_4, "lcd_b_4", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_B_5, "lcd_b_5", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_B_6, "lcd_b_6", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_B_7, "lcd_b_7", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_G_0, "lcd_g_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_G_1, "lcd_g_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_G_2, "lcd_g_2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_G_3, "lcd_g_3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_G_4, "lcd_g_4", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_G_5, "lcd_g_5", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_G_6, "lcd_g_6", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_G_7, "lcd_g_7", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_HSYNC, "lcd_hsync", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_OE, "lcd_oe", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_PCLK, "lcd_pclk", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_R_0, "lcd_r_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_R_1, "lcd_r_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_R_2, "lcd_r_2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_R_3, "lcd_r_3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_R_4, "lcd_r_4", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_R_5, "lcd_r_5", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_R_6, "lcd_r_6", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_R_7, "lcd_r_7", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_VSYNC, "lcd_vsync", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO0, "mdmgpio0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO1, "mdmgpio1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO2, "mdmgpio2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO3, "mdmgpio3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO4, "mdmgpio4", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO5, "mdmgpio5", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO6, "mdmgpio6", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO7, "mdmgpio7", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO8, "mdmgpio8", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_0, "mphi_data_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_1, "mphi_data_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_2, "mphi_data_2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_3, "mphi_data_3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_4, "mphi_data_4", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_5, "mphi_data_5", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_6, "mphi_data_6", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_7, "mphi_data_7", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_8, "mphi_data_8", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_9, "mphi_data_9", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_10, "mphi_data_10", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_11, "mphi_data_11", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_12, "mphi_data_12", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_13, "mphi_data_13", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_14, "mphi_data_14", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_15, "mphi_data_15", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_HA0, "mphi_ha0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_HAT0, "mphi_hat0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_HAT1, "mphi_hat1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_HCE0_N, "mphi_hce0_n", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_HCE1_N, "mphi_hce1_n", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_HRD_N, "mphi_hrd_n", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_HWR_N, "mphi_hwr_n", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_RUN0, "mphi_run0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_RUN1, "mphi_run1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MTX_SCAN_CLK, "mtx_scan_clk", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_MTX_SCAN_DATA, "mtx_scan_data", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_AD_0, "nand_ad_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_AD_1, "nand_ad_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_AD_2, "nand_ad_2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_AD_3, "nand_ad_3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_AD_4, "nand_ad_4", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_AD_5, "nand_ad_5", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_AD_6, "nand_ad_6", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_AD_7, "nand_ad_7", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_ALE, "nand_ale", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_CEN_0, "nand_cen_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_CEN_1, "nand_cen_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_CLE, "nand_cle", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_OEN, "nand_oen", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_RDY_0, "nand_rdy_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_RDY_1, "nand_rdy_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_WEN, "nand_wen", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_WP, "nand_wp", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_PC1, "pc1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_PC2, "pc2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_PMU_INT, "pmu_int", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_PMU_SCL, "pmu_scl", i2c),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_PMU_SDA, "pmu_sda", i2c),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RFST2G_MTSLOTEN3G, "rfst2g_mtsloten3g",
+		std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_RX_CTL, "rgmii_0_rx_ctl", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_RXC, "rgmii_0_rxc", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_RXD_0, "rgmii_0_rxd_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_RXD_1, "rgmii_0_rxd_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_RXD_2, "rgmii_0_rxd_2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_RXD_3, "rgmii_0_rxd_3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_TX_CTL, "rgmii_0_tx_ctl", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_TXC, "rgmii_0_txc", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_TXD_0, "rgmii_0_txd_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_TXD_1, "rgmii_0_txd_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_TXD_2, "rgmii_0_txd_2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_TXD_3, "rgmii_0_txd_3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_RX_CTL, "rgmii_1_rx_ctl", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_RXC, "rgmii_1_rxc", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_RXD_0, "rgmii_1_rxd_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_RXD_1, "rgmii_1_rxd_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_RXD_2, "rgmii_1_rxd_2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_RXD_3, "rgmii_1_rxd_3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_TX_CTL, "rgmii_1_tx_ctl", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_TXC, "rgmii_1_txc", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_TXD_0, "rgmii_1_txd_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_TXD_1, "rgmii_1_txd_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_TXD_2, "rgmii_1_txd_2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_TXD_3, "rgmii_1_txd_3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_GPIO_0, "rgmii_gpio_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_GPIO_1, "rgmii_gpio_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_GPIO_2, "rgmii_gpio_2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_GPIO_3, "rgmii_gpio_3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RTXDATA2G_TXDATA3G1,
+		"rtxdata2g_txdata3g1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RTXEN2G_TXDATA3G2, "rtxen2g_txdata3g2",
+		std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RXDATA3G0, "rxdata3g0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RXDATA3G1, "rxdata3g1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_RXDATA3G2, "rxdata3g2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO1_CLK, "sdio1_clk", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO1_CMD, "sdio1_cmd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO1_DATA_0, "sdio1_data_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO1_DATA_1, "sdio1_data_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO1_DATA_2, "sdio1_data_2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO1_DATA_3, "sdio1_data_3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO4_CLK, "sdio4_clk", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO4_CMD, "sdio4_cmd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO4_DATA_0, "sdio4_data_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO4_DATA_1, "sdio4_data_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO4_DATA_2, "sdio4_data_2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO4_DATA_3, "sdio4_data_3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SIM_CLK, "sim_clk", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SIM_DATA, "sim_data", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SIM_DET, "sim_det", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SIM_RESETN, "sim_resetn", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SIM2_CLK, "sim2_clk", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SIM2_DATA, "sim2_data", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SIM2_DET, "sim2_det", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SIM2_RESETN, "sim2_resetn", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SRI_C, "sri_c", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SRI_D, "sri_d", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SRI_E, "sri_e", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP_EXTCLK, "ssp_extclk", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP0_CLK, "ssp0_clk", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP0_FS, "ssp0_fs", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP0_RXD, "ssp0_rxd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP0_TXD, "ssp0_txd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_CLK, "ssp2_clk", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_FS_0, "ssp2_fs_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_FS_1, "ssp2_fs_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_FS_2, "ssp2_fs_2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_FS_3, "ssp2_fs_3", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_RXD_0, "ssp2_rxd_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_RXD_1, "ssp2_rxd_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_TXD_0, "ssp2_txd_0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_TXD_1, "ssp2_txd_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP3_CLK, "ssp3_clk", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP3_FS, "ssp3_fs", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP3_RXD, "ssp3_rxd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP3_TXD, "ssp3_txd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP4_CLK, "ssp4_clk", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP4_FS, "ssp4_fs", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP4_RXD, "ssp4_rxd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP4_TXD, "ssp4_txd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP5_CLK, "ssp5_clk", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP5_FS, "ssp5_fs", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP5_RXD, "ssp5_rxd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP5_TXD, "ssp5_txd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP6_CLK, "ssp6_clk", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP6_FS, "ssp6_fs", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP6_RXD, "ssp6_rxd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP6_TXD, "ssp6_txd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_STAT_1, "stat_1", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_STAT_2, "stat_2", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_SYSCLKEN, "sysclken", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACECLK, "traceclk", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT00, "tracedt00", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT01, "tracedt01", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT02, "tracedt02", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT03, "tracedt03", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT04, "tracedt04", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT05, "tracedt05", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT06, "tracedt06", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT07, "tracedt07", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT08, "tracedt08", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT09, "tracedt09", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT10, "tracedt10", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT11, "tracedt11", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT12, "tracedt12", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT13, "tracedt13", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT14, "tracedt14", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT15, "tracedt15", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TXDATA3G0, "txdata3g0", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_TXPWRIND, "txpwrind", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB1_UCTS, "uartb1_ucts", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB1_URTS, "uartb1_urts", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB1_URXD, "uartb1_urxd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB1_UTXD, "uartb1_utxd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB2_URXD, "uartb2_urxd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB2_UTXD, "uartb2_utxd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB3_UCTS, "uartb3_ucts", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB3_URTS, "uartb3_urts", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB3_URXD, "uartb3_urxd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB3_UTXD, "uartb3_utxd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB4_UCTS, "uartb4_ucts", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB4_URTS, "uartb4_urts", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB4_URXD, "uartb4_urxd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB4_UTXD, "uartb4_utxd", std),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_VC_CAM1_SCL, "vc_cam1_scl", i2c),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_VC_CAM1_SDA, "vc_cam1_sda", i2c),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_VC_CAM2_SCL, "vc_cam2_scl", i2c),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_VC_CAM2_SDA, "vc_cam2_sda", i2c),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_VC_CAM3_SCL, "vc_cam3_scl", i2c),
+	BCM281XX_PIN_DESC(BCM281XX_PIN_VC_CAM3_SDA, "vc_cam3_sda", i2c),
+};
+
+static const char * const bcm281xx_alt_groups[] = {
+	"adcsync",
+	"bat_rm",
+	"bsc1_scl",
+	"bsc1_sda",
+	"bsc2_scl",
+	"bsc2_sda",
+	"classgpwr",
+	"clk_cx8",
+	"clkout_0",
+	"clkout_1",
+	"clkout_2",
+	"clkout_3",
+	"clkreq_in_0",
+	"clkreq_in_1",
+	"cws_sys_req1",
+	"cws_sys_req2",
+	"cws_sys_req3",
+	"digmic1_clk",
+	"digmic1_dq",
+	"digmic2_clk",
+	"digmic2_dq",
+	"gpen13",
+	"gpen14",
+	"gpen15",
+	"gpio00",
+	"gpio01",
+	"gpio02",
+	"gpio03",
+	"gpio04",
+	"gpio05",
+	"gpio06",
+	"gpio07",
+	"gpio08",
+	"gpio09",
+	"gpio10",
+	"gpio11",
+	"gpio12",
+	"gpio13",
+	"gpio14",
+	"gps_pablank",
+	"gps_tmark",
+	"hdmi_scl",
+	"hdmi_sda",
+	"ic_dm",
+	"ic_dp",
+	"kp_col_ip_0",
+	"kp_col_ip_1",
+	"kp_col_ip_2",
+	"kp_col_ip_3",
+	"kp_row_op_0",
+	"kp_row_op_1",
+	"kp_row_op_2",
+	"kp_row_op_3",
+	"lcd_b_0",
+	"lcd_b_1",
+	"lcd_b_2",
+	"lcd_b_3",
+	"lcd_b_4",
+	"lcd_b_5",
+	"lcd_b_6",
+	"lcd_b_7",
+	"lcd_g_0",
+	"lcd_g_1",
+	"lcd_g_2",
+	"lcd_g_3",
+	"lcd_g_4",
+	"lcd_g_5",
+	"lcd_g_6",
+	"lcd_g_7",
+	"lcd_hsync",
+	"lcd_oe",
+	"lcd_pclk",
+	"lcd_r_0",
+	"lcd_r_1",
+	"lcd_r_2",
+	"lcd_r_3",
+	"lcd_r_4",
+	"lcd_r_5",
+	"lcd_r_6",
+	"lcd_r_7",
+	"lcd_vsync",
+	"mdmgpio0",
+	"mdmgpio1",
+	"mdmgpio2",
+	"mdmgpio3",
+	"mdmgpio4",
+	"mdmgpio5",
+	"mdmgpio6",
+	"mdmgpio7",
+	"mdmgpio8",
+	"mphi_data_0",
+	"mphi_data_1",
+	"mphi_data_2",
+	"mphi_data_3",
+	"mphi_data_4",
+	"mphi_data_5",
+	"mphi_data_6",
+	"mphi_data_7",
+	"mphi_data_8",
+	"mphi_data_9",
+	"mphi_data_10",
+	"mphi_data_11",
+	"mphi_data_12",
+	"mphi_data_13",
+	"mphi_data_14",
+	"mphi_data_15",
+	"mphi_ha0",
+	"mphi_hat0",
+	"mphi_hat1",
+	"mphi_hce0_n",
+	"mphi_hce1_n",
+	"mphi_hrd_n",
+	"mphi_hwr_n",
+	"mphi_run0",
+	"mphi_run1",
+	"mtx_scan_clk",
+	"mtx_scan_data",
+	"nand_ad_0",
+	"nand_ad_1",
+	"nand_ad_2",
+	"nand_ad_3",
+	"nand_ad_4",
+	"nand_ad_5",
+	"nand_ad_6",
+	"nand_ad_7",
+	"nand_ale",
+	"nand_cen_0",
+	"nand_cen_1",
+	"nand_cle",
+	"nand_oen",
+	"nand_rdy_0",
+	"nand_rdy_1",
+	"nand_wen",
+	"nand_wp",
+	"pc1",
+	"pc2",
+	"pmu_int",
+	"pmu_scl",
+	"pmu_sda",
+	"rfst2g_mtsloten3g",
+	"rgmii_0_rx_ctl",
+	"rgmii_0_rxc",
+	"rgmii_0_rxd_0",
+	"rgmii_0_rxd_1",
+	"rgmii_0_rxd_2",
+	"rgmii_0_rxd_3",
+	"rgmii_0_tx_ctl",
+	"rgmii_0_txc",
+	"rgmii_0_txd_0",
+	"rgmii_0_txd_1",
+	"rgmii_0_txd_2",
+	"rgmii_0_txd_3",
+	"rgmii_1_rx_ctl",
+	"rgmii_1_rxc",
+	"rgmii_1_rxd_0",
+	"rgmii_1_rxd_1",
+	"rgmii_1_rxd_2",
+	"rgmii_1_rxd_3",
+	"rgmii_1_tx_ctl",
+	"rgmii_1_txc",
+	"rgmii_1_txd_0",
+	"rgmii_1_txd_1",
+	"rgmii_1_txd_2",
+	"rgmii_1_txd_3",
+	"rgmii_gpio_0",
+	"rgmii_gpio_1",
+	"rgmii_gpio_2",
+	"rgmii_gpio_3",
+	"rtxdata2g_txdata3g1",
+	"rtxen2g_txdata3g2",
+	"rxdata3g0",
+	"rxdata3g1",
+	"rxdata3g2",
+	"sdio1_clk",
+	"sdio1_cmd",
+	"sdio1_data_0",
+	"sdio1_data_1",
+	"sdio1_data_2",
+	"sdio1_data_3",
+	"sdio4_clk",
+	"sdio4_cmd",
+	"sdio4_data_0",
+	"sdio4_data_1",
+	"sdio4_data_2",
+	"sdio4_data_3",
+	"sim_clk",
+	"sim_data",
+	"sim_det",
+	"sim_resetn",
+	"sim2_clk",
+	"sim2_data",
+	"sim2_det",
+	"sim2_resetn",
+	"sri_c",
+	"sri_d",
+	"sri_e",
+	"ssp_extclk",
+	"ssp0_clk",
+	"ssp0_fs",
+	"ssp0_rxd",
+	"ssp0_txd",
+	"ssp2_clk",
+	"ssp2_fs_0",
+	"ssp2_fs_1",
+	"ssp2_fs_2",
+	"ssp2_fs_3",
+	"ssp2_rxd_0",
+	"ssp2_rxd_1",
+	"ssp2_txd_0",
+	"ssp2_txd_1",
+	"ssp3_clk",
+	"ssp3_fs",
+	"ssp3_rxd",
+	"ssp3_txd",
+	"ssp4_clk",
+	"ssp4_fs",
+	"ssp4_rxd",
+	"ssp4_txd",
+	"ssp5_clk",
+	"ssp5_fs",
+	"ssp5_rxd",
+	"ssp5_txd",
+	"ssp6_clk",
+	"ssp6_fs",
+	"ssp6_rxd",
+	"ssp6_txd",
+	"stat_1",
+	"stat_2",
+	"sysclken",
+	"traceclk",
+	"tracedt00",
+	"tracedt01",
+	"tracedt02",
+	"tracedt03",
+	"tracedt04",
+	"tracedt05",
+	"tracedt06",
+	"tracedt07",
+	"tracedt08",
+	"tracedt09",
+	"tracedt10",
+	"tracedt11",
+	"tracedt12",
+	"tracedt13",
+	"tracedt14",
+	"tracedt15",
+	"txdata3g0",
+	"txpwrind",
+	"uartb1_ucts",
+	"uartb1_urts",
+	"uartb1_urxd",
+	"uartb1_utxd",
+	"uartb2_urxd",
+	"uartb2_utxd",
+	"uartb3_ucts",
+	"uartb3_urts",
+	"uartb3_urxd",
+	"uartb3_utxd",
+	"uartb4_ucts",
+	"uartb4_urts",
+	"uartb4_urxd",
+	"uartb4_utxd",
+	"vc_cam1_scl",
+	"vc_cam1_sda",
+	"vc_cam2_scl",
+	"vc_cam2_sda",
+	"vc_cam3_scl",
+	"vc_cam3_sda",
+};
+
+/* Every pin can implement all ALT1-ALT4 functions */
+#define BCM281XX_PIN_FUNCTION(fcn_name)			\
+{							\
+	.name = #fcn_name,				\
+	.groups = bcm281xx_alt_groups,			\
+	.ngroups = ARRAY_SIZE(bcm281xx_alt_groups),	\
+}
+
+static const struct bcm281xx_pin_function bcm281xx_functions[] = {
+	BCM281XX_PIN_FUNCTION(alt1),
+	BCM281XX_PIN_FUNCTION(alt2),
+	BCM281XX_PIN_FUNCTION(alt3),
+	BCM281XX_PIN_FUNCTION(alt4),
+};
+
+static struct bcm281xx_pinctrl_data bcm281xx_pinctrl = {
+	.pins = bcm281xx_pinctrl_pins,
+	.npins = ARRAY_SIZE(bcm281xx_pinctrl_pins),
+	.functions = bcm281xx_functions,
+	.nfunctions = ARRAY_SIZE(bcm281xx_functions),
+};
+
+static inline enum bcm281xx_pin_type pin_type_get(struct pinctrl_dev *pctldev,
+						  unsigned pin)
+{
+	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+
+	if (pin >= pdata->npins)
+		return BCM281XX_PIN_TYPE_UNKNOWN;
+
+	return *(enum bcm281xx_pin_type *)(pdata->pins[pin].drv_data);
+}
+
+#define BCM281XX_PIN_SHIFT(type, param) \
+	(BCM281XX_ ## type ## _PIN_REG_ ## param ## _SHIFT)
+
+#define BCM281XX_PIN_MASK(type, param) \
+	(BCM281XX_ ## type ## _PIN_REG_ ## param ## _MASK)
+
+/*
+ * This helper function is used to build up the value and mask used to write to
+ * a pin register, but does not actually write to the register.
+ */
+static inline void bcm281xx_pin_update(u32 *reg_val, u32 *reg_mask,
+				       u32 param_val, u32 param_shift,
+				       u32 param_mask)
+{
+	*reg_val &= ~param_mask;
+	*reg_val |= (param_val << param_shift) & param_mask;
+	*reg_mask |= param_mask;
+}
+
+static struct regmap_config bcm281xx_pinctrl_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = BCM281XX_PIN_VC_CAM3_SDA,
+};
+
+static int bcm281xx_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+
+	return pdata->npins;
+}
+
+static const char *bcm281xx_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
+						   unsigned group)
+{
+	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+
+	return pdata->pins[group].name;
+}
+
+static int bcm281xx_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
+					   unsigned group,
+					   const unsigned **pins,
+					   unsigned *num_pins)
+{
+	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = &pdata->pins[group].number;
+	*num_pins = 1;
+
+	return 0;
+}
+
+static void bcm281xx_pinctrl_pin_dbg_show(struct pinctrl_dev *pctldev,
+					  struct seq_file *s,
+					  unsigned offset)
+{
+	seq_printf(s, " %s", dev_name(pctldev->dev));
+}
+
+static struct pinctrl_ops bcm281xx_pinctrl_ops = {
+	.get_groups_count = bcm281xx_pinctrl_get_groups_count,
+	.get_group_name = bcm281xx_pinctrl_get_group_name,
+	.get_group_pins = bcm281xx_pinctrl_get_group_pins,
+	.pin_dbg_show = bcm281xx_pinctrl_pin_dbg_show,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
+	.dt_free_map = pinctrl_utils_dt_free_map,
+};
+
+static int bcm281xx_pinctrl_get_fcns_count(struct pinctrl_dev *pctldev)
+{
+	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+
+	return pdata->nfunctions;
+}
+
+static const char *bcm281xx_pinctrl_get_fcn_name(struct pinctrl_dev *pctldev,
+						 unsigned function)
+{
+	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+
+	return pdata->functions[function].name;
+}
+
+static int bcm281xx_pinctrl_get_fcn_groups(struct pinctrl_dev *pctldev,
+					   unsigned function,
+					   const char * const **groups,
+					   unsigned * const num_groups)
+{
+	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = pdata->functions[function].groups;
+	*num_groups = pdata->functions[function].ngroups;
+
+	return 0;
+}
+
+static int bcm281xx_pinmux_set(struct pinctrl_dev *pctldev,
+			       unsigned function,
+			       unsigned group)
+{
+	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	const struct bcm281xx_pin_function *f = &pdata->functions[function];
+	u32 offset = 4 * pdata->pins[group].number;
+	int rc = 0;
+
+	dev_dbg(pctldev->dev,
+		"%s(): Enable function %s (%d) of pin %s (%d) @offset 0x%x.\n",
+		__func__, f->name, function, pdata->pins[group].name,
+		pdata->pins[group].number, offset);
+
+	rc = regmap_update_bits(pdata->regmap, offset,
+		BCM281XX_PIN_REG_F_SEL_MASK,
+		function << BCM281XX_PIN_REG_F_SEL_SHIFT);
+	if (rc)
+		dev_err(pctldev->dev,
+			"Error updating register for pin %s (%d).\n",
+			pdata->pins[group].name, pdata->pins[group].number);
+
+	return rc;
+}
+
+static struct pinmux_ops bcm281xx_pinctrl_pinmux_ops = {
+	.get_functions_count = bcm281xx_pinctrl_get_fcns_count,
+	.get_function_name = bcm281xx_pinctrl_get_fcn_name,
+	.get_function_groups = bcm281xx_pinctrl_get_fcn_groups,
+	.set_mux = bcm281xx_pinmux_set,
+};
+
+static int bcm281xx_pinctrl_pin_config_get(struct pinctrl_dev *pctldev,
+					   unsigned pin,
+					   unsigned long *config)
+{
+	return -ENOTSUPP;
+}
+
+
+/* Goes through the configs and update register val/mask */
+static int bcm281xx_std_pin_update(struct pinctrl_dev *pctldev,
+				   unsigned pin,
+				   unsigned long *configs,
+				   unsigned num_configs,
+				   u32 *val,
+				   u32 *mask)
+{
+	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	int i;
+	enum pin_config_param param;
+	u16 arg;
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			arg = (arg >= 1 ? 1 : 0);
+			bcm281xx_pin_update(val, mask, arg,
+				BCM281XX_PIN_SHIFT(STD, HYST),
+				BCM281XX_PIN_MASK(STD, HYST));
+			break;
+		/*
+		 * The pin bias can only be one of pull-up, pull-down, or
+		 * disable.  The user does not need to specify a value for the
+		 * property, and the default value from pinconf-generic is
+		 * ignored.
+		 */
+		case PIN_CONFIG_BIAS_DISABLE:
+			bcm281xx_pin_update(val, mask, 0,
+				BCM281XX_PIN_SHIFT(STD, PULL_UP),
+				BCM281XX_PIN_MASK(STD, PULL_UP));
+			bcm281xx_pin_update(val, mask, 0,
+				BCM281XX_PIN_SHIFT(STD, PULL_DN),
+				BCM281XX_PIN_MASK(STD, PULL_DN));
+			break;
+
+		case PIN_CONFIG_BIAS_PULL_UP:
+			bcm281xx_pin_update(val, mask, 1,
+				BCM281XX_PIN_SHIFT(STD, PULL_UP),
+				BCM281XX_PIN_MASK(STD, PULL_UP));
+			bcm281xx_pin_update(val, mask, 0,
+				BCM281XX_PIN_SHIFT(STD, PULL_DN),
+				BCM281XX_PIN_MASK(STD, PULL_DN));
+			break;
+
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			bcm281xx_pin_update(val, mask, 0,
+				BCM281XX_PIN_SHIFT(STD, PULL_UP),
+				BCM281XX_PIN_MASK(STD, PULL_UP));
+			bcm281xx_pin_update(val, mask, 1,
+				BCM281XX_PIN_SHIFT(STD, PULL_DN),
+				BCM281XX_PIN_MASK(STD, PULL_DN));
+			break;
+
+		case PIN_CONFIG_SLEW_RATE:
+			arg = (arg >= 1 ? 1 : 0);
+			bcm281xx_pin_update(val, mask, arg,
+				BCM281XX_PIN_SHIFT(STD, SLEW),
+				BCM281XX_PIN_MASK(STD, SLEW));
+			break;
+
+		case PIN_CONFIG_INPUT_ENABLE:
+			/* inversed since register is for input _disable_ */
+			arg = (arg >= 1 ? 0 : 1);
+			bcm281xx_pin_update(val, mask, arg,
+				BCM281XX_PIN_SHIFT(STD, INPUT_DIS),
+				BCM281XX_PIN_MASK(STD, INPUT_DIS));
+			break;
+
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			/* Valid range is 2-16 mA, even numbers only */
+			if ((arg < 2) || (arg > 16) || (arg % 2)) {
+				dev_err(pctldev->dev,
+					"Invalid Drive Strength value (%d) for "
+					"pin %s (%d). Valid values are "
+					"(2..16) mA, even numbers only.\n",
+					arg, pdata->pins[pin].name, pin);
+				return -EINVAL;
+			}
+			bcm281xx_pin_update(val, mask, (arg/2)-1,
+				BCM281XX_PIN_SHIFT(STD, DRV_STR),
+				BCM281XX_PIN_MASK(STD, DRV_STR));
+			break;
+
+		default:
+			dev_err(pctldev->dev,
+				"Unrecognized pin config %d for pin %s (%d).\n",
+				param, pdata->pins[pin].name, pin);
+			return -EINVAL;
+
+		} /* switch config */
+	} /* for each config */
+
+	return 0;
+}
+
+/*
+ * The pull-up strength for an I2C pin is represented by bits 4-6 in the
+ * register with the following mapping:
+ *   0b000: No pull-up
+ *   0b001: 1200 Ohm
+ *   0b010: 1800 Ohm
+ *   0b011: 720 Ohm
+ *   0b100: 2700 Ohm
+ *   0b101: 831 Ohm
+ *   0b110: 1080 Ohm
+ *   0b111: 568 Ohm
+ * This array maps pull-up strength in Ohms to register values (1+index).
+ */
+static const u16 bcm281xx_pullup_map[] = {
+	1200, 1800, 720, 2700, 831, 1080, 568
+};
+
+/* Goes through the configs and update register val/mask */
+static int bcm281xx_i2c_pin_update(struct pinctrl_dev *pctldev,
+				   unsigned pin,
+				   unsigned long *configs,
+				   unsigned num_configs,
+				   u32 *val,
+				   u32 *mask)
+{
+	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	int i, j;
+	enum pin_config_param param;
+	u16 arg;
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_PULL_UP:
+			for (j = 0; j < ARRAY_SIZE(bcm281xx_pullup_map); j++)
+				if (bcm281xx_pullup_map[j] == arg)
+					break;
+
+			if (j == ARRAY_SIZE(bcm281xx_pullup_map)) {
+				dev_err(pctldev->dev,
+					"Invalid pull-up value (%d) for pin %s "
+					"(%d). Valid values are 568, 720, 831, "
+					"1080, 1200, 1800, 2700 Ohms.\n",
+					arg, pdata->pins[pin].name, pin);
+				return -EINVAL;
+			}
+
+			bcm281xx_pin_update(val, mask, j+1,
+				BCM281XX_PIN_SHIFT(I2C, PULL_UP_STR),
+				BCM281XX_PIN_MASK(I2C, PULL_UP_STR));
+			break;
+
+		case PIN_CONFIG_BIAS_DISABLE:
+			bcm281xx_pin_update(val, mask, 0,
+				BCM281XX_PIN_SHIFT(I2C, PULL_UP_STR),
+				BCM281XX_PIN_MASK(I2C, PULL_UP_STR));
+			break;
+
+		case PIN_CONFIG_SLEW_RATE:
+			arg = (arg >= 1 ? 1 : 0);
+			bcm281xx_pin_update(val, mask, arg,
+				BCM281XX_PIN_SHIFT(I2C, SLEW),
+				BCM281XX_PIN_MASK(I2C, SLEW));
+			break;
+
+		case PIN_CONFIG_INPUT_ENABLE:
+			/* inversed since register is for input _disable_ */
+			arg = (arg >= 1 ? 0 : 1);
+			bcm281xx_pin_update(val, mask, arg,
+				BCM281XX_PIN_SHIFT(I2C, INPUT_DIS),
+				BCM281XX_PIN_MASK(I2C, INPUT_DIS));
+			break;
+
+		default:
+			dev_err(pctldev->dev,
+				"Unrecognized pin config %d for pin %s (%d).\n",
+				param, pdata->pins[pin].name, pin);
+			return -EINVAL;
+
+		} /* switch config */
+	} /* for each config */
+
+	return 0;
+}
+
+/* Goes through the configs and update register val/mask */
+static int bcm281xx_hdmi_pin_update(struct pinctrl_dev *pctldev,
+				    unsigned pin,
+				    unsigned long *configs,
+				    unsigned num_configs,
+				    u32 *val,
+				    u32 *mask)
+{
+	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	int i;
+	enum pin_config_param param;
+	u16 arg;
+
+	for (i = 0; i < num_configs; i++) {
+		param = pinconf_to_config_param(configs[i]);
+		arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_SLEW_RATE:
+			arg = (arg >= 1 ? 1 : 0);
+			bcm281xx_pin_update(val, mask, arg,
+				BCM281XX_PIN_SHIFT(HDMI, MODE),
+				BCM281XX_PIN_MASK(HDMI, MODE));
+			break;
+
+		case PIN_CONFIG_INPUT_ENABLE:
+			/* inversed since register is for input _disable_ */
+			arg = (arg >= 1 ? 0 : 1);
+			bcm281xx_pin_update(val, mask, arg,
+				BCM281XX_PIN_SHIFT(HDMI, INPUT_DIS),
+				BCM281XX_PIN_MASK(HDMI, INPUT_DIS));
+			break;
+
+		default:
+			dev_err(pctldev->dev,
+				"Unrecognized pin config %d for pin %s (%d).\n",
+				param, pdata->pins[pin].name, pin);
+			return -EINVAL;
+
+		} /* switch config */
+	} /* for each config */
+
+	return 0;
+}
+
+static int bcm281xx_pinctrl_pin_config_set(struct pinctrl_dev *pctldev,
+					   unsigned pin,
+					   unsigned long *configs,
+					   unsigned num_configs)
+{
+	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
+	enum bcm281xx_pin_type pin_type;
+	u32 offset = 4 * pin;
+	u32 cfg_val, cfg_mask;
+	int rc;
+
+	cfg_val = 0;
+	cfg_mask = 0;
+	pin_type = pin_type_get(pctldev, pin);
+
+	/* Different pins have different configuration options */
+	switch (pin_type) {
+	case BCM281XX_PIN_TYPE_STD:
+		rc = bcm281xx_std_pin_update(pctldev, pin, configs,
+			num_configs, &cfg_val, &cfg_mask);
+		break;
+
+	case BCM281XX_PIN_TYPE_I2C:
+		rc = bcm281xx_i2c_pin_update(pctldev, pin, configs,
+			num_configs, &cfg_val, &cfg_mask);
+		break;
+
+	case BCM281XX_PIN_TYPE_HDMI:
+		rc = bcm281xx_hdmi_pin_update(pctldev, pin, configs,
+			num_configs, &cfg_val, &cfg_mask);
+		break;
+
+	default:
+		dev_err(pctldev->dev, "Unknown pin type for pin %s (%d).\n",
+			pdata->pins[pin].name, pin);
+		return -EINVAL;
+
+	} /* switch pin type */
+
+	if (rc)
+		return rc;
+
+	dev_dbg(pctldev->dev,
+		"%s(): Set pin %s (%d) with config 0x%x, mask 0x%x\n",
+		__func__, pdata->pins[pin].name, pin, cfg_val, cfg_mask);
+
+	rc = regmap_update_bits(pdata->regmap, offset, cfg_mask, cfg_val);
+	if (rc) {
+		dev_err(pctldev->dev,
+			"Error updating register for pin %s (%d).\n",
+			pdata->pins[pin].name, pin);
+		return rc;
+	}
+
+	return 0;
+}
+
+static struct pinconf_ops bcm281xx_pinctrl_pinconf_ops = {
+	.pin_config_get = bcm281xx_pinctrl_pin_config_get,
+	.pin_config_set = bcm281xx_pinctrl_pin_config_set,
+};
+
+static struct pinctrl_desc bcm281xx_pinctrl_desc = {
+	/* name, pins, npins members initialized in probe function */
+	.pctlops = &bcm281xx_pinctrl_ops,
+	.pmxops = &bcm281xx_pinctrl_pinmux_ops,
+	.confops = &bcm281xx_pinctrl_pinconf_ops,
+	.owner = THIS_MODULE,
+};
+
+static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
+{
+	struct bcm281xx_pinctrl_data *pdata = &bcm281xx_pinctrl;
+	struct resource *res;
+	struct pinctrl_dev *pctl;
+
+	/* So far We can assume there is only 1 bank of registers */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	pdata->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(pdata->reg_base)) {
+		dev_err(&pdev->dev, "Failed to ioremap MEM resource\n");
+		return -ENODEV;
+	}
+
+	/* Initialize the dynamic part of pinctrl_desc */
+	pdata->regmap = devm_regmap_init_mmio(&pdev->dev, pdata->reg_base,
+		&bcm281xx_pinctrl_regmap_config);
+	if (IS_ERR(pdata->regmap)) {
+		dev_err(&pdev->dev, "Regmap MMIO init failed.\n");
+		return -ENODEV;
+	}
+
+	bcm281xx_pinctrl_desc.name = dev_name(&pdev->dev);
+	bcm281xx_pinctrl_desc.pins = bcm281xx_pinctrl.pins;
+	bcm281xx_pinctrl_desc.npins = bcm281xx_pinctrl.npins;
+
+	pctl = pinctrl_register(&bcm281xx_pinctrl_desc,
+				&pdev->dev,
+				pdata);
+	if (!pctl) {
+		dev_err(&pdev->dev, "Failed to register pinctrl\n");
+		return -ENODEV;
+	}
+
+	platform_set_drvdata(pdev, pdata);
+
+	return 0;
+}
+
+static struct of_device_id bcm281xx_pinctrl_of_match[] = {
+	{ .compatible = "brcm,bcm11351-pinctrl", },
+	{ },
+};
+
+static struct platform_driver bcm281xx_pinctrl_driver = {
+	.driver = {
+		.name = "bcm281xx-pinctrl",
+		.of_match_table = bcm281xx_pinctrl_of_match,
+	},
+};
+
+module_platform_driver_probe(bcm281xx_pinctrl_driver, bcm281xx_pinctrl_probe);
+
+MODULE_AUTHOR("Broadcom Corporation <bcm-kernel-feedback-list@broadcom.com>");
+MODULE_AUTHOR("Sherman Yin <syin@broadcom.com>");
+MODULE_DESCRIPTION("Broadcom BCM281xx pinctrl driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
new file mode 100644
index 0000000..9aa8a3f
--- /dev/null
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -0,0 +1,1072 @@
+/*
+ * Driver for Broadcom BCM2835 GPIO unit (pinctrl + GPIO)
+ *
+ * Copyright (C) 2012 Chris Boot, Simon Arlott, Stephen Warren
+ *
+ * This driver is inspired by:
+ * pinctrl-nomadik.c, please see original file for copyright information
+ * pinctrl-tegra.c, please see original file for copyright information
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/bitmap.h>
+#include <linux/bug.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqdesc.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#define MODULE_NAME "pinctrl-bcm2835"
+#define BCM2835_NUM_GPIOS 54
+#define BCM2835_NUM_BANKS 2
+
+#define BCM2835_PIN_BITMAP_SZ \
+	DIV_ROUND_UP(BCM2835_NUM_GPIOS, sizeof(unsigned long) * 8)
+
+/* GPIO register offsets */
+#define GPFSEL0		0x0	/* Function Select */
+#define GPSET0		0x1c	/* Pin Output Set */
+#define GPCLR0		0x28	/* Pin Output Clear */
+#define GPLEV0		0x34	/* Pin Level */
+#define GPEDS0		0x40	/* Pin Event Detect Status */
+#define GPREN0		0x4c	/* Pin Rising Edge Detect Enable */
+#define GPFEN0		0x58	/* Pin Falling Edge Detect Enable */
+#define GPHEN0		0x64	/* Pin High Detect Enable */
+#define GPLEN0		0x70	/* Pin Low Detect Enable */
+#define GPAREN0		0x7c	/* Pin Async Rising Edge Detect */
+#define GPAFEN0		0x88	/* Pin Async Falling Edge Detect */
+#define GPPUD		0x94	/* Pin Pull-up/down Enable */
+#define GPPUDCLK0	0x98	/* Pin Pull-up/down Enable Clock */
+
+#define FSEL_REG(p)		(GPFSEL0 + (((p) / 10) * 4))
+#define FSEL_SHIFT(p)		(((p) % 10) * 3)
+#define GPIO_REG_OFFSET(p)	((p) / 32)
+#define GPIO_REG_SHIFT(p)	((p) % 32)
+
+enum bcm2835_pinconf_param {
+	/* argument: bcm2835_pinconf_pull */
+	BCM2835_PINCONF_PARAM_PULL,
+};
+
+enum bcm2835_pinconf_pull {
+	BCM2835_PINCONFIG_PULL_NONE,
+	BCM2835_PINCONFIG_PULL_DOWN,
+	BCM2835_PINCONFIG_PULL_UP,
+};
+
+#define BCM2835_PINCONF_PACK(_param_, _arg_) ((_param_) << 16 | (_arg_))
+#define BCM2835_PINCONF_UNPACK_PARAM(_conf_) ((_conf_) >> 16)
+#define BCM2835_PINCONF_UNPACK_ARG(_conf_) ((_conf_) & 0xffff)
+
+struct bcm2835_gpio_irqdata {
+	struct bcm2835_pinctrl *pc;
+	int bank;
+};
+
+struct bcm2835_pinctrl {
+	struct device *dev;
+	void __iomem *base;
+	int irq[BCM2835_NUM_BANKS];
+
+	/* note: locking assumes each bank will have its own unsigned long */
+	unsigned long enabled_irq_map[BCM2835_NUM_BANKS];
+	unsigned int irq_type[BCM2835_NUM_GPIOS];
+
+	struct pinctrl_dev *pctl_dev;
+	struct irq_domain *irq_domain;
+	struct gpio_chip gpio_chip;
+	struct pinctrl_gpio_range gpio_range;
+
+	struct bcm2835_gpio_irqdata irq_data[BCM2835_NUM_BANKS];
+	spinlock_t irq_lock[BCM2835_NUM_BANKS];
+};
+
+static struct lock_class_key gpio_lock_class;
+
+/* pins are just named GPIO0..GPIO53 */
+#define BCM2835_GPIO_PIN(a) PINCTRL_PIN(a, "gpio" #a)
+static struct pinctrl_pin_desc bcm2835_gpio_pins[] = {
+	BCM2835_GPIO_PIN(0),
+	BCM2835_GPIO_PIN(1),
+	BCM2835_GPIO_PIN(2),
+	BCM2835_GPIO_PIN(3),
+	BCM2835_GPIO_PIN(4),
+	BCM2835_GPIO_PIN(5),
+	BCM2835_GPIO_PIN(6),
+	BCM2835_GPIO_PIN(7),
+	BCM2835_GPIO_PIN(8),
+	BCM2835_GPIO_PIN(9),
+	BCM2835_GPIO_PIN(10),
+	BCM2835_GPIO_PIN(11),
+	BCM2835_GPIO_PIN(12),
+	BCM2835_GPIO_PIN(13),
+	BCM2835_GPIO_PIN(14),
+	BCM2835_GPIO_PIN(15),
+	BCM2835_GPIO_PIN(16),
+	BCM2835_GPIO_PIN(17),
+	BCM2835_GPIO_PIN(18),
+	BCM2835_GPIO_PIN(19),
+	BCM2835_GPIO_PIN(20),
+	BCM2835_GPIO_PIN(21),
+	BCM2835_GPIO_PIN(22),
+	BCM2835_GPIO_PIN(23),
+	BCM2835_GPIO_PIN(24),
+	BCM2835_GPIO_PIN(25),
+	BCM2835_GPIO_PIN(26),
+	BCM2835_GPIO_PIN(27),
+	BCM2835_GPIO_PIN(28),
+	BCM2835_GPIO_PIN(29),
+	BCM2835_GPIO_PIN(30),
+	BCM2835_GPIO_PIN(31),
+	BCM2835_GPIO_PIN(32),
+	BCM2835_GPIO_PIN(33),
+	BCM2835_GPIO_PIN(34),
+	BCM2835_GPIO_PIN(35),
+	BCM2835_GPIO_PIN(36),
+	BCM2835_GPIO_PIN(37),
+	BCM2835_GPIO_PIN(38),
+	BCM2835_GPIO_PIN(39),
+	BCM2835_GPIO_PIN(40),
+	BCM2835_GPIO_PIN(41),
+	BCM2835_GPIO_PIN(42),
+	BCM2835_GPIO_PIN(43),
+	BCM2835_GPIO_PIN(44),
+	BCM2835_GPIO_PIN(45),
+	BCM2835_GPIO_PIN(46),
+	BCM2835_GPIO_PIN(47),
+	BCM2835_GPIO_PIN(48),
+	BCM2835_GPIO_PIN(49),
+	BCM2835_GPIO_PIN(50),
+	BCM2835_GPIO_PIN(51),
+	BCM2835_GPIO_PIN(52),
+	BCM2835_GPIO_PIN(53),
+};
+
+/* one pin per group */
+static const char * const bcm2835_gpio_groups[] = {
+	"gpio0",
+	"gpio1",
+	"gpio2",
+	"gpio3",
+	"gpio4",
+	"gpio5",
+	"gpio6",
+	"gpio7",
+	"gpio8",
+	"gpio9",
+	"gpio10",
+	"gpio11",
+	"gpio12",
+	"gpio13",
+	"gpio14",
+	"gpio15",
+	"gpio16",
+	"gpio17",
+	"gpio18",
+	"gpio19",
+	"gpio20",
+	"gpio21",
+	"gpio22",
+	"gpio23",
+	"gpio24",
+	"gpio25",
+	"gpio26",
+	"gpio27",
+	"gpio28",
+	"gpio29",
+	"gpio30",
+	"gpio31",
+	"gpio32",
+	"gpio33",
+	"gpio34",
+	"gpio35",
+	"gpio36",
+	"gpio37",
+	"gpio38",
+	"gpio39",
+	"gpio40",
+	"gpio41",
+	"gpio42",
+	"gpio43",
+	"gpio44",
+	"gpio45",
+	"gpio46",
+	"gpio47",
+	"gpio48",
+	"gpio49",
+	"gpio50",
+	"gpio51",
+	"gpio52",
+	"gpio53",
+};
+
+enum bcm2835_fsel {
+	BCM2835_FSEL_GPIO_IN = 0,
+	BCM2835_FSEL_GPIO_OUT = 1,
+	BCM2835_FSEL_ALT0 = 4,
+	BCM2835_FSEL_ALT1 = 5,
+	BCM2835_FSEL_ALT2 = 6,
+	BCM2835_FSEL_ALT3 = 7,
+	BCM2835_FSEL_ALT4 = 3,
+	BCM2835_FSEL_ALT5 = 2,
+	BCM2835_FSEL_COUNT = 8,
+	BCM2835_FSEL_MASK = 0x7,
+};
+
+static const char * const bcm2835_functions[BCM2835_FSEL_COUNT] = {
+	[BCM2835_FSEL_GPIO_IN] = "gpio_in",
+	[BCM2835_FSEL_GPIO_OUT] = "gpio_out",
+	[BCM2835_FSEL_ALT0] = "alt0",
+	[BCM2835_FSEL_ALT1] = "alt1",
+	[BCM2835_FSEL_ALT2] = "alt2",
+	[BCM2835_FSEL_ALT3] = "alt3",
+	[BCM2835_FSEL_ALT4] = "alt4",
+	[BCM2835_FSEL_ALT5] = "alt5",
+};
+
+static const char * const irq_type_names[] = {
+	[IRQ_TYPE_NONE] = "none",
+	[IRQ_TYPE_EDGE_RISING] = "edge-rising",
+	[IRQ_TYPE_EDGE_FALLING] = "edge-falling",
+	[IRQ_TYPE_EDGE_BOTH] = "edge-both",
+	[IRQ_TYPE_LEVEL_HIGH] = "level-high",
+	[IRQ_TYPE_LEVEL_LOW] = "level-low",
+};
+
+static inline u32 bcm2835_gpio_rd(struct bcm2835_pinctrl *pc, unsigned reg)
+{
+	return readl(pc->base + reg);
+}
+
+static inline void bcm2835_gpio_wr(struct bcm2835_pinctrl *pc, unsigned reg,
+		u32 val)
+{
+	writel(val, pc->base + reg);
+}
+
+static inline int bcm2835_gpio_get_bit(struct bcm2835_pinctrl *pc, unsigned reg,
+		unsigned bit)
+{
+	reg += GPIO_REG_OFFSET(bit) * 4;
+	return (bcm2835_gpio_rd(pc, reg) >> GPIO_REG_SHIFT(bit)) & 1;
+}
+
+/* note NOT a read/modify/write cycle */
+static inline void bcm2835_gpio_set_bit(struct bcm2835_pinctrl *pc,
+		unsigned reg, unsigned bit)
+{
+	reg += GPIO_REG_OFFSET(bit) * 4;
+	bcm2835_gpio_wr(pc, reg, BIT(GPIO_REG_SHIFT(bit)));
+}
+
+static inline enum bcm2835_fsel bcm2835_pinctrl_fsel_get(
+		struct bcm2835_pinctrl *pc, unsigned pin)
+{
+	u32 val = bcm2835_gpio_rd(pc, FSEL_REG(pin));
+	enum bcm2835_fsel status = (val >> FSEL_SHIFT(pin)) & BCM2835_FSEL_MASK;
+
+	dev_dbg(pc->dev, "get %08x (%u => %s)\n", val, pin,
+			bcm2835_functions[status]);
+
+	return status;
+}
+
+static inline void bcm2835_pinctrl_fsel_set(
+		struct bcm2835_pinctrl *pc, unsigned pin,
+		enum bcm2835_fsel fsel)
+{
+	u32 val = bcm2835_gpio_rd(pc, FSEL_REG(pin));
+	enum bcm2835_fsel cur = (val >> FSEL_SHIFT(pin)) & BCM2835_FSEL_MASK;
+
+	dev_dbg(pc->dev, "read %08x (%u => %s)\n", val, pin,
+			bcm2835_functions[cur]);
+
+	if (cur == fsel)
+		return;
+
+	if (cur != BCM2835_FSEL_GPIO_IN && fsel != BCM2835_FSEL_GPIO_IN) {
+		/* always transition through GPIO_IN */
+		val &= ~(BCM2835_FSEL_MASK << FSEL_SHIFT(pin));
+		val |= BCM2835_FSEL_GPIO_IN << FSEL_SHIFT(pin);
+
+		dev_dbg(pc->dev, "trans %08x (%u <= %s)\n", val, pin,
+				bcm2835_functions[BCM2835_FSEL_GPIO_IN]);
+		bcm2835_gpio_wr(pc, FSEL_REG(pin), val);
+	}
+
+	val &= ~(BCM2835_FSEL_MASK << FSEL_SHIFT(pin));
+	val |= fsel << FSEL_SHIFT(pin);
+
+	dev_dbg(pc->dev, "write %08x (%u <= %s)\n", val, pin,
+			bcm2835_functions[fsel]);
+	bcm2835_gpio_wr(pc, FSEL_REG(pin), val);
+}
+
+static int bcm2835_gpio_request(struct gpio_chip *chip, unsigned offset)
+{
+	return pinctrl_request_gpio(chip->base + offset);
+}
+
+static void bcm2835_gpio_free(struct gpio_chip *chip, unsigned offset)
+{
+	pinctrl_free_gpio(chip->base + offset);
+}
+
+static int bcm2835_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
+{
+	return pinctrl_gpio_direction_input(chip->base + offset);
+}
+
+static int bcm2835_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct bcm2835_pinctrl *pc = dev_get_drvdata(chip->dev);
+
+	return bcm2835_gpio_get_bit(pc, GPLEV0, offset);
+}
+
+static int bcm2835_gpio_direction_output(struct gpio_chip *chip,
+		unsigned offset, int value)
+{
+	return pinctrl_gpio_direction_output(chip->base + offset);
+}
+
+static void bcm2835_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+{
+	struct bcm2835_pinctrl *pc = dev_get_drvdata(chip->dev);
+
+	bcm2835_gpio_set_bit(pc, value ? GPSET0 : GPCLR0, offset);
+}
+
+static int bcm2835_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+{
+	struct bcm2835_pinctrl *pc = dev_get_drvdata(chip->dev);
+
+	return irq_linear_revmap(pc->irq_domain, offset);
+}
+
+static struct gpio_chip bcm2835_gpio_chip = {
+	.label = MODULE_NAME,
+	.owner = THIS_MODULE,
+	.request = bcm2835_gpio_request,
+	.free = bcm2835_gpio_free,
+	.direction_input = bcm2835_gpio_direction_input,
+	.direction_output = bcm2835_gpio_direction_output,
+	.get = bcm2835_gpio_get,
+	.set = bcm2835_gpio_set,
+	.to_irq = bcm2835_gpio_to_irq,
+	.base = -1,
+	.ngpio = BCM2835_NUM_GPIOS,
+	.can_sleep = false,
+};
+
+static irqreturn_t bcm2835_gpio_irq_handler(int irq, void *dev_id)
+{
+	struct bcm2835_gpio_irqdata *irqdata = dev_id;
+	struct bcm2835_pinctrl *pc = irqdata->pc;
+	int bank = irqdata->bank;
+	unsigned long events;
+	unsigned offset;
+	unsigned gpio;
+	unsigned int type;
+
+	events = bcm2835_gpio_rd(pc, GPEDS0 + bank * 4);
+	events &= pc->enabled_irq_map[bank];
+	for_each_set_bit(offset, &events, 32) {
+		gpio = (32 * bank) + offset;
+		type = pc->irq_type[gpio];
+
+		/* ack edge triggered IRQs immediately */
+		if (!(type & IRQ_TYPE_LEVEL_MASK))
+			bcm2835_gpio_set_bit(pc, GPEDS0, gpio);
+
+		generic_handle_irq(irq_linear_revmap(pc->irq_domain, gpio));
+
+		/* ack level triggered IRQ after handling them */
+		if (type & IRQ_TYPE_LEVEL_MASK)
+			bcm2835_gpio_set_bit(pc, GPEDS0, gpio);
+	}
+	return events ? IRQ_HANDLED : IRQ_NONE;
+}
+
+static inline void __bcm2835_gpio_irq_config(struct bcm2835_pinctrl *pc,
+	unsigned reg, unsigned offset, bool enable)
+{
+	u32 value;
+	reg += GPIO_REG_OFFSET(offset) * 4;
+	value = bcm2835_gpio_rd(pc, reg);
+	if (enable)
+		value |= BIT(GPIO_REG_SHIFT(offset));
+	else
+		value &= ~(BIT(GPIO_REG_SHIFT(offset)));
+	bcm2835_gpio_wr(pc, reg, value);
+}
+
+/* fast path for IRQ handler */
+static void bcm2835_gpio_irq_config(struct bcm2835_pinctrl *pc,
+	unsigned offset, bool enable)
+{
+	switch (pc->irq_type[offset]) {
+	case IRQ_TYPE_EDGE_RISING:
+		__bcm2835_gpio_irq_config(pc, GPREN0, offset, enable);
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		__bcm2835_gpio_irq_config(pc, GPFEN0, offset, enable);
+		break;
+
+	case IRQ_TYPE_EDGE_BOTH:
+		__bcm2835_gpio_irq_config(pc, GPREN0, offset, enable);
+		__bcm2835_gpio_irq_config(pc, GPFEN0, offset, enable);
+		break;
+
+	case IRQ_TYPE_LEVEL_HIGH:
+		__bcm2835_gpio_irq_config(pc, GPHEN0, offset, enable);
+		break;
+
+	case IRQ_TYPE_LEVEL_LOW:
+		__bcm2835_gpio_irq_config(pc, GPLEN0, offset, enable);
+		break;
+	}
+}
+
+static void bcm2835_gpio_irq_enable(struct irq_data *data)
+{
+	struct bcm2835_pinctrl *pc = irq_data_get_irq_chip_data(data);
+	unsigned gpio = irqd_to_hwirq(data);
+	unsigned offset = GPIO_REG_SHIFT(gpio);
+	unsigned bank = GPIO_REG_OFFSET(gpio);
+	unsigned long flags;
+
+	spin_lock_irqsave(&pc->irq_lock[bank], flags);
+	set_bit(offset, &pc->enabled_irq_map[bank]);
+	bcm2835_gpio_irq_config(pc, gpio, true);
+	spin_unlock_irqrestore(&pc->irq_lock[bank], flags);
+}
+
+static void bcm2835_gpio_irq_disable(struct irq_data *data)
+{
+	struct bcm2835_pinctrl *pc = irq_data_get_irq_chip_data(data);
+	unsigned gpio = irqd_to_hwirq(data);
+	unsigned offset = GPIO_REG_SHIFT(gpio);
+	unsigned bank = GPIO_REG_OFFSET(gpio);
+	unsigned long flags;
+
+	spin_lock_irqsave(&pc->irq_lock[bank], flags);
+	bcm2835_gpio_irq_config(pc, gpio, false);
+	clear_bit(offset, &pc->enabled_irq_map[bank]);
+	spin_unlock_irqrestore(&pc->irq_lock[bank], flags);
+}
+
+static int __bcm2835_gpio_irq_set_type_disabled(struct bcm2835_pinctrl *pc,
+	unsigned offset, unsigned int type)
+{
+	switch (type) {
+	case IRQ_TYPE_NONE:
+	case IRQ_TYPE_EDGE_RISING:
+	case IRQ_TYPE_EDGE_FALLING:
+	case IRQ_TYPE_EDGE_BOTH:
+	case IRQ_TYPE_LEVEL_HIGH:
+	case IRQ_TYPE_LEVEL_LOW:
+		pc->irq_type[offset] = type;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+/* slower path for reconfiguring IRQ type */
+static int __bcm2835_gpio_irq_set_type_enabled(struct bcm2835_pinctrl *pc,
+	unsigned offset, unsigned int type)
+{
+	switch (type) {
+	case IRQ_TYPE_NONE:
+		if (pc->irq_type[offset] != type) {
+			bcm2835_gpio_irq_config(pc, offset, false);
+			pc->irq_type[offset] = type;
+		}
+		break;
+
+	case IRQ_TYPE_EDGE_RISING:
+		if (pc->irq_type[offset] == IRQ_TYPE_EDGE_BOTH) {
+			/* RISING already enabled, disable FALLING */
+			pc->irq_type[offset] = IRQ_TYPE_EDGE_FALLING;
+			bcm2835_gpio_irq_config(pc, offset, false);
+			pc->irq_type[offset] = type;
+		} else if (pc->irq_type[offset] != type) {
+			bcm2835_gpio_irq_config(pc, offset, false);
+			pc->irq_type[offset] = type;
+			bcm2835_gpio_irq_config(pc, offset, true);
+		}
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		if (pc->irq_type[offset] == IRQ_TYPE_EDGE_BOTH) {
+			/* FALLING already enabled, disable RISING */
+			pc->irq_type[offset] = IRQ_TYPE_EDGE_RISING;
+			bcm2835_gpio_irq_config(pc, offset, false);
+			pc->irq_type[offset] = type;
+		} else if (pc->irq_type[offset] != type) {
+			bcm2835_gpio_irq_config(pc, offset, false);
+			pc->irq_type[offset] = type;
+			bcm2835_gpio_irq_config(pc, offset, true);
+		}
+		break;
+
+	case IRQ_TYPE_EDGE_BOTH:
+		if (pc->irq_type[offset] == IRQ_TYPE_EDGE_RISING) {
+			/* RISING already enabled, enable FALLING too */
+			pc->irq_type[offset] = IRQ_TYPE_EDGE_FALLING;
+			bcm2835_gpio_irq_config(pc, offset, true);
+			pc->irq_type[offset] = type;
+		} else if (pc->irq_type[offset] == IRQ_TYPE_EDGE_FALLING) {
+			/* FALLING already enabled, enable RISING too */
+			pc->irq_type[offset] = IRQ_TYPE_EDGE_RISING;
+			bcm2835_gpio_irq_config(pc, offset, true);
+			pc->irq_type[offset] = type;
+		} else if (pc->irq_type[offset] != type) {
+			bcm2835_gpio_irq_config(pc, offset, false);
+			pc->irq_type[offset] = type;
+			bcm2835_gpio_irq_config(pc, offset, true);
+		}
+		break;
+
+	case IRQ_TYPE_LEVEL_HIGH:
+	case IRQ_TYPE_LEVEL_LOW:
+		if (pc->irq_type[offset] != type) {
+			bcm2835_gpio_irq_config(pc, offset, false);
+			pc->irq_type[offset] = type;
+			bcm2835_gpio_irq_config(pc, offset, true);
+		}
+		break;
+
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int bcm2835_gpio_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct bcm2835_pinctrl *pc = irq_data_get_irq_chip_data(data);
+	unsigned gpio = irqd_to_hwirq(data);
+	unsigned offset = GPIO_REG_SHIFT(gpio);
+	unsigned bank = GPIO_REG_OFFSET(gpio);
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&pc->irq_lock[bank], flags);
+
+	if (test_bit(offset, &pc->enabled_irq_map[bank]))
+		ret = __bcm2835_gpio_irq_set_type_enabled(pc, gpio, type);
+	else
+		ret = __bcm2835_gpio_irq_set_type_disabled(pc, gpio, type);
+
+	spin_unlock_irqrestore(&pc->irq_lock[bank], flags);
+
+	return ret;
+}
+
+static struct irq_chip bcm2835_gpio_irq_chip = {
+	.name = MODULE_NAME,
+	.irq_enable = bcm2835_gpio_irq_enable,
+	.irq_disable = bcm2835_gpio_irq_disable,
+	.irq_set_type = bcm2835_gpio_irq_set_type,
+};
+
+static int bcm2835_pctl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(bcm2835_gpio_groups);
+}
+
+static const char *bcm2835_pctl_get_group_name(struct pinctrl_dev *pctldev,
+		unsigned selector)
+{
+	return bcm2835_gpio_groups[selector];
+}
+
+static int bcm2835_pctl_get_group_pins(struct pinctrl_dev *pctldev,
+		unsigned selector,
+		const unsigned **pins,
+		unsigned *num_pins)
+{
+	*pins = &bcm2835_gpio_pins[selector].number;
+	*num_pins = 1;
+
+	return 0;
+}
+
+static void bcm2835_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
+		struct seq_file *s,
+		unsigned offset)
+{
+	struct bcm2835_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	enum bcm2835_fsel fsel = bcm2835_pinctrl_fsel_get(pc, offset);
+	const char *fname = bcm2835_functions[fsel];
+	int value = bcm2835_gpio_get_bit(pc, GPLEV0, offset);
+	int irq = irq_find_mapping(pc->irq_domain, offset);
+
+	seq_printf(s, "function %s in %s; irq %d (%s)",
+		fname, value ? "hi" : "lo",
+		irq, irq_type_names[pc->irq_type[offset]]);
+}
+
+static void bcm2835_pctl_dt_free_map(struct pinctrl_dev *pctldev,
+		struct pinctrl_map *maps, unsigned num_maps)
+{
+	int i;
+
+	for (i = 0; i < num_maps; i++)
+		if (maps[i].type == PIN_MAP_TYPE_CONFIGS_PIN)
+			kfree(maps[i].data.configs.configs);
+
+	kfree(maps);
+}
+
+static int bcm2835_pctl_dt_node_to_map_func(struct bcm2835_pinctrl *pc,
+		struct device_node *np, u32 pin, u32 fnum,
+		struct pinctrl_map **maps)
+{
+	struct pinctrl_map *map = *maps;
+
+	if (fnum >= ARRAY_SIZE(bcm2835_functions)) {
+		dev_err(pc->dev, "%s: invalid brcm,function %d\n",
+			of_node_full_name(np), fnum);
+		return -EINVAL;
+	}
+
+	map->type = PIN_MAP_TYPE_MUX_GROUP;
+	map->data.mux.group = bcm2835_gpio_groups[pin];
+	map->data.mux.function = bcm2835_functions[fnum];
+	(*maps)++;
+
+	return 0;
+}
+
+static int bcm2835_pctl_dt_node_to_map_pull(struct bcm2835_pinctrl *pc,
+		struct device_node *np, u32 pin, u32 pull,
+		struct pinctrl_map **maps)
+{
+	struct pinctrl_map *map = *maps;
+	unsigned long *configs;
+
+	if (pull > 2) {
+		dev_err(pc->dev, "%s: invalid brcm,pull %d\n",
+			of_node_full_name(np), pull);
+		return -EINVAL;
+	}
+
+	configs = kzalloc(sizeof(*configs), GFP_KERNEL);
+	if (!configs)
+		return -ENOMEM;
+	configs[0] = BCM2835_PINCONF_PACK(BCM2835_PINCONF_PARAM_PULL, pull);
+
+	map->type = PIN_MAP_TYPE_CONFIGS_PIN;
+	map->data.configs.group_or_pin = bcm2835_gpio_pins[pin].name;
+	map->data.configs.configs = configs;
+	map->data.configs.num_configs = 1;
+	(*maps)++;
+
+	return 0;
+}
+
+static int bcm2835_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
+		struct device_node *np,
+		struct pinctrl_map **map, unsigned *num_maps)
+{
+	struct bcm2835_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	struct property *pins, *funcs, *pulls;
+	int num_pins, num_funcs, num_pulls, maps_per_pin;
+	struct pinctrl_map *maps, *cur_map;
+	int i, err;
+	u32 pin, func, pull;
+
+	pins = of_find_property(np, "brcm,pins", NULL);
+	if (!pins) {
+		dev_err(pc->dev, "%s: missing brcm,pins property\n",
+				of_node_full_name(np));
+		return -EINVAL;
+	}
+
+	funcs = of_find_property(np, "brcm,function", NULL);
+	pulls = of_find_property(np, "brcm,pull", NULL);
+
+	if (!funcs && !pulls) {
+		dev_err(pc->dev,
+			"%s: neither brcm,function nor brcm,pull specified\n",
+			of_node_full_name(np));
+		return -EINVAL;
+	}
+
+	num_pins = pins->length / 4;
+	num_funcs = funcs ? (funcs->length / 4) : 0;
+	num_pulls = pulls ? (pulls->length / 4) : 0;
+
+	if (num_funcs > 1 && num_funcs != num_pins) {
+		dev_err(pc->dev,
+			"%s: brcm,function must have 1 or %d entries\n",
+			of_node_full_name(np), num_pins);
+		return -EINVAL;
+	}
+
+	if (num_pulls > 1 && num_pulls != num_pins) {
+		dev_err(pc->dev,
+			"%s: brcm,pull must have 1 or %d entries\n",
+			of_node_full_name(np), num_pins);
+		return -EINVAL;
+	}
+
+	maps_per_pin = 0;
+	if (num_funcs)
+		maps_per_pin++;
+	if (num_pulls)
+		maps_per_pin++;
+	cur_map = maps = kzalloc(num_pins * maps_per_pin * sizeof(*maps),
+				GFP_KERNEL);
+	if (!maps)
+		return -ENOMEM;
+
+	for (i = 0; i < num_pins; i++) {
+		err = of_property_read_u32_index(np, "brcm,pins", i, &pin);
+		if (err)
+			goto out;
+		if (pin >= ARRAY_SIZE(bcm2835_gpio_pins)) {
+			dev_err(pc->dev, "%s: invalid brcm,pins value %d\n",
+				of_node_full_name(np), pin);
+			err = -EINVAL;
+			goto out;
+		}
+
+		if (num_funcs) {
+			err = of_property_read_u32_index(np, "brcm,function",
+					(num_funcs > 1) ? i : 0, &func);
+			if (err)
+				goto out;
+			err = bcm2835_pctl_dt_node_to_map_func(pc, np, pin,
+							func, &cur_map);
+			if (err)
+				goto out;
+		}
+		if (num_pulls) {
+			err = of_property_read_u32_index(np, "brcm,pull",
+					(num_funcs > 1) ? i : 0, &pull);
+			if (err)
+				goto out;
+			err = bcm2835_pctl_dt_node_to_map_pull(pc, np, pin,
+							pull, &cur_map);
+			if (err)
+				goto out;
+		}
+	}
+
+	*map = maps;
+	*num_maps = num_pins * maps_per_pin;
+
+	return 0;
+
+out:
+	kfree(maps);
+	return err;
+}
+
+static const struct pinctrl_ops bcm2835_pctl_ops = {
+	.get_groups_count = bcm2835_pctl_get_groups_count,
+	.get_group_name = bcm2835_pctl_get_group_name,
+	.get_group_pins = bcm2835_pctl_get_group_pins,
+	.pin_dbg_show = bcm2835_pctl_pin_dbg_show,
+	.dt_node_to_map = bcm2835_pctl_dt_node_to_map,
+	.dt_free_map = bcm2835_pctl_dt_free_map,
+};
+
+static int bcm2835_pmx_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return BCM2835_FSEL_COUNT;
+}
+
+static const char *bcm2835_pmx_get_function_name(struct pinctrl_dev *pctldev,
+		unsigned selector)
+{
+	return bcm2835_functions[selector];
+}
+
+static int bcm2835_pmx_get_function_groups(struct pinctrl_dev *pctldev,
+		unsigned selector,
+		const char * const **groups,
+		unsigned * const num_groups)
+{
+	/* every pin can do every function */
+	*groups = bcm2835_gpio_groups;
+	*num_groups = ARRAY_SIZE(bcm2835_gpio_groups);
+
+	return 0;
+}
+
+static int bcm2835_pmx_set(struct pinctrl_dev *pctldev,
+		unsigned func_selector,
+		unsigned group_selector)
+{
+	struct bcm2835_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+
+	bcm2835_pinctrl_fsel_set(pc, group_selector, func_selector);
+
+	return 0;
+}
+
+static void bcm2835_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
+		struct pinctrl_gpio_range *range,
+		unsigned offset)
+{
+	struct bcm2835_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+
+	/* disable by setting to GPIO_IN */
+	bcm2835_pinctrl_fsel_set(pc, offset, BCM2835_FSEL_GPIO_IN);
+}
+
+static int bcm2835_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
+		struct pinctrl_gpio_range *range,
+		unsigned offset,
+		bool input)
+{
+	struct bcm2835_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	enum bcm2835_fsel fsel = input ?
+		BCM2835_FSEL_GPIO_IN : BCM2835_FSEL_GPIO_OUT;
+
+	bcm2835_pinctrl_fsel_set(pc, offset, fsel);
+
+	return 0;
+}
+
+static const struct pinmux_ops bcm2835_pmx_ops = {
+	.get_functions_count = bcm2835_pmx_get_functions_count,
+	.get_function_name = bcm2835_pmx_get_function_name,
+	.get_function_groups = bcm2835_pmx_get_function_groups,
+	.set_mux = bcm2835_pmx_set,
+	.gpio_disable_free = bcm2835_pmx_gpio_disable_free,
+	.gpio_set_direction = bcm2835_pmx_gpio_set_direction,
+};
+
+static int bcm2835_pinconf_get(struct pinctrl_dev *pctldev,
+			unsigned pin, unsigned long *config)
+{
+	/* No way to read back config in HW */
+	return -ENOTSUPP;
+}
+
+static int bcm2835_pinconf_set(struct pinctrl_dev *pctldev,
+			unsigned pin, unsigned long *configs,
+			unsigned num_configs)
+{
+	struct bcm2835_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
+	enum bcm2835_pinconf_param param;
+	u16 arg;
+	u32 off, bit;
+	int i;
+
+	for (i = 0; i < num_configs; i++) {
+		param = BCM2835_PINCONF_UNPACK_PARAM(configs[i]);
+		arg = BCM2835_PINCONF_UNPACK_ARG(configs[i]);
+
+		if (param != BCM2835_PINCONF_PARAM_PULL)
+			return -EINVAL;
+
+		off = GPIO_REG_OFFSET(pin);
+		bit = GPIO_REG_SHIFT(pin);
+
+		bcm2835_gpio_wr(pc, GPPUD, arg & 3);
+		/*
+		 * Docs say to wait 150 cycles, but not of what. We assume a
+		 * 1 MHz clock here, which is pretty slow...
+		 */
+		udelay(150);
+		bcm2835_gpio_wr(pc, GPPUDCLK0 + (off * 4), BIT(bit));
+		udelay(150);
+		bcm2835_gpio_wr(pc, GPPUDCLK0 + (off * 4), 0);
+	} /* for each config */
+
+	return 0;
+}
+
+static const struct pinconf_ops bcm2835_pinconf_ops = {
+	.pin_config_get = bcm2835_pinconf_get,
+	.pin_config_set = bcm2835_pinconf_set,
+};
+
+static struct pinctrl_desc bcm2835_pinctrl_desc = {
+	.name = MODULE_NAME,
+	.pins = bcm2835_gpio_pins,
+	.npins = ARRAY_SIZE(bcm2835_gpio_pins),
+	.pctlops = &bcm2835_pctl_ops,
+	.pmxops = &bcm2835_pmx_ops,
+	.confops = &bcm2835_pinconf_ops,
+	.owner = THIS_MODULE,
+};
+
+static struct pinctrl_gpio_range bcm2835_pinctrl_gpio_range = {
+	.name = MODULE_NAME,
+	.npins = BCM2835_NUM_GPIOS,
+};
+
+static int bcm2835_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct bcm2835_pinctrl *pc;
+	struct resource iomem;
+	int err, i;
+	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_pins) != BCM2835_NUM_GPIOS);
+	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_groups) != BCM2835_NUM_GPIOS);
+
+	pc = devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
+	if (!pc)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, pc);
+	pc->dev = dev;
+
+	err = of_address_to_resource(np, 0, &iomem);
+	if (err) {
+		dev_err(dev, "could not get IO memory\n");
+		return err;
+	}
+
+	pc->base = devm_ioremap_resource(dev, &iomem);
+	if (IS_ERR(pc->base))
+		return PTR_ERR(pc->base);
+
+	pc->gpio_chip = bcm2835_gpio_chip;
+	pc->gpio_chip.dev = dev;
+	pc->gpio_chip.of_node = np;
+
+	pc->irq_domain = irq_domain_add_linear(np, BCM2835_NUM_GPIOS,
+			&irq_domain_simple_ops, NULL);
+	if (!pc->irq_domain) {
+		dev_err(dev, "could not create IRQ domain\n");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < BCM2835_NUM_GPIOS; i++) {
+		int irq = irq_create_mapping(pc->irq_domain, i);
+		irq_set_lockdep_class(irq, &gpio_lock_class);
+		irq_set_chip_and_handler(irq, &bcm2835_gpio_irq_chip,
+				handle_simple_irq);
+		irq_set_chip_data(irq, pc);
+		set_irq_flags(irq, IRQF_VALID);
+	}
+
+	for (i = 0; i < BCM2835_NUM_BANKS; i++) {
+		unsigned long events;
+		unsigned offset;
+		int len;
+		char *name;
+
+		/* clear event detection flags */
+		bcm2835_gpio_wr(pc, GPREN0 + i * 4, 0);
+		bcm2835_gpio_wr(pc, GPFEN0 + i * 4, 0);
+		bcm2835_gpio_wr(pc, GPHEN0 + i * 4, 0);
+		bcm2835_gpio_wr(pc, GPLEN0 + i * 4, 0);
+		bcm2835_gpio_wr(pc, GPAREN0 + i * 4, 0);
+		bcm2835_gpio_wr(pc, GPAFEN0 + i * 4, 0);
+
+		/* clear all the events */
+		events = bcm2835_gpio_rd(pc, GPEDS0 + i * 4);
+		for_each_set_bit(offset, &events, 32)
+			bcm2835_gpio_wr(pc, GPEDS0 + i * 4, BIT(offset));
+
+		pc->irq[i] = irq_of_parse_and_map(np, i);
+		pc->irq_data[i].pc = pc;
+		pc->irq_data[i].bank = i;
+		spin_lock_init(&pc->irq_lock[i]);
+
+		len = strlen(dev_name(pc->dev)) + 16;
+		name = devm_kzalloc(pc->dev, len, GFP_KERNEL);
+		if (!name)
+			return -ENOMEM;
+		snprintf(name, len, "%s:bank%d", dev_name(pc->dev), i);
+
+		err = devm_request_irq(dev, pc->irq[i],
+			bcm2835_gpio_irq_handler, IRQF_SHARED,
+			name, &pc->irq_data[i]);
+		if (err) {
+			dev_err(dev, "unable to request IRQ %d\n", pc->irq[i]);
+			return err;
+		}
+	}
+
+	err = gpiochip_add(&pc->gpio_chip);
+	if (err) {
+		dev_err(dev, "could not add GPIO chip\n");
+		return err;
+	}
+
+	pc->pctl_dev = pinctrl_register(&bcm2835_pinctrl_desc, dev, pc);
+	if (!pc->pctl_dev) {
+		gpiochip_remove(&pc->gpio_chip);
+		return -EINVAL;
+	}
+
+	pc->gpio_range = bcm2835_pinctrl_gpio_range;
+	pc->gpio_range.base = pc->gpio_chip.base;
+	pc->gpio_range.gc = &pc->gpio_chip;
+	pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);
+
+	return 0;
+}
+
+static int bcm2835_pinctrl_remove(struct platform_device *pdev)
+{
+	struct bcm2835_pinctrl *pc = platform_get_drvdata(pdev);
+
+	pinctrl_unregister(pc->pctl_dev);
+	gpiochip_remove(&pc->gpio_chip);
+
+	return 0;
+}
+
+static struct of_device_id bcm2835_pinctrl_match[] = {
+	{ .compatible = "brcm,bcm2835-gpio" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, bcm2835_pinctrl_match);
+
+static struct platform_driver bcm2835_pinctrl_driver = {
+	.probe = bcm2835_pinctrl_probe,
+	.remove = bcm2835_pinctrl_remove,
+	.driver = {
+		.name = MODULE_NAME,
+		.of_match_table = bcm2835_pinctrl_match,
+	},
+};
+module_platform_driver(bcm2835_pinctrl_driver);
+
+MODULE_AUTHOR("Chris Boot, Simon Arlott, Stephen Warren");
+MODULE_DESCRIPTION("BCM2835 Pin control driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/pinctrl-bcm281xx.c b/drivers/pinctrl/pinctrl-bcm281xx.c
deleted file mode 100644
index fa2a00f..0000000
--- a/drivers/pinctrl/pinctrl-bcm281xx.c
+++ /dev/null
@@ -1,1455 +0,0 @@
-/*
- * Copyright (C) 2013 Broadcom Corporation
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation version 2.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-#include <linux/err.h>
-#include <linux/io.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <linux/pinctrl/pinctrl.h>
-#include <linux/pinctrl/pinmux.h>
-#include <linux/pinctrl/pinconf.h>
-#include <linux/pinctrl/pinconf-generic.h>
-#include <linux/regmap.h>
-#include <linux/slab.h>
-#include "core.h"
-#include "pinctrl-utils.h"
-
-/* BCM281XX Pin Control Registers Definitions */
-
-/* Function Select bits are the same for all pin control registers */
-#define BCM281XX_PIN_REG_F_SEL_MASK		0x0700
-#define BCM281XX_PIN_REG_F_SEL_SHIFT		8
-
-/* Standard pin register */
-#define BCM281XX_STD_PIN_REG_DRV_STR_MASK	0x0007
-#define BCM281XX_STD_PIN_REG_DRV_STR_SHIFT	0
-#define BCM281XX_STD_PIN_REG_INPUT_DIS_MASK	0x0008
-#define BCM281XX_STD_PIN_REG_INPUT_DIS_SHIFT	3
-#define BCM281XX_STD_PIN_REG_SLEW_MASK		0x0010
-#define BCM281XX_STD_PIN_REG_SLEW_SHIFT		4
-#define BCM281XX_STD_PIN_REG_PULL_UP_MASK	0x0020
-#define BCM281XX_STD_PIN_REG_PULL_UP_SHIFT	5
-#define BCM281XX_STD_PIN_REG_PULL_DN_MASK	0x0040
-#define BCM281XX_STD_PIN_REG_PULL_DN_SHIFT	6
-#define BCM281XX_STD_PIN_REG_HYST_MASK		0x0080
-#define BCM281XX_STD_PIN_REG_HYST_SHIFT		7
-
-/* I2C pin register */
-#define BCM281XX_I2C_PIN_REG_INPUT_DIS_MASK	0x0004
-#define BCM281XX_I2C_PIN_REG_INPUT_DIS_SHIFT	2
-#define BCM281XX_I2C_PIN_REG_SLEW_MASK		0x0008
-#define BCM281XX_I2C_PIN_REG_SLEW_SHIFT		3
-#define BCM281XX_I2C_PIN_REG_PULL_UP_STR_MASK	0x0070
-#define BCM281XX_I2C_PIN_REG_PULL_UP_STR_SHIFT	4
-
-/* HDMI pin register */
-#define BCM281XX_HDMI_PIN_REG_INPUT_DIS_MASK	0x0008
-#define BCM281XX_HDMI_PIN_REG_INPUT_DIS_SHIFT	3
-#define BCM281XX_HDMI_PIN_REG_MODE_MASK		0x0010
-#define BCM281XX_HDMI_PIN_REG_MODE_SHIFT	4
-
-/**
- * bcm281xx_pin_type - types of pin register
- */
-enum bcm281xx_pin_type {
-	BCM281XX_PIN_TYPE_UNKNOWN = 0,
-	BCM281XX_PIN_TYPE_STD,
-	BCM281XX_PIN_TYPE_I2C,
-	BCM281XX_PIN_TYPE_HDMI,
-};
-
-static enum bcm281xx_pin_type std_pin = BCM281XX_PIN_TYPE_STD;
-static enum bcm281xx_pin_type i2c_pin = BCM281XX_PIN_TYPE_I2C;
-static enum bcm281xx_pin_type hdmi_pin = BCM281XX_PIN_TYPE_HDMI;
-
-/**
- * bcm281xx_pin_function- define pin function
- */
-struct bcm281xx_pin_function {
-	const char *name;
-	const char * const *groups;
-	const unsigned ngroups;
-};
-
-/**
- * bcm281xx_pinctrl_data - Broadcom-specific pinctrl data
- * @reg_base - base of pinctrl registers
- */
-struct bcm281xx_pinctrl_data {
-	void __iomem *reg_base;
-
-	/* List of all pins */
-	const struct pinctrl_pin_desc *pins;
-	const unsigned npins;
-
-	const struct bcm281xx_pin_function *functions;
-	const unsigned nfunctions;
-
-	struct regmap *regmap;
-};
-
-/*
- * Pin number definition.  The order here must be the same as defined in the
- * PADCTRLREG block in the RDB.
- */
-#define BCM281XX_PIN_ADCSYNC		0
-#define BCM281XX_PIN_BAT_RM		1
-#define BCM281XX_PIN_BSC1_SCL		2
-#define BCM281XX_PIN_BSC1_SDA		3
-#define BCM281XX_PIN_BSC2_SCL		4
-#define BCM281XX_PIN_BSC2_SDA		5
-#define BCM281XX_PIN_CLASSGPWR		6
-#define BCM281XX_PIN_CLK_CX8		7
-#define BCM281XX_PIN_CLKOUT_0		8
-#define BCM281XX_PIN_CLKOUT_1		9
-#define BCM281XX_PIN_CLKOUT_2		10
-#define BCM281XX_PIN_CLKOUT_3		11
-#define BCM281XX_PIN_CLKREQ_IN_0	12
-#define BCM281XX_PIN_CLKREQ_IN_1	13
-#define BCM281XX_PIN_CWS_SYS_REQ1	14
-#define BCM281XX_PIN_CWS_SYS_REQ2	15
-#define BCM281XX_PIN_CWS_SYS_REQ3	16
-#define BCM281XX_PIN_DIGMIC1_CLK	17
-#define BCM281XX_PIN_DIGMIC1_DQ		18
-#define BCM281XX_PIN_DIGMIC2_CLK	19
-#define BCM281XX_PIN_DIGMIC2_DQ		20
-#define BCM281XX_PIN_GPEN13		21
-#define BCM281XX_PIN_GPEN14		22
-#define BCM281XX_PIN_GPEN15		23
-#define BCM281XX_PIN_GPIO00		24
-#define BCM281XX_PIN_GPIO01		25
-#define BCM281XX_PIN_GPIO02		26
-#define BCM281XX_PIN_GPIO03		27
-#define BCM281XX_PIN_GPIO04		28
-#define BCM281XX_PIN_GPIO05		29
-#define BCM281XX_PIN_GPIO06		30
-#define BCM281XX_PIN_GPIO07		31
-#define BCM281XX_PIN_GPIO08		32
-#define BCM281XX_PIN_GPIO09		33
-#define BCM281XX_PIN_GPIO10		34
-#define BCM281XX_PIN_GPIO11		35
-#define BCM281XX_PIN_GPIO12		36
-#define BCM281XX_PIN_GPIO13		37
-#define BCM281XX_PIN_GPIO14		38
-#define BCM281XX_PIN_GPS_PABLANK	39
-#define BCM281XX_PIN_GPS_TMARK		40
-#define BCM281XX_PIN_HDMI_SCL		41
-#define BCM281XX_PIN_HDMI_SDA		42
-#define BCM281XX_PIN_IC_DM		43
-#define BCM281XX_PIN_IC_DP		44
-#define BCM281XX_PIN_KP_COL_IP_0	45
-#define BCM281XX_PIN_KP_COL_IP_1	46
-#define BCM281XX_PIN_KP_COL_IP_2	47
-#define BCM281XX_PIN_KP_COL_IP_3	48
-#define BCM281XX_PIN_KP_ROW_OP_0	49
-#define BCM281XX_PIN_KP_ROW_OP_1	50
-#define BCM281XX_PIN_KP_ROW_OP_2	51
-#define BCM281XX_PIN_KP_ROW_OP_3	52
-#define BCM281XX_PIN_LCD_B_0		53
-#define BCM281XX_PIN_LCD_B_1		54
-#define BCM281XX_PIN_LCD_B_2		55
-#define BCM281XX_PIN_LCD_B_3		56
-#define BCM281XX_PIN_LCD_B_4		57
-#define BCM281XX_PIN_LCD_B_5		58
-#define BCM281XX_PIN_LCD_B_6		59
-#define BCM281XX_PIN_LCD_B_7		60
-#define BCM281XX_PIN_LCD_G_0		61
-#define BCM281XX_PIN_LCD_G_1		62
-#define BCM281XX_PIN_LCD_G_2		63
-#define BCM281XX_PIN_LCD_G_3		64
-#define BCM281XX_PIN_LCD_G_4		65
-#define BCM281XX_PIN_LCD_G_5		66
-#define BCM281XX_PIN_LCD_G_6		67
-#define BCM281XX_PIN_LCD_G_7		68
-#define BCM281XX_PIN_LCD_HSYNC		69
-#define BCM281XX_PIN_LCD_OE		70
-#define BCM281XX_PIN_LCD_PCLK		71
-#define BCM281XX_PIN_LCD_R_0		72
-#define BCM281XX_PIN_LCD_R_1		73
-#define BCM281XX_PIN_LCD_R_2		74
-#define BCM281XX_PIN_LCD_R_3		75
-#define BCM281XX_PIN_LCD_R_4		76
-#define BCM281XX_PIN_LCD_R_5		77
-#define BCM281XX_PIN_LCD_R_6		78
-#define BCM281XX_PIN_LCD_R_7		79
-#define BCM281XX_PIN_LCD_VSYNC		80
-#define BCM281XX_PIN_MDMGPIO0		81
-#define BCM281XX_PIN_MDMGPIO1		82
-#define BCM281XX_PIN_MDMGPIO2		83
-#define BCM281XX_PIN_MDMGPIO3		84
-#define BCM281XX_PIN_MDMGPIO4		85
-#define BCM281XX_PIN_MDMGPIO5		86
-#define BCM281XX_PIN_MDMGPIO6		87
-#define BCM281XX_PIN_MDMGPIO7		88
-#define BCM281XX_PIN_MDMGPIO8		89
-#define BCM281XX_PIN_MPHI_DATA_0	90
-#define BCM281XX_PIN_MPHI_DATA_1	91
-#define BCM281XX_PIN_MPHI_DATA_2	92
-#define BCM281XX_PIN_MPHI_DATA_3	93
-#define BCM281XX_PIN_MPHI_DATA_4	94
-#define BCM281XX_PIN_MPHI_DATA_5	95
-#define BCM281XX_PIN_MPHI_DATA_6	96
-#define BCM281XX_PIN_MPHI_DATA_7	97
-#define BCM281XX_PIN_MPHI_DATA_8	98
-#define BCM281XX_PIN_MPHI_DATA_9	99
-#define BCM281XX_PIN_MPHI_DATA_10	100
-#define BCM281XX_PIN_MPHI_DATA_11	101
-#define BCM281XX_PIN_MPHI_DATA_12	102
-#define BCM281XX_PIN_MPHI_DATA_13	103
-#define BCM281XX_PIN_MPHI_DATA_14	104
-#define BCM281XX_PIN_MPHI_DATA_15	105
-#define BCM281XX_PIN_MPHI_HA0		106
-#define BCM281XX_PIN_MPHI_HAT0		107
-#define BCM281XX_PIN_MPHI_HAT1		108
-#define BCM281XX_PIN_MPHI_HCE0_N	109
-#define BCM281XX_PIN_MPHI_HCE1_N	110
-#define BCM281XX_PIN_MPHI_HRD_N		111
-#define BCM281XX_PIN_MPHI_HWR_N		112
-#define BCM281XX_PIN_MPHI_RUN0		113
-#define BCM281XX_PIN_MPHI_RUN1		114
-#define BCM281XX_PIN_MTX_SCAN_CLK	115
-#define BCM281XX_PIN_MTX_SCAN_DATA	116
-#define BCM281XX_PIN_NAND_AD_0		117
-#define BCM281XX_PIN_NAND_AD_1		118
-#define BCM281XX_PIN_NAND_AD_2		119
-#define BCM281XX_PIN_NAND_AD_3		120
-#define BCM281XX_PIN_NAND_AD_4		121
-#define BCM281XX_PIN_NAND_AD_5		122
-#define BCM281XX_PIN_NAND_AD_6		123
-#define BCM281XX_PIN_NAND_AD_7		124
-#define BCM281XX_PIN_NAND_ALE		125
-#define BCM281XX_PIN_NAND_CEN_0		126
-#define BCM281XX_PIN_NAND_CEN_1		127
-#define BCM281XX_PIN_NAND_CLE		128
-#define BCM281XX_PIN_NAND_OEN		129
-#define BCM281XX_PIN_NAND_RDY_0		130
-#define BCM281XX_PIN_NAND_RDY_1		131
-#define BCM281XX_PIN_NAND_WEN		132
-#define BCM281XX_PIN_NAND_WP		133
-#define BCM281XX_PIN_PC1		134
-#define BCM281XX_PIN_PC2		135
-#define BCM281XX_PIN_PMU_INT		136
-#define BCM281XX_PIN_PMU_SCL		137
-#define BCM281XX_PIN_PMU_SDA		138
-#define BCM281XX_PIN_RFST2G_MTSLOTEN3G	139
-#define BCM281XX_PIN_RGMII_0_RX_CTL	140
-#define BCM281XX_PIN_RGMII_0_RXC	141
-#define BCM281XX_PIN_RGMII_0_RXD_0	142
-#define BCM281XX_PIN_RGMII_0_RXD_1	143
-#define BCM281XX_PIN_RGMII_0_RXD_2	144
-#define BCM281XX_PIN_RGMII_0_RXD_3	145
-#define BCM281XX_PIN_RGMII_0_TX_CTL	146
-#define BCM281XX_PIN_RGMII_0_TXC	147
-#define BCM281XX_PIN_RGMII_0_TXD_0	148
-#define BCM281XX_PIN_RGMII_0_TXD_1	149
-#define BCM281XX_PIN_RGMII_0_TXD_2	150
-#define BCM281XX_PIN_RGMII_0_TXD_3	151
-#define BCM281XX_PIN_RGMII_1_RX_CTL	152
-#define BCM281XX_PIN_RGMII_1_RXC	153
-#define BCM281XX_PIN_RGMII_1_RXD_0	154
-#define BCM281XX_PIN_RGMII_1_RXD_1	155
-#define BCM281XX_PIN_RGMII_1_RXD_2	156
-#define BCM281XX_PIN_RGMII_1_RXD_3	157
-#define BCM281XX_PIN_RGMII_1_TX_CTL	158
-#define BCM281XX_PIN_RGMII_1_TXC	159
-#define BCM281XX_PIN_RGMII_1_TXD_0	160
-#define BCM281XX_PIN_RGMII_1_TXD_1	161
-#define BCM281XX_PIN_RGMII_1_TXD_2	162
-#define BCM281XX_PIN_RGMII_1_TXD_3	163
-#define BCM281XX_PIN_RGMII_GPIO_0	164
-#define BCM281XX_PIN_RGMII_GPIO_1	165
-#define BCM281XX_PIN_RGMII_GPIO_2	166
-#define BCM281XX_PIN_RGMII_GPIO_3	167
-#define BCM281XX_PIN_RTXDATA2G_TXDATA3G1	168
-#define BCM281XX_PIN_RTXEN2G_TXDATA3G2	169
-#define BCM281XX_PIN_RXDATA3G0		170
-#define BCM281XX_PIN_RXDATA3G1		171
-#define BCM281XX_PIN_RXDATA3G2		172
-#define BCM281XX_PIN_SDIO1_CLK		173
-#define BCM281XX_PIN_SDIO1_CMD		174
-#define BCM281XX_PIN_SDIO1_DATA_0	175
-#define BCM281XX_PIN_SDIO1_DATA_1	176
-#define BCM281XX_PIN_SDIO1_DATA_2	177
-#define BCM281XX_PIN_SDIO1_DATA_3	178
-#define BCM281XX_PIN_SDIO4_CLK		179
-#define BCM281XX_PIN_SDIO4_CMD		180
-#define BCM281XX_PIN_SDIO4_DATA_0	181
-#define BCM281XX_PIN_SDIO4_DATA_1	182
-#define BCM281XX_PIN_SDIO4_DATA_2	183
-#define BCM281XX_PIN_SDIO4_DATA_3	184
-#define BCM281XX_PIN_SIM_CLK		185
-#define BCM281XX_PIN_SIM_DATA		186
-#define BCM281XX_PIN_SIM_DET		187
-#define BCM281XX_PIN_SIM_RESETN		188
-#define BCM281XX_PIN_SIM2_CLK		189
-#define BCM281XX_PIN_SIM2_DATA		190
-#define BCM281XX_PIN_SIM2_DET		191
-#define BCM281XX_PIN_SIM2_RESETN	192
-#define BCM281XX_PIN_SRI_C		193
-#define BCM281XX_PIN_SRI_D		194
-#define BCM281XX_PIN_SRI_E		195
-#define BCM281XX_PIN_SSP_EXTCLK		196
-#define BCM281XX_PIN_SSP0_CLK		197
-#define BCM281XX_PIN_SSP0_FS		198
-#define BCM281XX_PIN_SSP0_RXD		199
-#define BCM281XX_PIN_SSP0_TXD		200
-#define BCM281XX_PIN_SSP2_CLK		201
-#define BCM281XX_PIN_SSP2_FS_0		202
-#define BCM281XX_PIN_SSP2_FS_1		203
-#define BCM281XX_PIN_SSP2_FS_2		204
-#define BCM281XX_PIN_SSP2_FS_3		205
-#define BCM281XX_PIN_SSP2_RXD_0		206
-#define BCM281XX_PIN_SSP2_RXD_1		207
-#define BCM281XX_PIN_SSP2_TXD_0		208
-#define BCM281XX_PIN_SSP2_TXD_1		209
-#define BCM281XX_PIN_SSP3_CLK		210
-#define BCM281XX_PIN_SSP3_FS		211
-#define BCM281XX_PIN_SSP3_RXD		212
-#define BCM281XX_PIN_SSP3_TXD		213
-#define BCM281XX_PIN_SSP4_CLK		214
-#define BCM281XX_PIN_SSP4_FS		215
-#define BCM281XX_PIN_SSP4_RXD		216
-#define BCM281XX_PIN_SSP4_TXD		217
-#define BCM281XX_PIN_SSP5_CLK		218
-#define BCM281XX_PIN_SSP5_FS		219
-#define BCM281XX_PIN_SSP5_RXD		220
-#define BCM281XX_PIN_SSP5_TXD		221
-#define BCM281XX_PIN_SSP6_CLK		222
-#define BCM281XX_PIN_SSP6_FS		223
-#define BCM281XX_PIN_SSP6_RXD		224
-#define BCM281XX_PIN_SSP6_TXD		225
-#define BCM281XX_PIN_STAT_1		226
-#define BCM281XX_PIN_STAT_2		227
-#define BCM281XX_PIN_SYSCLKEN		228
-#define BCM281XX_PIN_TRACECLK		229
-#define BCM281XX_PIN_TRACEDT00		230
-#define BCM281XX_PIN_TRACEDT01		231
-#define BCM281XX_PIN_TRACEDT02		232
-#define BCM281XX_PIN_TRACEDT03		233
-#define BCM281XX_PIN_TRACEDT04		234
-#define BCM281XX_PIN_TRACEDT05		235
-#define BCM281XX_PIN_TRACEDT06		236
-#define BCM281XX_PIN_TRACEDT07		237
-#define BCM281XX_PIN_TRACEDT08		238
-#define BCM281XX_PIN_TRACEDT09		239
-#define BCM281XX_PIN_TRACEDT10		240
-#define BCM281XX_PIN_TRACEDT11		241
-#define BCM281XX_PIN_TRACEDT12		242
-#define BCM281XX_PIN_TRACEDT13		243
-#define BCM281XX_PIN_TRACEDT14		244
-#define BCM281XX_PIN_TRACEDT15		245
-#define BCM281XX_PIN_TXDATA3G0		246
-#define BCM281XX_PIN_TXPWRIND		247
-#define BCM281XX_PIN_UARTB1_UCTS	248
-#define BCM281XX_PIN_UARTB1_URTS	249
-#define BCM281XX_PIN_UARTB1_URXD	250
-#define BCM281XX_PIN_UARTB1_UTXD	251
-#define BCM281XX_PIN_UARTB2_URXD	252
-#define BCM281XX_PIN_UARTB2_UTXD	253
-#define BCM281XX_PIN_UARTB3_UCTS	254
-#define BCM281XX_PIN_UARTB3_URTS	255
-#define BCM281XX_PIN_UARTB3_URXD	256
-#define BCM281XX_PIN_UARTB3_UTXD	257
-#define BCM281XX_PIN_UARTB4_UCTS	258
-#define BCM281XX_PIN_UARTB4_URTS	259
-#define BCM281XX_PIN_UARTB4_URXD	260
-#define BCM281XX_PIN_UARTB4_UTXD	261
-#define BCM281XX_PIN_VC_CAM1_SCL	262
-#define BCM281XX_PIN_VC_CAM1_SDA	263
-#define BCM281XX_PIN_VC_CAM2_SCL	264
-#define BCM281XX_PIN_VC_CAM2_SDA	265
-#define BCM281XX_PIN_VC_CAM3_SCL	266
-#define BCM281XX_PIN_VC_CAM3_SDA	267
-
-#define BCM281XX_PIN_DESC(a, b, c) \
-	{ .number = a, .name = b, .drv_data = &c##_pin }
-
-/*
- * Pin description definition.  The order here must be the same as defined in
- * the PADCTRLREG block in the RDB, since the pin number is used as an index
- * into this array.
- */
-static const struct pinctrl_pin_desc bcm281xx_pinctrl_pins[] = {
-	BCM281XX_PIN_DESC(BCM281XX_PIN_ADCSYNC, "adcsync", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_BAT_RM, "bat_rm", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_BSC1_SCL, "bsc1_scl", i2c),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_BSC1_SDA, "bsc1_sda", i2c),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_BSC2_SCL, "bsc2_scl", i2c),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_BSC2_SDA, "bsc2_sda", i2c),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_CLASSGPWR, "classgpwr", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_CLK_CX8, "clk_cx8", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_CLKOUT_0, "clkout_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_CLKOUT_1, "clkout_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_CLKOUT_2, "clkout_2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_CLKOUT_3, "clkout_3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_CLKREQ_IN_0, "clkreq_in_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_CLKREQ_IN_1, "clkreq_in_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_CWS_SYS_REQ1, "cws_sys_req1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_CWS_SYS_REQ2, "cws_sys_req2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_CWS_SYS_REQ3, "cws_sys_req3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_DIGMIC1_CLK, "digmic1_clk", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_DIGMIC1_DQ, "digmic1_dq", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_DIGMIC2_CLK, "digmic2_clk", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_DIGMIC2_DQ, "digmic2_dq", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPEN13, "gpen13", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPEN14, "gpen14", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPEN15, "gpen15", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO00, "gpio00", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO01, "gpio01", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO02, "gpio02", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO03, "gpio03", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO04, "gpio04", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO05, "gpio05", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO06, "gpio06", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO07, "gpio07", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO08, "gpio08", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO09, "gpio09", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO10, "gpio10", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO11, "gpio11", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO12, "gpio12", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO13, "gpio13", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPIO14, "gpio14", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPS_PABLANK, "gps_pablank", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_GPS_TMARK, "gps_tmark", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_HDMI_SCL, "hdmi_scl", hdmi),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_HDMI_SDA, "hdmi_sda", hdmi),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_IC_DM, "ic_dm", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_IC_DP, "ic_dp", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_KP_COL_IP_0, "kp_col_ip_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_KP_COL_IP_1, "kp_col_ip_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_KP_COL_IP_2, "kp_col_ip_2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_KP_COL_IP_3, "kp_col_ip_3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_KP_ROW_OP_0, "kp_row_op_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_KP_ROW_OP_1, "kp_row_op_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_KP_ROW_OP_2, "kp_row_op_2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_KP_ROW_OP_3, "kp_row_op_3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_B_0, "lcd_b_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_B_1, "lcd_b_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_B_2, "lcd_b_2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_B_3, "lcd_b_3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_B_4, "lcd_b_4", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_B_5, "lcd_b_5", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_B_6, "lcd_b_6", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_B_7, "lcd_b_7", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_G_0, "lcd_g_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_G_1, "lcd_g_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_G_2, "lcd_g_2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_G_3, "lcd_g_3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_G_4, "lcd_g_4", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_G_5, "lcd_g_5", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_G_6, "lcd_g_6", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_G_7, "lcd_g_7", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_HSYNC, "lcd_hsync", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_OE, "lcd_oe", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_PCLK, "lcd_pclk", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_R_0, "lcd_r_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_R_1, "lcd_r_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_R_2, "lcd_r_2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_R_3, "lcd_r_3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_R_4, "lcd_r_4", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_R_5, "lcd_r_5", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_R_6, "lcd_r_6", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_R_7, "lcd_r_7", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_LCD_VSYNC, "lcd_vsync", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO0, "mdmgpio0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO1, "mdmgpio1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO2, "mdmgpio2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO3, "mdmgpio3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO4, "mdmgpio4", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO5, "mdmgpio5", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO6, "mdmgpio6", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO7, "mdmgpio7", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MDMGPIO8, "mdmgpio8", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_0, "mphi_data_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_1, "mphi_data_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_2, "mphi_data_2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_3, "mphi_data_3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_4, "mphi_data_4", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_5, "mphi_data_5", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_6, "mphi_data_6", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_7, "mphi_data_7", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_8, "mphi_data_8", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_9, "mphi_data_9", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_10, "mphi_data_10", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_11, "mphi_data_11", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_12, "mphi_data_12", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_13, "mphi_data_13", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_14, "mphi_data_14", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_DATA_15, "mphi_data_15", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_HA0, "mphi_ha0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_HAT0, "mphi_hat0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_HAT1, "mphi_hat1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_HCE0_N, "mphi_hce0_n", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_HCE1_N, "mphi_hce1_n", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_HRD_N, "mphi_hrd_n", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_HWR_N, "mphi_hwr_n", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_RUN0, "mphi_run0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MPHI_RUN1, "mphi_run1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MTX_SCAN_CLK, "mtx_scan_clk", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_MTX_SCAN_DATA, "mtx_scan_data", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_AD_0, "nand_ad_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_AD_1, "nand_ad_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_AD_2, "nand_ad_2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_AD_3, "nand_ad_3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_AD_4, "nand_ad_4", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_AD_5, "nand_ad_5", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_AD_6, "nand_ad_6", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_AD_7, "nand_ad_7", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_ALE, "nand_ale", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_CEN_0, "nand_cen_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_CEN_1, "nand_cen_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_CLE, "nand_cle", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_OEN, "nand_oen", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_RDY_0, "nand_rdy_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_RDY_1, "nand_rdy_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_WEN, "nand_wen", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_NAND_WP, "nand_wp", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_PC1, "pc1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_PC2, "pc2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_PMU_INT, "pmu_int", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_PMU_SCL, "pmu_scl", i2c),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_PMU_SDA, "pmu_sda", i2c),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RFST2G_MTSLOTEN3G, "rfst2g_mtsloten3g",
-		std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_RX_CTL, "rgmii_0_rx_ctl", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_RXC, "rgmii_0_rxc", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_RXD_0, "rgmii_0_rxd_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_RXD_1, "rgmii_0_rxd_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_RXD_2, "rgmii_0_rxd_2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_RXD_3, "rgmii_0_rxd_3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_TX_CTL, "rgmii_0_tx_ctl", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_TXC, "rgmii_0_txc", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_TXD_0, "rgmii_0_txd_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_TXD_1, "rgmii_0_txd_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_TXD_2, "rgmii_0_txd_2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_0_TXD_3, "rgmii_0_txd_3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_RX_CTL, "rgmii_1_rx_ctl", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_RXC, "rgmii_1_rxc", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_RXD_0, "rgmii_1_rxd_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_RXD_1, "rgmii_1_rxd_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_RXD_2, "rgmii_1_rxd_2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_RXD_3, "rgmii_1_rxd_3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_TX_CTL, "rgmii_1_tx_ctl", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_TXC, "rgmii_1_txc", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_TXD_0, "rgmii_1_txd_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_TXD_1, "rgmii_1_txd_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_TXD_2, "rgmii_1_txd_2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_1_TXD_3, "rgmii_1_txd_3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_GPIO_0, "rgmii_gpio_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_GPIO_1, "rgmii_gpio_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_GPIO_2, "rgmii_gpio_2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RGMII_GPIO_3, "rgmii_gpio_3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RTXDATA2G_TXDATA3G1,
-		"rtxdata2g_txdata3g1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RTXEN2G_TXDATA3G2, "rtxen2g_txdata3g2",
-		std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RXDATA3G0, "rxdata3g0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RXDATA3G1, "rxdata3g1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_RXDATA3G2, "rxdata3g2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO1_CLK, "sdio1_clk", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO1_CMD, "sdio1_cmd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO1_DATA_0, "sdio1_data_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO1_DATA_1, "sdio1_data_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO1_DATA_2, "sdio1_data_2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO1_DATA_3, "sdio1_data_3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO4_CLK, "sdio4_clk", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO4_CMD, "sdio4_cmd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO4_DATA_0, "sdio4_data_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO4_DATA_1, "sdio4_data_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO4_DATA_2, "sdio4_data_2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SDIO4_DATA_3, "sdio4_data_3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SIM_CLK, "sim_clk", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SIM_DATA, "sim_data", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SIM_DET, "sim_det", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SIM_RESETN, "sim_resetn", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SIM2_CLK, "sim2_clk", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SIM2_DATA, "sim2_data", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SIM2_DET, "sim2_det", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SIM2_RESETN, "sim2_resetn", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SRI_C, "sri_c", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SRI_D, "sri_d", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SRI_E, "sri_e", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP_EXTCLK, "ssp_extclk", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP0_CLK, "ssp0_clk", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP0_FS, "ssp0_fs", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP0_RXD, "ssp0_rxd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP0_TXD, "ssp0_txd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_CLK, "ssp2_clk", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_FS_0, "ssp2_fs_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_FS_1, "ssp2_fs_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_FS_2, "ssp2_fs_2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_FS_3, "ssp2_fs_3", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_RXD_0, "ssp2_rxd_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_RXD_1, "ssp2_rxd_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_TXD_0, "ssp2_txd_0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP2_TXD_1, "ssp2_txd_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP3_CLK, "ssp3_clk", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP3_FS, "ssp3_fs", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP3_RXD, "ssp3_rxd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP3_TXD, "ssp3_txd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP4_CLK, "ssp4_clk", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP4_FS, "ssp4_fs", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP4_RXD, "ssp4_rxd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP4_TXD, "ssp4_txd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP5_CLK, "ssp5_clk", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP5_FS, "ssp5_fs", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP5_RXD, "ssp5_rxd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP5_TXD, "ssp5_txd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP6_CLK, "ssp6_clk", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP6_FS, "ssp6_fs", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP6_RXD, "ssp6_rxd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SSP6_TXD, "ssp6_txd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_STAT_1, "stat_1", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_STAT_2, "stat_2", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_SYSCLKEN, "sysclken", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACECLK, "traceclk", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT00, "tracedt00", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT01, "tracedt01", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT02, "tracedt02", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT03, "tracedt03", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT04, "tracedt04", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT05, "tracedt05", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT06, "tracedt06", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT07, "tracedt07", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT08, "tracedt08", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT09, "tracedt09", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT10, "tracedt10", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT11, "tracedt11", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT12, "tracedt12", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT13, "tracedt13", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT14, "tracedt14", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TRACEDT15, "tracedt15", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TXDATA3G0, "txdata3g0", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_TXPWRIND, "txpwrind", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB1_UCTS, "uartb1_ucts", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB1_URTS, "uartb1_urts", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB1_URXD, "uartb1_urxd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB1_UTXD, "uartb1_utxd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB2_URXD, "uartb2_urxd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB2_UTXD, "uartb2_utxd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB3_UCTS, "uartb3_ucts", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB3_URTS, "uartb3_urts", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB3_URXD, "uartb3_urxd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB3_UTXD, "uartb3_utxd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB4_UCTS, "uartb4_ucts", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB4_URTS, "uartb4_urts", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB4_URXD, "uartb4_urxd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_UARTB4_UTXD, "uartb4_utxd", std),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_VC_CAM1_SCL, "vc_cam1_scl", i2c),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_VC_CAM1_SDA, "vc_cam1_sda", i2c),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_VC_CAM2_SCL, "vc_cam2_scl", i2c),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_VC_CAM2_SDA, "vc_cam2_sda", i2c),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_VC_CAM3_SCL, "vc_cam3_scl", i2c),
-	BCM281XX_PIN_DESC(BCM281XX_PIN_VC_CAM3_SDA, "vc_cam3_sda", i2c),
-};
-
-static const char * const bcm281xx_alt_groups[] = {
-	"adcsync",
-	"bat_rm",
-	"bsc1_scl",
-	"bsc1_sda",
-	"bsc2_scl",
-	"bsc2_sda",
-	"classgpwr",
-	"clk_cx8",
-	"clkout_0",
-	"clkout_1",
-	"clkout_2",
-	"clkout_3",
-	"clkreq_in_0",
-	"clkreq_in_1",
-	"cws_sys_req1",
-	"cws_sys_req2",
-	"cws_sys_req3",
-	"digmic1_clk",
-	"digmic1_dq",
-	"digmic2_clk",
-	"digmic2_dq",
-	"gpen13",
-	"gpen14",
-	"gpen15",
-	"gpio00",
-	"gpio01",
-	"gpio02",
-	"gpio03",
-	"gpio04",
-	"gpio05",
-	"gpio06",
-	"gpio07",
-	"gpio08",
-	"gpio09",
-	"gpio10",
-	"gpio11",
-	"gpio12",
-	"gpio13",
-	"gpio14",
-	"gps_pablank",
-	"gps_tmark",
-	"hdmi_scl",
-	"hdmi_sda",
-	"ic_dm",
-	"ic_dp",
-	"kp_col_ip_0",
-	"kp_col_ip_1",
-	"kp_col_ip_2",
-	"kp_col_ip_3",
-	"kp_row_op_0",
-	"kp_row_op_1",
-	"kp_row_op_2",
-	"kp_row_op_3",
-	"lcd_b_0",
-	"lcd_b_1",
-	"lcd_b_2",
-	"lcd_b_3",
-	"lcd_b_4",
-	"lcd_b_5",
-	"lcd_b_6",
-	"lcd_b_7",
-	"lcd_g_0",
-	"lcd_g_1",
-	"lcd_g_2",
-	"lcd_g_3",
-	"lcd_g_4",
-	"lcd_g_5",
-	"lcd_g_6",
-	"lcd_g_7",
-	"lcd_hsync",
-	"lcd_oe",
-	"lcd_pclk",
-	"lcd_r_0",
-	"lcd_r_1",
-	"lcd_r_2",
-	"lcd_r_3",
-	"lcd_r_4",
-	"lcd_r_5",
-	"lcd_r_6",
-	"lcd_r_7",
-	"lcd_vsync",
-	"mdmgpio0",
-	"mdmgpio1",
-	"mdmgpio2",
-	"mdmgpio3",
-	"mdmgpio4",
-	"mdmgpio5",
-	"mdmgpio6",
-	"mdmgpio7",
-	"mdmgpio8",
-	"mphi_data_0",
-	"mphi_data_1",
-	"mphi_data_2",
-	"mphi_data_3",
-	"mphi_data_4",
-	"mphi_data_5",
-	"mphi_data_6",
-	"mphi_data_7",
-	"mphi_data_8",
-	"mphi_data_9",
-	"mphi_data_10",
-	"mphi_data_11",
-	"mphi_data_12",
-	"mphi_data_13",
-	"mphi_data_14",
-	"mphi_data_15",
-	"mphi_ha0",
-	"mphi_hat0",
-	"mphi_hat1",
-	"mphi_hce0_n",
-	"mphi_hce1_n",
-	"mphi_hrd_n",
-	"mphi_hwr_n",
-	"mphi_run0",
-	"mphi_run1",
-	"mtx_scan_clk",
-	"mtx_scan_data",
-	"nand_ad_0",
-	"nand_ad_1",
-	"nand_ad_2",
-	"nand_ad_3",
-	"nand_ad_4",
-	"nand_ad_5",
-	"nand_ad_6",
-	"nand_ad_7",
-	"nand_ale",
-	"nand_cen_0",
-	"nand_cen_1",
-	"nand_cle",
-	"nand_oen",
-	"nand_rdy_0",
-	"nand_rdy_1",
-	"nand_wen",
-	"nand_wp",
-	"pc1",
-	"pc2",
-	"pmu_int",
-	"pmu_scl",
-	"pmu_sda",
-	"rfst2g_mtsloten3g",
-	"rgmii_0_rx_ctl",
-	"rgmii_0_rxc",
-	"rgmii_0_rxd_0",
-	"rgmii_0_rxd_1",
-	"rgmii_0_rxd_2",
-	"rgmii_0_rxd_3",
-	"rgmii_0_tx_ctl",
-	"rgmii_0_txc",
-	"rgmii_0_txd_0",
-	"rgmii_0_txd_1",
-	"rgmii_0_txd_2",
-	"rgmii_0_txd_3",
-	"rgmii_1_rx_ctl",
-	"rgmii_1_rxc",
-	"rgmii_1_rxd_0",
-	"rgmii_1_rxd_1",
-	"rgmii_1_rxd_2",
-	"rgmii_1_rxd_3",
-	"rgmii_1_tx_ctl",
-	"rgmii_1_txc",
-	"rgmii_1_txd_0",
-	"rgmii_1_txd_1",
-	"rgmii_1_txd_2",
-	"rgmii_1_txd_3",
-	"rgmii_gpio_0",
-	"rgmii_gpio_1",
-	"rgmii_gpio_2",
-	"rgmii_gpio_3",
-	"rtxdata2g_txdata3g1",
-	"rtxen2g_txdata3g2",
-	"rxdata3g0",
-	"rxdata3g1",
-	"rxdata3g2",
-	"sdio1_clk",
-	"sdio1_cmd",
-	"sdio1_data_0",
-	"sdio1_data_1",
-	"sdio1_data_2",
-	"sdio1_data_3",
-	"sdio4_clk",
-	"sdio4_cmd",
-	"sdio4_data_0",
-	"sdio4_data_1",
-	"sdio4_data_2",
-	"sdio4_data_3",
-	"sim_clk",
-	"sim_data",
-	"sim_det",
-	"sim_resetn",
-	"sim2_clk",
-	"sim2_data",
-	"sim2_det",
-	"sim2_resetn",
-	"sri_c",
-	"sri_d",
-	"sri_e",
-	"ssp_extclk",
-	"ssp0_clk",
-	"ssp0_fs",
-	"ssp0_rxd",
-	"ssp0_txd",
-	"ssp2_clk",
-	"ssp2_fs_0",
-	"ssp2_fs_1",
-	"ssp2_fs_2",
-	"ssp2_fs_3",
-	"ssp2_rxd_0",
-	"ssp2_rxd_1",
-	"ssp2_txd_0",
-	"ssp2_txd_1",
-	"ssp3_clk",
-	"ssp3_fs",
-	"ssp3_rxd",
-	"ssp3_txd",
-	"ssp4_clk",
-	"ssp4_fs",
-	"ssp4_rxd",
-	"ssp4_txd",
-	"ssp5_clk",
-	"ssp5_fs",
-	"ssp5_rxd",
-	"ssp5_txd",
-	"ssp6_clk",
-	"ssp6_fs",
-	"ssp6_rxd",
-	"ssp6_txd",
-	"stat_1",
-	"stat_2",
-	"sysclken",
-	"traceclk",
-	"tracedt00",
-	"tracedt01",
-	"tracedt02",
-	"tracedt03",
-	"tracedt04",
-	"tracedt05",
-	"tracedt06",
-	"tracedt07",
-	"tracedt08",
-	"tracedt09",
-	"tracedt10",
-	"tracedt11",
-	"tracedt12",
-	"tracedt13",
-	"tracedt14",
-	"tracedt15",
-	"txdata3g0",
-	"txpwrind",
-	"uartb1_ucts",
-	"uartb1_urts",
-	"uartb1_urxd",
-	"uartb1_utxd",
-	"uartb2_urxd",
-	"uartb2_utxd",
-	"uartb3_ucts",
-	"uartb3_urts",
-	"uartb3_urxd",
-	"uartb3_utxd",
-	"uartb4_ucts",
-	"uartb4_urts",
-	"uartb4_urxd",
-	"uartb4_utxd",
-	"vc_cam1_scl",
-	"vc_cam1_sda",
-	"vc_cam2_scl",
-	"vc_cam2_sda",
-	"vc_cam3_scl",
-	"vc_cam3_sda",
-};
-
-/* Every pin can implement all ALT1-ALT4 functions */
-#define BCM281XX_PIN_FUNCTION(fcn_name)			\
-{							\
-	.name = #fcn_name,				\
-	.groups = bcm281xx_alt_groups,			\
-	.ngroups = ARRAY_SIZE(bcm281xx_alt_groups),	\
-}
-
-static const struct bcm281xx_pin_function bcm281xx_functions[] = {
-	BCM281XX_PIN_FUNCTION(alt1),
-	BCM281XX_PIN_FUNCTION(alt2),
-	BCM281XX_PIN_FUNCTION(alt3),
-	BCM281XX_PIN_FUNCTION(alt4),
-};
-
-static struct bcm281xx_pinctrl_data bcm281xx_pinctrl = {
-	.pins = bcm281xx_pinctrl_pins,
-	.npins = ARRAY_SIZE(bcm281xx_pinctrl_pins),
-	.functions = bcm281xx_functions,
-	.nfunctions = ARRAY_SIZE(bcm281xx_functions),
-};
-
-static inline enum bcm281xx_pin_type pin_type_get(struct pinctrl_dev *pctldev,
-						  unsigned pin)
-{
-	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
-
-	if (pin >= pdata->npins)
-		return BCM281XX_PIN_TYPE_UNKNOWN;
-
-	return *(enum bcm281xx_pin_type *)(pdata->pins[pin].drv_data);
-}
-
-#define BCM281XX_PIN_SHIFT(type, param) \
-	(BCM281XX_ ## type ## _PIN_REG_ ## param ## _SHIFT)
-
-#define BCM281XX_PIN_MASK(type, param) \
-	(BCM281XX_ ## type ## _PIN_REG_ ## param ## _MASK)
-
-/*
- * This helper function is used to build up the value and mask used to write to
- * a pin register, but does not actually write to the register.
- */
-static inline void bcm281xx_pin_update(u32 *reg_val, u32 *reg_mask,
-				       u32 param_val, u32 param_shift,
-				       u32 param_mask)
-{
-	*reg_val &= ~param_mask;
-	*reg_val |= (param_val << param_shift) & param_mask;
-	*reg_mask |= param_mask;
-}
-
-static struct regmap_config bcm281xx_pinctrl_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = BCM281XX_PIN_VC_CAM3_SDA,
-};
-
-static int bcm281xx_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
-{
-	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
-
-	return pdata->npins;
-}
-
-static const char *bcm281xx_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
-						   unsigned group)
-{
-	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
-
-	return pdata->pins[group].name;
-}
-
-static int bcm281xx_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
-					   unsigned group,
-					   const unsigned **pins,
-					   unsigned *num_pins)
-{
-	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
-
-	*pins = &pdata->pins[group].number;
-	*num_pins = 1;
-
-	return 0;
-}
-
-static void bcm281xx_pinctrl_pin_dbg_show(struct pinctrl_dev *pctldev,
-					  struct seq_file *s,
-					  unsigned offset)
-{
-	seq_printf(s, " %s", dev_name(pctldev->dev));
-}
-
-static struct pinctrl_ops bcm281xx_pinctrl_ops = {
-	.get_groups_count = bcm281xx_pinctrl_get_groups_count,
-	.get_group_name = bcm281xx_pinctrl_get_group_name,
-	.get_group_pins = bcm281xx_pinctrl_get_group_pins,
-	.pin_dbg_show = bcm281xx_pinctrl_pin_dbg_show,
-	.dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
-	.dt_free_map = pinctrl_utils_dt_free_map,
-};
-
-static int bcm281xx_pinctrl_get_fcns_count(struct pinctrl_dev *pctldev)
-{
-	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
-
-	return pdata->nfunctions;
-}
-
-static const char *bcm281xx_pinctrl_get_fcn_name(struct pinctrl_dev *pctldev,
-						 unsigned function)
-{
-	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
-
-	return pdata->functions[function].name;
-}
-
-static int bcm281xx_pinctrl_get_fcn_groups(struct pinctrl_dev *pctldev,
-					   unsigned function,
-					   const char * const **groups,
-					   unsigned * const num_groups)
-{
-	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
-
-	*groups = pdata->functions[function].groups;
-	*num_groups = pdata->functions[function].ngroups;
-
-	return 0;
-}
-
-static int bcm281xx_pinmux_set(struct pinctrl_dev *pctldev,
-			       unsigned function,
-			       unsigned group)
-{
-	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
-	const struct bcm281xx_pin_function *f = &pdata->functions[function];
-	u32 offset = 4 * pdata->pins[group].number;
-	int rc = 0;
-
-	dev_dbg(pctldev->dev,
-		"%s(): Enable function %s (%d) of pin %s (%d) @offset 0x%x.\n",
-		__func__, f->name, function, pdata->pins[group].name,
-		pdata->pins[group].number, offset);
-
-	rc = regmap_update_bits(pdata->regmap, offset,
-		BCM281XX_PIN_REG_F_SEL_MASK,
-		function << BCM281XX_PIN_REG_F_SEL_SHIFT);
-	if (rc)
-		dev_err(pctldev->dev,
-			"Error updating register for pin %s (%d).\n",
-			pdata->pins[group].name, pdata->pins[group].number);
-
-	return rc;
-}
-
-static struct pinmux_ops bcm281xx_pinctrl_pinmux_ops = {
-	.get_functions_count = bcm281xx_pinctrl_get_fcns_count,
-	.get_function_name = bcm281xx_pinctrl_get_fcn_name,
-	.get_function_groups = bcm281xx_pinctrl_get_fcn_groups,
-	.set_mux = bcm281xx_pinmux_set,
-};
-
-static int bcm281xx_pinctrl_pin_config_get(struct pinctrl_dev *pctldev,
-					   unsigned pin,
-					   unsigned long *config)
-{
-	return -ENOTSUPP;
-}
-
-
-/* Goes through the configs and update register val/mask */
-static int bcm281xx_std_pin_update(struct pinctrl_dev *pctldev,
-				   unsigned pin,
-				   unsigned long *configs,
-				   unsigned num_configs,
-				   u32 *val,
-				   u32 *mask)
-{
-	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
-	int i;
-	enum pin_config_param param;
-	u16 arg;
-
-	for (i = 0; i < num_configs; i++) {
-		param = pinconf_to_config_param(configs[i]);
-		arg = pinconf_to_config_argument(configs[i]);
-
-		switch (param) {
-		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-			arg = (arg >= 1 ? 1 : 0);
-			bcm281xx_pin_update(val, mask, arg,
-				BCM281XX_PIN_SHIFT(STD, HYST),
-				BCM281XX_PIN_MASK(STD, HYST));
-			break;
-		/*
-		 * The pin bias can only be one of pull-up, pull-down, or
-		 * disable.  The user does not need to specify a value for the
-		 * property, and the default value from pinconf-generic is
-		 * ignored.
-		 */
-		case PIN_CONFIG_BIAS_DISABLE:
-			bcm281xx_pin_update(val, mask, 0,
-				BCM281XX_PIN_SHIFT(STD, PULL_UP),
-				BCM281XX_PIN_MASK(STD, PULL_UP));
-			bcm281xx_pin_update(val, mask, 0,
-				BCM281XX_PIN_SHIFT(STD, PULL_DN),
-				BCM281XX_PIN_MASK(STD, PULL_DN));
-			break;
-
-		case PIN_CONFIG_BIAS_PULL_UP:
-			bcm281xx_pin_update(val, mask, 1,
-				BCM281XX_PIN_SHIFT(STD, PULL_UP),
-				BCM281XX_PIN_MASK(STD, PULL_UP));
-			bcm281xx_pin_update(val, mask, 0,
-				BCM281XX_PIN_SHIFT(STD, PULL_DN),
-				BCM281XX_PIN_MASK(STD, PULL_DN));
-			break;
-
-		case PIN_CONFIG_BIAS_PULL_DOWN:
-			bcm281xx_pin_update(val, mask, 0,
-				BCM281XX_PIN_SHIFT(STD, PULL_UP),
-				BCM281XX_PIN_MASK(STD, PULL_UP));
-			bcm281xx_pin_update(val, mask, 1,
-				BCM281XX_PIN_SHIFT(STD, PULL_DN),
-				BCM281XX_PIN_MASK(STD, PULL_DN));
-			break;
-
-		case PIN_CONFIG_SLEW_RATE:
-			arg = (arg >= 1 ? 1 : 0);
-			bcm281xx_pin_update(val, mask, arg,
-				BCM281XX_PIN_SHIFT(STD, SLEW),
-				BCM281XX_PIN_MASK(STD, SLEW));
-			break;
-
-		case PIN_CONFIG_INPUT_ENABLE:
-			/* inversed since register is for input _disable_ */
-			arg = (arg >= 1 ? 0 : 1);
-			bcm281xx_pin_update(val, mask, arg,
-				BCM281XX_PIN_SHIFT(STD, INPUT_DIS),
-				BCM281XX_PIN_MASK(STD, INPUT_DIS));
-			break;
-
-		case PIN_CONFIG_DRIVE_STRENGTH:
-			/* Valid range is 2-16 mA, even numbers only */
-			if ((arg < 2) || (arg > 16) || (arg % 2)) {
-				dev_err(pctldev->dev,
-					"Invalid Drive Strength value (%d) for "
-					"pin %s (%d). Valid values are "
-					"(2..16) mA, even numbers only.\n",
-					arg, pdata->pins[pin].name, pin);
-				return -EINVAL;
-			}
-			bcm281xx_pin_update(val, mask, (arg/2)-1,
-				BCM281XX_PIN_SHIFT(STD, DRV_STR),
-				BCM281XX_PIN_MASK(STD, DRV_STR));
-			break;
-
-		default:
-			dev_err(pctldev->dev,
-				"Unrecognized pin config %d for pin %s (%d).\n",
-				param, pdata->pins[pin].name, pin);
-			return -EINVAL;
-
-		} /* switch config */
-	} /* for each config */
-
-	return 0;
-}
-
-/*
- * The pull-up strength for an I2C pin is represented by bits 4-6 in the
- * register with the following mapping:
- *   0b000: No pull-up
- *   0b001: 1200 Ohm
- *   0b010: 1800 Ohm
- *   0b011: 720 Ohm
- *   0b100: 2700 Ohm
- *   0b101: 831 Ohm
- *   0b110: 1080 Ohm
- *   0b111: 568 Ohm
- * This array maps pull-up strength in Ohms to register values (1+index).
- */
-static const u16 bcm281xx_pullup_map[] = {
-	1200, 1800, 720, 2700, 831, 1080, 568
-};
-
-/* Goes through the configs and update register val/mask */
-static int bcm281xx_i2c_pin_update(struct pinctrl_dev *pctldev,
-				   unsigned pin,
-				   unsigned long *configs,
-				   unsigned num_configs,
-				   u32 *val,
-				   u32 *mask)
-{
-	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
-	int i, j;
-	enum pin_config_param param;
-	u16 arg;
-
-	for (i = 0; i < num_configs; i++) {
-		param = pinconf_to_config_param(configs[i]);
-		arg = pinconf_to_config_argument(configs[i]);
-
-		switch (param) {
-		case PIN_CONFIG_BIAS_PULL_UP:
-			for (j = 0; j < ARRAY_SIZE(bcm281xx_pullup_map); j++)
-				if (bcm281xx_pullup_map[j] == arg)
-					break;
-
-			if (j == ARRAY_SIZE(bcm281xx_pullup_map)) {
-				dev_err(pctldev->dev,
-					"Invalid pull-up value (%d) for pin %s "
-					"(%d). Valid values are 568, 720, 831, "
-					"1080, 1200, 1800, 2700 Ohms.\n",
-					arg, pdata->pins[pin].name, pin);
-				return -EINVAL;
-			}
-
-			bcm281xx_pin_update(val, mask, j+1,
-				BCM281XX_PIN_SHIFT(I2C, PULL_UP_STR),
-				BCM281XX_PIN_MASK(I2C, PULL_UP_STR));
-			break;
-
-		case PIN_CONFIG_BIAS_DISABLE:
-			bcm281xx_pin_update(val, mask, 0,
-				BCM281XX_PIN_SHIFT(I2C, PULL_UP_STR),
-				BCM281XX_PIN_MASK(I2C, PULL_UP_STR));
-			break;
-
-		case PIN_CONFIG_SLEW_RATE:
-			arg = (arg >= 1 ? 1 : 0);
-			bcm281xx_pin_update(val, mask, arg,
-				BCM281XX_PIN_SHIFT(I2C, SLEW),
-				BCM281XX_PIN_MASK(I2C, SLEW));
-			break;
-
-		case PIN_CONFIG_INPUT_ENABLE:
-			/* inversed since register is for input _disable_ */
-			arg = (arg >= 1 ? 0 : 1);
-			bcm281xx_pin_update(val, mask, arg,
-				BCM281XX_PIN_SHIFT(I2C, INPUT_DIS),
-				BCM281XX_PIN_MASK(I2C, INPUT_DIS));
-			break;
-
-		default:
-			dev_err(pctldev->dev,
-				"Unrecognized pin config %d for pin %s (%d).\n",
-				param, pdata->pins[pin].name, pin);
-			return -EINVAL;
-
-		} /* switch config */
-	} /* for each config */
-
-	return 0;
-}
-
-/* Goes through the configs and update register val/mask */
-static int bcm281xx_hdmi_pin_update(struct pinctrl_dev *pctldev,
-				    unsigned pin,
-				    unsigned long *configs,
-				    unsigned num_configs,
-				    u32 *val,
-				    u32 *mask)
-{
-	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
-	int i;
-	enum pin_config_param param;
-	u16 arg;
-
-	for (i = 0; i < num_configs; i++) {
-		param = pinconf_to_config_param(configs[i]);
-		arg = pinconf_to_config_argument(configs[i]);
-
-		switch (param) {
-		case PIN_CONFIG_SLEW_RATE:
-			arg = (arg >= 1 ? 1 : 0);
-			bcm281xx_pin_update(val, mask, arg,
-				BCM281XX_PIN_SHIFT(HDMI, MODE),
-				BCM281XX_PIN_MASK(HDMI, MODE));
-			break;
-
-		case PIN_CONFIG_INPUT_ENABLE:
-			/* inversed since register is for input _disable_ */
-			arg = (arg >= 1 ? 0 : 1);
-			bcm281xx_pin_update(val, mask, arg,
-				BCM281XX_PIN_SHIFT(HDMI, INPUT_DIS),
-				BCM281XX_PIN_MASK(HDMI, INPUT_DIS));
-			break;
-
-		default:
-			dev_err(pctldev->dev,
-				"Unrecognized pin config %d for pin %s (%d).\n",
-				param, pdata->pins[pin].name, pin);
-			return -EINVAL;
-
-		} /* switch config */
-	} /* for each config */
-
-	return 0;
-}
-
-static int bcm281xx_pinctrl_pin_config_set(struct pinctrl_dev *pctldev,
-					   unsigned pin,
-					   unsigned long *configs,
-					   unsigned num_configs)
-{
-	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
-	enum bcm281xx_pin_type pin_type;
-	u32 offset = 4 * pin;
-	u32 cfg_val, cfg_mask;
-	int rc;
-
-	cfg_val = 0;
-	cfg_mask = 0;
-	pin_type = pin_type_get(pctldev, pin);
-
-	/* Different pins have different configuration options */
-	switch (pin_type) {
-	case BCM281XX_PIN_TYPE_STD:
-		rc = bcm281xx_std_pin_update(pctldev, pin, configs,
-			num_configs, &cfg_val, &cfg_mask);
-		break;
-
-	case BCM281XX_PIN_TYPE_I2C:
-		rc = bcm281xx_i2c_pin_update(pctldev, pin, configs,
-			num_configs, &cfg_val, &cfg_mask);
-		break;
-
-	case BCM281XX_PIN_TYPE_HDMI:
-		rc = bcm281xx_hdmi_pin_update(pctldev, pin, configs,
-			num_configs, &cfg_val, &cfg_mask);
-		break;
-
-	default:
-		dev_err(pctldev->dev, "Unknown pin type for pin %s (%d).\n",
-			pdata->pins[pin].name, pin);
-		return -EINVAL;
-
-	} /* switch pin type */
-
-	if (rc)
-		return rc;
-
-	dev_dbg(pctldev->dev,
-		"%s(): Set pin %s (%d) with config 0x%x, mask 0x%x\n",
-		__func__, pdata->pins[pin].name, pin, cfg_val, cfg_mask);
-
-	rc = regmap_update_bits(pdata->regmap, offset, cfg_mask, cfg_val);
-	if (rc) {
-		dev_err(pctldev->dev,
-			"Error updating register for pin %s (%d).\n",
-			pdata->pins[pin].name, pin);
-		return rc;
-	}
-
-	return 0;
-}
-
-static struct pinconf_ops bcm281xx_pinctrl_pinconf_ops = {
-	.pin_config_get = bcm281xx_pinctrl_pin_config_get,
-	.pin_config_set = bcm281xx_pinctrl_pin_config_set,
-};
-
-static struct pinctrl_desc bcm281xx_pinctrl_desc = {
-	/* name, pins, npins members initialized in probe function */
-	.pctlops = &bcm281xx_pinctrl_ops,
-	.pmxops = &bcm281xx_pinctrl_pinmux_ops,
-	.confops = &bcm281xx_pinctrl_pinconf_ops,
-	.owner = THIS_MODULE,
-};
-
-static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
-{
-	struct bcm281xx_pinctrl_data *pdata = &bcm281xx_pinctrl;
-	struct resource *res;
-	struct pinctrl_dev *pctl;
-
-	/* So far We can assume there is only 1 bank of registers */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pdata->reg_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(pdata->reg_base)) {
-		dev_err(&pdev->dev, "Failed to ioremap MEM resource\n");
-		return -ENODEV;
-	}
-
-	/* Initialize the dynamic part of pinctrl_desc */
-	pdata->regmap = devm_regmap_init_mmio(&pdev->dev, pdata->reg_base,
-		&bcm281xx_pinctrl_regmap_config);
-	if (IS_ERR(pdata->regmap)) {
-		dev_err(&pdev->dev, "Regmap MMIO init failed.\n");
-		return -ENODEV;
-	}
-
-	bcm281xx_pinctrl_desc.name = dev_name(&pdev->dev);
-	bcm281xx_pinctrl_desc.pins = bcm281xx_pinctrl.pins;
-	bcm281xx_pinctrl_desc.npins = bcm281xx_pinctrl.npins;
-
-	pctl = pinctrl_register(&bcm281xx_pinctrl_desc,
-				&pdev->dev,
-				pdata);
-	if (!pctl) {
-		dev_err(&pdev->dev, "Failed to register pinctrl\n");
-		return -ENODEV;
-	}
-
-	platform_set_drvdata(pdev, pdata);
-
-	return 0;
-}
-
-static struct of_device_id bcm281xx_pinctrl_of_match[] = {
-	{ .compatible = "brcm,bcm11351-pinctrl", },
-	{ },
-};
-
-static struct platform_driver bcm281xx_pinctrl_driver = {
-	.driver = {
-		.name = "bcm281xx-pinctrl",
-		.of_match_table = bcm281xx_pinctrl_of_match,
-	},
-};
-
-module_platform_driver_probe(bcm281xx_pinctrl_driver, bcm281xx_pinctrl_probe);
-
-MODULE_AUTHOR("Broadcom Corporation <bcm-kernel-feedback-list@broadcom.com>");
-MODULE_AUTHOR("Sherman Yin <syin@broadcom.com>");
-MODULE_DESCRIPTION("Broadcom BCM281xx pinctrl driver");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/pinctrl-bcm2835.c b/drivers/pinctrl/pinctrl-bcm2835.c
deleted file mode 100644
index 9aa8a3f..0000000
--- a/drivers/pinctrl/pinctrl-bcm2835.c
+++ /dev/null
@@ -1,1072 +0,0 @@
-/*
- * Driver for Broadcom BCM2835 GPIO unit (pinctrl + GPIO)
- *
- * Copyright (C) 2012 Chris Boot, Simon Arlott, Stephen Warren
- *
- * This driver is inspired by:
- * pinctrl-nomadik.c, please see original file for copyright information
- * pinctrl-tegra.c, please see original file for copyright information
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#include <linux/bitmap.h>
-#include <linux/bug.h>
-#include <linux/delay.h>
-#include <linux/device.h>
-#include <linux/err.h>
-#include <linux/gpio.h>
-#include <linux/interrupt.h>
-#include <linux/io.h>
-#include <linux/irq.h>
-#include <linux/irqdesc.h>
-#include <linux/irqdomain.h>
-#include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of.h>
-#include <linux/of_irq.h>
-#include <linux/pinctrl/consumer.h>
-#include <linux/pinctrl/machine.h>
-#include <linux/pinctrl/pinconf.h>
-#include <linux/pinctrl/pinctrl.h>
-#include <linux/pinctrl/pinmux.h>
-#include <linux/platform_device.h>
-#include <linux/seq_file.h>
-#include <linux/slab.h>
-#include <linux/spinlock.h>
-#include <linux/types.h>
-
-#define MODULE_NAME "pinctrl-bcm2835"
-#define BCM2835_NUM_GPIOS 54
-#define BCM2835_NUM_BANKS 2
-
-#define BCM2835_PIN_BITMAP_SZ \
-	DIV_ROUND_UP(BCM2835_NUM_GPIOS, sizeof(unsigned long) * 8)
-
-/* GPIO register offsets */
-#define GPFSEL0		0x0	/* Function Select */
-#define GPSET0		0x1c	/* Pin Output Set */
-#define GPCLR0		0x28	/* Pin Output Clear */
-#define GPLEV0		0x34	/* Pin Level */
-#define GPEDS0		0x40	/* Pin Event Detect Status */
-#define GPREN0		0x4c	/* Pin Rising Edge Detect Enable */
-#define GPFEN0		0x58	/* Pin Falling Edge Detect Enable */
-#define GPHEN0		0x64	/* Pin High Detect Enable */
-#define GPLEN0		0x70	/* Pin Low Detect Enable */
-#define GPAREN0		0x7c	/* Pin Async Rising Edge Detect */
-#define GPAFEN0		0x88	/* Pin Async Falling Edge Detect */
-#define GPPUD		0x94	/* Pin Pull-up/down Enable */
-#define GPPUDCLK0	0x98	/* Pin Pull-up/down Enable Clock */
-
-#define FSEL_REG(p)		(GPFSEL0 + (((p) / 10) * 4))
-#define FSEL_SHIFT(p)		(((p) % 10) * 3)
-#define GPIO_REG_OFFSET(p)	((p) / 32)
-#define GPIO_REG_SHIFT(p)	((p) % 32)
-
-enum bcm2835_pinconf_param {
-	/* argument: bcm2835_pinconf_pull */
-	BCM2835_PINCONF_PARAM_PULL,
-};
-
-enum bcm2835_pinconf_pull {
-	BCM2835_PINCONFIG_PULL_NONE,
-	BCM2835_PINCONFIG_PULL_DOWN,
-	BCM2835_PINCONFIG_PULL_UP,
-};
-
-#define BCM2835_PINCONF_PACK(_param_, _arg_) ((_param_) << 16 | (_arg_))
-#define BCM2835_PINCONF_UNPACK_PARAM(_conf_) ((_conf_) >> 16)
-#define BCM2835_PINCONF_UNPACK_ARG(_conf_) ((_conf_) & 0xffff)
-
-struct bcm2835_gpio_irqdata {
-	struct bcm2835_pinctrl *pc;
-	int bank;
-};
-
-struct bcm2835_pinctrl {
-	struct device *dev;
-	void __iomem *base;
-	int irq[BCM2835_NUM_BANKS];
-
-	/* note: locking assumes each bank will have its own unsigned long */
-	unsigned long enabled_irq_map[BCM2835_NUM_BANKS];
-	unsigned int irq_type[BCM2835_NUM_GPIOS];
-
-	struct pinctrl_dev *pctl_dev;
-	struct irq_domain *irq_domain;
-	struct gpio_chip gpio_chip;
-	struct pinctrl_gpio_range gpio_range;
-
-	struct bcm2835_gpio_irqdata irq_data[BCM2835_NUM_BANKS];
-	spinlock_t irq_lock[BCM2835_NUM_BANKS];
-};
-
-static struct lock_class_key gpio_lock_class;
-
-/* pins are just named GPIO0..GPIO53 */
-#define BCM2835_GPIO_PIN(a) PINCTRL_PIN(a, "gpio" #a)
-static struct pinctrl_pin_desc bcm2835_gpio_pins[] = {
-	BCM2835_GPIO_PIN(0),
-	BCM2835_GPIO_PIN(1),
-	BCM2835_GPIO_PIN(2),
-	BCM2835_GPIO_PIN(3),
-	BCM2835_GPIO_PIN(4),
-	BCM2835_GPIO_PIN(5),
-	BCM2835_GPIO_PIN(6),
-	BCM2835_GPIO_PIN(7),
-	BCM2835_GPIO_PIN(8),
-	BCM2835_GPIO_PIN(9),
-	BCM2835_GPIO_PIN(10),
-	BCM2835_GPIO_PIN(11),
-	BCM2835_GPIO_PIN(12),
-	BCM2835_GPIO_PIN(13),
-	BCM2835_GPIO_PIN(14),
-	BCM2835_GPIO_PIN(15),
-	BCM2835_GPIO_PIN(16),
-	BCM2835_GPIO_PIN(17),
-	BCM2835_GPIO_PIN(18),
-	BCM2835_GPIO_PIN(19),
-	BCM2835_GPIO_PIN(20),
-	BCM2835_GPIO_PIN(21),
-	BCM2835_GPIO_PIN(22),
-	BCM2835_GPIO_PIN(23),
-	BCM2835_GPIO_PIN(24),
-	BCM2835_GPIO_PIN(25),
-	BCM2835_GPIO_PIN(26),
-	BCM2835_GPIO_PIN(27),
-	BCM2835_GPIO_PIN(28),
-	BCM2835_GPIO_PIN(29),
-	BCM2835_GPIO_PIN(30),
-	BCM2835_GPIO_PIN(31),
-	BCM2835_GPIO_PIN(32),
-	BCM2835_GPIO_PIN(33),
-	BCM2835_GPIO_PIN(34),
-	BCM2835_GPIO_PIN(35),
-	BCM2835_GPIO_PIN(36),
-	BCM2835_GPIO_PIN(37),
-	BCM2835_GPIO_PIN(38),
-	BCM2835_GPIO_PIN(39),
-	BCM2835_GPIO_PIN(40),
-	BCM2835_GPIO_PIN(41),
-	BCM2835_GPIO_PIN(42),
-	BCM2835_GPIO_PIN(43),
-	BCM2835_GPIO_PIN(44),
-	BCM2835_GPIO_PIN(45),
-	BCM2835_GPIO_PIN(46),
-	BCM2835_GPIO_PIN(47),
-	BCM2835_GPIO_PIN(48),
-	BCM2835_GPIO_PIN(49),
-	BCM2835_GPIO_PIN(50),
-	BCM2835_GPIO_PIN(51),
-	BCM2835_GPIO_PIN(52),
-	BCM2835_GPIO_PIN(53),
-};
-
-/* one pin per group */
-static const char * const bcm2835_gpio_groups[] = {
-	"gpio0",
-	"gpio1",
-	"gpio2",
-	"gpio3",
-	"gpio4",
-	"gpio5",
-	"gpio6",
-	"gpio7",
-	"gpio8",
-	"gpio9",
-	"gpio10",
-	"gpio11",
-	"gpio12",
-	"gpio13",
-	"gpio14",
-	"gpio15",
-	"gpio16",
-	"gpio17",
-	"gpio18",
-	"gpio19",
-	"gpio20",
-	"gpio21",
-	"gpio22",
-	"gpio23",
-	"gpio24",
-	"gpio25",
-	"gpio26",
-	"gpio27",
-	"gpio28",
-	"gpio29",
-	"gpio30",
-	"gpio31",
-	"gpio32",
-	"gpio33",
-	"gpio34",
-	"gpio35",
-	"gpio36",
-	"gpio37",
-	"gpio38",
-	"gpio39",
-	"gpio40",
-	"gpio41",
-	"gpio42",
-	"gpio43",
-	"gpio44",
-	"gpio45",
-	"gpio46",
-	"gpio47",
-	"gpio48",
-	"gpio49",
-	"gpio50",
-	"gpio51",
-	"gpio52",
-	"gpio53",
-};
-
-enum bcm2835_fsel {
-	BCM2835_FSEL_GPIO_IN = 0,
-	BCM2835_FSEL_GPIO_OUT = 1,
-	BCM2835_FSEL_ALT0 = 4,
-	BCM2835_FSEL_ALT1 = 5,
-	BCM2835_FSEL_ALT2 = 6,
-	BCM2835_FSEL_ALT3 = 7,
-	BCM2835_FSEL_ALT4 = 3,
-	BCM2835_FSEL_ALT5 = 2,
-	BCM2835_FSEL_COUNT = 8,
-	BCM2835_FSEL_MASK = 0x7,
-};
-
-static const char * const bcm2835_functions[BCM2835_FSEL_COUNT] = {
-	[BCM2835_FSEL_GPIO_IN] = "gpio_in",
-	[BCM2835_FSEL_GPIO_OUT] = "gpio_out",
-	[BCM2835_FSEL_ALT0] = "alt0",
-	[BCM2835_FSEL_ALT1] = "alt1",
-	[BCM2835_FSEL_ALT2] = "alt2",
-	[BCM2835_FSEL_ALT3] = "alt3",
-	[BCM2835_FSEL_ALT4] = "alt4",
-	[BCM2835_FSEL_ALT5] = "alt5",
-};
-
-static const char * const irq_type_names[] = {
-	[IRQ_TYPE_NONE] = "none",
-	[IRQ_TYPE_EDGE_RISING] = "edge-rising",
-	[IRQ_TYPE_EDGE_FALLING] = "edge-falling",
-	[IRQ_TYPE_EDGE_BOTH] = "edge-both",
-	[IRQ_TYPE_LEVEL_HIGH] = "level-high",
-	[IRQ_TYPE_LEVEL_LOW] = "level-low",
-};
-
-static inline u32 bcm2835_gpio_rd(struct bcm2835_pinctrl *pc, unsigned reg)
-{
-	return readl(pc->base + reg);
-}
-
-static inline void bcm2835_gpio_wr(struct bcm2835_pinctrl *pc, unsigned reg,
-		u32 val)
-{
-	writel(val, pc->base + reg);
-}
-
-static inline int bcm2835_gpio_get_bit(struct bcm2835_pinctrl *pc, unsigned reg,
-		unsigned bit)
-{
-	reg += GPIO_REG_OFFSET(bit) * 4;
-	return (bcm2835_gpio_rd(pc, reg) >> GPIO_REG_SHIFT(bit)) & 1;
-}
-
-/* note NOT a read/modify/write cycle */
-static inline void bcm2835_gpio_set_bit(struct bcm2835_pinctrl *pc,
-		unsigned reg, unsigned bit)
-{
-	reg += GPIO_REG_OFFSET(bit) * 4;
-	bcm2835_gpio_wr(pc, reg, BIT(GPIO_REG_SHIFT(bit)));
-}
-
-static inline enum bcm2835_fsel bcm2835_pinctrl_fsel_get(
-		struct bcm2835_pinctrl *pc, unsigned pin)
-{
-	u32 val = bcm2835_gpio_rd(pc, FSEL_REG(pin));
-	enum bcm2835_fsel status = (val >> FSEL_SHIFT(pin)) & BCM2835_FSEL_MASK;
-
-	dev_dbg(pc->dev, "get %08x (%u => %s)\n", val, pin,
-			bcm2835_functions[status]);
-
-	return status;
-}
-
-static inline void bcm2835_pinctrl_fsel_set(
-		struct bcm2835_pinctrl *pc, unsigned pin,
-		enum bcm2835_fsel fsel)
-{
-	u32 val = bcm2835_gpio_rd(pc, FSEL_REG(pin));
-	enum bcm2835_fsel cur = (val >> FSEL_SHIFT(pin)) & BCM2835_FSEL_MASK;
-
-	dev_dbg(pc->dev, "read %08x (%u => %s)\n", val, pin,
-			bcm2835_functions[cur]);
-
-	if (cur == fsel)
-		return;
-
-	if (cur != BCM2835_FSEL_GPIO_IN && fsel != BCM2835_FSEL_GPIO_IN) {
-		/* always transition through GPIO_IN */
-		val &= ~(BCM2835_FSEL_MASK << FSEL_SHIFT(pin));
-		val |= BCM2835_FSEL_GPIO_IN << FSEL_SHIFT(pin);
-
-		dev_dbg(pc->dev, "trans %08x (%u <= %s)\n", val, pin,
-				bcm2835_functions[BCM2835_FSEL_GPIO_IN]);
-		bcm2835_gpio_wr(pc, FSEL_REG(pin), val);
-	}
-
-	val &= ~(BCM2835_FSEL_MASK << FSEL_SHIFT(pin));
-	val |= fsel << FSEL_SHIFT(pin);
-
-	dev_dbg(pc->dev, "write %08x (%u <= %s)\n", val, pin,
-			bcm2835_functions[fsel]);
-	bcm2835_gpio_wr(pc, FSEL_REG(pin), val);
-}
-
-static int bcm2835_gpio_request(struct gpio_chip *chip, unsigned offset)
-{
-	return pinctrl_request_gpio(chip->base + offset);
-}
-
-static void bcm2835_gpio_free(struct gpio_chip *chip, unsigned offset)
-{
-	pinctrl_free_gpio(chip->base + offset);
-}
-
-static int bcm2835_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
-{
-	return pinctrl_gpio_direction_input(chip->base + offset);
-}
-
-static int bcm2835_gpio_get(struct gpio_chip *chip, unsigned offset)
-{
-	struct bcm2835_pinctrl *pc = dev_get_drvdata(chip->dev);
-
-	return bcm2835_gpio_get_bit(pc, GPLEV0, offset);
-}
-
-static int bcm2835_gpio_direction_output(struct gpio_chip *chip,
-		unsigned offset, int value)
-{
-	return pinctrl_gpio_direction_output(chip->base + offset);
-}
-
-static void bcm2835_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
-{
-	struct bcm2835_pinctrl *pc = dev_get_drvdata(chip->dev);
-
-	bcm2835_gpio_set_bit(pc, value ? GPSET0 : GPCLR0, offset);
-}
-
-static int bcm2835_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
-{
-	struct bcm2835_pinctrl *pc = dev_get_drvdata(chip->dev);
-
-	return irq_linear_revmap(pc->irq_domain, offset);
-}
-
-static struct gpio_chip bcm2835_gpio_chip = {
-	.label = MODULE_NAME,
-	.owner = THIS_MODULE,
-	.request = bcm2835_gpio_request,
-	.free = bcm2835_gpio_free,
-	.direction_input = bcm2835_gpio_direction_input,
-	.direction_output = bcm2835_gpio_direction_output,
-	.get = bcm2835_gpio_get,
-	.set = bcm2835_gpio_set,
-	.to_irq = bcm2835_gpio_to_irq,
-	.base = -1,
-	.ngpio = BCM2835_NUM_GPIOS,
-	.can_sleep = false,
-};
-
-static irqreturn_t bcm2835_gpio_irq_handler(int irq, void *dev_id)
-{
-	struct bcm2835_gpio_irqdata *irqdata = dev_id;
-	struct bcm2835_pinctrl *pc = irqdata->pc;
-	int bank = irqdata->bank;
-	unsigned long events;
-	unsigned offset;
-	unsigned gpio;
-	unsigned int type;
-
-	events = bcm2835_gpio_rd(pc, GPEDS0 + bank * 4);
-	events &= pc->enabled_irq_map[bank];
-	for_each_set_bit(offset, &events, 32) {
-		gpio = (32 * bank) + offset;
-		type = pc->irq_type[gpio];
-
-		/* ack edge triggered IRQs immediately */
-		if (!(type & IRQ_TYPE_LEVEL_MASK))
-			bcm2835_gpio_set_bit(pc, GPEDS0, gpio);
-
-		generic_handle_irq(irq_linear_revmap(pc->irq_domain, gpio));
-
-		/* ack level triggered IRQ after handling them */
-		if (type & IRQ_TYPE_LEVEL_MASK)
-			bcm2835_gpio_set_bit(pc, GPEDS0, gpio);
-	}
-	return events ? IRQ_HANDLED : IRQ_NONE;
-}
-
-static inline void __bcm2835_gpio_irq_config(struct bcm2835_pinctrl *pc,
-	unsigned reg, unsigned offset, bool enable)
-{
-	u32 value;
-	reg += GPIO_REG_OFFSET(offset) * 4;
-	value = bcm2835_gpio_rd(pc, reg);
-	if (enable)
-		value |= BIT(GPIO_REG_SHIFT(offset));
-	else
-		value &= ~(BIT(GPIO_REG_SHIFT(offset)));
-	bcm2835_gpio_wr(pc, reg, value);
-}
-
-/* fast path for IRQ handler */
-static void bcm2835_gpio_irq_config(struct bcm2835_pinctrl *pc,
-	unsigned offset, bool enable)
-{
-	switch (pc->irq_type[offset]) {
-	case IRQ_TYPE_EDGE_RISING:
-		__bcm2835_gpio_irq_config(pc, GPREN0, offset, enable);
-		break;
-
-	case IRQ_TYPE_EDGE_FALLING:
-		__bcm2835_gpio_irq_config(pc, GPFEN0, offset, enable);
-		break;
-
-	case IRQ_TYPE_EDGE_BOTH:
-		__bcm2835_gpio_irq_config(pc, GPREN0, offset, enable);
-		__bcm2835_gpio_irq_config(pc, GPFEN0, offset, enable);
-		break;
-
-	case IRQ_TYPE_LEVEL_HIGH:
-		__bcm2835_gpio_irq_config(pc, GPHEN0, offset, enable);
-		break;
-
-	case IRQ_TYPE_LEVEL_LOW:
-		__bcm2835_gpio_irq_config(pc, GPLEN0, offset, enable);
-		break;
-	}
-}
-
-static void bcm2835_gpio_irq_enable(struct irq_data *data)
-{
-	struct bcm2835_pinctrl *pc = irq_data_get_irq_chip_data(data);
-	unsigned gpio = irqd_to_hwirq(data);
-	unsigned offset = GPIO_REG_SHIFT(gpio);
-	unsigned bank = GPIO_REG_OFFSET(gpio);
-	unsigned long flags;
-
-	spin_lock_irqsave(&pc->irq_lock[bank], flags);
-	set_bit(offset, &pc->enabled_irq_map[bank]);
-	bcm2835_gpio_irq_config(pc, gpio, true);
-	spin_unlock_irqrestore(&pc->irq_lock[bank], flags);
-}
-
-static void bcm2835_gpio_irq_disable(struct irq_data *data)
-{
-	struct bcm2835_pinctrl *pc = irq_data_get_irq_chip_data(data);
-	unsigned gpio = irqd_to_hwirq(data);
-	unsigned offset = GPIO_REG_SHIFT(gpio);
-	unsigned bank = GPIO_REG_OFFSET(gpio);
-	unsigned long flags;
-
-	spin_lock_irqsave(&pc->irq_lock[bank], flags);
-	bcm2835_gpio_irq_config(pc, gpio, false);
-	clear_bit(offset, &pc->enabled_irq_map[bank]);
-	spin_unlock_irqrestore(&pc->irq_lock[bank], flags);
-}
-
-static int __bcm2835_gpio_irq_set_type_disabled(struct bcm2835_pinctrl *pc,
-	unsigned offset, unsigned int type)
-{
-	switch (type) {
-	case IRQ_TYPE_NONE:
-	case IRQ_TYPE_EDGE_RISING:
-	case IRQ_TYPE_EDGE_FALLING:
-	case IRQ_TYPE_EDGE_BOTH:
-	case IRQ_TYPE_LEVEL_HIGH:
-	case IRQ_TYPE_LEVEL_LOW:
-		pc->irq_type[offset] = type;
-		break;
-
-	default:
-		return -EINVAL;
-	}
-	return 0;
-}
-
-/* slower path for reconfiguring IRQ type */
-static int __bcm2835_gpio_irq_set_type_enabled(struct bcm2835_pinctrl *pc,
-	unsigned offset, unsigned int type)
-{
-	switch (type) {
-	case IRQ_TYPE_NONE:
-		if (pc->irq_type[offset] != type) {
-			bcm2835_gpio_irq_config(pc, offset, false);
-			pc->irq_type[offset] = type;
-		}
-		break;
-
-	case IRQ_TYPE_EDGE_RISING:
-		if (pc->irq_type[offset] == IRQ_TYPE_EDGE_BOTH) {
-			/* RISING already enabled, disable FALLING */
-			pc->irq_type[offset] = IRQ_TYPE_EDGE_FALLING;
-			bcm2835_gpio_irq_config(pc, offset, false);
-			pc->irq_type[offset] = type;
-		} else if (pc->irq_type[offset] != type) {
-			bcm2835_gpio_irq_config(pc, offset, false);
-			pc->irq_type[offset] = type;
-			bcm2835_gpio_irq_config(pc, offset, true);
-		}
-		break;
-
-	case IRQ_TYPE_EDGE_FALLING:
-		if (pc->irq_type[offset] == IRQ_TYPE_EDGE_BOTH) {
-			/* FALLING already enabled, disable RISING */
-			pc->irq_type[offset] = IRQ_TYPE_EDGE_RISING;
-			bcm2835_gpio_irq_config(pc, offset, false);
-			pc->irq_type[offset] = type;
-		} else if (pc->irq_type[offset] != type) {
-			bcm2835_gpio_irq_config(pc, offset, false);
-			pc->irq_type[offset] = type;
-			bcm2835_gpio_irq_config(pc, offset, true);
-		}
-		break;
-
-	case IRQ_TYPE_EDGE_BOTH:
-		if (pc->irq_type[offset] == IRQ_TYPE_EDGE_RISING) {
-			/* RISING already enabled, enable FALLING too */
-			pc->irq_type[offset] = IRQ_TYPE_EDGE_FALLING;
-			bcm2835_gpio_irq_config(pc, offset, true);
-			pc->irq_type[offset] = type;
-		} else if (pc->irq_type[offset] == IRQ_TYPE_EDGE_FALLING) {
-			/* FALLING already enabled, enable RISING too */
-			pc->irq_type[offset] = IRQ_TYPE_EDGE_RISING;
-			bcm2835_gpio_irq_config(pc, offset, true);
-			pc->irq_type[offset] = type;
-		} else if (pc->irq_type[offset] != type) {
-			bcm2835_gpio_irq_config(pc, offset, false);
-			pc->irq_type[offset] = type;
-			bcm2835_gpio_irq_config(pc, offset, true);
-		}
-		break;
-
-	case IRQ_TYPE_LEVEL_HIGH:
-	case IRQ_TYPE_LEVEL_LOW:
-		if (pc->irq_type[offset] != type) {
-			bcm2835_gpio_irq_config(pc, offset, false);
-			pc->irq_type[offset] = type;
-			bcm2835_gpio_irq_config(pc, offset, true);
-		}
-		break;
-
-	default:
-		return -EINVAL;
-	}
-	return 0;
-}
-
-static int bcm2835_gpio_irq_set_type(struct irq_data *data, unsigned int type)
-{
-	struct bcm2835_pinctrl *pc = irq_data_get_irq_chip_data(data);
-	unsigned gpio = irqd_to_hwirq(data);
-	unsigned offset = GPIO_REG_SHIFT(gpio);
-	unsigned bank = GPIO_REG_OFFSET(gpio);
-	unsigned long flags;
-	int ret;
-
-	spin_lock_irqsave(&pc->irq_lock[bank], flags);
-
-	if (test_bit(offset, &pc->enabled_irq_map[bank]))
-		ret = __bcm2835_gpio_irq_set_type_enabled(pc, gpio, type);
-	else
-		ret = __bcm2835_gpio_irq_set_type_disabled(pc, gpio, type);
-
-	spin_unlock_irqrestore(&pc->irq_lock[bank], flags);
-
-	return ret;
-}
-
-static struct irq_chip bcm2835_gpio_irq_chip = {
-	.name = MODULE_NAME,
-	.irq_enable = bcm2835_gpio_irq_enable,
-	.irq_disable = bcm2835_gpio_irq_disable,
-	.irq_set_type = bcm2835_gpio_irq_set_type,
-};
-
-static int bcm2835_pctl_get_groups_count(struct pinctrl_dev *pctldev)
-{
-	return ARRAY_SIZE(bcm2835_gpio_groups);
-}
-
-static const char *bcm2835_pctl_get_group_name(struct pinctrl_dev *pctldev,
-		unsigned selector)
-{
-	return bcm2835_gpio_groups[selector];
-}
-
-static int bcm2835_pctl_get_group_pins(struct pinctrl_dev *pctldev,
-		unsigned selector,
-		const unsigned **pins,
-		unsigned *num_pins)
-{
-	*pins = &bcm2835_gpio_pins[selector].number;
-	*num_pins = 1;
-
-	return 0;
-}
-
-static void bcm2835_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
-		struct seq_file *s,
-		unsigned offset)
-{
-	struct bcm2835_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
-	enum bcm2835_fsel fsel = bcm2835_pinctrl_fsel_get(pc, offset);
-	const char *fname = bcm2835_functions[fsel];
-	int value = bcm2835_gpio_get_bit(pc, GPLEV0, offset);
-	int irq = irq_find_mapping(pc->irq_domain, offset);
-
-	seq_printf(s, "function %s in %s; irq %d (%s)",
-		fname, value ? "hi" : "lo",
-		irq, irq_type_names[pc->irq_type[offset]]);
-}
-
-static void bcm2835_pctl_dt_free_map(struct pinctrl_dev *pctldev,
-		struct pinctrl_map *maps, unsigned num_maps)
-{
-	int i;
-
-	for (i = 0; i < num_maps; i++)
-		if (maps[i].type == PIN_MAP_TYPE_CONFIGS_PIN)
-			kfree(maps[i].data.configs.configs);
-
-	kfree(maps);
-}
-
-static int bcm2835_pctl_dt_node_to_map_func(struct bcm2835_pinctrl *pc,
-		struct device_node *np, u32 pin, u32 fnum,
-		struct pinctrl_map **maps)
-{
-	struct pinctrl_map *map = *maps;
-
-	if (fnum >= ARRAY_SIZE(bcm2835_functions)) {
-		dev_err(pc->dev, "%s: invalid brcm,function %d\n",
-			of_node_full_name(np), fnum);
-		return -EINVAL;
-	}
-
-	map->type = PIN_MAP_TYPE_MUX_GROUP;
-	map->data.mux.group = bcm2835_gpio_groups[pin];
-	map->data.mux.function = bcm2835_functions[fnum];
-	(*maps)++;
-
-	return 0;
-}
-
-static int bcm2835_pctl_dt_node_to_map_pull(struct bcm2835_pinctrl *pc,
-		struct device_node *np, u32 pin, u32 pull,
-		struct pinctrl_map **maps)
-{
-	struct pinctrl_map *map = *maps;
-	unsigned long *configs;
-
-	if (pull > 2) {
-		dev_err(pc->dev, "%s: invalid brcm,pull %d\n",
-			of_node_full_name(np), pull);
-		return -EINVAL;
-	}
-
-	configs = kzalloc(sizeof(*configs), GFP_KERNEL);
-	if (!configs)
-		return -ENOMEM;
-	configs[0] = BCM2835_PINCONF_PACK(BCM2835_PINCONF_PARAM_PULL, pull);
-
-	map->type = PIN_MAP_TYPE_CONFIGS_PIN;
-	map->data.configs.group_or_pin = bcm2835_gpio_pins[pin].name;
-	map->data.configs.configs = configs;
-	map->data.configs.num_configs = 1;
-	(*maps)++;
-
-	return 0;
-}
-
-static int bcm2835_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
-		struct device_node *np,
-		struct pinctrl_map **map, unsigned *num_maps)
-{
-	struct bcm2835_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
-	struct property *pins, *funcs, *pulls;
-	int num_pins, num_funcs, num_pulls, maps_per_pin;
-	struct pinctrl_map *maps, *cur_map;
-	int i, err;
-	u32 pin, func, pull;
-
-	pins = of_find_property(np, "brcm,pins", NULL);
-	if (!pins) {
-		dev_err(pc->dev, "%s: missing brcm,pins property\n",
-				of_node_full_name(np));
-		return -EINVAL;
-	}
-
-	funcs = of_find_property(np, "brcm,function", NULL);
-	pulls = of_find_property(np, "brcm,pull", NULL);
-
-	if (!funcs && !pulls) {
-		dev_err(pc->dev,
-			"%s: neither brcm,function nor brcm,pull specified\n",
-			of_node_full_name(np));
-		return -EINVAL;
-	}
-
-	num_pins = pins->length / 4;
-	num_funcs = funcs ? (funcs->length / 4) : 0;
-	num_pulls = pulls ? (pulls->length / 4) : 0;
-
-	if (num_funcs > 1 && num_funcs != num_pins) {
-		dev_err(pc->dev,
-			"%s: brcm,function must have 1 or %d entries\n",
-			of_node_full_name(np), num_pins);
-		return -EINVAL;
-	}
-
-	if (num_pulls > 1 && num_pulls != num_pins) {
-		dev_err(pc->dev,
-			"%s: brcm,pull must have 1 or %d entries\n",
-			of_node_full_name(np), num_pins);
-		return -EINVAL;
-	}
-
-	maps_per_pin = 0;
-	if (num_funcs)
-		maps_per_pin++;
-	if (num_pulls)
-		maps_per_pin++;
-	cur_map = maps = kzalloc(num_pins * maps_per_pin * sizeof(*maps),
-				GFP_KERNEL);
-	if (!maps)
-		return -ENOMEM;
-
-	for (i = 0; i < num_pins; i++) {
-		err = of_property_read_u32_index(np, "brcm,pins", i, &pin);
-		if (err)
-			goto out;
-		if (pin >= ARRAY_SIZE(bcm2835_gpio_pins)) {
-			dev_err(pc->dev, "%s: invalid brcm,pins value %d\n",
-				of_node_full_name(np), pin);
-			err = -EINVAL;
-			goto out;
-		}
-
-		if (num_funcs) {
-			err = of_property_read_u32_index(np, "brcm,function",
-					(num_funcs > 1) ? i : 0, &func);
-			if (err)
-				goto out;
-			err = bcm2835_pctl_dt_node_to_map_func(pc, np, pin,
-							func, &cur_map);
-			if (err)
-				goto out;
-		}
-		if (num_pulls) {
-			err = of_property_read_u32_index(np, "brcm,pull",
-					(num_funcs > 1) ? i : 0, &pull);
-			if (err)
-				goto out;
-			err = bcm2835_pctl_dt_node_to_map_pull(pc, np, pin,
-							pull, &cur_map);
-			if (err)
-				goto out;
-		}
-	}
-
-	*map = maps;
-	*num_maps = num_pins * maps_per_pin;
-
-	return 0;
-
-out:
-	kfree(maps);
-	return err;
-}
-
-static const struct pinctrl_ops bcm2835_pctl_ops = {
-	.get_groups_count = bcm2835_pctl_get_groups_count,
-	.get_group_name = bcm2835_pctl_get_group_name,
-	.get_group_pins = bcm2835_pctl_get_group_pins,
-	.pin_dbg_show = bcm2835_pctl_pin_dbg_show,
-	.dt_node_to_map = bcm2835_pctl_dt_node_to_map,
-	.dt_free_map = bcm2835_pctl_dt_free_map,
-};
-
-static int bcm2835_pmx_get_functions_count(struct pinctrl_dev *pctldev)
-{
-	return BCM2835_FSEL_COUNT;
-}
-
-static const char *bcm2835_pmx_get_function_name(struct pinctrl_dev *pctldev,
-		unsigned selector)
-{
-	return bcm2835_functions[selector];
-}
-
-static int bcm2835_pmx_get_function_groups(struct pinctrl_dev *pctldev,
-		unsigned selector,
-		const char * const **groups,
-		unsigned * const num_groups)
-{
-	/* every pin can do every function */
-	*groups = bcm2835_gpio_groups;
-	*num_groups = ARRAY_SIZE(bcm2835_gpio_groups);
-
-	return 0;
-}
-
-static int bcm2835_pmx_set(struct pinctrl_dev *pctldev,
-		unsigned func_selector,
-		unsigned group_selector)
-{
-	struct bcm2835_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
-
-	bcm2835_pinctrl_fsel_set(pc, group_selector, func_selector);
-
-	return 0;
-}
-
-static void bcm2835_pmx_gpio_disable_free(struct pinctrl_dev *pctldev,
-		struct pinctrl_gpio_range *range,
-		unsigned offset)
-{
-	struct bcm2835_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
-
-	/* disable by setting to GPIO_IN */
-	bcm2835_pinctrl_fsel_set(pc, offset, BCM2835_FSEL_GPIO_IN);
-}
-
-static int bcm2835_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
-		struct pinctrl_gpio_range *range,
-		unsigned offset,
-		bool input)
-{
-	struct bcm2835_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
-	enum bcm2835_fsel fsel = input ?
-		BCM2835_FSEL_GPIO_IN : BCM2835_FSEL_GPIO_OUT;
-
-	bcm2835_pinctrl_fsel_set(pc, offset, fsel);
-
-	return 0;
-}
-
-static const struct pinmux_ops bcm2835_pmx_ops = {
-	.get_functions_count = bcm2835_pmx_get_functions_count,
-	.get_function_name = bcm2835_pmx_get_function_name,
-	.get_function_groups = bcm2835_pmx_get_function_groups,
-	.set_mux = bcm2835_pmx_set,
-	.gpio_disable_free = bcm2835_pmx_gpio_disable_free,
-	.gpio_set_direction = bcm2835_pmx_gpio_set_direction,
-};
-
-static int bcm2835_pinconf_get(struct pinctrl_dev *pctldev,
-			unsigned pin, unsigned long *config)
-{
-	/* No way to read back config in HW */
-	return -ENOTSUPP;
-}
-
-static int bcm2835_pinconf_set(struct pinctrl_dev *pctldev,
-			unsigned pin, unsigned long *configs,
-			unsigned num_configs)
-{
-	struct bcm2835_pinctrl *pc = pinctrl_dev_get_drvdata(pctldev);
-	enum bcm2835_pinconf_param param;
-	u16 arg;
-	u32 off, bit;
-	int i;
-
-	for (i = 0; i < num_configs; i++) {
-		param = BCM2835_PINCONF_UNPACK_PARAM(configs[i]);
-		arg = BCM2835_PINCONF_UNPACK_ARG(configs[i]);
-
-		if (param != BCM2835_PINCONF_PARAM_PULL)
-			return -EINVAL;
-
-		off = GPIO_REG_OFFSET(pin);
-		bit = GPIO_REG_SHIFT(pin);
-
-		bcm2835_gpio_wr(pc, GPPUD, arg & 3);
-		/*
-		 * Docs say to wait 150 cycles, but not of what. We assume a
-		 * 1 MHz clock here, which is pretty slow...
-		 */
-		udelay(150);
-		bcm2835_gpio_wr(pc, GPPUDCLK0 + (off * 4), BIT(bit));
-		udelay(150);
-		bcm2835_gpio_wr(pc, GPPUDCLK0 + (off * 4), 0);
-	} /* for each config */
-
-	return 0;
-}
-
-static const struct pinconf_ops bcm2835_pinconf_ops = {
-	.pin_config_get = bcm2835_pinconf_get,
-	.pin_config_set = bcm2835_pinconf_set,
-};
-
-static struct pinctrl_desc bcm2835_pinctrl_desc = {
-	.name = MODULE_NAME,
-	.pins = bcm2835_gpio_pins,
-	.npins = ARRAY_SIZE(bcm2835_gpio_pins),
-	.pctlops = &bcm2835_pctl_ops,
-	.pmxops = &bcm2835_pmx_ops,
-	.confops = &bcm2835_pinconf_ops,
-	.owner = THIS_MODULE,
-};
-
-static struct pinctrl_gpio_range bcm2835_pinctrl_gpio_range = {
-	.name = MODULE_NAME,
-	.npins = BCM2835_NUM_GPIOS,
-};
-
-static int bcm2835_pinctrl_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct bcm2835_pinctrl *pc;
-	struct resource iomem;
-	int err, i;
-	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_pins) != BCM2835_NUM_GPIOS);
-	BUILD_BUG_ON(ARRAY_SIZE(bcm2835_gpio_groups) != BCM2835_NUM_GPIOS);
-
-	pc = devm_kzalloc(dev, sizeof(*pc), GFP_KERNEL);
-	if (!pc)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, pc);
-	pc->dev = dev;
-
-	err = of_address_to_resource(np, 0, &iomem);
-	if (err) {
-		dev_err(dev, "could not get IO memory\n");
-		return err;
-	}
-
-	pc->base = devm_ioremap_resource(dev, &iomem);
-	if (IS_ERR(pc->base))
-		return PTR_ERR(pc->base);
-
-	pc->gpio_chip = bcm2835_gpio_chip;
-	pc->gpio_chip.dev = dev;
-	pc->gpio_chip.of_node = np;
-
-	pc->irq_domain = irq_domain_add_linear(np, BCM2835_NUM_GPIOS,
-			&irq_domain_simple_ops, NULL);
-	if (!pc->irq_domain) {
-		dev_err(dev, "could not create IRQ domain\n");
-		return -ENOMEM;
-	}
-
-	for (i = 0; i < BCM2835_NUM_GPIOS; i++) {
-		int irq = irq_create_mapping(pc->irq_domain, i);
-		irq_set_lockdep_class(irq, &gpio_lock_class);
-		irq_set_chip_and_handler(irq, &bcm2835_gpio_irq_chip,
-				handle_simple_irq);
-		irq_set_chip_data(irq, pc);
-		set_irq_flags(irq, IRQF_VALID);
-	}
-
-	for (i = 0; i < BCM2835_NUM_BANKS; i++) {
-		unsigned long events;
-		unsigned offset;
-		int len;
-		char *name;
-
-		/* clear event detection flags */
-		bcm2835_gpio_wr(pc, GPREN0 + i * 4, 0);
-		bcm2835_gpio_wr(pc, GPFEN0 + i * 4, 0);
-		bcm2835_gpio_wr(pc, GPHEN0 + i * 4, 0);
-		bcm2835_gpio_wr(pc, GPLEN0 + i * 4, 0);
-		bcm2835_gpio_wr(pc, GPAREN0 + i * 4, 0);
-		bcm2835_gpio_wr(pc, GPAFEN0 + i * 4, 0);
-
-		/* clear all the events */
-		events = bcm2835_gpio_rd(pc, GPEDS0 + i * 4);
-		for_each_set_bit(offset, &events, 32)
-			bcm2835_gpio_wr(pc, GPEDS0 + i * 4, BIT(offset));
-
-		pc->irq[i] = irq_of_parse_and_map(np, i);
-		pc->irq_data[i].pc = pc;
-		pc->irq_data[i].bank = i;
-		spin_lock_init(&pc->irq_lock[i]);
-
-		len = strlen(dev_name(pc->dev)) + 16;
-		name = devm_kzalloc(pc->dev, len, GFP_KERNEL);
-		if (!name)
-			return -ENOMEM;
-		snprintf(name, len, "%s:bank%d", dev_name(pc->dev), i);
-
-		err = devm_request_irq(dev, pc->irq[i],
-			bcm2835_gpio_irq_handler, IRQF_SHARED,
-			name, &pc->irq_data[i]);
-		if (err) {
-			dev_err(dev, "unable to request IRQ %d\n", pc->irq[i]);
-			return err;
-		}
-	}
-
-	err = gpiochip_add(&pc->gpio_chip);
-	if (err) {
-		dev_err(dev, "could not add GPIO chip\n");
-		return err;
-	}
-
-	pc->pctl_dev = pinctrl_register(&bcm2835_pinctrl_desc, dev, pc);
-	if (!pc->pctl_dev) {
-		gpiochip_remove(&pc->gpio_chip);
-		return -EINVAL;
-	}
-
-	pc->gpio_range = bcm2835_pinctrl_gpio_range;
-	pc->gpio_range.base = pc->gpio_chip.base;
-	pc->gpio_range.gc = &pc->gpio_chip;
-	pinctrl_add_gpio_range(pc->pctl_dev, &pc->gpio_range);
-
-	return 0;
-}
-
-static int bcm2835_pinctrl_remove(struct platform_device *pdev)
-{
-	struct bcm2835_pinctrl *pc = platform_get_drvdata(pdev);
-
-	pinctrl_unregister(pc->pctl_dev);
-	gpiochip_remove(&pc->gpio_chip);
-
-	return 0;
-}
-
-static struct of_device_id bcm2835_pinctrl_match[] = {
-	{ .compatible = "brcm,bcm2835-gpio" },
-	{}
-};
-MODULE_DEVICE_TABLE(of, bcm2835_pinctrl_match);
-
-static struct platform_driver bcm2835_pinctrl_driver = {
-	.probe = bcm2835_pinctrl_probe,
-	.remove = bcm2835_pinctrl_remove,
-	.driver = {
-		.name = MODULE_NAME,
-		.of_match_table = bcm2835_pinctrl_match,
-	},
-};
-module_platform_driver(bcm2835_pinctrl_driver);
-
-MODULE_AUTHOR("Chris Boot, Simon Arlott, Stephen Warren");
-MODULE_DESCRIPTION("BCM2835 Pin control driver");
-MODULE_LICENSE("GPL");
-- 
1.7.9.5
