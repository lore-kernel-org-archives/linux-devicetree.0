From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 11/12] ARM: mvebu: Add Device Tree description of the Armada 388 SoC
Date: Thu,  8 Jan 2015 18:38:13 +0100
Message-ID: <1420738694-6163-12-git-send-email-gregory.clement@free-electrons.com>
References: <1420738694-6163-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420738694-6163-1-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This SoC belongs to the Armada 38x family. The main difference with
the Armada 385 is that the 388 can handle two more SATA
ports. Currently the consequence is the use of a different compatible
string for the pinctrl node, in order to be able to use the pins
associated to this 2 new SATA ports. The second SATA controller has
also been moved from the armada38x.dtsi as it it specific to the
Armada388 version.

In the same time the Armada385 DB and Armada 385 RD board have been
renamed in the 388 one and now include the armada-388.dtsi file. AS
both of them have 4 SATA ports the SoC used on them were wrongly
described.

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                         |  4 +-
 .../dts/{armada-385-db.dts => armada-388-db.dts}   |  7 ++-
 .../dts/{armada-385-rd.dts => armada-388-rd.dts}   |  7 ++-
 arch/arm/boot/dts/armada-388.dtsi                  | 70 ++++++++++++++++++++++
 4 files changed, 80 insertions(+), 8 deletions(-)
 rename arch/arm/boot/dts/{armada-385-db.dts => armada-388-db.dts} (93%)
 rename arch/arm/boot/dts/{armada-385-rd.dts => armada-388-rd.dts} (89%)
 create mode 100644 arch/arm/boot/dts/armada-388.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index ce7bc221fae7..4613c1603692 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -534,9 +534,9 @@ dtb-$(CONFIG_MACH_ARMADA_370) += \
 dtb-$(CONFIG_MACH_ARMADA_375) += \
 	armada-375-db.dtb
 dtb-$(CONFIG_MACH_ARMADA_38X) += \
-	armada-385-db.dtb \
 	armada-385-db-ap.dtb \
-	armada-385-rd.dtb
+	armada-388-db.dtb \
+	armada-388-rd.dtb
 dtb-$(CONFIG_MACH_ARMADA_XP) += \
 	armada-xp-axpwifiap.dtb \
 	armada-xp-db.dtb \
diff --git a/arch/arm/boot/dts/armada-385-db.dts b/arch/arm/boot/dts/armada-388-db.dts
similarity index 93%
rename from arch/arm/boot/dts/armada-385-db.dts
rename to arch/arm/boot/dts/armada-388-db.dts
index 212605ccc7b6..e200836c30be 100644
--- a/arch/arm/boot/dts/armada-385-db.dts
+++ b/arch/arm/boot/dts/armada-388-db.dts
@@ -1,5 +1,5 @@
 /*
- * Device Tree file for Marvell Armada 385 evaluation board
+ * Device Tree file for Marvell Armada 388 evaluation board
  * (DB-88F6820)
  *
  *  Copyright (C) 2014 Marvell
@@ -12,11 +12,12 @@
  */
 
 /dts-v1/;
-#include "armada-385.dtsi"
+#include "armada-388.dtsi"
 
 / {
 	model = "Marvell Armada 385 Development Board";
-	compatible = "marvell,a385-db", "marvell,armada385", "marvell,armada380";
+	compatible = "marvell,a385-db", "marvell,armada388",
+		"marvell,armada385", "marvell,armada380";
 
 	chosen {
 		bootargs = "console=ttyS0,115200 earlyprintk";
diff --git a/arch/arm/boot/dts/armada-385-rd.dts b/arch/arm/boot/dts/armada-388-rd.dts
similarity index 89%
rename from arch/arm/boot/dts/armada-385-rd.dts
rename to arch/arm/boot/dts/armada-388-rd.dts
index 74a3bfe6efd7..c98a8f8d01a9 100644
--- a/arch/arm/boot/dts/armada-385-rd.dts
+++ b/arch/arm/boot/dts/armada-388-rd.dts
@@ -1,5 +1,5 @@
 /*
- * Device Tree file for Marvell Armada 385 Reference Design board
+ * Device Tree file for Marvell Armada 388 Reference Design board
  * (RD-88F6820-AP)
  *
  *  Copyright (C) 2014 Marvell
@@ -13,11 +13,12 @@
  */
 
 /dts-v1/;
-#include "armada-385.dtsi"
+#include "armada-388.dtsi"
 
 / {
 	model = "Marvell Armada 385 Reference Design";
-	compatible = "marvell,a385-rd", "marvell,armada385", "marvell,armada380";
+	compatible = "marvell,a385-rd", "marvell,armada388",
+		"marvell,armada385","marvell,armada380";
 
 	chosen {
 		bootargs = "console=ttyS0,115200 earlyprintk";
diff --git a/arch/arm/boot/dts/armada-388.dtsi b/arch/arm/boot/dts/armada-388.dtsi
new file mode 100644
index 000000000000..564fa5937e25
--- /dev/null
+++ b/arch/arm/boot/dts/armada-388.dtsi
@@ -0,0 +1,70 @@
+/*
+ * Device Tree Include file for Marvell Armada 388 SoC.
+ *
+ * Copyright (C) 2015 Marvell
+ *
+ * Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is licensed under the terms of the GNU General Public
+ *     License version 2.  This program is licensed "as is" without
+ *     any warranty of any kind, whether express or implied.
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
+ *
+ *
+ * The main difference with the Armada 385 is that the 388 can handle two more
+ * SATA ports. So we can reuse the dtsi of the Armada 385, override the pinctrl
+ * property and the name of the SoC, and add the second SATA host which control
+ * the 2 other ports.
+ */
+
+#include "armada-385.dtsi"
+
+/ {
+	model = "Marvell Armada 388 family SoC";
+	compatible = "marvell,armada388", "marvell,armada385",
+		"marvell,armada380";
+
+	soc {
+		internal-regs {
+			pinctrl@18000 {
+				compatible = "marvell,mv88f6828-pinctrl";
+			};
+
+			sata@e0000 {
+				compatible = "marvell,armada-380-ahci";
+				reg = <0xe0000 0x2000>;
+				interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gateclk 30>;
+				status = "disabled";
+			};
+
+		};
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
