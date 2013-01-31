From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2] arm: mvebu: support for the new Armada XP development
 board(DB-MV784MP-GP)
Date: Thu, 31 Jan 2013 15:08:06 +0100
Message-ID: <1359641286-18182-2-git-send-email-gregory.clement@free-electrons.com>
References: <1359641286-18182-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1359641286-18182-1-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Simon Guinot <simon.guinot-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ike Pan <ike.pan-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Dan Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Chris Van Hoof <vanhoof-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, David Marlin <dmarlin-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Leif Lindholm <leif.lindholm-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is the new Armada XP evaluation board from Marvell. It comes with
a RS232 port over USB, a SATA link, an internal SSD, 4 Ethernet
Gigabit links.

Support for USB (Host and device), SDIO, PCIe will be added as drivers
when they become available for Armada XP in mainline.

Tested-by: Simon Guinot <simon.guinot-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>
Tested-by: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/Makefile         |    1 +
 arch/arm/boot/dts/armada-xp-gp.dts |  101 ++++++++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 arch/arm/boot/dts/armada-xp-gp.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 5ebb44f..51aab4b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -78,6 +78,7 @@ dtb-$(CONFIG_ARCH_MSM) += msm8660-surf.dtb \
 dtb-$(CONFIG_ARCH_MVEBU) += armada-370-db.dtb \
 	armada-370-mirabox.dtb \
 	armada-xp-db.dtb \
+	armada-xp-gp.dtb \
 	armada-xp-openblocks-ax3-4.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx51-babbage.dtb \
 	imx53-ard.dtb \
diff --git a/arch/arm/boot/dts/armada-xp-gp.dts b/arch/arm/boot/dts/armada-xp-gp.dts
new file mode 100644
index 0000000..50e44e7
--- /dev/null
+++ b/arch/arm/boot/dts/armada-xp-gp.dts
@@ -0,0 +1,101 @@
+/*
+ * Device Tree file for Marvell Armada XP development board
+ * (DB-MV784MP-GP)
+ *
+ * Copyright (C) 2013 Marvell
+ *
+ * Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
+ * Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
+ * Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2.  This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+/dts-v1/;
+/include/ "armada-xp-mv78460.dtsi"
+
+/ {
+	model = "Marvell Armada XP Development Board: DB-MV784MP-GP";
+	compatible = "marvell,axp-db", "marvell,armadaxp-mv78460", "marvell,armadaxp", "marvell,armada-370-xp";
+
+	chosen {
+		bootargs = "console=ttyS0,115200 earlyprintk";
+	};
+
+	memory {
+		device_type = "memory";
+
+		/*
+		 * 4 GB of plug-in RAM modules by default but only 3GB
+		 * are visible, the amount of memory available can be
+		 * changed by he bootloader according the size of the
+		 * module actually pluged
+		 */
+		reg = <0x00000000 0xC0000000>;
+	};
+
+	soc {
+		serial@d0012000 {
+			clock-frequency = <250000000>;
+			status = "okay";
+		};
+		serial@d0012100 {
+			clock-frequency = <250000000>;
+			status = "okay";
+		};
+		serial@d0012200 {
+			clock-frequency = <250000000>;
+			status = "okay";
+		};
+		serial@d0012300 {
+			clock-frequency = <250000000>;
+			status = "okay";
+		};
+
+		sata@d00a0000 {
+			nr-ports = <2>;
+			status = "okay";
+		};
+
+		mdio {
+			phy0: ethernet-phy@0 {
+				reg = <16>;
+			};
+
+			phy1: ethernet-phy@1 {
+				reg = <17>;
+			};
+
+			phy2: ethernet-phy@2 {
+				reg = <18>;
+			};
+
+			phy3: ethernet-phy@3 {
+				reg = <19>;
+			};
+		};
+
+		ethernet@d0070000 {
+			status = "okay";
+			phy = <&phy0>;
+			phy-mode = "rgmii-id";
+		};
+		ethernet@d0074000 {
+			status = "okay";
+			phy = <&phy1>;
+			phy-mode = "rgmii-id";
+		};
+		ethernet@d0030000 {
+			status = "okay";
+			phy = <&phy2>;
+			phy-mode = "rgmii-id";
+		};
+		ethernet@d0034000 {
+			status = "okay";
+			phy = <&phy3>;
+			phy-mode = "rgmii-id";
+		};
+	};
+};
-- 
1.7.9.5
