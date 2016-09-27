From: Dan Haab <dhaab@luxul.com>
Subject: [PATCH 1/2] ARM: BCM5301X: Add DT for Luxul XAP-1510
Date: Tue, 27 Sep 2016 11:27:10 -0600
Message-ID: <1474997231-27700-1-git-send-email-dhaab@luxul.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Dan Haab <dhaab@luxul.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Luxul XAP-1510 is an AP device based on BCM4708 SoC with 2 x BCM4360
chipsets on PCB connected using PCIe.

Signed-off-by: Dan Haab <dhaab@luxul.com>
---
 arch/arm/boot/dts/Makefile                   |    1 +
 arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts |   64 ++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 9bfd1ef..b7fbc1b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -75,6 +75,7 @@ dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm4708-asus-rt-ac56u.dtb \
 	bcm4708-asus-rt-ac68u.dtb \
 	bcm4708-buffalo-wzr-1750dhp.dtb \
+	bcm4708-luxul-xap-1510.dtb \
 	bcm4708-luxul-xwc-1000.dtb \
 	bcm4708-netgear-r6250.dtb \
 	bcm4708-netgear-r6300-v2.dtb \
diff --git a/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts b/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts
new file mode 100644
index 0000000..35e6ed6
--- /dev/null
+++ b/arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts
@@ -0,0 +1,64 @@
+/*
+ * Copyright 2016 Luxul Inc.
+ *
+ * Licensed under the ISC license.
+ */
+
+/dts-v1/;
+
+#include "bcm4708.dtsi"
+
+/ {
+	compatible = "luxul,xap-1510v1", "brcm,bcm4708";
+	model = "Luxul XAP-1510 V1";
+
+	chosen {
+		bootargs = "console=ttyS0,115200 earlycon";
+	};
+
+	memory {
+		reg = <0x00000000 0x08000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		5ghz {
+			label = "bcm53xx:blue:5ghz";
+			gpios = <&chipcommon 13 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "none";
+		};
+
+		2ghz {
+			label = "bcm53xx:blue:2ghz";
+			gpios = <&chipcommon 14 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "none";
+		};
+
+		status {
+			label = "bcm53xx:green:status";
+			gpios = <&chipcommon 15 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "timer";
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
+			gpios = <&chipcommon 11 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&spi_nor {
+	status = "okay";
+};
-- 
1.7.9.5
