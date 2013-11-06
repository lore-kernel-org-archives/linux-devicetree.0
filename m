From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv12][ 4/8] pinctrl: pinctrl-imx: add imx25 pinctrl driver
Date: Wed,  6 Nov 2013 09:52:15 +0100
Message-ID: <1383727939-4190-4-git-send-email-denis@eukrea.com>
References: <1383727939-4190-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383727939-4190-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is mostly cut and paste from the imx35 pinctrl driver.
The data was generated using sed and awk on
  arch/arm/plat-mxc/include/mach/iomux-mx25.h.

Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Acked-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
ChangeLog v10->v11:
- Added Shawn Guo in the Cc list.
- Splitted the patch to be only pinctrl driver specific.
- Removed the group control registers, and the PAD_CTL_DRIVE_VOLAGAGE_*=
 pad configurations.
  (They were not used).

ChangeLog v9->v10:
- Added a imx25-pingrp.h header.
- Removed backslash-newline at end of imx25-pingrp.h

ChangeLog v8->v9:
- Whitespace cleanup betwen the CC: and Signed-off-by.
- Kconfig: rebased to make it apply on the new HEAD.
---
 .../bindings/pinctrl/fsl,imx25-pinctrl.txt         |   23 ++
 drivers/pinctrl/Kconfig                            |    9 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-imx25.c                    |  351 ++++++++++++=
++++++++
 4 files changed, 384 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx25=
-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-imx25.c

diff --git a/Documentation/devicetree/bindings/pinctrl/fsl,imx25-pinctr=
l.txt b/Documentation/devicetree/bindings/pinctrl/fsl,imx25-pinctrl.txt
new file mode 100644
index 0000000..fd653bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/fsl,imx25-pinctrl.txt
@@ -0,0 +1,23 @@
+* Freescale IMX25 IOMUX Controller
+
+Please refer to fsl,imx-pinctrl.txt in this directory for common bindi=
ng part
+and usage.
+
+CONFIG bits definition:
+PAD_CTL_HYS			(1 << 8)
+PAD_CTL_PKE			(1 << 7)
+PAD_CTL_PUE			(1 << 6)
+PAD_CTL_PUS_100K_DOWN		(0 << 4)
+PAD_CTL_PUS_47K_UP		(1 << 4)
+PAD_CTL_PUS_100K_UP		(2 << 4)
+PAD_CTL_PUS_22K_UP		(3 << 4)
+PAD_CTL_ODE_CMOS		(0 << 3)
+PAD_CTL_ODE_OPENDRAIN		(1 << 3)
+PAD_CTL_DSE_NOMINAL		(0 << 1)
+PAD_CTL_DSE_HIGH		(1 << 1)
+PAD_CTL_DSE_MAX			(2 << 1)
+PAD_CTL_SRE_FAST		(1 << 0)
+PAD_CTL_SRE_SLOW		(0 << 0)
+
+Refer to imx25-pinfunc.h in device tree source folder for all availabl=
e
+imx25 PIN_FUNC_ID.
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index b6e864e..6716be9 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -80,6 +80,15 @@ config PINCTRL_IMX
 	select PINMUX
 	select PINCONF
=20
+
+config PINCTRL_IMX25
+        bool "IMX25 pinctrl driver"
+        depends on OF
+        depends on SOC_IMX25
+        select PINCTRL_IMX
+        help
+          Say Y here to enable the imx25 pinctrl driver
+
 config PINCTRL_IMX35
 	bool "IMX35 pinctrl driver"
 	depends on OF
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 496d9bf..9bf4b16 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_PINCTRL_IMX6SL)	+=3D pinctrl-imx6sl.o
 obj-$(CONFIG_PINCTRL_FALCON)	+=3D pinctrl-falcon.o
 obj-$(CONFIG_PINCTRL_MXS)	+=3D pinctrl-mxs.o
 obj-$(CONFIG_PINCTRL_IMX23)	+=3D pinctrl-imx23.o
+obj-$(CONFIG_PINCTRL_IMX25)	+=3D pinctrl-imx25.o
 obj-$(CONFIG_PINCTRL_IMX28)	+=3D pinctrl-imx28.o
 obj-$(CONFIG_PINCTRL_NOMADIK)	+=3D pinctrl-nomadik.o
 obj-$(CONFIG_PINCTRL_STN8815)	+=3D pinctrl-nomadik-stn8815.o
