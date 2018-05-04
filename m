From: Dan Haab <riproute@gmail.com>
Subject: [PATCH 1/2] ARM: dts: BCM5301X: Add DT for Luxul XWR-3150 V1
Date: Fri,  4 May 2018 10:08:43 -0600
Message-ID: <1525450124-21665-1-git-send-email-dan.haab@luxul.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jon Mason <jonmason@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Dan Haab <dan.haab@luxul.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Luxul XWR-3150 is a wireless router similar to the XWR-3100 except:
1) It has more RAM
2) Its NAND controller in running in BCH8 mode
3) LAN ports LEDs are hardware controlled

Signed-off-by: Dan Haab <dan.haab@luxul.com>
---
 arch/arm/boot/dts/Makefile                       |  1 +
 arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts | 77 ++++++++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7e24249..a00b279 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -104,6 +104,7 @@ dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm47094-luxul-abr-4500.dtb \
 	bcm47094-luxul-xbr-4500.dtb \
 	bcm47094-luxul-xwr-3100.dtb \
+	bcm47094-luxul-xwr-3150-v1.dtb \
 	bcm47094-netgear-r8500.dtb \
 	bcm94708.dtb \
 	bcm94709.dtb \
diff --git a/arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts
new file mode 100644
index 0000000..bdad726
--- /dev/null
+++ b/arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2018 Luxul Inc.
+ */
+
+/dts-v1/;
+
+#include "bcm47094.dtsi"
+#include "bcm5301x-nand-cs0-bch8.dtsi"
+
+/ {
+	compatible = "luxul,xwr-3150-v1", "brcm,bcm47094", "brcm,bcm4708";
+	model = "Luxul XWR-3150 V1";
+
+	chosen {
+		bootargs = "earlycon";
+	};
+
+	memory {
+		reg = <0x00000000 0x08000000
+		       0x88000000 0x18000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		power	{
+			label = "bcm53xx:green:power";
+			gpios = <&chipcommon 0 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "default-on";
+		};
+
+		usb3	{
+			label = "bcm53xx:green:usb3";
+			gpios = <&chipcommon 8 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&ohci_port1>, <&ehci_port1>,
+					  <&xhci_port1>;
+			linux,default-trigger = "usbport";
+		};
+
+		status	{
+			label = "bcm53xx:green:status";
+			gpios = <&chipcommon 10 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "timer";
+		};
+
+		2ghz {
+			label = "bcm53xx:green:2ghz";
+			gpios = <&chipcommon 13 GPIO_ACTIVE_LOW>;
+		};
+
+		5ghz {
+			label = "bcm53xx:green:5ghz";
+			gpios = <&chipcommon 14 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		restart {
+			label = "Reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&usb3 {
+	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+};
+
+&spi_nor {
+	status = "okay";
+};
-- 
1.9.1
