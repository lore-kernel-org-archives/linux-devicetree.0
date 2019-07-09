From: Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 10/10] ARM: dts: imx6ull: Add support for PHYTEC
 phyBOARD-Segin with i.MX 6ULL
Date: Tue, 9 Jul 2019 09:19:27 +0200
Message-ID: <1562656767-273566-11-git-send-email-s.riedmueller@phytec.de>
References: <1562656767-273566-1-git-send-email-s.riedmueller@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1562656767-273566-1-git-send-email-s.riedmueller@phytec.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, martyn.welch@collabora.com, linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

In addition to the PHYTEC phyCORE-i.MX 6UL the PHYTEC phyBOARD-Segin is
also available with the PHYTEC phyCORE-i.MX 6ULL. So this adds support
for this SOM and its baseboards.

It comes in a full featured option with either NAND flash or eMMC and in
a low cost option only available with NAND flash.

The hardware specs are:

 - Full featured with NAND or eMMC:
    * i.MX 6ULL Y2
    * 512MB DDR3 memory
    * 512MB NAND flash or 4GB/8GB eMMC
    * Dual 10/100 Ethernet
    * USB Host and USB OTG
    * RS232
    * MicroSD external storage
    * Audio, RS232, I2C, SPI, CAN headers
    * Further I/O options via A/V and Expansion headers

 - Low cost with NAND:
    * i.MX 6ULL Y0
    * 256MB DDR3 memory
    * 128MB NAND flash
    * Single 10/100 Ethernet
    * USB OTG
    * RS232
    * MicroSD external storage
    * I2C
    * Further I/O options via Expansion headers

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 arch/arm/boot/dts/Makefile                         |  3 +
 arch/arm/boot/dts/imx6ull-phytec-phycore-som.dtsi  | 24 ++++++
 .../boot/dts/imx6ull-phytec-segin-ff-rdk-emmc.dts  | 93 ++++++++++++++++++++++
 .../boot/dts/imx6ull-phytec-segin-ff-rdk-nand.dts  | 93 ++++++++++++++++++++++
 .../boot/dts/imx6ull-phytec-segin-lc-rdk-nand.dts  | 45 +++++++++++
 .../boot/dts/imx6ull-phytec-segin-peb-eval-01.dtsi | 19 +++++
 arch/arm/boot/dts/imx6ull-phytec-segin.dtsi        | 38 +++++++++
 7 files changed, 315 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-phycore-som.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-emmc.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-nand.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-segin-lc-rdk-nand.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-segin-peb-eval-01.dtsi
 create mode 100644 arch/arm/boot/dts/imx6ull-phytec-segin.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 668b57c8cc57..16efd11cf20f 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -580,6 +580,9 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-14x14-evk.dtb \
 	imx6ull-colibri-eval-v3.dtb \
 	imx6ull-colibri-wifi-eval-v3.dtb \
+	imx6ull-phytec-segin-ff-rdk-nand.dtb \
+	imx6ull-phytec-segin-ff-rdk-emmc.dtb \
+	imx6ull-phytec-segin-lc-rdk-nand.dtb \
 	imx6ulz-14x14-evk.dtb
 dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-cl-som-imx7.dtb \
