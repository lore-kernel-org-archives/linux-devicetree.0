From: "G, Manjunath Kondaiah" <manjugk@ti.com>
Subject: [RFC/PATCH 11/14] dt: omap3: add soc file for handling i2c controllers
Date: Tue, 09 Aug 2011 19:10:29 +0500
Message-ID: <1312897232-4792-12-git-send-email-manjugk@ti.com>
References: <1312897232-4792-1-git-send-email-manjugk@ti.com>
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, grant.likely@secretlab.ca
List-Id: devicetree@vger.kernel.org


Add omap3 soc file for handling omap3 soc i2c controllers existing
on l4-core bus.

Signed-off-by: G, Manjunath Kondaiah <manjugk@ti.com>
---
 arch/arm/boot/dts/omap3-soc.dtsi |   62 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 62 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/boot/dts/omap3-soc.dtsi

diff --git a/arch/arm/boot/dts/omap3-soc.dtsi b/arch/arm/boot/dts/omap3-soc.dtsi
new file mode 100644
index 0000000..85de92f
--- /dev/null
+++ b/arch/arm/boot/dts/omap3-soc.dtsi
@@ -0,0 +1,62 @@
+/*
+ * Device Tree Source for OMAP3 SoC
+ *
+ * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+
+/dts-v1/;
+/include/ "skeleton.dtsi"
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	model = "ti,omap3";
+
+	aliases {
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+	};
+
+	l4-core {
+		compatible = "ti,omap3-l4-core";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x48000000 0x1000000>;
+
+		i2c1: i2c@70000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "ti,omap3-i2c";
+			reg = <0x70000 0x100>;
+			interrupts = < 88 >;
+		};
+
+		i2c2: i2c@72000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "ti,omap3-i2c";
+			reg = <0x72000 0x100>;
+			interrupts = < 89 >;
+		};
+
+		i2c3: i2c@60000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "ti,omap3-i2c";
+			reg = <0x60000 0x100>;
+			interrupts = < 93 >;
+		};
+	};
+
+	l4-per {
+		compatible = "ti,l4-per";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x49000000 0x100000>;
+	};
+};
-- 
1.7.1