diff --git a/drivers/pinctrl/pinctrl-imx25.c b/drivers/pinctrl/pinctrl-=
imx25.c
new file mode 100644
index 0000000..8994b43
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-imx25.c
@@ -0,0 +1,351 @@
+/*
+ * imx25 pinctrl driver.
+ *
+ * Copyright 2013 Eukr=C3=A9a Electromatique <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
+ *
+ * This driver was mostly copied from the imx51 pinctrl driver which h=
as:
+ *
+ * Copyright (C) 2012 Freescale Semiconductor, Inc.
+ * Copyright (C) 2012 Linaro, Inc.
+ *
+ * Author: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as p=
ublished
+ * by the Free Software Foundation.
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-imx.h"
+
+enum imx25_pads {
+	MX25_PAD_RESERVE0 =3D 1,
+	MX25_PAD_RESERVE1 =3D 2,
+	MX25_PAD_A10 =3D 3,
+	MX25_PAD_A13 =3D 4,
+	MX25_PAD_A14 =3D 5,
+	MX25_PAD_A15 =3D 6,
+	MX25_PAD_A16 =3D 7,
+	MX25_PAD_A17 =3D 8,
+	MX25_PAD_A18 =3D 9,
+	MX25_PAD_A19 =3D 10,
+	MX25_PAD_A20 =3D 11,
+	MX25_PAD_A21 =3D 12,
+	MX25_PAD_A22 =3D 13,
+	MX25_PAD_A23 =3D 14,
+	MX25_PAD_A24 =3D 15,
+	MX25_PAD_A25 =3D 16,
+	MX25_PAD_EB0 =3D 17,
+	MX25_PAD_EB1 =3D 18,
+	MX25_PAD_OE =3D 19,
+	MX25_PAD_CS0 =3D 20,
+	MX25_PAD_CS1 =3D 21,
+	MX25_PAD_CS4 =3D 22,
+	MX25_PAD_CS5 =3D 23,
+	MX25_PAD_NF_CE0 =3D 24,
+	MX25_PAD_ECB =3D 25,
+	MX25_PAD_LBA =3D 26,
+	MX25_PAD_BCLK =3D 27,
+	MX25_PAD_RW =3D 28,
+	MX25_PAD_NFWE_B =3D 29,
+	MX25_PAD_NFRE_B =3D 30,
+	MX25_PAD_NFALE =3D 31,
+	MX25_PAD_NFCLE =3D 32,
+	MX25_PAD_NFWP_B =3D 33,
+	MX25_PAD_NFRB =3D 34,
+	MX25_PAD_D15 =3D 35,
+	MX25_PAD_D14 =3D 36,
+	MX25_PAD_D13 =3D 37,
+	MX25_PAD_D12 =3D 38,
+	MX25_PAD_D11 =3D 39,
+	MX25_PAD_D10 =3D 40,
+	MX25_PAD_D9 =3D 41,
+	MX25_PAD_D8 =3D 42,
+	MX25_PAD_D7 =3D 43,
+	MX25_PAD_D6 =3D 44,
+	MX25_PAD_D5 =3D 45,
+	MX25_PAD_D4 =3D 46,
+	MX25_PAD_D3 =3D 47,
+	MX25_PAD_D2 =3D 48,
+	MX25_PAD_D1 =3D 49,
+	MX25_PAD_D0 =3D 50,
+	MX25_PAD_LD0 =3D 51,
+	MX25_PAD_LD1 =3D 52,
+	MX25_PAD_LD2 =3D 53,
+	MX25_PAD_LD3 =3D 54,
+	MX25_PAD_LD4 =3D 55,
+	MX25_PAD_LD5 =3D 56,
+	MX25_PAD_LD6 =3D 57,
+	MX25_PAD_LD7 =3D 58,
+	MX25_PAD_LD8 =3D 59,
+	MX25_PAD_LD9 =3D 60,
+	MX25_PAD_LD10 =3D 61,
+	MX25_PAD_LD11 =3D 62,
+	MX25_PAD_LD12 =3D 63,
+	MX25_PAD_LD13 =3D 64,
+	MX25_PAD_LD14 =3D 65,
+	MX25_PAD_LD15 =3D 66,
+	MX25_PAD_HSYNC =3D 67,
+	MX25_PAD_VSYNC =3D 68,
+	MX25_PAD_LSCLK =3D 69,
+	MX25_PAD_OE_ACD =3D 70,
+	MX25_PAD_CONTRAST =3D 71,
+	MX25_PAD_PWM =3D 72,
+	MX25_PAD_CSI_D2 =3D 73,
+	MX25_PAD_CSI_D3 =3D 74,
+	MX25_PAD_CSI_D4 =3D 75,
+	MX25_PAD_CSI_D5 =3D 76,
+	MX25_PAD_CSI_D6 =3D 77,
+	MX25_PAD_CSI_D7 =3D 78,
+	MX25_PAD_CSI_D8 =3D 79,
+	MX25_PAD_CSI_D9 =3D 80,
+	MX25_PAD_CSI_MCLK =3D 81,
+	MX25_PAD_CSI_VSYNC =3D 82,
+	MX25_PAD_CSI_HSYNC =3D 83,
+	MX25_PAD_CSI_PIXCLK =3D 84,
+	MX25_PAD_I2C1_CLK =3D 85,
+	MX25_PAD_I2C1_DAT =3D 86,
+	MX25_PAD_CSPI1_MOSI =3D 87,
+	MX25_PAD_CSPI1_MISO =3D 88,
+	MX25_PAD_CSPI1_SS0 =3D 89,
+	MX25_PAD_CSPI1_SS1 =3D 90,
+	MX25_PAD_CSPI1_SCLK =3D 91,
+	MX25_PAD_CSPI1_RDY =3D 92,
+	MX25_PAD_UART1_RXD =3D 93,
+	MX25_PAD_UART1_TXD =3D 94,
+	MX25_PAD_UART1_RTS =3D 95,
+	MX25_PAD_UART1_CTS =3D 96,
+	MX25_PAD_UART2_RXD =3D 97,
+	MX25_PAD_UART2_TXD =3D 98,
+	MX25_PAD_UART2_RTS =3D 99,
+	MX25_PAD_UART2_CTS =3D 100,
+	MX25_PAD_SD1_CMD =3D 101,
+	MX25_PAD_SD1_CLK =3D 102,
+	MX25_PAD_SD1_DATA0 =3D 103,
+	MX25_PAD_SD1_DATA1 =3D 104,
+	MX25_PAD_SD1_DATA2 =3D 105,
+	MX25_PAD_SD1_DATA3 =3D 106,
+	MX25_PAD_KPP_ROW0 =3D 107,
+	MX25_PAD_KPP_ROW1 =3D 108,
+	MX25_PAD_KPP_ROW2 =3D 109,
+	MX25_PAD_KPP_ROW3 =3D 110,
+	MX25_PAD_KPP_COL0 =3D 111,
+	MX25_PAD_KPP_COL1 =3D 112,
+	MX25_PAD_KPP_COL2 =3D 113,
+	MX25_PAD_KPP_COL3 =3D 114,
+	MX25_PAD_FEC_MDC =3D 115,
+	MX25_PAD_FEC_MDIO =3D 116,
+	MX25_PAD_FEC_TDATA0 =3D 117,
+	MX25_PAD_FEC_TDATA1 =3D 118,
+	MX25_PAD_FEC_TX_EN =3D 119,
+	MX25_PAD_FEC_RDATA0 =3D 120,
+	MX25_PAD_FEC_RDATA1 =3D 121,
+	MX25_PAD_FEC_RX_DV =3D 122,
+	MX25_PAD_FEC_TX_CLK =3D 123,
+	MX25_PAD_RTCK =3D 124,
+	MX25_PAD_DE_B =3D 125,
+	MX25_PAD_GPIO_A =3D 126,
+	MX25_PAD_GPIO_B =3D 127,
+	MX25_PAD_GPIO_C =3D 128,
+	MX25_PAD_GPIO_D =3D 129,
+	MX25_PAD_GPIO_E =3D 130,
+	MX25_PAD_GPIO_F =3D 131,
+	MX25_PAD_EXT_ARMCLK =3D 132,
+	MX25_PAD_UPLL_BYPCLK =3D 133,
+	MX25_PAD_VSTBY_REQ =3D 134,
+	MX25_PAD_VSTBY_ACK =3D 135,
+	MX25_PAD_POWER_FAIL  =3D 136,
+	MX25_PAD_CLKO =3D 137,
+	MX25_PAD_BOOT_MODE0 =3D 138,
+	MX25_PAD_BOOT_MODE1 =3D 139,
+};
+
+/* Pad names for the pinmux subsystem */
+static const struct pinctrl_pin_desc imx25_pinctrl_pads[] =3D {
+	IMX_PINCTRL_PIN(MX25_PAD_RESERVE0),
+	IMX_PINCTRL_PIN(MX25_PAD_RESERVE1),
+	IMX_PINCTRL_PIN(MX25_PAD_A10),
+	IMX_PINCTRL_PIN(MX25_PAD_A13),
+	IMX_PINCTRL_PIN(MX25_PAD_A14),
+	IMX_PINCTRL_PIN(MX25_PAD_A15),
+	IMX_PINCTRL_PIN(MX25_PAD_A16),
+	IMX_PINCTRL_PIN(MX25_PAD_A17),
+	IMX_PINCTRL_PIN(MX25_PAD_A18),
+	IMX_PINCTRL_PIN(MX25_PAD_A19),
+	IMX_PINCTRL_PIN(MX25_PAD_A20),
+	IMX_PINCTRL_PIN(MX25_PAD_A21),
+	IMX_PINCTRL_PIN(MX25_PAD_A22),
+	IMX_PINCTRL_PIN(MX25_PAD_A23),
+	IMX_PINCTRL_PIN(MX25_PAD_A24),
+	IMX_PINCTRL_PIN(MX25_PAD_A25),
+	IMX_PINCTRL_PIN(MX25_PAD_EB0),
+	IMX_PINCTRL_PIN(MX25_PAD_EB1),
+	IMX_PINCTRL_PIN(MX25_PAD_OE),
+	IMX_PINCTRL_PIN(MX25_PAD_CS0),
+	IMX_PINCTRL_PIN(MX25_PAD_CS1),
+	IMX_PINCTRL_PIN(MX25_PAD_CS4),
+	IMX_PINCTRL_PIN(MX25_PAD_CS5),
+	IMX_PINCTRL_PIN(MX25_PAD_NF_CE0),
+	IMX_PINCTRL_PIN(MX25_PAD_ECB),
+	IMX_PINCTRL_PIN(MX25_PAD_LBA),
+	IMX_PINCTRL_PIN(MX25_PAD_BCLK),
+	IMX_PINCTRL_PIN(MX25_PAD_RW),
+	IMX_PINCTRL_PIN(MX25_PAD_NFWE_B),
+	IMX_PINCTRL_PIN(MX25_PAD_NFRE_B),
+	IMX_PINCTRL_PIN(MX25_PAD_NFALE),
+	IMX_PINCTRL_PIN(MX25_PAD_NFCLE),
+	IMX_PINCTRL_PIN(MX25_PAD_NFWP_B),
+	IMX_PINCTRL_PIN(MX25_PAD_NFRB),
+	IMX_PINCTRL_PIN(MX25_PAD_D15),
+	IMX_PINCTRL_PIN(MX25_PAD_D14),
+	IMX_PINCTRL_PIN(MX25_PAD_D13),
+	IMX_PINCTRL_PIN(MX25_PAD_D12),
+	IMX_PINCTRL_PIN(MX25_PAD_D11),
+	IMX_PINCTRL_PIN(MX25_PAD_D10),
+	IMX_PINCTRL_PIN(MX25_PAD_D9),
+	IMX_PINCTRL_PIN(MX25_PAD_D8),
+	IMX_PINCTRL_PIN(MX25_PAD_D7),
+	IMX_PINCTRL_PIN(MX25_PAD_D6),
+	IMX_PINCTRL_PIN(MX25_PAD_D5),
+	IMX_PINCTRL_PIN(MX25_PAD_D4),
+	IMX_PINCTRL_PIN(MX25_PAD_D3),
+	IMX_PINCTRL_PIN(MX25_PAD_D2),
+	IMX_PINCTRL_PIN(MX25_PAD_D1),
+	IMX_PINCTRL_PIN(MX25_PAD_D0),
+	IMX_PINCTRL_PIN(MX25_PAD_LD0),
+	IMX_PINCTRL_PIN(MX25_PAD_LD1),
+	IMX_PINCTRL_PIN(MX25_PAD_LD2),
+	IMX_PINCTRL_PIN(MX25_PAD_LD3),
+	IMX_PINCTRL_PIN(MX25_PAD_LD4),
+	IMX_PINCTRL_PIN(MX25_PAD_LD5),
+	IMX_PINCTRL_PIN(MX25_PAD_LD6),
+	IMX_PINCTRL_PIN(MX25_PAD_LD7),
+	IMX_PINCTRL_PIN(MX25_PAD_LD8),
+	IMX_PINCTRL_PIN(MX25_PAD_LD9),
+	IMX_PINCTRL_PIN(MX25_PAD_LD10),
+	IMX_PINCTRL_PIN(MX25_PAD_LD11),
+	IMX_PINCTRL_PIN(MX25_PAD_LD12),
+	IMX_PINCTRL_PIN(MX25_PAD_LD13),
+	IMX_PINCTRL_PIN(MX25_PAD_LD14),
+	IMX_PINCTRL_PIN(MX25_PAD_LD15),
+	IMX_PINCTRL_PIN(MX25_PAD_HSYNC),
+	IMX_PINCTRL_PIN(MX25_PAD_VSYNC),
+	IMX_PINCTRL_PIN(MX25_PAD_LSCLK),
+	IMX_PINCTRL_PIN(MX25_PAD_OE_ACD),
+	IMX_PINCTRL_PIN(MX25_PAD_CONTRAST),
+	IMX_PINCTRL_PIN(MX25_PAD_PWM),
+	IMX_PINCTRL_PIN(MX25_PAD_CSI_D2),
+	IMX_PINCTRL_PIN(MX25_PAD_CSI_D3),
+	IMX_PINCTRL_PIN(MX25_PAD_CSI_D4),
+	IMX_PINCTRL_PIN(MX25_PAD_CSI_D5),
+	IMX_PINCTRL_PIN(MX25_PAD_CSI_D6),
+	IMX_PINCTRL_PIN(MX25_PAD_CSI_D7),
+	IMX_PINCTRL_PIN(MX25_PAD_CSI_D8),
+	IMX_PINCTRL_PIN(MX25_PAD_CSI_D9),
+	IMX_PINCTRL_PIN(MX25_PAD_CSI_MCLK),
+	IMX_PINCTRL_PIN(MX25_PAD_CSI_VSYNC),
+	IMX_PINCTRL_PIN(MX25_PAD_CSI_HSYNC),
+	IMX_PINCTRL_PIN(MX25_PAD_CSI_PIXCLK),
+	IMX_PINCTRL_PIN(MX25_PAD_I2C1_CLK),
+	IMX_PINCTRL_PIN(MX25_PAD_I2C1_DAT),
+	IMX_PINCTRL_PIN(MX25_PAD_CSPI1_MOSI),
+	IMX_PINCTRL_PIN(MX25_PAD_CSPI1_MISO),
+	IMX_PINCTRL_PIN(MX25_PAD_CSPI1_SS0),
+	IMX_PINCTRL_PIN(MX25_PAD_CSPI1_SS1),
+	IMX_PINCTRL_PIN(MX25_PAD_CSPI1_SCLK),
+	IMX_PINCTRL_PIN(MX25_PAD_CSPI1_RDY),
+	IMX_PINCTRL_PIN(MX25_PAD_UART1_RXD),
+	IMX_PINCTRL_PIN(MX25_PAD_UART1_TXD),
+	IMX_PINCTRL_PIN(MX25_PAD_UART1_RTS),
+	IMX_PINCTRL_PIN(MX25_PAD_UART1_CTS),
+	IMX_PINCTRL_PIN(MX25_PAD_UART2_RXD),
+	IMX_PINCTRL_PIN(MX25_PAD_UART2_TXD),
+	IMX_PINCTRL_PIN(MX25_PAD_UART2_RTS),
+	IMX_PINCTRL_PIN(MX25_PAD_UART2_CTS),
+	IMX_PINCTRL_PIN(MX25_PAD_SD1_CMD),
+	IMX_PINCTRL_PIN(MX25_PAD_SD1_CLK),
+	IMX_PINCTRL_PIN(MX25_PAD_SD1_DATA0),
+	IMX_PINCTRL_PIN(MX25_PAD_SD1_DATA1),
+	IMX_PINCTRL_PIN(MX25_PAD_SD1_DATA2),
+	IMX_PINCTRL_PIN(MX25_PAD_SD1_DATA3),
+	IMX_PINCTRL_PIN(MX25_PAD_KPP_ROW0),
+	IMX_PINCTRL_PIN(MX25_PAD_KPP_ROW1),
+	IMX_PINCTRL_PIN(MX25_PAD_KPP_ROW2),
+	IMX_PINCTRL_PIN(MX25_PAD_KPP_ROW3),
+	IMX_PINCTRL_PIN(MX25_PAD_KPP_COL0),
+	IMX_PINCTRL_PIN(MX25_PAD_KPP_COL1),
+	IMX_PINCTRL_PIN(MX25_PAD_KPP_COL2),
+	IMX_PINCTRL_PIN(MX25_PAD_KPP_COL3),
+	IMX_PINCTRL_PIN(MX25_PAD_FEC_MDC),
+	IMX_PINCTRL_PIN(MX25_PAD_FEC_MDIO),
+	IMX_PINCTRL_PIN(MX25_PAD_FEC_TDATA0),
+	IMX_PINCTRL_PIN(MX25_PAD_FEC_TDATA1),
+	IMX_PINCTRL_PIN(MX25_PAD_FEC_TX_EN),
+	IMX_PINCTRL_PIN(MX25_PAD_FEC_RDATA0),
+	IMX_PINCTRL_PIN(MX25_PAD_FEC_RDATA1),
+	IMX_PINCTRL_PIN(MX25_PAD_FEC_RX_DV),
+	IMX_PINCTRL_PIN(MX25_PAD_FEC_TX_CLK),
+	IMX_PINCTRL_PIN(MX25_PAD_RTCK),
+	IMX_PINCTRL_PIN(MX25_PAD_DE_B),
+	IMX_PINCTRL_PIN(MX25_PAD_GPIO_A),
+	IMX_PINCTRL_PIN(MX25_PAD_GPIO_B),
+	IMX_PINCTRL_PIN(MX25_PAD_GPIO_C),
+	IMX_PINCTRL_PIN(MX25_PAD_GPIO_D),
+	IMX_PINCTRL_PIN(MX25_PAD_GPIO_E),
+	IMX_PINCTRL_PIN(MX25_PAD_GPIO_F),
+	IMX_PINCTRL_PIN(MX25_PAD_EXT_ARMCLK),
+	IMX_PINCTRL_PIN(MX25_PAD_UPLL_BYPCLK),
+	IMX_PINCTRL_PIN(MX25_PAD_VSTBY_REQ),
+	IMX_PINCTRL_PIN(MX25_PAD_VSTBY_ACK),
+	IMX_PINCTRL_PIN(MX25_PAD_POWER_FAIL),
+	IMX_PINCTRL_PIN(MX25_PAD_CLKO),
+	IMX_PINCTRL_PIN(MX25_PAD_BOOT_MODE0),
+	IMX_PINCTRL_PIN(MX25_PAD_BOOT_MODE1),
+};
+
+static struct imx_pinctrl_soc_info imx25_pinctrl_info =3D {
+	.pins =3D imx25_pinctrl_pads,
+	.npins =3D ARRAY_SIZE(imx25_pinctrl_pads),
+};
+
+static struct of_device_id imx25_pinctrl_of_match[] =3D {
+	{ .compatible =3D "fsl,imx25-iomuxc", },
+	{ /* sentinel */ }
+};
+
+static int imx25_pinctrl_probe(struct platform_device *pdev)
+{
+	return imx_pinctrl_probe(pdev, &imx25_pinctrl_info);
+}
+
+static struct platform_driver imx25_pinctrl_driver =3D {
+	.driver =3D {
+		.name =3D "imx25-pinctrl",
+		.owner =3D THIS_MODULE,
+		.of_match_table =3D of_match_ptr(imx25_pinctrl_of_match),
+	},
+	.probe =3D imx25_pinctrl_probe,
+	.remove =3D imx_pinctrl_remove,
+};
+
+static int __init imx25_pinctrl_init(void)
+{
+	return platform_driver_register(&imx25_pinctrl_driver);
+}
+arch_initcall(imx25_pinctrl_init);
+
+static void __exit imx25_pinctrl_exit(void)
+{
+	platform_driver_unregister(&imx25_pinctrl_driver);
+}
+module_exit(imx25_pinctrl_exit);
+MODULE_AUTHOR("Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>");
+MODULE_DESCRIPTION("Freescale IMX25 pinctrl driver");
+MODULE_LICENSE("GPL v2");
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