diff --git a/arch/arm/boot/dts/imx6ull-phytec-phycore-som.dtsi b/arch/arm/boot/dts/imx6ull-phytec-phycore-som.dtsi
new file mode 100644
index 000000000000..56cd16e5a77f
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ull-phytec-phycore-som.dtsi
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2019 PHYTEC Messtechnik GmbH
+ * Author: Stefan Riedmueller <s.riedmueller@phytec.de>
+ */
+
+#include "imx6ul-phytec-phycore-som.dtsi"
+
+/ {
+	model = "PHYTEC phyCORE-i.MX6 ULL";
+	compatible = "phytec,imx6ull-pcl063", "fsl,imx6ull";
+};
+
+&iomuxc {
+	/delete-node/ gpioledssomgrp;
+};
+
+&iomuxc_snvs {
+	pinctrl_gpioleds_som: gpioledssomgrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x0b0b0
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-emmc.dts b/arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-emmc.dts
new file mode 100644
index 000000000000..9648d4ecaf58
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-emmc.dts
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2019 PHYTEC Messtechnik GmbH
+ * Author: Stefan Riedmueller <s.riedmueller@phytec.de>
+ */
+
+/dts-v1/;
+#include "imx6ull.dtsi"
+#include "imx6ull-phytec-phycore-som.dtsi"
+#include "imx6ull-phytec-segin.dtsi"
+#include "imx6ull-phytec-segin-peb-eval-01.dtsi"
+
+/ {
+	model = "PHYTEC phyBOARD-Segin i.MX6 ULL Full Featured with eMMC";
+	compatible = "phytec,imx6ull-pbacd10-emmc", "phytec,imx6ull-pbacd10",
+		     "phytec,imx6ull-pcl063","fsl,imx6ull";
+};
+
+&adc1 {
+	status = "okay";
+};
+
+&can1 {
+	status = "okay";
+};
+
+&tlv320 {
+	status = "okay";
+};
+
+&ecspi3 {
+	status = "okay";
+};
+
+&ethphy1 {
+	status = "okay";
+};
+
+&ethphy2 {
+	status = "okay";
+};
+
+&fec1 {
+	status = "okay";
+};
+
+&fec2 {
+	status = "okay";
+};
+
+&i2c_rtc {
+	status = "okay";
+};
+
+&reg_can1_en {
+	status = "okay";
+};
+
+&reg_sound_1v8 {
+	status = "okay";
+};
+
+&reg_sound_3v3 {
+	status = "okay";
+};
+
+&sai2 {
+	status = "okay";
+};
+
+&sound {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&usbotg1 {
+	status = "okay";
+};
+
+&usbotg2 {
+	status = "okay";
+};
+
+&usdhc1 {
+	status = "okay";
+};
+
+&usdhc2 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-nand.dts b/arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-nand.dts
new file mode 100644
index 000000000000..656baf846453
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ull-phytec-segin-ff-rdk-nand.dts
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2019 PHYTEC Messtechnik GmbH
+ * Author: Stefan Riedmueller <s.riedmueller@phytec.de>
+ */
+
+/dts-v1/;
+#include "imx6ull.dtsi"
+#include "imx6ull-phytec-phycore-som.dtsi"
+#include "imx6ull-phytec-segin.dtsi"
+#include "imx6ull-phytec-segin-peb-eval-01.dtsi"
+
+/ {
+	model = "PHYTEC phyBOARD-Segin i.MX6 ULL Full Featured with NAND";
+	compatible = "phytec,imx6ull-pbacd10-nand", "phytec,imx6ull-pbacd10",
+		     "phytec,imx6ull-pcl063", "fsl,imx6ull";
+};
+
+&adc1 {
+	status = "okay";
+};
+
+&can1 {
+	status = "okay";
+};
+
+&tlv320 {
+	status = "okay";
+};
+
+&ecspi3 {
+	status = "okay";
+};
+
+&ethphy1 {
+	status = "okay";
+};
+
+&ethphy2 {
+	status = "okay";
+};
+
+&fec1 {
+	status = "okay";
+};
+
+&fec2 {
+	status = "okay";
+};
+
+&gpmi {
+	status = "okay";
+};
+
+&i2c_rtc {
+	status = "okay";
+};
+
+&reg_can1_en {
+	status = "okay";
+};
+
+&reg_sound_1v8 {
+	status = "okay";
+};
+
+&reg_sound_3v3 {
+	status = "okay";
+};
+
+&sai2 {
+	status = "okay";
+};
+
+&sound {
+	status = "okay";
+};
+
+&uart5 {
+	status = "okay";
+};
+
+&usbotg1 {
+	status = "okay";
+};
+
+&usbotg2 {
+	status = "okay";
+};
+
+&usdhc1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx6ull-phytec-segin-lc-rdk-nand.dts b/arch/arm/boot/dts/imx6ull-phytec-segin-lc-rdk-nand.dts
new file mode 100644
index 000000000000..e168494e0a6d
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ull-phytec-segin-lc-rdk-nand.dts
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2019 PHYTEC Messtechnik GmbH
+ * Author: Stefan Riedmueller <s.riedmueller@phytec.de>
+ */
+
+/dts-v1/;
+#include "imx6ull.dtsi"
+#include "imx6ull-phytec-phycore-som.dtsi"
+#include "imx6ull-phytec-segin.dtsi"
+#include "imx6ull-phytec-segin-peb-eval-01.dtsi"
+
+/ {
+	model = "PHYTEC phyBOARD-Segin i.MX6 ULL Low Cost with NAND";
+	compatible = "phytec,imx6ull-pbacd10-nand", "phytec,imx6ull-pbacd10",
+		     "phytec,imx6ull-pcl063", "fsl,imx6ull";
+};
+
+&adc1 {
+	status = "okay";
+};
+
+&ethphy1 {
+	status = "okay";
+};
+
+&fec1 {
+	status = "okay";
+};
+
+&gpmi {
+	status = "okay";
+};
+
+&i2c_rtc {
+	status = "okay";
+};
+
+&usbotg1 {
+	status = "okay";
+};
+
+&usdhc1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx6ull-phytec-segin-peb-eval-01.dtsi b/arch/arm/boot/dts/imx6ull-phytec-segin-peb-eval-01.dtsi
new file mode 100644
index 000000000000..ff08d95a1aa2
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ull-phytec-segin-peb-eval-01.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2019 PHYTEC Messtechnik GmbH
+ * Author: Stefan Riedmueller <s.riedmueller@phytec.de>
+ */
+
+#include "imx6ul-phytec-segin-peb-eval-01.dtsi"
+
+&iomuxc {
+	/delete-node/ gpio_keysgrp;
+};
+
+&iomuxc_snvs {
+	pinctrl_gpio_keys: gpio_keysgrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x79
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/imx6ull-phytec-segin.dtsi b/arch/arm/boot/dts/imx6ull-phytec-segin.dtsi
new file mode 100644
index 000000000000..c1595fc785f7
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ull-phytec-segin.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2019 PHYTEC Messtechnik GmbH
+ * Author: Stefan Riedmueller <s.riedmueller@phytec.de>
+ */
+
+#include "imx6ul-phytec-segin.dtsi"
+
+/ {
+	model = "PHYTEC phyBOARD-Segin i.MX6 ULL";
+	compatible = "phytec,imx6ull-pbacd-10", "phytec,imx6ull-pcl063","fsl,imx6ull";
+};
+
+&iomuxc {
+	/delete-node/ flexcan1engrp;
+	/delete-node/ rtcintgrp;
+	/delete-node/ stmpegrp;
+};
+
+&iomuxc_snvs {
+	princtrl_flexcan1_en: flexcan1engrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x17059
+		>;
+	};
+
+	pinctrl_rtc_int: rtcintgrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER1__GPIO5_IO01	0x17059
+		>;
+	};
+
+	pinctrl_stmpe: stmpegrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER3__GPIO5_IO03	0x17059
+		>;
+	};
+};
-- 
2.7.4
