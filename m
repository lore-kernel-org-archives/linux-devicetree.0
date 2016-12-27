From: Bai Ping <ping.bai@nxp.com>
Subject: [PATCH v2 07/12] ARM: dts: imx: Add basic dtsi for imx6sll
Date: Tue, 27 Dec 2016 17:47:45 +0800
Message-ID: <1482832070-22668-8-git-send-email-ping.bai@nxp.com>
References: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
To: shawnguo@kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org
Cc: kernel@pengutronix.de, fabio.estevam@nxp.com, daniel.lezcano@linaro.org, tglx@linutronix.de, p.zabel@pengutronix.de, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jacky.baip@gmail.com
List-Id: devicetree@vger.kernel.org

Add basic dtsi and pinfunc header file for imx6sll

Signed-off-by: Bai Ping <ping.bai@nxp.com>
---
 arch/arm/boot/dts/imx6sll-pinfunc.h | 882 ++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6sll.dtsi      | 843 ++++++++++++++++++++++++++++++++++
 2 files changed, 1725 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6sll-pinfunc.h
 create mode 100644 arch/arm/boot/dts/imx6sll.dtsi

diff --git a/arch/arm/boot/dts/imx6sll-pinfunc.h b/arch/arm/boot/dts/imx6sll-pinfunc.h
new file mode 100644
index 0000000..5a3700b
--- /dev/null
+++ b/arch/arm/boot/dts/imx6sll-pinfunc.h
@@ -0,0 +1,882 @@
+/*
+ * Copyright 2016 Freescale Semiconductor, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#ifndef __DTS_IMX6SLL_PINFUNC_H
+#define __DTS_IMX6SLL_PINFUNC_H
+
+/*
+ * The pin function ID is a tuple of
+ * <mux_reg conf_reg input_reg mux_mode input_val>
+ */
+#define MX6SLL_PAD_WDOG_B__WDOG1_B                                0x0014 0x02DC 0x0000 0x0 0x0
+#define MX6SLL_PAD_WDOG_B__WDOG1_RESET_B_DEB                      0x0014 0x02DC 0x0000 0x1 0x0
+#define MX6SLL_PAD_WDOG_B__UART5_RI_B                             0x0014 0x02DC 0x0000 0x2 0x0
+#define MX6SLL_PAD_WDOG_B__GPIO3_IO18                             0x0014 0x02DC 0x0000 0x5 0x0
+#define MX6SLL_PAD_REF_CLK_24M__XTALOSC_REF_CLK_24M               0x0018 0x02E0 0x0000 0x0 0x0
+#define MX6SLL_PAD_REF_CLK_24M__I2C3_SCL                          0x0018 0x02E0 0x068C 0x1 0x0
+#define MX6SLL_PAD_REF_CLK_24M__PWM3_OUT                          0x0018 0x02E0 0x0000 0x2 0x0
+#define MX6SLL_PAD_REF_CLK_24M__USB_OTG2_ID                       0x0018 0x02E0 0x0560 0x3 0x0
+#define MX6SLL_PAD_REF_CLK_24M__CCM_PMIC_READY                    0x0018 0x02E0 0x05AC 0x4 0x0
+#define MX6SLL_PAD_REF_CLK_24M__GPIO3_IO21                        0x0018 0x02E0 0x0000 0x5 0x0
+#define MX6SLL_PAD_REF_CLK_24M__SD3_WP                            0x0018 0x02E0 0x0794 0x6 0x0
+#define MX6SLL_PAD_REF_CLK_32K__XTALOSC_REF_CLK_32K               0x001C 0x02E4 0x0000 0x0 0x0
+#define MX6SLL_PAD_REF_CLK_32K__I2C3_SDA                          0x001C 0x02E4 0x0690 0x1 0x0
+#define MX6SLL_PAD_REF_CLK_32K__PWM4_OUT                          0x001C 0x02E4 0x0000 0x2 0x0
+#define MX6SLL_PAD_REF_CLK_32K__USB_OTG1_ID                       0x001C 0x02E4 0x055C 0x3 0x0
+#define MX6SLL_PAD_REF_CLK_32K__SD1_LCTL                          0x001C 0x02E4 0x0000 0x4 0x0
+#define MX6SLL_PAD_REF_CLK_32K__GPIO3_IO22                        0x001C 0x02E4 0x0000 0x5 0x0
+#define MX6SLL_PAD_REF_CLK_32K__SD3_CD_B                          0x001C 0x02E4 0x0780 0x6 0x0
+#define MX6SLL_PAD_PWM1__PWM1_OUT                                 0x0020 0x02E8 0x0000 0x0 0x0
+#define MX6SLL_PAD_PWM1__CCM_CLKO                                 0x0020 0x02E8 0x0000 0x1 0x0
+#define MX6SLL_PAD_PWM1__AUDIO_CLK_OUT                            0x0020 0x02E8 0x0000 0x2 0x0
+#define MX6SLL_PAD_PWM1__CSI_MCLK                                 0x0020 0x02E8 0x0000 0x4 0x0
+#define MX6SLL_PAD_PWM1__GPIO3_IO23                               0x0020 0x02E8 0x0000 0x5 0x0
+#define MX6SLL_PAD_PWM1__EPIT1_OUT                                0x0020 0x02E8 0x0000 0x6 0x0
+#define MX6SLL_PAD_KEY_COL0__KEY_COL0                             0x0024 0x02EC 0x06A0 0x0 0x0
+#define MX6SLL_PAD_KEY_COL0__I2C2_SCL                             0x0024 0x02EC 0x0684 0x1 0x0
+#define MX6SLL_PAD_KEY_COL0__LCD_DATA00                           0x0024 0x02EC 0x06D8 0x2 0x0
+#define MX6SLL_PAD_KEY_COL0__SD1_CD_B                             0x0024 0x02EC 0x0770 0x4 0x1
+#define MX6SLL_PAD_KEY_COL0__GPIO3_IO24                           0x0024 0x02EC 0x0000 0x5 0x0
+#define MX6SLL_PAD_KEY_ROW0__KEY_ROW0                             0x0028 0x02F0 0x06C0 0x0 0x0
+#define MX6SLL_PAD_KEY_ROW0__I2C2_SDA                             0x0028 0x02F0 0x0688 0x1 0x0
+#define MX6SLL_PAD_KEY_ROW0__LCD_DATA01                           0x0028 0x02F0 0x06DC 0x2 0x0
+#define MX6SLL_PAD_KEY_ROW0__SD1_WP                               0x0028 0x02F0 0x0774 0x4 0x1
+#define MX6SLL_PAD_KEY_ROW0__GPIO3_IO25                           0x0028 0x02F0 0x0000 0x5 0x0
+#define MX6SLL_PAD_KEY_COL1__KEY_COL1                             0x002C 0x02F4 0x06A4 0x0 0x0
+#define MX6SLL_PAD_KEY_COL1__ECSPI4_MOSI                          0x002C 0x02F4 0x0658 0x1 0x1
+#define MX6SLL_PAD_KEY_COL1__LCD_DATA02                           0x002C 0x02F4 0x06E0 0x2 0x0
+#define MX6SLL_PAD_KEY_COL1__SD3_DATA4                            0x002C 0x02F4 0x0784 0x4 0x0
+#define MX6SLL_PAD_KEY_COL1__GPIO3_IO26                           0x002C 0x02F4 0x0000 0x5 0x0
+#define MX6SLL_PAD_KEY_ROW1__KEY_ROW1                             0x0030 0x02F8 0x06C4 0x0 0x0
+#define MX6SLL_PAD_KEY_ROW1__ECSPI4_MISO                          0x0030 0x02F8 0x0654 0x1 0x1
+#define MX6SLL_PAD_KEY_ROW1__LCD_DATA03                           0x0030 0x02F8 0x06E4 0x2 0x0
+#define MX6SLL_PAD_KEY_ROW1__CSI_FIELD                            0x0030 0x02F8 0x0000 0x3 0x0
+#define MX6SLL_PAD_KEY_ROW1__SD3_DATA5                            0x0030 0x02F8 0x0788 0x4 0x0
+#define MX6SLL_PAD_KEY_ROW1__GPIO3_IO27                           0x0030 0x02F8 0x0000 0x5 0x0
+#define MX6SLL_PAD_KEY_COL2__KEY_COL2                             0x0034 0x02FC 0x06A8 0x0 0x0
+#define MX6SLL_PAD_KEY_COL2__ECSPI4_SS0                           0x0034 0x02FC 0x065C 0x1 0x1
+#define MX6SLL_PAD_KEY_COL2__LCD_DATA04                           0x0034 0x02FC 0x06E8 0x2 0x0
+#define MX6SLL_PAD_KEY_COL2__CSI_DATA12                           0x0034 0x02FC 0x05B8 0x3 0x1
+#define MX6SLL_PAD_KEY_COL2__SD3_DATA6                            0x0034 0x02FC 0x078C 0x4 0x0
+#define MX6SLL_PAD_KEY_COL2__GPIO3_IO28                           0x0034 0x02FC 0x0000 0x5 0x0
+#define MX6SLL_PAD_KEY_ROW2__KEY_ROW2                             0x0038 0x0300 0x06C8 0x0 0x0
+#define MX6SLL_PAD_KEY_ROW2__ECSPI4_SCLK                          0x0038 0x0300 0x0650 0x1 0x1
+#define MX6SLL_PAD_KEY_ROW2__LCD_DATA05                           0x0038 0x0300 0x06EC 0x2 0x0
+#define MX6SLL_PAD_KEY_ROW2__CSI_DATA13                           0x0038 0x0300 0x05BC 0x3 0x1
+#define MX6SLL_PAD_KEY_ROW2__SD3_DATA7                            0x0038 0x0300 0x0790 0x4 0x0
+#define MX6SLL_PAD_KEY_ROW2__GPIO3_IO29                           0x0038 0x0300 0x0000 0x5 0x0
+#define MX6SLL_PAD_KEY_COL3__KEY_COL3                             0x003C 0x0304 0x06AC 0x0 0x0
+#define MX6SLL_PAD_KEY_COL3__AUD6_RXFS                            0x003C 0x0304 0x05A0 0x1 0x1
+#define MX6SLL_PAD_KEY_COL3__LCD_DATA06                           0x003C 0x0304 0x06F0 0x2 0x0
+#define MX6SLL_PAD_KEY_COL3__CSI_DATA14                           0x003C 0x0304 0x05C0 0x3 0x1
+#define MX6SLL_PAD_KEY_COL3__GPIO3_IO30                           0x003C 0x0304 0x0000 0x5 0x0
+#define MX6SLL_PAD_KEY_COL3__SD1_RESET                            0x003C 0x0304 0x0000 0x6 0x0
+#define MX6SLL_PAD_KEY_ROW3__KEY_ROW3                             0x0040 0x0308 0x06CC 0x0 0x1
+#define MX6SLL_PAD_KEY_ROW3__AUD6_RXC                             0x0040 0x0308 0x059C 0x1 0x1
+#define MX6SLL_PAD_KEY_ROW3__LCD_DATA07                           0x0040 0x0308 0x06F4 0x2 0x1
+#define MX6SLL_PAD_KEY_ROW3__CSI_DATA15                           0x0040 0x0308 0x05C4 0x3 0x2
+#define MX6SLL_PAD_KEY_ROW3__GPIO3_IO31                           0x0040 0x0308 0x0000 0x5 0x0
+#define MX6SLL_PAD_KEY_ROW3__SD1_VSELECT                          0x0040 0x0308 0x0000 0x6 0x0
+#define MX6SLL_PAD_KEY_COL4__KEY_COL4                             0x0044 0x030C 0x06B0 0x0 0x1
+#define MX6SLL_PAD_KEY_COL4__AUD6_RXD                             0x0044 0x030C 0x0594 0x1 0x1
+#define MX6SLL_PAD_KEY_COL4__LCD_DATA08                           0x0044 0x030C 0x06F8 0x2 0x1
+#define MX6SLL_PAD_KEY_COL4__CSI_DATA16                           0x0044 0x030C 0x0000 0x3 0x0
+#define MX6SLL_PAD_KEY_COL4__GPIO4_IO00                           0x0044 0x030C 0x0000 0x5 0x0
+#define MX6SLL_PAD_KEY_COL4__USB_OTG1_PWR                         0x0044 0x030C 0x0000 0x6 0x0
+#define MX6SLL_PAD_KEY_ROW4__KEY_ROW4                             0x0048 0x0310 0x06D0 0x0 0x1
+#define MX6SLL_PAD_KEY_ROW4__AUD6_TXC                             0x0048 0x0310 0x05A4 0x1 0x1
+#define MX6SLL_PAD_KEY_ROW4__LCD_DATA09                           0x0048 0x0310 0x06FC 0x2 0x1
+#define MX6SLL_PAD_KEY_ROW4__CSI_DATA17                           0x0048 0x0310 0x0000 0x3 0x0
+#define MX6SLL_PAD_KEY_ROW4__GPIO4_IO01                           0x0048 0x0310 0x0000 0x5 0x0
+#define MX6SLL_PAD_KEY_ROW4__USB_OTG1_OC                          0x0048 0x0310 0x076C 0x6 0x2
+#define MX6SLL_PAD_KEY_COL5__KEY_COL5                             0x004C 0x0314 0x0694 0x0 0x1
+#define MX6SLL_PAD_KEY_COL5__AUD6_TXFS                            0x004C 0x0314 0x05A8 0x1 0x1
+#define MX6SLL_PAD_KEY_COL5__LCD_DATA10                           0x004C 0x0314 0x0700 0x2 0x0
+#define MX6SLL_PAD_KEY_COL5__CSI_DATA18                           0x004C 0x0314 0x0000 0x3 0x0
+#define MX6SLL_PAD_KEY_COL5__GPIO4_IO02                           0x004C 0x0314 0x0000 0x5 0x0
+#define MX6SLL_PAD_KEY_COL5__USB_OTG2_PWR                         0x004C 0x0314 0x0000 0x6 0x0
+#define MX6SLL_PAD_KEY_ROW5__KEY_ROW5                             0x0050 0x0318 0x06B4 0x0 0x2
+#define MX6SLL_PAD_KEY_ROW5__AUD6_TXD                             0x0050 0x0318 0x0598 0x1 0x1
+#define MX6SLL_PAD_KEY_ROW5__LCD_DATA11                           0x0050 0x0318 0x0704 0x2 0x1
+#define MX6SLL_PAD_KEY_ROW5__CSI_DATA19                           0x0050 0x0318 0x0000 0x3 0x0
+#define MX6SLL_PAD_KEY_ROW5__GPIO4_IO03                           0x0050 0x0318 0x0000 0x5 0x0
+#define MX6SLL_PAD_KEY_ROW5__USB_OTG2_OC                          0x0050 0x0318 0x0768 0x6 0x3
+#define MX6SLL_PAD_KEY_COL6__KEY_COL6                             0x0054 0x031C 0x0698 0x0 0x2
+#define MX6SLL_PAD_KEY_COL6__UART4_DCE_RX                         0x0054 0x031C 0x075C 0x1 0x2
+#define MX6SLL_PAD_KEY_COL6__UART4_DTE_TX                         0x0054 0x031C 0x0000 0x1 0x0
+#define MX6SLL_PAD_KEY_COL6__LCD_DATA12                           0x0054 0x031C 0x0708 0x2 0x1
+#define MX6SLL_PAD_KEY_COL6__CSI_DATA20                           0x0054 0x031C 0x0000 0x3 0x0
+#define MX6SLL_PAD_KEY_COL6__GPIO4_IO04                           0x0054 0x031C 0x0000 0x5 0x0
+#define MX6SLL_PAD_KEY_COL6__SD3_RESET                            0x0054 0x031C 0x0000 0x6 0x0
+#define MX6SLL_PAD_KEY_ROW6__KEY_ROW6                             0x0058 0x0320 0x06B8 0x0 0x2
+#define MX6SLL_PAD_KEY_ROW6__UART4_DCE_TX                         0x0058 0x0320 0x0000 0x1 0x0
+#define MX6SLL_PAD_KEY_ROW6__UART4_DTE_RX                         0x0058 0x0320 0x075C 0x1 0x3
+#define MX6SLL_PAD_KEY_ROW6__LCD_DATA13                           0x0058 0x0320 0x070C 0x2 0x1
+#define MX6SLL_PAD_KEY_ROW6__CSI_DATA21                           0x0058 0x0320 0x0000 0x3 0x0
+#define MX6SLL_PAD_KEY_ROW6__GPIO4_IO05                           0x0058 0x0320 0x0000 0x5 0x0
+#define MX6SLL_PAD_KEY_ROW6__SD3_VSELECT                          0x0058 0x0320 0x0000 0x6 0x0
+#define MX6SLL_PAD_KEY_COL7__KEY_COL7                             0x005C 0x0324 0x069C 0x0 0x2
+#define MX6SLL_PAD_KEY_COL7__UART4_DCE_RTS                        0x005C 0x0324 0x0758 0x1 0x2
+#define MX6SLL_PAD_KEY_COL7__UART4_DTE_CTS                        0x005C 0x0324 0x0000 0x1 0x0
+#define MX6SLL_PAD_KEY_COL7__LCD_DATA14                           0x005C 0x0324 0x0710 0x2 0x1
+#define MX6SLL_PAD_KEY_COL7__CSI_DATA22                           0x005C 0x0324 0x0000 0x3 0x0
+#define MX6SLL_PAD_KEY_COL7__GPIO4_IO06                           0x005C 0x0324 0x0000 0x5 0x0
+#define MX6SLL_PAD_KEY_COL7__SD1_WP                               0x005C 0x0324 0x0774 0x6 0x3
+#define MX6SLL_PAD_KEY_ROW7__KEY_ROW7                             0x0060 0x0328 0x06BC 0x0 0x2
+#define MX6SLL_PAD_KEY_ROW7__UART4_DCE_CTS                        0x0060 0x0328 0x0000 0x1 0x0
+#define MX6SLL_PAD_KEY_ROW7__UART4_DTE_RTS                        0x0060 0x0328 0x0758 0x1 0x3
+#define MX6SLL_PAD_KEY_ROW7__LCD_DATA15                           0x0060 0x0328 0x0714 0x2 0x1
+#define MX6SLL_PAD_KEY_ROW7__CSI_DATA23                           0x0060 0x0328 0x0000 0x3 0x0
+#define MX6SLL_PAD_KEY_ROW7__GPIO4_IO07                           0x0060 0x0328 0x0000 0x5 0x0
+#define MX6SLL_PAD_KEY_ROW7__SD1_CD_B                             0x0060 0x0328 0x0770 0x6 0x3
+#define MX6SLL_PAD_EPDC_DATA00__EPDC_DATA00                       0x0064 0x032C 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_DATA00__ECSPI4_MOSI                       0x0064 0x032C 0x0658 0x1 0x2
+#define MX6SLL_PAD_EPDC_DATA00__LCD_DATA24                        0x0064 0x032C 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_DATA00__CSI_DATA00                        0x0064 0x032C 0x05C8 0x3 0x2
+#define MX6SLL_PAD_EPDC_DATA00__GPIO1_IO07                        0x0064 0x032C 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_DATA01__EPDC_DATA01                       0x0068 0x0330 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_DATA01__ECSPI4_MISO                       0x0068 0x0330 0x0654 0x1 0x2
+#define MX6SLL_PAD_EPDC_DATA01__LCD_DATA25                        0x0068 0x0330 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_DATA01__CSI_DATA01                        0x0068 0x0330 0x05CC 0x3 0x2
+#define MX6SLL_PAD_EPDC_DATA01__GPIO1_IO08                        0x0068 0x0330 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_DATA02__EPDC_DATA02                       0x006C 0x0334 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_DATA02__ECSPI4_SS0                        0x006C 0x0334 0x065C 0x1 0x2
+#define MX6SLL_PAD_EPDC_DATA02__LCD_DATA26                        0x006C 0x0334 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_DATA02__CSI_DATA02                        0x006C 0x0334 0x05D0 0x3 0x2
+#define MX6SLL_PAD_EPDC_DATA02__GPIO1_IO09                        0x006C 0x0334 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_DATA03__EPDC_DATA03                       0x0070 0x0338 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_DATA03__ECSPI4_SCLK                       0x0070 0x0338 0x0650 0x1 0x2
+#define MX6SLL_PAD_EPDC_DATA03__LCD_DATA27                        0x0070 0x0338 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_DATA03__CSI_DATA03                        0x0070 0x0338 0x05D4 0x3 0x2
+#define MX6SLL_PAD_EPDC_DATA03__GPIO1_IO10                        0x0070 0x0338 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_DATA04__EPDC_DATA04                       0x0074 0x033C 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_DATA04__ECSPI4_SS1                        0x0074 0x033C 0x0660 0x1 0x1
+#define MX6SLL_PAD_EPDC_DATA04__LCD_DATA28                        0x0074 0x033C 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_DATA04__CSI_DATA04                        0x0074 0x033C 0x05D8 0x3 0x2
+#define MX6SLL_PAD_EPDC_DATA04__GPIO1_IO11                        0x0074 0x033C 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_DATA05__EPDC_DATA05                       0x0078 0x0340 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_DATA05__ECSPI4_SS2                        0x0078 0x0340 0x0664 0x1 0x1
+#define MX6SLL_PAD_EPDC_DATA05__LCD_DATA29                        0x0078 0x0340 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_DATA05__CSI_DATA05                        0x0078 0x0340 0x05DC 0x3 0x2
+#define MX6SLL_PAD_EPDC_DATA05__GPIO1_IO12                        0x0078 0x0340 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_DATA06__EPDC_DATA06                       0x007C 0x0344 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_DATA06__ECSPI4_SS3                        0x007C 0x0344 0x0000 0x1 0x0
+#define MX6SLL_PAD_EPDC_DATA06__LCD_DATA30                        0x007C 0x0344 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_DATA06__CSI_DATA06                        0x007C 0x0344 0x05E0 0x3 0x2
+#define MX6SLL_PAD_EPDC_DATA06__GPIO1_IO13                        0x007C 0x0344 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_DATA07__EPDC_DATA07                       0x0080 0x0348 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_DATA07__ECSPI4_RDY                        0x0080 0x0348 0x0000 0x1 0x0
+#define MX6SLL_PAD_EPDC_DATA07__LCD_DATA31                        0x0080 0x0348 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_DATA07__CSI_DATA07                        0x0080 0x0348 0x05E4 0x3 0x2
+#define MX6SLL_PAD_EPDC_DATA07__GPIO1_IO14                        0x0080 0x0348 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_DATA08__EPDC_DATA08                       0x0084 0x034C 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_DATA08__ECSPI3_MOSI                       0x0084 0x034C 0x063C 0x1 0x2
+#define MX6SLL_PAD_EPDC_DATA08__EPDC_PWR_CTRL0                    0x0084 0x034C 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_DATA08__GPIO1_IO15                        0x0084 0x034C 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_DATA09__EPDC_DATA09                       0x0088 0x0350 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_DATA09__ECSPI3_MISO                       0x0088 0x0350 0x0638 0x1 0x2
+#define MX6SLL_PAD_EPDC_DATA09__EPDC_PWR_CTRL1                    0x0088 0x0350 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_DATA09__GPIO1_IO16                        0x0088 0x0350 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_DATA10__EPDC_DATA10                       0x008C 0x0354 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_DATA10__ECSPI3_SS0                        0x008C 0x0354 0x0648 0x1 0x2
+#define MX6SLL_PAD_EPDC_DATA10__EPDC_PWR_CTRL2                    0x008C 0x0354 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_DATA10__GPIO1_IO17                        0x008C 0x0354 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_DATA11__EPDC_DATA11                       0x0090 0x0358 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_DATA11__ECSPI3_SCLK                       0x0090 0x0358 0x0630 0x1 0x2
+#define MX6SLL_PAD_EPDC_DATA11__EPDC_PWR_CTRL3                    0x0090 0x0358 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_DATA11__GPIO1_IO18                        0x0090 0x0358 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_DATA12__EPDC_DATA12                       0x0094 0x035C 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_DATA12__UART2_DCE_RX                      0x0094 0x035C 0x074C 0x1 0x4
+#define MX6SLL_PAD_EPDC_DATA12__UART2_DTE_TX                      0x0094 0x035C 0x0000 0x1 0x0
+#define MX6SLL_PAD_EPDC_DATA12__EPDC_PWR_COM                      0x0094 0x035C 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_DATA12__GPIO1_IO19                        0x0094 0x035C 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_DATA12__ECSPI3_SS1                        0x0094 0x035C 0x064C 0x6 0x1
+#define MX6SLL_PAD_EPDC_DATA13__EPDC_DATA13                       0x0098 0x0360 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_DATA13__UART2_DCE_TX                      0x0098 0x0360 0x0000 0x1 0x0
+#define MX6SLL_PAD_EPDC_DATA13__UART2_DTE_RX                      0x0098 0x0360 0x074C 0x1 0x5
+#define MX6SLL_PAD_EPDC_DATA13__EPDC_PWR_IRQ                      0x0098 0x0360 0x0668 0x2 0x0
+#define MX6SLL_PAD_EPDC_DATA13__GPIO1_IO20                        0x0098 0x0360 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_DATA13__ECSPI3_SS2                        0x0098 0x0360 0x0640 0x6 0x1
+#define MX6SLL_PAD_EPDC_DATA14__EPDC_DATA14                       0x009C 0x0364 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_DATA14__UART2_DCE_RTS                     0x009C 0x0364 0x0748 0x1 0x4
+#define MX6SLL_PAD_EPDC_DATA14__UART2_DTE_CTS                     0x009C 0x0364 0x0000 0x1 0x0
+#define MX6SLL_PAD_EPDC_DATA14__EPDC_PWR_STAT                     0x009C 0x0364 0x066C 0x2 0x0
+#define MX6SLL_PAD_EPDC_DATA14__GPIO1_IO21                        0x009C 0x0364 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_DATA14__ECSPI3_SS3                        0x009C 0x0364 0x0644 0x6 0x1
+#define MX6SLL_PAD_EPDC_DATA15__EPDC_DATA15                       0x00A0 0x0368 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_DATA15__UART2_DCE_CTS                     0x00A0 0x0368 0x0000 0x1 0x0
+#define MX6SLL_PAD_EPDC_DATA15__UART2_DTE_RTS                     0x00A0 0x0368 0x0748 0x1 0x5
+#define MX6SLL_PAD_EPDC_DATA15__EPDC_PWR_WAKE                     0x00A0 0x0368 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_DATA15__GPIO1_IO22                        0x00A0 0x0368 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_DATA15__ECSPI3_RDY                        0x00A0 0x0368 0x0634 0x6 0x1
+#define MX6SLL_PAD_EPDC_SDCLK__EPDC_SDCLK_P                       0x00A4 0x036C 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_SDCLK__ECSPI2_MOSI                        0x00A4 0x036C 0x0624 0x1 0x2
+#define MX6SLL_PAD_EPDC_SDCLK__I2C2_SCL                           0x00A4 0x036C 0x0684 0x2 0x2
+#define MX6SLL_PAD_EPDC_SDCLK__CSI_DATA08                         0x00A4 0x036C 0x05E8 0x3 0x2
+#define MX6SLL_PAD_EPDC_SDCLK__GPIO1_IO23                         0x00A4 0x036C 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_SDLE__EPDC_SDLE                           0x00A8 0x0370 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_SDLE__ECSPI2_MISO                         0x00A8 0x0370 0x0620 0x1 0x2
+#define MX6SLL_PAD_EPDC_SDLE__I2C2_SDA                            0x00A8 0x0370 0x0688 0x2 0x2
+#define MX6SLL_PAD_EPDC_SDLE__CSI_DATA09                          0x00A8 0x0370 0x05EC 0x3 0x2
+#define MX6SLL_PAD_EPDC_SDLE__GPIO1_IO24                          0x00A8 0x0370 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_SDOE__EPDC_SDOE                           0x00AC 0x0374 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_SDOE__ECSPI2_SS0                          0x00AC 0x0374 0x0628 0x1 0x1
+#define MX6SLL_PAD_EPDC_SDOE__CSI_DATA10                          0x00AC 0x0374 0x05B0 0x3 0x2
+#define MX6SLL_PAD_EPDC_SDOE__GPIO1_IO25                          0x00AC 0x0374 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_SDSHR__EPDC_SDSHR                         0x00B0 0x0378 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_SDSHR__ECSPI2_SCLK                        0x00B0 0x0378 0x061C 0x1 0x2
+#define MX6SLL_PAD_EPDC_SDSHR__EPDC_SDCE4                         0x00B0 0x0378 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_SDSHR__CSI_DATA11                         0x00B0 0x0378 0x05B4 0x3 0x2
+#define MX6SLL_PAD_EPDC_SDSHR__GPIO1_IO26                         0x00B0 0x0378 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_SDCE0__EPDC_SDCE0                         0x00B4 0x037C 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_SDCE0__ECSPI2_SS1                         0x00B4 0x037C 0x062C 0x1 0x1
+#define MX6SLL_PAD_EPDC_SDCE0__PWM3_OUT                           0x00B4 0x037C 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_SDCE0__GPIO1_IO27                         0x00B4 0x037C 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_SDCE1__EPDC_SDCE1                         0x00B8 0x0380 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_SDCE1__WDOG2_B                            0x00B8 0x0380 0x0000 0x1 0x0
+#define MX6SLL_PAD_EPDC_SDCE1__PWM4_OUT                           0x00B8 0x0380 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_SDCE1__GPIO1_IO28                         0x00B8 0x0380 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_SDCE2__EPDC_SDCE2                         0x00BC 0x0384 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_SDCE2__I2C3_SCL                           0x00BC 0x0384 0x068C 0x1 0x2
+#define MX6SLL_PAD_EPDC_SDCE2__PWM1_OUT                           0x00BC 0x0384 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_SDCE2__GPIO1_IO29                         0x00BC 0x0384 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_SDCE3__EPDC_SDCE3                         0x00C0 0x0388 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_SDCE3__I2C3_SDA                           0x00C0 0x0388 0x0690 0x1 0x2
+#define MX6SLL_PAD_EPDC_SDCE3__PWM2_OUT                           0x00C0 0x0388 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_SDCE3__GPIO1_IO30                         0x00C0 0x0388 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_GDCLK__EPDC_GDCLK                         0x00C4 0x038C 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_GDCLK__ECSPI2_SS2                         0x00C4 0x038C 0x0000 0x1 0x0
+#define MX6SLL_PAD_EPDC_GDCLK__CSI_PIXCLK                         0x00C4 0x038C 0x05F4 0x3 0x2
+#define MX6SLL_PAD_EPDC_GDCLK__GPIO1_IO31                         0x00C4 0x038C 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_GDCLK__SD2_RESET                          0x00C4 0x038C 0x0000 0x6 0x0
+#define MX6SLL_PAD_EPDC_GDOE__EPDC_GDOE                           0x00C8 0x0390 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_GDOE__ECSPI2_SS3                          0x00C8 0x0390 0x0000 0x1 0x0
+#define MX6SLL_PAD_EPDC_GDOE__CSI_HSYNC                           0x00C8 0x0390 0x05F0 0x3 0x2
+#define MX6SLL_PAD_EPDC_GDOE__GPIO2_IO00                          0x00C8 0x0390 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_GDOE__SD2_VSELECT                         0x00C8 0x0390 0x0000 0x6 0x0
+#define MX6SLL_PAD_EPDC_GDRL__EPDC_GDRL                           0x00CC 0x0394 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_GDRL__ECSPI2_RDY                          0x00CC 0x0394 0x0000 0x1 0x0
+#define MX6SLL_PAD_EPDC_GDRL__CSI_MCLK                            0x00CC 0x0394 0x0000 0x3 0x0
+#define MX6SLL_PAD_EPDC_GDRL__GPIO2_IO01                          0x00CC 0x0394 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_GDRL__SD2_WP                              0x00CC 0x0394 0x077C 0x6 0x2
+#define MX6SLL_PAD_EPDC_GDSP__EPDC_GDSP                           0x00D0 0x0398 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_GDSP__PWM4_OUT                            0x00D0 0x0398 0x0000 0x1 0x0
+#define MX6SLL_PAD_EPDC_GDSP__CSI_VSYNC                           0x00D0 0x0398 0x05F8 0x3 0x2
+#define MX6SLL_PAD_EPDC_GDSP__GPIO2_IO02                          0x00D0 0x0398 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_GDSP__SD2_CD_B                            0x00D0 0x0398 0x0778 0x6 0x2
+#define MX6SLL_PAD_EPDC_VCOM0__EPDC_VCOM0                         0x00D4 0x039C 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_VCOM0__AUD5_RXFS                          0x00D4 0x039C 0x0588 0x1 0x1
+#define MX6SLL_PAD_EPDC_VCOM0__UART3_DCE_RX                       0x00D4 0x039C 0x0754 0x2 0x4
+#define MX6SLL_PAD_EPDC_VCOM0__UART3_DTE_TX                       0x00D4 0x039C 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_VCOM0__GPIO2_IO03                         0x00D4 0x039C 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_VCOM0__EPDC_SDCE5                         0x00D4 0x039C 0x0000 0x6 0x0
+#define MX6SLL_PAD_EPDC_VCOM1__EPDC_VCOM1                         0x00D8 0x03A0 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_VCOM1__AUD5_RXD                           0x00D8 0x03A0 0x057C 0x1 0x1
+#define MX6SLL_PAD_EPDC_VCOM1__UART3_DCE_TX                       0x00D8 0x03A0 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_VCOM1__UART3_DTE_RX                       0x00D8 0x03A0 0x0754 0x2 0x5
+#define MX6SLL_PAD_EPDC_VCOM1__GPIO2_IO04                         0x00D8 0x03A0 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_VCOM1__EPDC_SDCE6                         0x00D8 0x03A0 0x0000 0x6 0x0
+#define MX6SLL_PAD_EPDC_BDR0__EPDC_BDR0                           0x00DC 0x03A4 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_BDR0__UART3_DCE_RTS                       0x00DC 0x03A4 0x0750 0x2 0x2
+#define MX6SLL_PAD_EPDC_BDR0__UART3_DTE_CTS                       0x00DC 0x03A4 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_BDR0__GPIO2_IO05                          0x00DC 0x03A4 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_BDR0__EPDC_SDCE7                          0x00DC 0x03A4 0x0000 0x6 0x0
+#define MX6SLL_PAD_EPDC_BDR1__EPDC_BDR1                           0x00E0 0x03A8 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_BDR1__UART3_DCE_CTS                       0x00E0 0x03A8 0x0000 0x2 0x0
+#define MX6SLL_PAD_EPDC_BDR1__UART3_DTE_RTS                       0x00E0 0x03A8 0x0750 0x2 0x3
+#define MX6SLL_PAD_EPDC_BDR1__GPIO2_IO06                          0x00E0 0x03A8 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_BDR1__EPDC_SDCE8                          0x00E0 0x03A8 0x0000 0x6 0x0
+#define MX6SLL_PAD_EPDC_PWR_CTRL0__EPDC_PWR_CTRL0                 0x00E4 0x03AC 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_PWR_CTRL0__AUD5_RXC                       0x00E4 0x03AC 0x0584 0x1 0x1
+#define MX6SLL_PAD_EPDC_PWR_CTRL0__LCD_DATA16                     0x00E4 0x03AC 0x0718 0x2 0x1
+#define MX6SLL_PAD_EPDC_PWR_CTRL0__GPIO2_IO07                     0x00E4 0x03AC 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_PWR_CTRL1__EPDC_PWR_CTRL1                 0x00E8 0x03B0 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_PWR_CTRL1__AUD5_TXFS                      0x00E8 0x03B0 0x0590 0x1 0x1
+#define MX6SLL_PAD_EPDC_PWR_CTRL1__LCD_DATA17                     0x00E8 0x03B0 0x071C 0x2 0x1
+#define MX6SLL_PAD_EPDC_PWR_CTRL1__GPIO2_IO08                     0x00E8 0x03B0 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_PWR_CTRL2__EPDC_PWR_CTRL2                 0x00EC 0x03B4 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_PWR_CTRL2__AUD5_TXD                       0x00EC 0x03B4 0x0580 0x1 0x1
+#define MX6SLL_PAD_EPDC_PWR_CTRL2__LCD_DATA18                     0x00EC 0x03B4 0x0720 0x2 0x1
+#define MX6SLL_PAD_EPDC_PWR_CTRL2__GPIO2_IO09                     0x00EC 0x03B4 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_PWR_CTRL3__EPDC_PWR_CTRL3                 0x00F0 0x03B8 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_PWR_CTRL3__AUD5_TXC                       0x00F0 0x03B8 0x058C 0x1 0x1
+#define MX6SLL_PAD_EPDC_PWR_CTRL3__LCD_DATA19                     0x00F0 0x03B8 0x0724 0x2 0x1
+#define MX6SLL_PAD_EPDC_PWR_CTRL3__GPIO2_IO10                     0x00F0 0x03B8 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_PWR_COM__EPDC_PWR_COM                     0x00F4 0x03BC 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_PWR_COM__LCD_DATA20                       0x00F4 0x03BC 0x0728 0x2 0x1
+#define MX6SLL_PAD_EPDC_PWR_COM__USB_OTG1_ID                      0x00F4 0x03BC 0x055C 0x4 0x4
+#define MX6SLL_PAD_EPDC_PWR_COM__GPIO2_IO11                       0x00F4 0x03BC 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_PWR_COM__SD3_RESET                        0x00F4 0x03BC 0x0000 0x6 0x0
+#define MX6SLL_PAD_EPDC_PWR_IRQ__EPDC_PWR_IRQ                     0x00F8 0x03C0 0x0668 0x0 0x1
+#define MX6SLL_PAD_EPDC_PWR_IRQ__LCD_DATA21                       0x00F8 0x03C0 0x072C 0x2 0x1
+#define MX6SLL_PAD_EPDC_PWR_IRQ__USB_OTG2_ID                      0x00F8 0x03C0 0x0560 0x4 0x3
+#define MX6SLL_PAD_EPDC_PWR_IRQ__GPIO2_IO12                       0x00F8 0x03C0 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_PWR_IRQ__SD3_VSELECT                      0x00F8 0x03C0 0x0000 0x6 0x0
+#define MX6SLL_PAD_EPDC_PWR_STAT__EPDC_PWR_STAT                   0x00FC 0x03C4 0x066C 0x0 0x1
+#define MX6SLL_PAD_EPDC_PWR_STAT__LCD_DATA22                      0x00FC 0x03C4 0x0730 0x2 0x1
+#define MX6SLL_PAD_EPDC_PWR_STAT__ARM_EVENTI                      0x00FC 0x03C4 0x0000 0x4 0x0
+#define MX6SLL_PAD_EPDC_PWR_STAT__GPIO2_IO13                      0x00FC 0x03C4 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_PWR_STAT__SD3_WP                          0x00FC 0x03C4 0x0794 0x6 0x2
+#define MX6SLL_PAD_EPDC_PWR_WAKE__EPDC_PWR_WAKE                   0x0100 0x03C8 0x0000 0x0 0x0
+#define MX6SLL_PAD_EPDC_PWR_WAKE__LCD_DATA23                      0x0100 0x03C8 0x0734 0x2 0x1
+#define MX6SLL_PAD_EPDC_PWR_WAKE__ARM_EVENTO                      0x0100 0x03C8 0x0000 0x4 0x0
+#define MX6SLL_PAD_EPDC_PWR_WAKE__GPIO2_IO14                      0x0100 0x03C8 0x0000 0x5 0x0
+#define MX6SLL_PAD_EPDC_PWR_WAKE__SD3_CD_B                        0x0100 0x03C8 0x0780 0x6 0x2
+#define MX6SLL_PAD_LCD_CLK__LCD_CLK                               0x0104 0x03CC 0x0000 0x0 0x0
+#define MX6SLL_PAD_LCD_CLK__LCD_WR_RWN                            0x0104 0x03CC 0x0000 0x2 0x0
+#define MX6SLL_PAD_LCD_CLK__PWM4_OUT                              0x0104 0x03CC 0x0000 0x4 0x0
+#define MX6SLL_PAD_LCD_CLK__GPIO2_IO15                            0x0104 0x03CC 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_ENABLE__LCD_ENABLE                         0x0108 0x03D0 0x0000 0x0 0x0
+#define MX6SLL_PAD_LCD_ENABLE__LCD_RD_E                           0x0108 0x03D0 0x0000 0x2 0x0
+#define MX6SLL_PAD_LCD_ENABLE__UART2_DCE_RX                       0x0108 0x03D0 0x0000 0x4 0x0
+#define MX6SLL_PAD_LCD_ENABLE__UART2_DTE_TX                       0x0108 0x03D0 0x0000 0x4 0x0
+#define MX6SLL_PAD_LCD_ENABLE__GPIO2_IO16                         0x0108 0x03D0 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_HSYNC__LCD_HSYNC                           0x010C 0x03D4 0x06D4 0x0 0x0
+#define MX6SLL_PAD_LCD_HSYNC__LCD_CS                              0x010C 0x03D4 0x0000 0x2 0x0
+#define MX6SLL_PAD_LCD_HSYNC__UART2_DCE_TX                        0x010C 0x03D4 0x0000 0x4 0x0
+#define MX6SLL_PAD_LCD_HSYNC__UART2_DTE_RX                        0x010C 0x03D4 0x074C 0x4 0x1
+#define MX6SLL_PAD_LCD_HSYNC__GPIO2_IO17                          0x010C 0x03D4 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_HSYNC__ARM_TRACE_CLK                       0x010C 0x03D4 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_VSYNC__LCD_VSYNC                           0x0110 0x03D8 0x0000 0x0 0x0
+#define MX6SLL_PAD_LCD_VSYNC__LCD_RS                              0x0110 0x03D8 0x0000 0x2 0x0
+#define MX6SLL_PAD_LCD_VSYNC__UART2_DCE_RTS                       0x0110 0x03D8 0x0748 0x4 0x0
+#define MX6SLL_PAD_LCD_VSYNC__UART2_DTE_CTS                       0x0110 0x03D8 0x0000 0x4 0x0
+#define MX6SLL_PAD_LCD_VSYNC__GPIO2_IO18                          0x0110 0x03D8 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_VSYNC__ARM_TRACE_CTL                       0x0110 0x03D8 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_RESET__LCD_RESET                           0x0114 0x03DC 0x0000 0x0 0x0
+#define MX6SLL_PAD_LCD_RESET__LCD_BUSY                            0x0114 0x03DC 0x06D4 0x2 0x1
+#define MX6SLL_PAD_LCD_RESET__UART2_DCE_CTS                       0x0114 0x03DC 0x0000 0x4 0x0
+#define MX6SLL_PAD_LCD_RESET__UART2_DTE_RTS                       0x0114 0x03DC 0x0748 0x4 0x1
+#define MX6SLL_PAD_LCD_RESET__GPIO2_IO19                          0x0114 0x03DC 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_RESET__CCM_PMIC_READY                      0x0114 0x03DC 0x05AC 0x6 0x2
+#define MX6SLL_PAD_LCD_DATA00__LCD_DATA00                         0x0118 0x03E0 0x06D8 0x0 0x1
+#define MX6SLL_PAD_LCD_DATA00__ECSPI1_MOSI                        0x0118 0x03E0 0x0608 0x1 0x0
+#define MX6SLL_PAD_LCD_DATA00__USB_OTG2_ID                        0x0118 0x03E0 0x0560 0x2 0x2
+#define MX6SLL_PAD_LCD_DATA00__PWM1_OUT                           0x0118 0x03E0 0x0000 0x3 0x0
+#define MX6SLL_PAD_LCD_DATA00__UART5_DTR_B                        0x0118 0x03E0 0x0000 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA00__GPIO2_IO20                         0x0118 0x03E0 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA00__ARM_TRACE00                        0x0118 0x03E0 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_DATA00__SRC_BOOT_CFG00                     0x0118 0x03E0 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA01__LCD_DATA01                         0x011C 0x03E4 0x06DC 0x0 0x1
+#define MX6SLL_PAD_LCD_DATA01__ECSPI1_MISO                        0x011C 0x03E4 0x0604 0x1 0x0
+#define MX6SLL_PAD_LCD_DATA01__USB_OTG1_ID                        0x011C 0x03E4 0x055C 0x2 0x3
+#define MX6SLL_PAD_LCD_DATA01__PWM2_OUT                           0x011C 0x03E4 0x0000 0x3 0x0
+#define MX6SLL_PAD_LCD_DATA01__AUD4_RXFS                          0x011C 0x03E4 0x0570 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA01__GPIO2_IO21                         0x011C 0x03E4 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA01__ARM_TRACE01                        0x011C 0x03E4 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_DATA01__SRC_BOOT_CFG01                     0x011C 0x03E4 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA02__LCD_DATA02                         0x0120 0x03E8 0x06E0 0x0 0x1
+#define MX6SLL_PAD_LCD_DATA02__ECSPI1_SS0                         0x0120 0x03E8 0x0614 0x1 0x0
+#define MX6SLL_PAD_LCD_DATA02__EPIT2_OUT                          0x0120 0x03E8 0x0000 0x2 0x0
+#define MX6SLL_PAD_LCD_DATA02__PWM3_OUT                           0x0120 0x03E8 0x0000 0x3 0x0
+#define MX6SLL_PAD_LCD_DATA02__AUD4_RXC                           0x0120 0x03E8 0x056C 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA02__GPIO2_IO22                         0x0120 0x03E8 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA02__ARM_TRACE02                        0x0120 0x03E8 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_DATA02__SRC_BOOT_CFG02                     0x0120 0x03E8 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA03__LCD_DATA03                         0x0124 0x03EC 0x06E4 0x0 0x1
+#define MX6SLL_PAD_LCD_DATA03__ECSPI1_SCLK                        0x0124 0x03EC 0x05FC 0x1 0x0
+#define MX6SLL_PAD_LCD_DATA03__UART5_DSR_B                        0x0124 0x03EC 0x0000 0x2 0x0
+#define MX6SLL_PAD_LCD_DATA03__PWM4_OUT                           0x0124 0x03EC 0x0000 0x3 0x0
+#define MX6SLL_PAD_LCD_DATA03__AUD4_RXD                           0x0124 0x03EC 0x0564 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA03__GPIO2_IO23                         0x0124 0x03EC 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA03__ARM_TRACE03                        0x0124 0x03EC 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_DATA03__SRC_BOOT_CFG03                     0x0124 0x03EC 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA04__LCD_DATA04                         0x0128 0x03F0 0x06E8 0x0 0x1
+#define MX6SLL_PAD_LCD_DATA04__ECSPI1_SS1                         0x0128 0x03F0 0x060C 0x1 0x1
+#define MX6SLL_PAD_LCD_DATA04__CSI_VSYNC                          0x0128 0x03F0 0x05F8 0x2 0x0
+#define MX6SLL_PAD_LCD_DATA04__WDOG2_RESET_B_DEB                  0x0128 0x03F0 0x0000 0x3 0x0
+#define MX6SLL_PAD_LCD_DATA04__AUD4_TXC                           0x0128 0x03F0 0x0574 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA04__GPIO2_IO24                         0x0128 0x03F0 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA04__ARM_TRACE04                        0x0128 0x03F0 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_DATA04__SRC_BOOT_CFG04                     0x0128 0x03F0 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA05__LCD_DATA05                         0x012C 0x03F4 0x06EC 0x0 0x1
+#define MX6SLL_PAD_LCD_DATA05__ECSPI1_SS2                         0x012C 0x03F4 0x0610 0x1 0x1
+#define MX6SLL_PAD_LCD_DATA05__CSI_HSYNC                          0x012C 0x03F4 0x05F0 0x2 0x0
+#define MX6SLL_PAD_LCD_DATA05__AUD4_TXFS                          0x012C 0x03F4 0x0578 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA05__GPIO2_IO25                         0x012C 0x03F4 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA05__ARM_TRACE05                        0x012C 0x03F4 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_DATA05__SRC_BOOT_CFG05                     0x012C 0x03F4 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA06__LCD_DATA06                         0x0130 0x03F8 0x06F0 0x0 0x1
+#define MX6SLL_PAD_LCD_DATA06__ECSPI1_SS3                         0x0130 0x03F8 0x0618 0x1 0x0
+#define MX6SLL_PAD_LCD_DATA06__CSI_PIXCLK                         0x0130 0x03F8 0x05F4 0x2 0x0
+#define MX6SLL_PAD_LCD_DATA06__AUD4_TXD                           0x0130 0x03F8 0x0568 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA06__GPIO2_IO26                         0x0130 0x03F8 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA06__ARM_TRACE06                        0x0130 0x03F8 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_DATA06__SRC_BOOT_CFG06                     0x0130 0x03F8 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA07__LCD_DATA07                         0x0134 0x03FC 0x06F4 0x0 0x0
+#define MX6SLL_PAD_LCD_DATA07__ECSPI1_RDY                         0x0134 0x03FC 0x0600 0x1 0x0
+#define MX6SLL_PAD_LCD_DATA07__CSI_MCLK                           0x0134 0x03FC 0x0000 0x2 0x0
+#define MX6SLL_PAD_LCD_DATA07__AUDIO_CLK_OUT                      0x0134 0x03FC 0x0000 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA07__GPIO2_IO27                         0x0134 0x03FC 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA07__ARM_TRACE07                        0x0134 0x03FC 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_DATA07__SRC_BOOT_CFG07                     0x0134 0x03FC 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA08__LCD_DATA08                         0x0138 0x0400 0x06F8 0x0 0x0
+#define MX6SLL_PAD_LCD_DATA08__KEY_COL0                           0x0138 0x0400 0x06A0 0x1 0x1
+#define MX6SLL_PAD_LCD_DATA08__CSI_DATA09                         0x0138 0x0400 0x05EC 0x2 0x0
+#define MX6SLL_PAD_LCD_DATA08__ECSPI2_SCLK                        0x0138 0x0400 0x061C 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA08__GPIO2_IO28                         0x0138 0x0400 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA08__ARM_TRACE08                        0x0138 0x0400 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_DATA08__SRC_BOOT_CFG08                     0x0138 0x0400 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA09__LCD_DATA09                         0x013C 0x0404 0x06FC 0x0 0x0
+#define MX6SLL_PAD_LCD_DATA09__KEY_ROW0                           0x013C 0x0404 0x06C0 0x1 0x1
+#define MX6SLL_PAD_LCD_DATA09__CSI_DATA08                         0x013C 0x0404 0x05E8 0x2 0x0
+#define MX6SLL_PAD_LCD_DATA09__ECSPI2_MOSI                        0x013C 0x0404 0x0624 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA09__GPIO2_IO29                         0x013C 0x0404 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA09__ARM_TRACE09                        0x013C 0x0404 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_DATA09__SRC_BOOT_CFG09                     0x013C 0x0404 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA10__LCD_DATA10                         0x0140 0x0408 0x0700 0x0 0x1
+#define MX6SLL_PAD_LCD_DATA10__KEY_COL1                           0x0140 0x0408 0x06A4 0x1 0x1
+#define MX6SLL_PAD_LCD_DATA10__CSI_DATA07                         0x0140 0x0408 0x05E4 0x2 0x0
+#define MX6SLL_PAD_LCD_DATA10__ECSPI2_MISO                        0x0140 0x0408 0x0620 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA10__GPIO2_IO30                         0x0140 0x0408 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA10__ARM_TRACE10                        0x0140 0x0408 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_DATA10__SRC_BOOT_CFG10                     0x0140 0x0408 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA11__LCD_DATA11                         0x0144 0x040C 0x0704 0x0 0x0
+#define MX6SLL_PAD_LCD_DATA11__KEY_ROW1                           0x0144 0x040C 0x06C4 0x1 0x1
+#define MX6SLL_PAD_LCD_DATA11__CSI_DATA06                         0x0144 0x040C 0x05E0 0x2 0x0
+#define MX6SLL_PAD_LCD_DATA11__ECSPI2_SS1                         0x0144 0x040C 0x062C 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA11__GPIO2_IO31                         0x0144 0x040C 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA11__ARM_TRACE11                        0x0144 0x040C 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_DATA11__SRC_BOOT_CFG11                     0x0144 0x040C 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA12__LCD_DATA12                         0x0148 0x0410 0x0708 0x0 0x0
+#define MX6SLL_PAD_LCD_DATA12__KEY_COL2                           0x0148 0x0410 0x06A8 0x1 0x1
+#define MX6SLL_PAD_LCD_DATA12__CSI_DATA05                         0x0148 0x0410 0x05DC 0x2 0x0
+#define MX6SLL_PAD_LCD_DATA12__UART5_DCE_RTS                      0x0148 0x0410 0x0760 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA12__UART5_DTE_CTS                      0x0148 0x0410 0x0000 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA12__GPIO3_IO00                         0x0148 0x0410 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA12__ARM_TRACE12                        0x0148 0x0410 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_DATA12__SRC_BOOT_CFG12                     0x0148 0x0410 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA13__LCD_DATA13                         0x014C 0x0414 0x070C 0x0 0x0
+#define MX6SLL_PAD_LCD_DATA13__KEY_ROW2                           0x014C 0x0414 0x06C8 0x1 0x1
+#define MX6SLL_PAD_LCD_DATA13__CSI_DATA04                         0x014C 0x0414 0x05D8 0x2 0x0
+#define MX6SLL_PAD_LCD_DATA13__UART5_DCE_CTS                      0x014C 0x0414 0x0000 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA13__UART5_DTE_RTS                      0x014C 0x0414 0x0760 0x4 0x1
+#define MX6SLL_PAD_LCD_DATA13__GPIO3_IO01                         0x014C 0x0414 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA13__ARM_TRACE13                        0x014C 0x0414 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_DATA13__SRC_BOOT_CFG13                     0x014C 0x0414 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA14__LCD_DATA14                         0x0150 0x0418 0x0710 0x0 0x0
+#define MX6SLL_PAD_LCD_DATA14__KEY_COL3                           0x0150 0x0418 0x06AC 0x1 0x1
+#define MX6SLL_PAD_LCD_DATA14__CSI_DATA03                         0x0150 0x0418 0x05D4 0x2 0x0
+#define MX6SLL_PAD_LCD_DATA14__UART5_DCE_RX                       0x0150 0x0418 0x0764 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA14__UART5_DTE_TX                       0x0150 0x0418 0x0000 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA14__GPIO3_IO02                         0x0150 0x0418 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA14__ARM_TRACE14                        0x0150 0x0418 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_DATA14__SRC_BOOT_CFG14                     0x0150 0x0418 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA15__LCD_DATA15                         0x0154 0x041C 0x0714 0x0 0x0
+#define MX6SLL_PAD_LCD_DATA15__KEY_ROW3                           0x0154 0x041C 0x06CC 0x1 0x0
+#define MX6SLL_PAD_LCD_DATA15__CSI_DATA02                         0x0154 0x041C 0x05D0 0x2 0x0
+#define MX6SLL_PAD_LCD_DATA15__UART5_DCE_TX                       0x0154 0x041C 0x0000 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA15__UART5_DTE_RX                       0x0154 0x041C 0x0764 0x4 0x1
+#define MX6SLL_PAD_LCD_DATA15__GPIO3_IO03                         0x0154 0x041C 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA15__ARM_TRACE15                        0x0154 0x041C 0x0000 0x6 0x0
+#define MX6SLL_PAD_LCD_DATA15__SRC_BOOT_CFG15                     0x0154 0x041C 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA16__LCD_DATA16                         0x0158 0x0420 0x0718 0x0 0x0
+#define MX6SLL_PAD_LCD_DATA16__KEY_COL4                           0x0158 0x0420 0x06B0 0x1 0x0
+#define MX6SLL_PAD_LCD_DATA16__CSI_DATA01                         0x0158 0x0420 0x05CC 0x2 0x0
+#define MX6SLL_PAD_LCD_DATA16__I2C2_SCL                           0x0158 0x0420 0x0684 0x4 0x1
+#define MX6SLL_PAD_LCD_DATA16__GPIO3_IO04                         0x0158 0x0420 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA16__SRC_BOOT_CFG24                     0x0158 0x0420 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA17__LCD_DATA17                         0x015C 0x0424 0x071C 0x0 0x0
+#define MX6SLL_PAD_LCD_DATA17__KEY_ROW4                           0x015C 0x0424 0x06D0 0x1 0x0
+#define MX6SLL_PAD_LCD_DATA17__CSI_DATA00                         0x015C 0x0424 0x05C8 0x2 0x0
+#define MX6SLL_PAD_LCD_DATA17__I2C2_SDA                           0x015C 0x0424 0x0688 0x4 0x1
+#define MX6SLL_PAD_LCD_DATA17__GPIO3_IO05                         0x015C 0x0424 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA17__SRC_BOOT_CFG25                     0x015C 0x0424 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA18__LCD_DATA18                         0x0160 0x0428 0x0720 0x0 0x0
+#define MX6SLL_PAD_LCD_DATA18__KEY_COL5                           0x0160 0x0428 0x0694 0x1 0x2
+#define MX6SLL_PAD_LCD_DATA18__CSI_DATA15                         0x0160 0x0428 0x05C4 0x2 0x1
+#define MX6SLL_PAD_LCD_DATA18__GPT_CAPTURE1                       0x0160 0x0428 0x0670 0x4 0x1
+#define MX6SLL_PAD_LCD_DATA18__GPIO3_IO06                         0x0160 0x0428 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA18__SRC_BOOT_CFG26                     0x0160 0x0428 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA19__LCD_DATA19                         0x0164 0x042C 0x0724 0x0 0x0
+#define MX6SLL_PAD_LCD_DATA19__KEY_ROW5                           0x0164 0x042C 0x06B4 0x1 0x1
+#define MX6SLL_PAD_LCD_DATA19__CSI_DATA14                         0x0164 0x042C 0x05C0 0x2 0x2
+#define MX6SLL_PAD_LCD_DATA19__GPT_CAPTURE2                       0x0164 0x042C 0x0674 0x4 0x1
+#define MX6SLL_PAD_LCD_DATA19__GPIO3_IO07                         0x0164 0x042C 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA19__SRC_BOOT_CFG27                     0x0164 0x042C 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA20__LCD_DATA20                         0x0168 0x0430 0x0728 0x0 0x0
+#define MX6SLL_PAD_LCD_DATA20__KEY_COL6                           0x0168 0x0430 0x0698 0x1 0x1
+#define MX6SLL_PAD_LCD_DATA20__CSI_DATA13                         0x0168 0x0430 0x05BC 0x2 0x2
+#define MX6SLL_PAD_LCD_DATA20__GPT_COMPARE1                       0x0168 0x0430 0x0000 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA20__GPIO3_IO08                         0x0168 0x0430 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA20__SRC_BOOT_CFG28                     0x0168 0x0430 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA21__LCD_DATA21                         0x016C 0x0434 0x072C 0x0 0x0
+#define MX6SLL_PAD_LCD_DATA21__KEY_ROW6                           0x016C 0x0434 0x06B8 0x1 0x1
+#define MX6SLL_PAD_LCD_DATA21__CSI_DATA12                         0x016C 0x0434 0x05B8 0x2 0x2
+#define MX6SLL_PAD_LCD_DATA21__GPT_COMPARE2                       0x016C 0x0434 0x0000 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA21__GPIO3_IO09                         0x016C 0x0434 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA21__SRC_BOOT_CFG29                     0x016C 0x0434 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA22__LCD_DATA22                         0x0170 0x0438 0x0730 0x0 0x0
+#define MX6SLL_PAD_LCD_DATA22__KEY_COL7                           0x0170 0x0438 0x069C 0x1 0x1
+#define MX6SLL_PAD_LCD_DATA22__CSI_DATA11                         0x0170 0x0438 0x05B4 0x2 0x1
+#define MX6SLL_PAD_LCD_DATA22__GPT_COMPARE3                       0x0170 0x0438 0x0000 0x4 0x0
+#define MX6SLL_PAD_LCD_DATA22__GPIO3_IO10                         0x0170 0x0438 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA22__SRC_BOOT_CFG30                     0x0170 0x0438 0x0000 0x7 0x0
+#define MX6SLL_PAD_LCD_DATA23__LCD_DATA23                         0x0174 0x043C 0x0734 0x0 0x0
+#define MX6SLL_PAD_LCD_DATA23__KEY_ROW7                           0x0174 0x043C 0x06BC 0x1 0x1
+#define MX6SLL_PAD_LCD_DATA23__CSI_DATA10                         0x0174 0x043C 0x05B0 0x2 0x1
+#define MX6SLL_PAD_LCD_DATA23__GPT_CLKIN                          0x0174 0x043C 0x0678 0x4 0x1
+#define MX6SLL_PAD_LCD_DATA23__GPIO3_IO11                         0x0174 0x043C 0x0000 0x5 0x0
+#define MX6SLL_PAD_LCD_DATA23__SRC_BOOT_CFG31                     0x0174 0x043C 0x0000 0x7 0x0
+#define MX6SLL_PAD_AUD_RXFS__AUD3_RXFS                            0x0178 0x0440 0x0000 0x0 0x0
+#define MX6SLL_PAD_AUD_RXFS__I2C1_SCL                             0x0178 0x0440 0x067C 0x1 0x1
+#define MX6SLL_PAD_AUD_RXFS__UART3_DCE_RX                         0x0178 0x0440 0x0754 0x2 0x0
+#define MX6SLL_PAD_AUD_RXFS__UART3_DTE_TX                         0x0178 0x0440 0x0000 0x2 0x0
+#define MX6SLL_PAD_AUD_RXFS__I2C3_SCL                             0x0178 0x0440 0x068C 0x4 0x1
+#define MX6SLL_PAD_AUD_RXFS__GPIO1_IO00                           0x0178 0x0440 0x0000 0x5 0x0
+#define MX6SLL_PAD_AUD_RXFS__ECSPI3_SS0                           0x0178 0x0440 0x0648 0x6 0x0
+#define MX6SLL_PAD_AUD_RXFS__MBIST_BEND                           0x0178 0x0440 0x0000 0x7 0x0
+#define MX6SLL_PAD_AUD_RXC__AUD3_RXC                              0x017C 0x0444 0x0000 0x0 0x0
+#define MX6SLL_PAD_AUD_RXC__I2C1_SDA                              0x017C 0x0444 0x0680 0x1 0x1
+#define MX6SLL_PAD_AUD_RXC__UART3_DCE_TX                          0x017C 0x0444 0x0000 0x2 0x0
+#define MX6SLL_PAD_AUD_RXC__UART3_DTE_RX                          0x017C 0x0444 0x0754 0x2 0x1
+#define MX6SLL_PAD_AUD_RXC__I2C3_SDA                              0x017C 0x0444 0x0690 0x4 0x1
+#define MX6SLL_PAD_AUD_RXC__GPIO1_IO01                            0x017C 0x0444 0x0000 0x5 0x0
+#define MX6SLL_PAD_AUD_RXC__ECSPI3_SS1                            0x017C 0x0444 0x064C 0x6 0x0
+#define MX6SLL_PAD_AUD_RXD__AUD3_RXD                              0x0180 0x0448 0x0000 0x0 0x0
+#define MX6SLL_PAD_AUD_RXD__ECSPI3_MOSI                           0x0180 0x0448 0x063C 0x1 0x0
+#define MX6SLL_PAD_AUD_RXD__UART4_DCE_RX                          0x0180 0x0448 0x075C 0x2 0x0
+#define MX6SLL_PAD_AUD_RXD__UART4_DTE_TX                          0x0180 0x0448 0x0000 0x2 0x0
+#define MX6SLL_PAD_AUD_RXD__SD1_LCTL                              0x0180 0x0448 0x0000 0x4 0x0
+#define MX6SLL_PAD_AUD_RXD__GPIO1_IO02                            0x0180 0x0448 0x0000 0x5 0x0
+#define MX6SLL_PAD_AUD_TXC__AUD3_TXC                              0x0184 0x044C 0x0000 0x0 0x0
+#define MX6SLL_PAD_AUD_TXC__ECSPI3_MISO                           0x0184 0x044C 0x0638 0x1 0x0
+#define MX6SLL_PAD_AUD_TXC__UART4_DCE_TX                          0x0184 0x044C 0x0000 0x2 0x0
+#define MX6SLL_PAD_AUD_TXC__UART4_DTE_RX                          0x0184 0x044C 0x075C 0x2 0x1
+#define MX6SLL_PAD_AUD_TXC__SD2_LCTL                              0x0184 0x044C 0x0000 0x4 0x0
+#define MX6SLL_PAD_AUD_TXC__GPIO1_IO03                            0x0184 0x044C 0x0000 0x5 0x0
+#define MX6SLL_PAD_AUD_TXFS__AUD3_TXFS                            0x0188 0x0450 0x0000 0x0 0x0
+#define MX6SLL_PAD_AUD_TXFS__PWM3_OUT                             0x0188 0x0450 0x0000 0x1 0x0
+#define MX6SLL_PAD_AUD_TXFS__UART4_DCE_RTS                        0x0188 0x0450 0x0758 0x2 0x0
+#define MX6SLL_PAD_AUD_TXFS__UART4_DTE_CTS                        0x0188 0x0450 0x0000 0x2 0x0
+#define MX6SLL_PAD_AUD_TXFS__SD3_LCTL                             0x0188 0x0450 0x0000 0x4 0x0
+#define MX6SLL_PAD_AUD_TXFS__GPIO1_IO04                           0x0188 0x0450 0x0000 0x5 0x0
+#define MX6SLL_PAD_AUD_TXD__AUD3_TXD                              0x018C 0x0454 0x0000 0x0 0x0
+#define MX6SLL_PAD_AUD_TXD__ECSPI3_SCLK                           0x018C 0x0454 0x0630 0x1 0x0
+#define MX6SLL_PAD_AUD_TXD__UART4_DCE_CTS                         0x018C 0x0454 0x0000 0x2 0x0
+#define MX6SLL_PAD_AUD_TXD__UART4_DTE_RTS                         0x018C 0x0454 0x0758 0x2 0x1
+#define MX6SLL_PAD_AUD_TXD__GPIO1_IO05                            0x018C 0x0454 0x0000 0x5 0x0
+#define MX6SLL_PAD_AUD_MCLK__AUDIO_CLK_OUT                        0x0190 0x0458 0x0000 0x0 0x0
+#define MX6SLL_PAD_AUD_MCLK__PWM4_OUT                             0x0190 0x0458 0x0000 0x1 0x0
+#define MX6SLL_PAD_AUD_MCLK__ECSPI3_RDY                           0x0190 0x0458 0x0634 0x2 0x0
+#define MX6SLL_PAD_AUD_MCLK__WDOG2_RESET_B_DEB                    0x0190 0x0458 0x0000 0x4 0x0
+#define MX6SLL_PAD_AUD_MCLK__GPIO1_IO06                           0x0190 0x0458 0x0000 0x5 0x0
+#define MX6SLL_PAD_AUD_MCLK__SPDIF_EXT_CLK                        0x0190 0x0458 0x073C 0x6 0x1
+#define MX6SLL_PAD_UART1_RXD__UART1_DCE_RX                        0x0194 0x045C 0x0744 0x0 0x0
+#define MX6SLL_PAD_UART1_RXD__UART1_DTE_TX                        0x0194 0x045C 0x0000 0x0 0x0
+#define MX6SLL_PAD_UART1_RXD__PWM1_OUT                            0x0194 0x045C 0x0000 0x1 0x0
+#define MX6SLL_PAD_UART1_RXD__UART4_DCE_RX                        0x0194 0x045C 0x075C 0x2 0x4
+#define MX6SLL_PAD_UART1_RXD__UART4_DTE_TX                        0x0194 0x045C 0x0000 0x2 0x0
+#define MX6SLL_PAD_UART1_RXD__UART5_DCE_RX                        0x0194 0x045C 0x0764 0x4 0x6
+#define MX6SLL_PAD_UART1_RXD__UART5_DTE_TX                        0x0194 0x045C 0x0000 0x4 0x0
+#define MX6SLL_PAD_UART1_RXD__GPIO3_IO16                          0x0194 0x045C 0x0000 0x5 0x0
+#define MX6SLL_PAD_UART1_TXD__UART1_DCE_TX                        0x0198 0x0460 0x0000 0x0 0x0
+#define MX6SLL_PAD_UART1_TXD__UART1_DTE_RX                        0x0198 0x0460 0x0744 0x0 0x1
+#define MX6SLL_PAD_UART1_TXD__PWM2_OUT                            0x0198 0x0460 0x0000 0x1 0x0
+#define MX6SLL_PAD_UART1_TXD__UART4_DCE_TX                        0x0198 0x0460 0x0000 0x2 0x0
+#define MX6SLL_PAD_UART1_TXD__UART4_DTE_RX                        0x0198 0x0460 0x075C 0x2 0x5
+#define MX6SLL_PAD_UART1_TXD__UART5_DCE_TX                        0x0198 0x0460 0x0000 0x4 0x0
+#define MX6SLL_PAD_UART1_TXD__UART5_DTE_RX                        0x0198 0x0460 0x0764 0x4 0x7
+#define MX6SLL_PAD_UART1_TXD__GPIO3_IO17                          0x0198 0x0460 0x0000 0x5 0x0
+#define MX6SLL_PAD_UART1_TXD__UART5_DCD_B                         0x0198 0x0460 0x0000 0x7 0x0
+#define MX6SLL_PAD_I2C1_SCL__I2C1_SCL                             0x019C 0x0464 0x067C 0x0 0x0
+#define MX6SLL_PAD_I2C1_SCL__UART1_DCE_RTS                        0x019C 0x0464 0x0740 0x1 0x0
+#define MX6SLL_PAD_I2C1_SCL__UART1_DTE_CTS                        0x019C 0x0464 0x0000 0x1 0x0
+#define MX6SLL_PAD_I2C1_SCL__ECSPI3_SS2                           0x019C 0x0464 0x0640 0x2 0x0
+#define MX6SLL_PAD_I2C1_SCL__SD3_RESET                            0x019C 0x0464 0x0000 0x4 0x0
+#define MX6SLL_PAD_I2C1_SCL__GPIO3_IO12                           0x019C 0x0464 0x0000 0x5 0x0
+#define MX6SLL_PAD_I2C1_SCL__ECSPI1_SS1                           0x019C 0x0464 0x060C 0x6 0x0
+#define MX6SLL_PAD_I2C1_SDA__I2C1_SDA                             0x01A0 0x0468 0x0680 0x0 0x0
+#define MX6SLL_PAD_I2C1_SDA__UART1_DCE_CTS                        0x01A0 0x0468 0x0000 0x1 0x0
+#define MX6SLL_PAD_I2C1_SDA__UART1_DTE_RTS                        0x01A0 0x0468 0x0740 0x1 0x1
+#define MX6SLL_PAD_I2C1_SDA__ECSPI3_SS3                           0x01A0 0x0468 0x0644 0x2 0x0
+#define MX6SLL_PAD_I2C1_SDA__SD3_VSELECT                          0x01A0 0x0468 0x0000 0x4 0x0
+#define MX6SLL_PAD_I2C1_SDA__GPIO3_IO13                           0x01A0 0x0468 0x0000 0x5 0x0
+#define MX6SLL_PAD_I2C1_SDA__ECSPI1_SS2                           0x01A0 0x0468 0x0610 0x6 0x0
+#define MX6SLL_PAD_I2C2_SCL__I2C2_SCL                             0x01A4 0x046C 0x0684 0x0 0x3
+#define MX6SLL_PAD_I2C2_SCL__AUD4_RXFS                            0x01A4 0x046C 0x0570 0x1 0x2
+#define MX6SLL_PAD_I2C2_SCL__SPDIF_IN                             0x01A4 0x046C 0x0738 0x2 0x2
+#define MX6SLL_PAD_I2C2_SCL__SD3_WP                               0x01A4 0x046C 0x0794 0x4 0x3
+#define MX6SLL_PAD_I2C2_SCL__GPIO3_IO14                           0x01A4 0x046C 0x0000 0x5 0x0
+#define MX6SLL_PAD_I2C2_SCL__ECSPI1_RDY                           0x01A4 0x046C 0x0600 0x6 0x1
+#define MX6SLL_PAD_I2C2_SDA__I2C2_SDA                             0x01A8 0x0470 0x0688 0x0 0x3
+#define MX6SLL_PAD_I2C2_SDA__AUD4_RXC                             0x01A8 0x0470 0x056C 0x1 0x2
+#define MX6SLL_PAD_I2C2_SDA__SPDIF_OUT                            0x01A8 0x0470 0x0000 0x2 0x0
+#define MX6SLL_PAD_I2C2_SDA__SD3_CD_B                             0x01A8 0x0470 0x0780 0x4 0x3
+#define MX6SLL_PAD_I2C2_SDA__GPIO3_IO15                           0x01A8 0x0470 0x0000 0x5 0x0
+#define MX6SLL_PAD_ECSPI1_SCLK__ECSPI1_SCLK                       0x01AC 0x0474 0x05FC 0x0 0x1
+#define MX6SLL_PAD_ECSPI1_SCLK__AUD4_TXD                          0x01AC 0x0474 0x0568 0x1 0x1
+#define MX6SLL_PAD_ECSPI1_SCLK__UART5_DCE_RX                      0x01AC 0x0474 0x0764 0x2 0x2
+#define MX6SLL_PAD_ECSPI1_SCLK__UART5_DTE_TX                      0x01AC 0x0474 0x0000 0x2 0x0
+#define MX6SLL_PAD_ECSPI1_SCLK__EPDC_VCOM0                        0x01AC 0x0474 0x0000 0x3 0x0
+#define MX6SLL_PAD_ECSPI1_SCLK__SD2_RESET                         0x01AC 0x0474 0x0000 0x4 0x0
+#define MX6SLL_PAD_ECSPI1_SCLK__GPIO4_IO08                        0x01AC 0x0474 0x0000 0x5 0x0
+#define MX6SLL_PAD_ECSPI1_SCLK__USB_OTG2_OC                       0x01AC 0x0474 0x0768 0x6 0x1
+#define MX6SLL_PAD_ECSPI1_MOSI__ECSPI1_MOSI                       0x01B0 0x0478 0x0608 0x0 0x1
+#define MX6SLL_PAD_ECSPI1_MOSI__AUD4_TXC                          0x01B0 0x0478 0x0574 0x1 0x1
+#define MX6SLL_PAD_ECSPI1_MOSI__UART5_DCE_TX                      0x01B0 0x0478 0x0000 0x2 0x0
+#define MX6SLL_PAD_ECSPI1_MOSI__UART5_DTE_RX                      0x01B0 0x0478 0x0764 0x2 0x3
+#define MX6SLL_PAD_ECSPI1_MOSI__EPDC_VCOM1                        0x01B0 0x0478 0x0000 0x3 0x0
+#define MX6SLL_PAD_ECSPI1_MOSI__SD2_VSELECT                       0x01B0 0x0478 0x0000 0x4 0x0
+#define MX6SLL_PAD_ECSPI1_MOSI__GPIO4_IO09                        0x01B0 0x0478 0x0000 0x5 0x0
+#define MX6SLL_PAD_ECSPI1_MISO__ECSPI1_MISO                       0x01B4 0x047C 0x0604 0x0 0x1
+#define MX6SLL_PAD_ECSPI1_MISO__AUD4_TXFS                         0x01B4 0x047C 0x0578 0x1 0x1
+#define MX6SLL_PAD_ECSPI1_MISO__UART5_DCE_RTS                     0x01B4 0x047C 0x0760 0x2 0x2
+#define MX6SLL_PAD_ECSPI1_MISO__UART5_DTE_CTS                     0x01B4 0x047C 0x0000 0x2 0x0
+#define MX6SLL_PAD_ECSPI1_MISO__EPDC_BDR0                         0x01B4 0x047C 0x0000 0x3 0x0
+#define MX6SLL_PAD_ECSPI1_MISO__SD2_WP                            0x01B4 0x047C 0x077C 0x4 0x0
+#define MX6SLL_PAD_ECSPI1_MISO__GPIO4_IO10                        0x01B4 0x047C 0x0000 0x5 0x0
+#define MX6SLL_PAD_ECSPI1_SS0__ECSPI1_SS0                         0x01B8 0x0480 0x0614 0x0 0x1
+#define MX6SLL_PAD_ECSPI1_SS0__AUD4_RXD                           0x01B8 0x0480 0x0564 0x1 0x1
+#define MX6SLL_PAD_ECSPI1_SS0__UART5_DCE_CTS                      0x01B8 0x0480 0x0000 0x2 0x0
+#define MX6SLL_PAD_ECSPI1_SS0__UART5_DTE_RTS                      0x01B8 0x0480 0x0760 0x2 0x3
+#define MX6SLL_PAD_ECSPI1_SS0__EPDC_BDR1                          0x01B8 0x0480 0x0000 0x3 0x0
+#define MX6SLL_PAD_ECSPI1_SS0__SD2_CD_B                           0x01B8 0x0480 0x0778 0x4 0x0
+#define MX6SLL_PAD_ECSPI1_SS0__GPIO4_IO11                         0x01B8 0x0480 0x0000 0x5 0x0
+#define MX6SLL_PAD_ECSPI1_SS0__USB_OTG2_PWR                       0x01B8 0x0480 0x0000 0x6 0x0
+#define MX6SLL_PAD_ECSPI2_SCLK__ECSPI2_SCLK                       0x01BC 0x0484 0x061C 0x0 0x1
+#define MX6SLL_PAD_ECSPI2_SCLK__SPDIF_EXT_CLK                     0x01BC 0x0484 0x073C 0x1 0x2
+#define MX6SLL_PAD_ECSPI2_SCLK__UART3_DCE_RX                      0x01BC 0x0484 0x0754 0x2 0x2
+#define MX6SLL_PAD_ECSPI2_SCLK__UART3_DTE_TX                      0x01BC 0x0484 0x0000 0x2 0x0
+#define MX6SLL_PAD_ECSPI2_SCLK__CSI_PIXCLK                        0x01BC 0x0484 0x05F4 0x3 0x1
+#define MX6SLL_PAD_ECSPI2_SCLK__SD1_RESET                         0x01BC 0x0484 0x0000 0x4 0x0
+#define MX6SLL_PAD_ECSPI2_SCLK__GPIO4_IO12                        0x01BC 0x0484 0x0000 0x5 0x0
+#define MX6SLL_PAD_ECSPI2_SCLK__USB_OTG2_OC                       0x01BC 0x0484 0x0768 0x6 0x2
+#define MX6SLL_PAD_ECSPI2_MOSI__ECSPI2_MOSI                       0x01C0 0x0488 0x0624 0x0 0x1
+#define MX6SLL_PAD_ECSPI2_MOSI__SDMA_EXT_EVENT1                   0x01C0 0x0488 0x0000 0x1 0x0
+#define MX6SLL_PAD_ECSPI2_MOSI__UART3_DCE_TX                      0x01C0 0x0488 0x0000 0x2 0x0
+#define MX6SLL_PAD_ECSPI2_MOSI__UART3_DTE_RX                      0x01C0 0x0488 0x0754 0x2 0x3
+#define MX6SLL_PAD_ECSPI2_MOSI__CSI_HSYNC                         0x01C0 0x0488 0x05F0 0x3 0x1
+#define MX6SLL_PAD_ECSPI2_MOSI__SD1_VSELECT                       0x01C0 0x0488 0x0000 0x4 0x0
+#define MX6SLL_PAD_ECSPI2_MOSI__GPIO4_IO13                        0x01C0 0x0488 0x0000 0x5 0x0
+#define MX6SLL_PAD_ECSPI2_MISO__ECSPI2_MISO                       0x01C4 0x048C 0x0620 0x0 0x1
+#define MX6SLL_PAD_ECSPI2_MISO__SDMA_EXT_EVENT0                   0x01C4 0x048C 0x0000 0x1 0x0
+#define MX6SLL_PAD_ECSPI2_MISO__UART3_DCE_RTS                     0x01C4 0x048C 0x0750 0x2 0x0
+#define MX6SLL_PAD_ECSPI2_MISO__UART3_DTE_CTS                     0x01C4 0x048C 0x0000 0x2 0x0
+#define MX6SLL_PAD_ECSPI2_MISO__CSI_MCLK                          0x01C4 0x048C 0x0000 0x3 0x0
+#define MX6SLL_PAD_ECSPI2_MISO__SD1_WP                            0x01C4 0x048C 0x0774 0x4 0x2
+#define MX6SLL_PAD_ECSPI2_MISO__GPIO4_IO14                        0x01C4 0x048C 0x0000 0x5 0x0
+#define MX6SLL_PAD_ECSPI2_MISO__USB_OTG1_OC                       0x01C4 0x048C 0x076C 0x6 0x1
+#define MX6SLL_PAD_ECSPI2_SS0__ECSPI2_SS0                         0x01C8 0x0490 0x0628 0x0 0x0
+#define MX6SLL_PAD_ECSPI2_SS0__ECSPI1_SS3                         0x01C8 0x0490 0x0618 0x1 0x1
+#define MX6SLL_PAD_ECSPI2_SS0__UART3_DCE_CTS                      0x01C8 0x0490 0x0000 0x2 0x0
+#define MX6SLL_PAD_ECSPI2_SS0__UART3_DTE_RTS                      0x01C8 0x0490 0x0750 0x2 0x1
+#define MX6SLL_PAD_ECSPI2_SS0__CSI_VSYNC                          0x01C8 0x0490 0x05F8 0x3 0x1
+#define MX6SLL_PAD_ECSPI2_SS0__SD1_CD_B                           0x01C8 0x0490 0x0770 0x4 0x2
+#define MX6SLL_PAD_ECSPI2_SS0__GPIO4_IO15                         0x01C8 0x0490 0x0000 0x5 0x0
+#define MX6SLL_PAD_ECSPI2_SS0__USB_OTG1_PWR                       0x01C8 0x0490 0x0000 0x6 0x0
+#define MX6SLL_PAD_SD1_CLK__SD1_CLK                               0x01CC 0x0494 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD1_CLK__KEY_COL0                              0x01CC 0x0494 0x06A0 0x2 0x2
+#define MX6SLL_PAD_SD1_CLK__EPDC_SDCE4                            0x01CC 0x0494 0x0000 0x3 0x0
+#define MX6SLL_PAD_SD1_CLK__GPIO5_IO15                            0x01CC 0x0494 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD1_CMD__SD1_CMD                               0x01D0 0x0498 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD1_CMD__KEY_ROW0                              0x01D0 0x0498 0x06C0 0x2 0x2
+#define MX6SLL_PAD_SD1_CMD__EPDC_SDCE5                            0x01D0 0x0498 0x0000 0x3 0x0
+#define MX6SLL_PAD_SD1_CMD__GPIO5_IO14                            0x01D0 0x0498 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD1_DATA0__SD1_DATA0                           0x01D4 0x049C 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD1_DATA0__KEY_COL1                            0x01D4 0x049C 0x06A4 0x2 0x2
+#define MX6SLL_PAD_SD1_DATA0__EPDC_SDCE6                          0x01D4 0x049C 0x0000 0x3 0x0
+#define MX6SLL_PAD_SD1_DATA0__GPIO5_IO11                          0x01D4 0x049C 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD1_DATA1__SD1_DATA1                           0x01D8 0x04A0 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD1_DATA1__KEY_ROW1                            0x01D8 0x04A0 0x06C4 0x2 0x2
+#define MX6SLL_PAD_SD1_DATA1__EPDC_SDCE7                          0x01D8 0x04A0 0x0000 0x3 0x0
+#define MX6SLL_PAD_SD1_DATA1__GPIO5_IO08                          0x01D8 0x04A0 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD1_DATA2__SD1_DATA2                           0x01DC 0x04A4 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD1_DATA2__KEY_COL2                            0x01DC 0x04A4 0x06A8 0x2 0x2
+#define MX6SLL_PAD_SD1_DATA2__EPDC_SDCE8                          0x01DC 0x04A4 0x0000 0x3 0x0
+#define MX6SLL_PAD_SD1_DATA2__GPIO5_IO13                          0x01DC 0x04A4 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD1_DATA3__SD1_DATA3                           0x01E0 0x04A8 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD1_DATA3__KEY_ROW2                            0x01E0 0x04A8 0x06C8 0x2 0x2
+#define MX6SLL_PAD_SD1_DATA3__EPDC_SDCE9                          0x01E0 0x04A8 0x0000 0x3 0x0
+#define MX6SLL_PAD_SD1_DATA3__GPIO5_IO06                          0x01E0 0x04A8 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD1_DATA4__SD1_DATA4                           0x01E4 0x04AC 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD1_DATA4__KEY_COL3                            0x01E4 0x04AC 0x06AC 0x2 0x2
+#define MX6SLL_PAD_SD1_DATA4__EPDC_SDCLK_N                        0x01E4 0x04AC 0x0000 0x3 0x0
+#define MX6SLL_PAD_SD1_DATA4__UART4_DCE_RX                        0x01E4 0x04AC 0x075C 0x4 0x6
+#define MX6SLL_PAD_SD1_DATA4__UART4_DTE_TX                        0x01E4 0x04AC 0x0000 0x4 0x0
+#define MX6SLL_PAD_SD1_DATA4__GPIO5_IO12                          0x01E4 0x04AC 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD1_DATA5__SD1_DATA5                           0x01E8 0x04B0 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD1_DATA5__KEY_ROW3                            0x01E8 0x04B0 0x06CC 0x2 0x2
+#define MX6SLL_PAD_SD1_DATA5__EPDC_SDOED                          0x01E8 0x04B0 0x0000 0x3 0x0
+#define MX6SLL_PAD_SD1_DATA5__UART4_DCE_TX                        0x01E8 0x04B0 0x0000 0x4 0x0
+#define MX6SLL_PAD_SD1_DATA5__UART4_DTE_RX                        0x01E8 0x04B0 0x075C 0x4 0x7
+#define MX6SLL_PAD_SD1_DATA5__GPIO5_IO09                          0x01E8 0x04B0 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD1_DATA6__SD1_DATA6                           0x01EC 0x04B4 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD1_DATA6__KEY_COL4                            0x01EC 0x04B4 0x06B0 0x2 0x2
+#define MX6SLL_PAD_SD1_DATA6__EPDC_SDOEZ                          0x01EC 0x04B4 0x0000 0x3 0x0
+#define MX6SLL_PAD_SD1_DATA6__UART4_DCE_RTS                       0x01EC 0x04B4 0x0758 0x4 0x4
+#define MX6SLL_PAD_SD1_DATA6__UART4_DTE_CTS                       0x01EC 0x04B4 0x0000 0x4 0x0
+#define MX6SLL_PAD_SD1_DATA6__GPIO5_IO07                          0x01EC 0x04B4 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD1_DATA7__SD1_DATA7                           0x01F0 0x04B8 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD1_DATA7__KEY_ROW4                            0x01F0 0x04B8 0x06D0 0x2 0x2
+#define MX6SLL_PAD_SD1_DATA7__CCM_PMIC_READY                      0x01F0 0x04B8 0x05AC 0x3 0x3
+#define MX6SLL_PAD_SD1_DATA7__UART4_DCE_CTS                       0x01F0 0x04B8 0x0000 0x4 0x0
+#define MX6SLL_PAD_SD1_DATA7__UART4_DTE_RTS                       0x01F0 0x04B8 0x0758 0x4 0x5
+#define MX6SLL_PAD_SD1_DATA7__GPIO5_IO10                          0x01F0 0x04B8 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD2_RESET__SD2_RESET                           0x01F4 0x04BC 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD2_RESET__WDOG2_B                             0x01F4 0x04BC 0x0000 0x2 0x0
+#define MX6SLL_PAD_SD2_RESET__SPDIF_OUT                           0x01F4 0x04BC 0x0000 0x3 0x0
+#define MX6SLL_PAD_SD2_RESET__CSI_MCLK                            0x01F4 0x04BC 0x0000 0x4 0x0
+#define MX6SLL_PAD_SD2_RESET__GPIO4_IO27                          0x01F4 0x04BC 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD2_CLK__SD2_CLK                               0x01F8 0x04C0 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD2_CLK__AUD4_RXFS                             0x01F8 0x04C0 0x0570 0x1 0x1
+#define MX6SLL_PAD_SD2_CLK__ECSPI3_SCLK                           0x01F8 0x04C0 0x0630 0x2 0x1
+#define MX6SLL_PAD_SD2_CLK__CSI_DATA00                            0x01F8 0x04C0 0x05C8 0x3 0x1
+#define MX6SLL_PAD_SD2_CLK__GPIO5_IO05                            0x01F8 0x04C0 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD2_CMD__SD2_CMD                               0x01FC 0x04C4 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD2_CMD__AUD4_RXC                              0x01FC 0x04C4 0x056C 0x1 0x1
+#define MX6SLL_PAD_SD2_CMD__ECSPI3_SS0                            0x01FC 0x04C4 0x0648 0x2 0x1
+#define MX6SLL_PAD_SD2_CMD__CSI_DATA01                            0x01FC 0x04C4 0x05CC 0x3 0x1
+#define MX6SLL_PAD_SD2_CMD__EPIT1_OUT                             0x01FC 0x04C4 0x0000 0x4 0x0
+#define MX6SLL_PAD_SD2_CMD__GPIO5_IO04                            0x01FC 0x04C4 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD2_DATA0__SD2_DATA0                           0x0200 0x04C8 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD2_DATA0__AUD4_RXD                            0x0200 0x04C8 0x0564 0x1 0x2
+#define MX6SLL_PAD_SD2_DATA0__ECSPI3_MOSI                         0x0200 0x04C8 0x063C 0x2 0x1
+#define MX6SLL_PAD_SD2_DATA0__CSI_DATA02                          0x0200 0x04C8 0x05D0 0x3 0x1
+#define MX6SLL_PAD_SD2_DATA0__UART5_DCE_RTS                       0x0200 0x04C8 0x0760 0x4 0x4
+#define MX6SLL_PAD_SD2_DATA0__UART5_DTE_CTS                       0x0200 0x04C8 0x0000 0x4 0x0
+#define MX6SLL_PAD_SD2_DATA0__GPIO5_IO01                          0x0200 0x04C8 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD2_DATA1__SD2_DATA1                           0x0204 0x04CC 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD2_DATA1__AUD4_TXC                            0x0204 0x04CC 0x0574 0x1 0x2
+#define MX6SLL_PAD_SD2_DATA1__ECSPI3_MISO                         0x0204 0x04CC 0x0638 0x2 0x1
+#define MX6SLL_PAD_SD2_DATA1__CSI_DATA03                          0x0204 0x04CC 0x05D4 0x3 0x1
+#define MX6SLL_PAD_SD2_DATA1__UART5_DCE_CTS                       0x0204 0x04CC 0x0000 0x4 0x0
+#define MX6SLL_PAD_SD2_DATA1__UART5_DTE_RTS                       0x0204 0x04CC 0x0760 0x4 0x5
+#define MX6SLL_PAD_SD2_DATA1__GPIO4_IO30                          0x0204 0x04CC 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD2_DATA2__SD2_DATA2                           0x0208 0x04D0 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD2_DATA2__AUD4_TXFS                           0x0208 0x04D0 0x0578 0x1 0x2
+#define MX6SLL_PAD_SD2_DATA2__CSI_DATA04                          0x0208 0x04D0 0x05D8 0x3 0x1
+#define MX6SLL_PAD_SD2_DATA2__UART5_DCE_RX                        0x0208 0x04D0 0x0764 0x4 0x4
+#define MX6SLL_PAD_SD2_DATA2__UART5_DTE_TX                        0x0208 0x04D0 0x0000 0x4 0x0
+#define MX6SLL_PAD_SD2_DATA2__GPIO5_IO03                          0x0208 0x04D0 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD2_DATA3__SD2_DATA3                           0x020C 0x04D4 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD2_DATA3__AUD4_TXD                            0x020C 0x04D4 0x0568 0x1 0x2
+#define MX6SLL_PAD_SD2_DATA3__CSI_DATA05                          0x020C 0x04D4 0x05DC 0x3 0x1
+#define MX6SLL_PAD_SD2_DATA3__UART5_DCE_TX                        0x020C 0x04D4 0x0000 0x4 0x0
+#define MX6SLL_PAD_SD2_DATA3__UART5_DTE_RX                        0x020C 0x04D4 0x0764 0x4 0x5
+#define MX6SLL_PAD_SD2_DATA3__GPIO4_IO28                          0x020C 0x04D4 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD2_DATA4__SD2_DATA4                           0x0210 0x04D8 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD2_DATA4__SD3_DATA4                           0x0210 0x04D8 0x0784 0x1 0x1
+#define MX6SLL_PAD_SD2_DATA4__UART2_DCE_RX                        0x0210 0x04D8 0x074C 0x2 0x2
+#define MX6SLL_PAD_SD2_DATA4__UART2_DTE_TX                        0x0210 0x04D8 0x0000 0x2 0x0
+#define MX6SLL_PAD_SD2_DATA4__CSI_DATA06                          0x0210 0x04D8 0x05E0 0x3 0x1
+#define MX6SLL_PAD_SD2_DATA4__SPDIF_OUT                           0x0210 0x04D8 0x0000 0x4 0x0
+#define MX6SLL_PAD_SD2_DATA4__GPIO5_IO02                          0x0210 0x04D8 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD2_DATA5__SD2_DATA5                           0x0214 0x04DC 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD2_DATA5__SD3_DATA5                           0x0214 0x04DC 0x0788 0x1 0x1
+#define MX6SLL_PAD_SD2_DATA5__UART2_DCE_TX                        0x0214 0x04DC 0x0000 0x2 0x0
+#define MX6SLL_PAD_SD2_DATA5__UART2_DTE_RX                        0x0214 0x04DC 0x074C 0x2 0x3
+#define MX6SLL_PAD_SD2_DATA5__CSI_DATA07                          0x0214 0x04DC 0x05E4 0x3 0x1
+#define MX6SLL_PAD_SD2_DATA5__SPDIF_IN                            0x0214 0x04DC 0x0738 0x4 0x1
+#define MX6SLL_PAD_SD2_DATA5__GPIO4_IO31                          0x0214 0x04DC 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD2_DATA6__SD2_DATA6                           0x0218 0x04E0 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD2_DATA6__SD3_DATA6                           0x0218 0x04E0 0x078C 0x1 0x1
+#define MX6SLL_PAD_SD2_DATA6__UART2_DCE_RTS                       0x0218 0x04E0 0x0748 0x2 0x2
+#define MX6SLL_PAD_SD2_DATA6__UART2_DTE_CTS                       0x0218 0x04E0 0x0000 0x2 0x0
+#define MX6SLL_PAD_SD2_DATA6__CSI_DATA08                          0x0218 0x04E0 0x05E8 0x3 0x1
+#define MX6SLL_PAD_SD2_DATA6__SD2_WP                              0x0218 0x04E0 0x077C 0x4 0x1
+#define MX6SLL_PAD_SD2_DATA6__GPIO4_IO29                          0x0218 0x04E0 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD2_DATA7__SD2_DATA7                           0x021C 0x04E4 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD2_DATA7__SD3_DATA7                           0x021C 0x04E4 0x0790 0x1 0x1
+#define MX6SLL_PAD_SD2_DATA7__UART2_DCE_CTS                       0x021C 0x04E4 0x0000 0x2 0x0
+#define MX6SLL_PAD_SD2_DATA7__UART2_DTE_RTS                       0x021C 0x04E4 0x0748 0x2 0x3
+#define MX6SLL_PAD_SD2_DATA7__CSI_DATA09                          0x021C 0x04E4 0x05EC 0x3 0x1
+#define MX6SLL_PAD_SD2_DATA7__SD2_CD_B                            0x021C 0x04E4 0x0778 0x4 0x1
+#define MX6SLL_PAD_SD2_DATA7__GPIO5_IO00                          0x021C 0x04E4 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD3_CLK__SD3_CLK                               0x0220 0x04E8 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD3_CLK__AUD5_RXFS                             0x0220 0x04E8 0x0588 0x1 0x0
+#define MX6SLL_PAD_SD3_CLK__KEY_COL5                              0x0220 0x04E8 0x0694 0x2 0x0
+#define MX6SLL_PAD_SD3_CLK__CSI_DATA10                            0x0220 0x04E8 0x05B0 0x3 0x0
+#define MX6SLL_PAD_SD3_CLK__WDOG1_RESET_B_DEB                     0x0220 0x04E8 0x0000 0x4 0x0
+#define MX6SLL_PAD_SD3_CLK__GPIO5_IO18                            0x0220 0x04E8 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD3_CLK__USB_OTG1_PWR                          0x0220 0x04E8 0x0000 0x6 0x0
+#define MX6SLL_PAD_SD3_CMD__SD3_CMD                               0x0224 0x04EC 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD3_CMD__AUD5_RXC                              0x0224 0x04EC 0x0584 0x1 0x0
+#define MX6SLL_PAD_SD3_CMD__KEY_ROW5                              0x0224 0x04EC 0x06B4 0x2 0x0
+#define MX6SLL_PAD_SD3_CMD__CSI_DATA11                            0x0224 0x04EC 0x05B4 0x3 0x0
+#define MX6SLL_PAD_SD3_CMD__USB_OTG2_ID                           0x0224 0x04EC 0x0560 0x4 0x1
+#define MX6SLL_PAD_SD3_CMD__GPIO5_IO21                            0x0224 0x04EC 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD3_CMD__USB_OTG2_PWR                          0x0224 0x04EC 0x0000 0x6 0x0
+#define MX6SLL_PAD_SD3_DATA0__SD3_DATA0                           0x0228 0x04F0 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD3_DATA0__AUD5_RXD                            0x0228 0x04F0 0x057C 0x1 0x0
+#define MX6SLL_PAD_SD3_DATA0__KEY_COL6                            0x0228 0x04F0 0x0698 0x2 0x0
+#define MX6SLL_PAD_SD3_DATA0__CSI_DATA12                          0x0228 0x04F0 0x05B8 0x3 0x0
+#define MX6SLL_PAD_SD3_DATA0__USB_OTG1_ID                         0x0228 0x04F0 0x055C 0x4 0x1
+#define MX6SLL_PAD_SD3_DATA0__GPIO5_IO19                          0x0228 0x04F0 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD3_DATA1__SD3_DATA1                           0x022C 0x04F4 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD3_DATA1__AUD5_TXC                            0x022C 0x04F4 0x058C 0x1 0x0
+#define MX6SLL_PAD_SD3_DATA1__KEY_ROW6                            0x022C 0x04F4 0x06B8 0x2 0x0
+#define MX6SLL_PAD_SD3_DATA1__CSI_DATA13                          0x022C 0x04F4 0x05BC 0x3 0x0
+#define MX6SLL_PAD_SD3_DATA1__SD1_VSELECT                         0x022C 0x04F4 0x0000 0x4 0x0
+#define MX6SLL_PAD_SD3_DATA1__GPIO5_IO20                          0x022C 0x04F4 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD3_DATA1__JTAG_DE_B                           0x022C 0x04F4 0x0000 0x6 0x0
+#define MX6SLL_PAD_SD3_DATA2__SD3_DATA2                           0x0230 0x04F8 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD3_DATA2__AUD5_TXFS                           0x0230 0x04F8 0x0590 0x1 0x0
+#define MX6SLL_PAD_SD3_DATA2__KEY_COL7                            0x0230 0x04F8 0x069C 0x2 0x0
+#define MX6SLL_PAD_SD3_DATA2__CSI_DATA14                          0x0230 0x04F8 0x05C0 0x3 0x0
+#define MX6SLL_PAD_SD3_DATA2__EPIT1_OUT                           0x0230 0x04F8 0x0000 0x4 0x0
+#define MX6SLL_PAD_SD3_DATA2__GPIO5_IO16                          0x0230 0x04F8 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD3_DATA2__USB_OTG2_OC                         0x0230 0x04F8 0x0768 0x6 0x0
+#define MX6SLL_PAD_SD3_DATA3__SD3_DATA3                           0x0234 0x04FC 0x0000 0x0 0x0
+#define MX6SLL_PAD_SD3_DATA3__AUD5_TXD                            0x0234 0x04FC 0x0580 0x1 0x0
+#define MX6SLL_PAD_SD3_DATA3__KEY_ROW7                            0x0234 0x04FC 0x06BC 0x2 0x0
+#define MX6SLL_PAD_SD3_DATA3__CSI_DATA15                          0x0234 0x04FC 0x05C4 0x3 0x0
+#define MX6SLL_PAD_SD3_DATA3__EPIT2_OUT                           0x0234 0x04FC 0x0000 0x4 0x0
+#define MX6SLL_PAD_SD3_DATA3__GPIO5_IO17                          0x0234 0x04FC 0x0000 0x5 0x0
+#define MX6SLL_PAD_SD3_DATA3__USB_OTG1_OC                         0x0234 0x04FC 0x076C 0x6 0x0
+#define MX6SLL_PAD_GPIO4_IO20__SD1_STROBE                         0x0238 0x0500 0x0000 0x0 0x0
+#define MX6SLL_PAD_GPIO4_IO20__AUD6_RXFS                          0x0238 0x0500 0x05A0 0x2 0x0
+#define MX6SLL_PAD_GPIO4_IO20__ECSPI4_SS0                         0x0238 0x0500 0x065C 0x3 0x0
+#define MX6SLL_PAD_GPIO4_IO20__GPT_CAPTURE1                       0x0238 0x0500 0x0670 0x4 0x0
+#define MX6SLL_PAD_GPIO4_IO20__GPIO4_IO20                         0x0238 0x0500 0x0000 0x5 0x0
+#define MX6SLL_PAD_GPIO4_IO21__SD2_STROBE                         0x023C 0x0504 0x0000 0x0 0x0
+#define MX6SLL_PAD_GPIO4_IO21__AUD6_RXC                           0x023C 0x0504 0x059C 0x2 0x0
+#define MX6SLL_PAD_GPIO4_IO21__ECSPI4_SCLK                        0x023C 0x0504 0x0650 0x3 0x0
+#define MX6SLL_PAD_GPIO4_IO21__GPT_CAPTURE2                       0x023C 0x0504 0x0674 0x4 0x0
+#define MX6SLL_PAD_GPIO4_IO21__GPIO4_IO21                         0x023C 0x0504 0x0000 0x5 0x0
+#define MX6SLL_PAD_GPIO4_IO19__SD3_STROBE                         0x0240 0x0508 0x0000 0x0 0x0
+#define MX6SLL_PAD_GPIO4_IO19__AUD6_RXD                           0x0240 0x0508 0x0594 0x2 0x0
+#define MX6SLL_PAD_GPIO4_IO19__ECSPI4_MOSI                        0x0240 0x0508 0x0658 0x3 0x0
+#define MX6SLL_PAD_GPIO4_IO19__GPT_COMPARE1                       0x0240 0x0508 0x0000 0x4 0x0
+#define MX6SLL_PAD_GPIO4_IO19__GPIO4_IO19                         0x0240 0x0508 0x0000 0x5 0x0
+#define MX6SLL_PAD_GPIO4_IO25__AUD6_TXC                           0x0244 0x050C 0x05A4 0x2 0x0
+#define MX6SLL_PAD_GPIO4_IO25__ECSPI4_MISO                        0x0244 0x050C 0x0654 0x3 0x0
+#define MX6SLL_PAD_GPIO4_IO25__GPT_COMPARE2                       0x0244 0x050C 0x0000 0x4 0x0
+#define MX6SLL_PAD_GPIO4_IO25__GPIO4_IO25                         0x0244 0x050C 0x0000 0x5 0x0
+#define MX6SLL_PAD_GPIO4_IO18__AUD6_TXFS                          0x0248 0x0510 0x05A8 0x2 0x0
+#define MX6SLL_PAD_GPIO4_IO18__ECSPI4_SS1                         0x0248 0x0510 0x0660 0x3 0x0
+#define MX6SLL_PAD_GPIO4_IO18__GPT_COMPARE3                       0x0248 0x0510 0x0000 0x4 0x0
+#define MX6SLL_PAD_GPIO4_IO18__GPIO4_IO18                         0x0248 0x0510 0x0000 0x5 0x0
+#define MX6SLL_PAD_GPIO4_IO24__AUD6_TXD                           0x024C 0x0514 0x0598 0x2 0x0
+#define MX6SLL_PAD_GPIO4_IO24__ECSPI4_SS2                         0x024C 0x0514 0x0664 0x3 0x0
+#define MX6SLL_PAD_GPIO4_IO24__GPT_CLKIN                          0x024C 0x0514 0x0678 0x4 0x0
+#define MX6SLL_PAD_GPIO4_IO24__GPIO4_IO24                         0x024C 0x0514 0x0000 0x5 0x0
+#define MX6SLL_PAD_GPIO4_IO23__AUDIO_CLK_OUT                      0x0250 0x0518 0x0000 0x2 0x0
+#define MX6SLL_PAD_GPIO4_IO23__SD1_RESET                          0x0250 0x0518 0x0000 0x3 0x0
+#define MX6SLL_PAD_GPIO4_IO23__SD3_RESET                          0x0250 0x0518 0x0000 0x4 0x0
+#define MX6SLL_PAD_GPIO4_IO23__GPIO4_IO23                         0x0250 0x0518 0x0000 0x5 0x0
+#define MX6SLL_PAD_GPIO4_IO17__USB_OTG1_ID                        0x0254 0x051C 0x055C 0x2 0x2
+#define MX6SLL_PAD_GPIO4_IO17__SD1_VSELECT                        0x0254 0x051C 0x0000 0x3 0x0
+#define MX6SLL_PAD_GPIO4_IO17__SD3_VSELECT                        0x0254 0x051C 0x0000 0x4 0x0
+#define MX6SLL_PAD_GPIO4_IO17__GPIO4_IO17                         0x0254 0x051C 0x0000 0x5 0x0
+#define MX6SLL_PAD_GPIO4_IO22__SPDIF_IN                           0x0258 0x0520 0x0738 0x2 0x0
+#define MX6SLL_PAD_GPIO4_IO22__SD1_WP                             0x0258 0x0520 0x0774 0x3 0x0
+#define MX6SLL_PAD_GPIO4_IO22__SD3_WP                             0x0258 0x0520 0x0794 0x4 0x1
+#define MX6SLL_PAD_GPIO4_IO22__GPIO4_IO22                         0x0258 0x0520 0x0000 0x5 0x0
+#define MX6SLL_PAD_GPIO4_IO16__SPDIF_OUT                          0x025C 0x0524 0x0000 0x2 0x0
+#define MX6SLL_PAD_GPIO4_IO16__SD1_CD_B                           0x025C 0x0524 0x0770 0x3 0x0
+#define MX6SLL_PAD_GPIO4_IO16__SD3_CD_B                           0x025C 0x0524 0x0780 0x4 0x1
+#define MX6SLL_PAD_GPIO4_IO16__GPIO4_IO16                         0x025C 0x0524 0x0000 0x5 0x0
+#define MX6SLL_PAD_GPIO4_IO26__WDOG1_B                            0x0260 0x0528 0x0000 0x2 0x0
+#define MX6SLL_PAD_GPIO4_IO26__PWM4_OUT                           0x0260 0x0528 0x0000 0x3 0x0
+#define MX6SLL_PAD_GPIO4_IO26__CCM_PMIC_READY                     0x0260 0x0528 0x05AC 0x4 0x1
+#define MX6SLL_PAD_GPIO4_IO26__GPIO4_IO26                         0x0260 0x0528 0x0000 0x5 0x0
+#define MX6SLL_PAD_GPIO4_IO26__SPDIF_EXT_CLK                      0x0260 0x0528 0x073C 0x6 0x0
+
+#endif /* __DTS_IMX6SLL_PINFUNC_H */
diff --git a/arch/arm/boot/dts/imx6sll.dtsi b/arch/arm/boot/dts/imx6sll.dtsi
new file mode 100644
index 0000000..66e6e6d
--- /dev/null
+++ b/arch/arm/boot/dts/imx6sll.dtsi
@@ -0,0 +1,843 @@
+/*
+ * Copyright 2016 Freescale Semiconductor, Inc.
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <dt-bindings/clock/imx6sll-clock.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "imx6sll-pinfunc.h"
+#include "skeleton.dtsi"
+
+/ {
+	aliases {
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		gpio3 = &gpio4;
+		gpio4 = &gpio5;
+		gpio5 = &gpio6;
+		i2c0 = &i2c1;
+		i2c1 = &i2c2;
+		i2c2 = &i2c3;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		mmc2 = &usdhc3;
+		serial0 = &uart1;
+		serial1 = &uart2;
+		serial2 = &uart3;
+		serial3 = &uart4;
+		serial4 = &uart5;
+		spi0 = &ecspi1;
+		spi1 = &ecspi2;
+		spi3 = &ecspi3;
+		spi4 = &ecspi4;
+		usbphy0 = &usbphy1;
+		usbphy1 = &usbphy2;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a9";
+			device_type = "cpu";
+			reg = <0>;
+			next-level-cache = <&L2>;
+			operating-points = <
+				/* kHz    uV */
+				996000  1225000
+				792000  1175000
+				396000  1075000
+				198000	975000
+			>;
+			fsl,soc-operating-points = <
+				/* ARM kHz      SOC-PU uV */
+				996000          1225000
+				792000          1175000
+				396000          1175000
+				198000		1175000
+			>;
+			clock-latency = <61036>; /* two CLK32 periods */
+			fsl,low-power-run;
+			clocks = <&clks IMX6SLL_CLK_ARM>,
+				 <&clks IMX6SLL_CLK_PLL2_PFD2>,
+				 <&clks IMX6SLL_CLK_STEP>,
+				 <&clks IMX6SLL_CLK_PLL1_SW>,
+				 <&clks IMX6SLL_CLK_PLL1_SYS>,
+				 <&clks IMX6SLL_CLK_PLL1>,
+				 <&clks IMX6SLL_PLL1_BYPASS>,
+				 <&clks IMX6SLL_PLL1_BYPASS_SRC>;
+			clock-names = "arm", "pll2_pfd2_396m", "step",
+				      "pll1_sw", "pll1_sys", "pll1", "pll1_bypass",
+				      "pll1_bypass_src";
+		};
+	};
+
+	intc: interrupt-controller@00a01000 {
+		compatible = "arm,cortex-a9-gic";
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		reg = <0x00a01000 0x1000>,
+		      <0x00a00100 0x100>;
+		interrupt-parent = <&intc>;
+	};
+
+	clocks {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ckil: clock@0 {
+			compatible = "fixed-clock";
+			reg = <0>;
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+			clock-output-names = "ckil";
+		};
+
+		osc: clock@1 {
+			compatible = "fixed-clock";
+			reg = <1>;
+			#clock-cells = <0>;
+			clock-frequency = <24000000>;
+			clock-output-names = "osc";
+		};
+
+		ipp_di0: clock@2 {
+			compatible = "fixed-clock";
+			reg = <2>;
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+			clock-output-names = "ipp_di0";
+		};
+
+		ipp_di1: clock@3 {
+			compatible = "fixed-clock";
+			reg = <3>;
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+			clock-output-names = "ipp_di1";
+		};
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gpc>;
+		ranges;
+
+		ocram: sram@00900000 {
+			compatible = "mmio-sram";
+			reg = <0x00905000 0x20000>;
+		};
+
+		L2: l2-cache@00a02000 {
+			compatible = "arm,pl310-cache";
+			reg = <0x00a02000 0x1000>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			cache-unified;
+			cache-level = <2>;
+			arm,tag-latency = <4 2 3>;
+			arm,data-latency = <4 2 3>;
+		};
+
+		aips1: aips-bus@02000000 {
+			compatible = "fsl,aips-bus", "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x02000000 0x100000>;
+			ranges;
+
+			spba: spba-bus@02000000 {
+				compatible = "fsl,spba-bus", "simple-bus";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0x02000000 0x40000>;
+				ranges;
+
+				spdif: spdif@02004000 {
+					compatible = "fsl,imx6sl-spdif", "fsl,imx35-spdif";
+					reg = <0x02004000 0x4000>;
+					interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&sdma 14 18 0>, <&sdma 15 18 0>;
+					dma-names = "rx", "tx";
+					clocks = <&clks IMX6SLL_CLK_SPDIF_GCLK>,
+						 <&clks IMX6SLL_CLK_OSC>,
+						 <&clks IMX6SLL_CLK_SPDIF>,
+						 <&clks IMX6SLL_CLK_DUMMY>,
+						 <&clks IMX6SLL_CLK_DUMMY>,
+						 <&clks IMX6SLL_CLK_DUMMY>,
+						 <&clks IMX6SLL_CLK_IPG>,
+						 <&clks IMX6SLL_CLK_DUMMY>,
+						 <&clks IMX6SLL_CLK_DUMMY>,
+						 <&clks IMX6SLL_CLK_SPBA>;
+					clock-names = "core", "rxtx0",
+						      "rxtx1", "rxtx2",
+						      "rxtx3", "rxtx4",
+						      "rxtx5", "rxtx6",
+						      "rxtx7", "dma";
+					status = "disabled";
+				};
+
+				ecspi1: ecspi@02008000 {
+					compatible = "fsl,imx6ul-ecspi", "fsl,imx51-ecspi";
+					reg = <0x02008000 0x4000>;
+					interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&sdma 3 7 1>, <&sdma 4 7 2>;
+					dma-names = "rx", "tx";
+					clocks = <&clks IMX6SLL_CLK_ECSPI1>,
+						 <&clks IMX6SLL_CLK_ECSPI1>;
+					clock-names = "ipg", "per";
+					status = "disabled";
+				};
+
+				ecspi2: ecspi@0200c000 {
+					compatible = "fsl,imx6ul-ecspi", "fsl,imx51-ecspi";
+					reg = <0x0200c000 0x4000>;
+					interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&sdma 5 7 1>, <&sdma 6 7 2>;
+					dma-names = "rx", "tx";
+					clocks = <&clks IMX6SLL_CLK_ECSPI2>,
+						 <&clks IMX6SLL_CLK_ECSPI2>;
+					clock-names = "ipg", "per";
+					status = "disabled";
+				};
+
+				ecspi3: ecspi@02010000 {
+					compatible = "fsl,imx6ul-ecspi", "fsl,imx51-ecspi";
+					reg = <0x02010000 0x4000>;
+					interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&sdma 7 7 1>, <&sdma 8 7 2>;
+					dma-names = "rx", "tx";
+					clocks = <&clks IMX6SLL_CLK_ECSPI3>,
+						 <&clks IMX6SLL_CLK_ECSPI3>;
+					clock-names = "ipg", "per";
+					status = "disabled";
+				};
+
+				ecspi4: ecspi@02014000 {
+					compatible = "fsl,imx6ul-ecspi", "fsl,imx51-ecspi";
+					reg = <0x02014000 0x4000>;
+					interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&sdma 9 7 1>, <&sdma 10 7 2>;
+					dma-names = "rx", "tx";
+					clocks = <&clks IMX6SLL_CLK_ECSPI4>,
+						 <&clks IMX6SLL_CLK_ECSPI4>;
+					clock-names = "ipg", "per";
+					status = "disabled";
+				};
+
+				uart4: serial@02018000 {
+					compatible = "fsl,imx6sl-uart", "fsl,imx6q-uart", "fsl,imx21-uart";
+					reg = <0x02018000 0x4000>;
+					interrupts =<GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&sdma 31 4 0>, <&sdma 32 4 0>;
+					dma-names = "rx", "tx";
+					clocks = <&clks IMX6SLL_CLK_UART4_IPG>,
+						 <&clks IMX6SLL_CLK_UART4_SERIAL>;
+					clock-names = "ipg", "per";
+					status = "disabled";
+				};
+
+				uart1: serial@02020000 {
+					compatible = "fsl,imx6sl-uart", "fsl,imx6q-uart", "fsl,imx21-uart";
+					reg = <0x02020000 0x4000>;
+					interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&sdma 25 4 0>, <&sdma 26 4 0>;
+					dma-names = "rx", "tx";
+					clocks = <&clks IMX6SLL_CLK_UART1_IPG>,
+						 <&clks IMX6SLL_CLK_UART1_SERIAL>;
+					clock-names = "ipg", "per";
+					status = "disabled";
+				};
+
+				uart2: serial@02024000 {
+					compatible = "fsl,imx6sl-uart", "fsl,imx6q-uart", "fsl,imx21-uart";
+					reg = <0x02024000 0x4000>;
+					interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&sdma 27 4 0>, <&sdma 28 4 0>;
+					dma-names = "rx", "tx";
+					clocks = <&clks IMX6SLL_CLK_UART2_IPG>,
+						 <&clks IMX6SLL_CLK_UART2_SERIAL>;
+					clock-names = "ipg", "per";
+					status = "disabled";
+				};
+
+				ssi1: ssi@02028000 {
+					compatible = "fsl,imx6sl-ssi", "fsl,imx51-ssi";
+					reg = <0x02028000 0x4000>;
+					interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&sdma 37 22 0>, <&sdma 38 22 0>;
+					dma-names = "rx", "tx";
+					fsl,fifo-depth = <15>;
+					clocks = <&clks IMX6SLL_CLK_SSI1_IPG>,
+						 <&clks IMX6SLL_CLK_SSI1>;
+					clock-names = "ipg", "baud";
+					status = "disabled";
+				};
+
+				ssi2: ssi2@0202c000 {
+					compatible = "fsl,imx6sl-ssi", "fsl,imx51-ssi";
+					reg = <0x0202c000 0x4000>;
+					interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&sdma 41 22 0>, <&sdma 42 22 0>;
+					dma-names = "rx", "tx";
+					fsl,fifo-depth = <15>;
+					clocks = <&clks IMX6SLL_CLK_SSI2_IPG>,
+						 <&clks IMX6SLL_CLK_SSI2>;
+					clock-names = "ipg", "baud";
+					status = "disabled";
+				};
+
+				ssi3: ssi@02030000 {
+					compatible = "fsl,imx6sl-ssi", "fsl,imx51-ssi";
+					reg = <0x02030000 0x4000>;
+					interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&sdma 45 22 0>, <&sdma 46 22 0>;
+					dma-names = "rx", "tx";
+					fsl,fifo-depth = <15>;
+					clocks = <&clks IMX6SLL_CLK_SSI3_IPG>,
+						 <&clks IMX6SLL_CLK_SSI3>;
+					clock-names = "ipg", "baud";
+					status = "disabled";
+				};
+
+				uart3: serial@02034000 {
+					compatible = "fsl,imx6sl-uart", "fsl,imx6q-uart", "fsl,imx21-uart";
+					reg = <0x02034000 0x4000>;
+					interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+					dmas = <&sdma 29 4 0>, <&sdma 30 4 0>;
+					dma-name = "rx", "tx";
+					clocks = <&clks IMX6SLL_CLK_UART3_IPG>,
+						 <&clks IMX6SLL_CLK_UART3_SERIAL>;
+					clock-names = "ipg", "per";
+					status = "disabled";
+				};
+			};
+
+			pwm1: pwm@02080000 {
+				compatible = "fsl,imx6sll-pwm", "fsl,imx27-pwm";
+				reg = <0x02080000 0x4000>;
+				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_PWM1>,
+					 <&clks IMX6SLL_CLK_PWM1>;
+				clock-names = "ipg", "per";
+				#pwm-cells = <2>;
+			};
+
+			pwm2: pwm@02084000 {
+				compatible = "fsl,imx6sll-pwm", "fsl,imx27-pwm";
+				reg = <0x02084000 0x4000>;
+				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_PWM2>,
+					 <&clks IMX6SLL_CLK_PWM2>;
+				clock-names = "ipg", "per";
+				#pwm-cells = <2>;
+			};
+
+			pwm3: pwm@02088000 {
+				compatible = "fsl,imx6sll-pwm", "fsl,imx27-pwm";
+				reg = <0x02088000 0x4000>;
+				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_PWM3>,
+					 <&clks IMX6SLL_CLK_PWM3>;
+				clock-names = "ipg", "per";
+				#pwm-cells = <2>;
+			};
+
+			pwm4: pwm@0208c000 {
+				compatible = "fsl,imx6sll-pwm", "fsl,imx27-pwm";
+				reg = <0x0208c000 0x4000>;
+				interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_PWM4>,
+					 <&clks IMX6SLL_CLK_PWM4>;
+				clock-names = "ipg", "per";
+				#pwm-cells = <2>;
+			};
+
+			gpt1: gpt@02098000 {
+				compatible = "fsl,imx6sll-gpt";
+				reg = <0x02098000 0x4000>;
+				interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_GPT_BUS>,
+					 <&clks IMX6SLL_CLK_GPT_SERIAL>;
+				clock-names = "ipg", "per";
+			};
+
+			gpio1: gpio@0209c000 {
+				compatible = "fsl,imx6sll-gpio", "fsl,imx35-gpio";
+				reg = <0x0209c000 0x4000>;
+				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpio2: gpio@020a0000 {
+				compatible = "fsl,imx6sll-gpio", "fsl,imx35-gpio";
+				reg = <0x020a0000 0x4000>;
+				interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpio3: gpio@020a4000 {
+				compatible = "fsl,imx6sll-gpio", "fsl,imx35-gpio";
+				reg = <0x020a4000 0x4000>;
+				interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpio4: gpio@020a8000 {
+				compatible = "fsl,imx6sll-gpio", "fsl,imx35-gpio";
+				reg = <0x020a8000 0x4000>;
+				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpio5: gpio@020ac000 {
+				compatible = "fsl,imx6sll-gpio", "fsl,imx35-gpio";
+				reg = <0x020ac000 0x4000>;
+				interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			gpio6: gpio@020b0000 {
+				compatible = "fsl,imx6sll-gpio", "fsl,imx35-gpio";
+				reg = <0x020b0000 0x4000>;
+				interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
+			kpp: kpp@020b8000 {
+				compatible = "fsl,imx6sll-kpp", "fsl,imx21-kpp";
+				reg = <0x020b8000 0x4000>;
+				interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_KPP>;
+				status = "disabled";
+			};
+
+			wdog1: wdog@020bc000 {
+				compatible = "fsl,imx6sll-wdt", "fsl,imx21-wdt";
+				reg = <0x020bc000 0x4000>;
+				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_WDOG1>;
+			};
+
+			wdog2: wdog@020c0000 {
+				compatible = "fsl,imx6sll-wdt", "fsl,imx21-wdt";
+				reg = <0x020c0000 0x4000>;
+				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_WDOG2>;
+				status = "disabled";
+			};
+
+			clks: ccm@020c4000 {
+				compatible = "fsl,imx6sll-ccm";
+				reg = <0x020c4000 0x4000>;
+				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+				#clock-cells = <1>;
+				clocks = <&ckil>, <&osc>, <&ipp_di0>, <&ipp_di1>;
+				clock-names = "ckil", "osc", "ipp_di0", "ipp_di1";
+			};
+
+			anatop: anatop@020c8000 {
+				compatible = "fsl,imx6sll-anatop",
+					     "fsl,imx6q-anatop",
+					     "syscon", "simple-bus";
+				reg = <0x020c8000 0x4000>;
+				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+
+				reg_3p0: regulator-3p0@120 {
+					compatible = "fsl,anatop-regulator";
+					regulator-name = "vdd3p0";
+					regulator-min-microvolt = <2625000>;
+					regulator-max-microvolt = <3400000>;
+					anatop-reg-offset = <0x120>;
+					anatop-vol-bit-shift = <8>;
+					anatop-vol-bit-width = <5>;
+					anatop-min-bit-val = <0>;
+					anatop-min-voltage = <2625000>;
+					anatop-max-voltage = <3400000>;
+					anatop-enable-bit = <0>;
+				};
+			};
+
+			tempmon: tempmon {
+				compatible = "fsl,imx6sll-tempmon", "fsl,imx6sx-tempmon";
+				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+				fsl,tempmon = <&anatop>;
+				fsl,tempmon-data = <&ocotp>;
+				clocks = <&clks IMX6SLL_CLK_PLL3_USB_OTG>;
+				status = "disabled";
+			};
+
+			usbphy1: usbphy@020c9000 {
+				compatible = "fsl,imx6sll-usbphy", "fsl,imx6ul-usbphy",
+						"fsl,imx23-usbphy";
+				reg = <0x020c9000 0x1000>;
+				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_USBPHY1>;
+				phy-3p0-supply = <&reg_3p0>;
+				fsl,anatop = <&anatop>;
+			};
+
+			usbphy2: usbphy@020ca000 {
+				compatible = "fsl,imx6sll-usbphy", "fsl,imx6ul-usbphy",
+						"fsl,imx23-usbphy";
+				reg = <0x020ca000 0x1000>;
+				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_USBPHY2>;
+				phy-reg_3p0-supply = <&reg_3p0>;
+				fsl,anatop = <&anatop>;
+			};
+
+			snvs: snvs@020cc000 {
+				compatible = "fsl,sec-v4.0-mon", "syscon", "simple-mfd";
+				reg = <0x020cc000 0x4000>;
+
+				snvs_rtc: snvs-rtc-lp {
+					compatible = "fsl,sec-v4.0-mon-rtc-lp";
+					regmap = <&snvs>;
+					offset = <0x34>;
+					interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+				};
+
+				snvs_poweroff: snvs-poweroff {
+					compatible = "syscon-poweroff";
+					regmap = <&snvs>;
+					offset = <0x38>;
+					mask = <0x61>;
+				};
+
+				snvs_pwrkey: snvs-powerkey {
+					compatible = "fsl,sec-v4.0-pwrkey";
+					regmap = <&snvs>;
+					interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+					linux,keycode = <KEY_POWER>;
+					wakeup-source;
+				};
+			};
+
+			epit1: epit@020d0000 {
+				reg = <0x020d0000 0x4000>;
+				interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			epit2: epit@020d4000 {
+				reg = <0x020d4000 0x4000>;
+				interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			src: src@020d8000 {
+				compatible = "fsl,imx6sll-src", "fsl,imx51-src";
+				reg = <0x020d8000 0x4000>;
+				interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+				#reset-cells = <1>;
+			};
+
+			gpc: gpc@020dc000 {
+				compatible = "fsl,imx6sll-gpc", "fsl,imx6q-gpc";
+				reg = <0x020dc000 0x4000>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&intc>;
+				fsl,mf-mix-wakeup-irq = <0x7c00000 0x7d00 0x0 0x1400640>;
+			};
+
+			iomuxc: iomuxc@020e0000 {
+				compatible = "fsl,imx6sll-iomuxc";
+				reg = <0x020e0000 0x4000>;
+			};
+
+			gpr: iomuxc-gpr@020e4000 {
+				compatible = "fsl,imx6sll-iomuxc-gpr",
+					     "fsl,imx6q-iomuxc-gpr", "syscon";
+				reg = <0x020e4000 0x4000>;
+			};
+
+			csi: csi@020e8000 {
+				compatible = "fsl,imx6sll-csi", "fsl,imx6s-csi";
+				reg = <0x020e8000 0x4000>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_DUMMY>,
+					 <&clks IMX6SLL_CLK_CSI>,
+					 <&clks IMX6SLL_CLK_DUMMY>;
+				clock-names = "disp-axi", "csi_mclk", "disp_dcic";
+				status = "disabled";
+			};
+
+			sdma: sdma@020ec000 {
+				compatible = "fsl,imx6sll-sdma", "fsl,imx35-sdma";
+				reg = <0x020ec000 0x4000>;
+				interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_SDMA>,
+					 <&clks IMX6SLL_CLK_SDMA>;
+				clock-names = "ipg", "ahb";
+				#dma-cells = <3>;
+				iram = <&ocram>;
+				fsl,sdma-ram-script-name = "imx/sdma/sdma-imx6q.bin";
+			};
+
+			lcdif: lcdif@020f8000 {
+				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
+				reg = <0x020f8000 0x4000>;
+				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
+					 <&clks IMX6SLL_CLK_LCDIF_APB>,
+					 <&clks IMX6SLL_CLK_DUMMY>;
+				clock-names = "pix", "axi", "disp_axi";
+				status = "disabled";
+			};
+
+			dcp: dcp@020fc000 {
+				compatible = "fsl,imx6sl-dcp";
+				reg = <0x020fc000 0x4000>;
+				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_DCP>;
+				clock-names = "dcp";
+			};
+		};
+
+		aips2: aips-bus@02100000 {
+			compatible = "fsl,aips-bus", "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x02100000 0x100000>;
+			ranges;
+
+			usbotg1: usb@02184000 {
+				compatible = "fsl,imx6sll-usb", "fsl,imx6ul-usb",
+						"fsl,imx27-usb";
+				reg = <0x02184000 0x200>;
+				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_USBOH3>;
+				fsl,usbphy = <&usbphy1>;
+				fsl,usbmisc = <&usbmisc 0>;
+				fsl,anatop = <&anatop>;
+				ahb-burst-config = <0x0>;
+				tx-burst-size-dword = <0x10>;
+				rx-burst-size-dword = <0x10>;
+				status = "disabled";
+			};
+
+			usbotg2: usb@02184200 {
+				compatible = "fsl,imx6sll-usb", "fsl,imx6ul-usb",
+						"fsl,imx27-usb";
+				reg = <0x02184200 0x200>;
+				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_USBOH3>;
+				fsl,usbphy = <&usbphy2>;
+				fsl,usbmisc = <&usbmisc 1>;
+				ahb-burst-config = <0x0>;
+				tx-burst-size-dword = <0x10>;
+				rx-burst-size-dword = <0x10>;
+				status = "disabled";
+			};
+
+			usbmisc: usbmisc@02184800 {
+				#index-cells = <1>;
+				compatible = "fsl,imx6sll-usbmisc", "fsl,imx6ul-usbmisc",
+						"fsl,imx6q-usbmisc";
+				reg = <0x02184800 0x200>;
+			};
+
+			usdhc1: usdhc@02190000 {
+				compatible = "fsl,imx6sll-usdhc", "fsl,imx6sx-usdhc";
+				reg = <0x02190000 0x4000>;
+				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_USDHC1>,
+					 <&clks IMX6SLL_CLK_USDHC1>,
+					 <&clks IMX6SLL_CLK_USDHC1>;
+				clock-names = "ipg", "ahb", "per";
+				bus-width = <4>;
+				fsl,tuning-step = <2>;
+				fsl,tuning-start-tap = <20>;
+				status = "disabled";
+			};
+
+			usdhc2: usdhc@02194000 {
+				compatible = "fsl,imx6sll-usdhc", "fsl,imx6sx-usdhc";
+				reg = <0x02194000 0x4000>;
+				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_USDHC2>,
+					 <&clks IMX6SLL_CLK_USDHC2>,
+					 <&clks IMX6SLL_CLK_USDHC2>;
+				clock-names = "ipg", "ahb", "per";
+				bus-width = <4>;
+				fsl,tuning-step = <2>;
+				fsl,tuning-start-tap = <20>;
+				status = "disabled";
+			};
+
+			usdhc3: usdhc@02198000 {
+				compatible = "fsl,imx6sll-usdhc", "fsl,imx6sx-usdhc";
+				reg = <0x02198000 0x4000>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_USDHC3>,
+					 <&clks IMX6SLL_CLK_USDHC3>,
+					 <&clks IMX6SLL_CLK_USDHC3>;
+				clock-names = "ipg", "ahb", "per";
+				bus-width = <4>;
+				fsl,tuning-step = <2>;
+				fsl,tuning-start-tap = <20>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@021a0000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fs,imx6sll-i2c", "fsl,imx21-i2c";
+				reg = <0x021a0000 0x4000>;
+				interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_I2C1>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@021a4000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,imx6sll-i2c", "fsl,imx21-i2c";
+				reg = <0x021a4000 0x4000>;
+				interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_I2C2>;
+				status = "disabled";
+			};
+
+			i2c3: i2c@021a8000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,imx6sll-i2c", "fsl,imx21-i2c";
+				reg = <0x021a8000 0x4000>;
+				interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6SLL_CLK_I2C3>;
+				status = "disabled";
+			};
+
+			romcp@021ac000 {
+				compatible = "fsl,imx6sll-romcp", "syscon";
+				reg = <0x021ac000 0x4000>;
+			};
+
+			mmdc: mmdc@021b0000 {
+				compatible = "fsl,imx6sll-mmdc", "fsl,imx6q-mmdc";
+				reg = <0x021b0000 0x4000>;
+			};
+
+			rngb: rngb@021b4000 {
+				compatible = "fsl,imx6sl-rng", "fsl,imx-rng", "imx-rng";
+				reg = <0x021b4000 0x4000>;
+				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =  <&clks IMX6SLL_CLK_DUMMY>;
+			};
+
+			ocotp: ocotp-ctrl@021bc000 {
+				compatible = "fsl,imx6sll-ocotp", "syscon";
+				reg = <0x021bc000 0x4000>;
+				clocks = <&clks IMX6SLL_CLK_OCOTP>;
+			};
+
+			csu: csu@021c0000 {
+				compatible = "fsl,imx6sll-csu";
+				reg = <0x021c0000 0x4000>;
+				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
+			snvs_gpr: snvs-gpr@0x021c4000 {
+				compatible = "fsl, imx6sll-snvs-gpr";
+				reg = <0x021c4000 0x10000>;
+			};
+
+			iomuxc_snvs: iomuxc-snvs@021c8000 {
+				compatible = "fsl,imx6sll-iomuxc-snvs";
+				reg = <0x021c80000 0x10000>;
+			};
+
+			audmux: audmux@021d8000 {
+				compatible = "fsl,imx6sll-audmux", "fsl,imx31-audmux";
+				reg = <0x021d8000 0x4000>;
+				status = "disabled";
+			};
+
+			uart5: serial@021f4000 {
+				compatible = "fsl,imx6sll-uart", "fsl,imx6q-uart", "fsl,imx21-uart";
+				reg = <0x021f4000 0x4000>;
+				interrupts =<GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&sdma 33 4 0>, <&sdma 34 4 0>;
+				dma-names = "rx", "tx";
+				clocks = <&clks IMX6SLL_CLK_UART5_IPG>,
+					 <&clks IMX6SLL_CLK_UART5_SERIAL>;
+				clock-names = "ipg", "per";
+				status = "disabled";
+			};
+		};
+	};
+};
-- 
1.9.1

