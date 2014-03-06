From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] ARM: mvebu: add Device Tree for the Armada 385 RD board
Date: Thu,  6 Mar 2014 13:11:08 +0100
Message-ID: <1394107868-26094-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Armada 385 RD board is the reference design board from Marvell
for the Armada 385 SoC. This commit adds a Device Tree description for
this board, which enables the following features:

 * Network interfaces
 * I2C bus
 * Serial port
 * SPI bus, with a SPI flash
 * PCIe interface

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
Hi,

I have received this board only recently, so that why its device tree
comes only now. This patch should not cause any trouble to other part
of the kernel, so that's why I think it is reasonable to have it in
3.15.

Thanks,

Gregory


 arch/arm/boot/dts/Makefile          |   3 +-
 arch/arm/boot/dts/armada-385-rd.dts | 104 ++++++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/armada-385-rd.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index f7d678808122..9155cf48e1b1 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -153,7 +153,8 @@ dtb-$(CONFIG_MACH_ARMADA_370) += \
 dtb-$(CONFIG_MACH_ARMADA_375) += \
 	armada-375-db.dtb
 dtb-$(CONFIG_MACH_ARMADA_38X) += \
-	armada-385-db.dtb
+	armada-385-db.dtb \
+	armada-385-rd.dtb
 dtb-$(CONFIG_MACH_ARMADA_XP) += \
 	armada-xp-axpwifiap.dtb \
 	armada-xp-db.dtb \
diff --git a/arch/arm/boot/dts/armada-385-rd.dts b/arch/arm/boot/dts/armada-385-rd.dts
new file mode 100644
index 000000000000..951bd91059e1
--- /dev/null
+++ b/arch/arm/boot/dts/armada-385-rd.dts
@@ -0,0 +1,104 @@
+/*
+ * Device Tree file for Marvell Armada 385 Reference Design board
+ * (RD-88F6820-AP)
+ *
+ *  Copyright (C) 2014 Marvell
+ *
+ * Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
+ * Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2.  This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+/dts-v1/;
+#include "armada-385.dtsi"
+
+/ {
+	model = "Marvell Armada 385 Reference Design";
+	compatible = "marvell,a385-rd", "marvell,armada385", "marvell,armada38x";
+
+	chosen {
+		bootargs = "console=ttyS0,115200 earlyprintk";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x00000000 0x10000000>; /* 256 MB */
+	};
+
+	soc {
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0xf1000000 0x100000
+			  MBUS_ID(0x01, 0x1d) 0 0xfff00000 0x100000>;
+
+		internal-regs {
+			spi@10600 {
+				status = "okay";
+
+				spi-flash@0 {
+					#address-cells = <1>;
+					#size-cells = <1>;
+					compatible = "m25p128";
+					reg = <0>; /* Chip select 0 */
+					spi-max-frequency = <108000000>;
+				};
+			};
+
+			i2c@11000 {
+				status = "okay";
+				clock-frequency = <100000>;
+			};
+
+			serial@12000 {
+				clock-frequency = <200000000>;
+				status = "okay";
+			};
+
+
+			/*
+			 * The Ethernet nodes are not ordered by
+			 * address on purpose. Indeed the first
+			 * Ethernet port of the board (Giga0) is
+			 * located at 0x70000 whereas the the second
+			 * Ethernet(Giga 1) port is located at
+			 * 0x30000.
+			 */
+
+			ethernet@70000 {
+				status = "okay";
+				phy = <&phy0>;
+				phy-mode = "rgmii";
+			};
+
+			ethernet@30000 {
+				status = "okay";
+				phy = <&phy1>;
+				phy-mode = "rgmii";
+			};
+
+
+			mdio {
+				phy0: ethernet-phy@0 {
+					reg = <0>;
+				};
+
+				phy1: ethernet-phy@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		pcie-controller {
+			status = "okay";
+			/*
+			 * One PCIe units is accessible through
+			 * standard PCIe slot on the board.
+			 */
+			pcie@1,0 {
+				/* Port 0, Lane 0 */
+				status = "okay";
+			};
+		};
+	};
+};
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
