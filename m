From: alison-hh6fLRYtCEIS+FvcfC7Uqw@public.gmane.org
Subject: [PATCH 1/2] i.MX6-SabreAuto: DTS: use gpio-hog to enable WEIM-NOR at boot
Date: Sun, 19 Apr 2015 14:02:23 -0700
Message-ID: <1429477343-11076-2-git-send-email-alison_chaiken@mentor.com>
References: <20150116072716.GD18220@pengutronix.de>
 <1429477343-11076-1-git-send-email-alison_chaiken@mentor.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429477343-11076-1-git-send-email-alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, alison-hh6fLRYtCEIS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>

Create an imx6-sabreauto-weim-nor.dtsi file whose inclusion in
a DTS file sets GPIO5 to the level at boot that the WEIM-NOR
device requires.  The GPIO is set via the gpio-hogging mechanism.

Signed-off-by: Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/imx6-sabreauto-weim-nor.dtsi | 56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6-sabreauto-weim-nor.dtsi

diff --git a/arch/arm/boot/dts/imx6-sabreauto-weim-nor.dtsi b/arch/arm/boot/dts/imx6-sabreauto-weim-nor.dtsi
new file mode 100644
index 0000000..940a908
--- /dev/null
+++ b/arch/arm/boot/dts/imx6-sabreauto-weim-nor.dtsi
@@ -0,0 +1,56 @@
+/*
+ * Copyright 2012 Freescale Semiconductor, Inc.
+ * Copyright 2011 Linaro Ltd.
+ * Copyright (c) 2015 Mentor Graphics Inc.
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+/ {
+	soc {
+		aips-bus@02000000 {
+			gpio5: gpio@020ac000 {
+				compatible = "fsl,imx6q-gpio", "fsl,imx35-gpio";
+				reg = <0x020ac000 0x4000>;
+				interrupts = <0 74 IRQ_TYPE_LEVEL_HIGH>,
+					     <0 75 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+
+				weim_nor {
+					 gpio-hog;
+					 gpios = <4 0>;
+					 output-low;
+					 line-name = "weim-nor-gpio";
+				};
+			};
+		};
+	};
+};
+
+&weim {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "disabled";
+};
+
+&uart3 {
+	status = "disabled";
+};
+
+&ecspi1 {
+	status = "disabled";
+};
+
+&usdhc3 {
+	status = "disabled";
+};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
