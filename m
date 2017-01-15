From: Dan Haab <dhaab@luxul.com>
Subject: [PATCH 2/2] ARM: BCM5301X: Add DT for Luxul XWR-1200
Date: Sat, 14 Jan 2017 19:29:28 -0700
Message-ID: <1484447368-7622-2-git-send-email-dhaab@luxul.com>
References: <1484447368-7622-1-git-send-email-dhaab@luxul.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484447368-7622-1-git-send-email-dhaab@luxul.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Dan Haab <dhaab@luxul.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Luxul XWR-1200 in a dual-band router based on BCM47081. It uses serial
flash (for bootloader and NVRAM) and NAND flash (for firmware).

Signed-off-by: Dan Haab <dhaab@luxul.com>
---
 arch/arm/boot/dts/Makefile                    |    1 +
 arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts |  107 +++++++++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 04fd8f0..8a403a2 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -84,6 +84,7 @@ dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm47081-buffalo-wzr-600dhp2.dtb \
 	bcm47081-buffalo-wzr-900dhp.dtb \
 	bcm47081-luxul-xap-1410.dtb \
+	bcm47081-luxul-xwr-1200.dtb \
 	bcm4709-asus-rt-ac87u.dtb \
 	bcm4709-buffalo-wxr-1900dhp.dtb \
 	bcm4709-netgear-r7000.dtb \
diff --git a/arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts b/arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts
new file mode 100644
index 0000000..c544ab3
--- /dev/null
+++ b/arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts
@@ -0,0 +1,107 @@
+/*
+ * Copyright 2017 Luxul Inc.
+ *
+ * Licensed under the ISC license.
+ */
+
+/dts-v1/;
+
+#include "bcm47081.dtsi"
+#include "bcm5301x-nand-cs0-bch4.dtsi"
+
+/ {
+	compatible = "luxul,xwr-1200v1", "brcm,bcm47081", "brcm,bcm4708";
+	model = "Luxul XWR-1200 V1";
+
+	chosen {
+		bootargs = "console=ttyS0,115200";
+	};
+
+	memory {
+		reg = <0x00000000 0x08000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		power {
+			label = "bcm53xx:green:power";
+			gpios = <&chipcommon 0 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "default-on";
+		};
+
+		lan3 {
+			label = "bcm53xx:green:lan3";
+			gpios = <&chipcommon 1 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "none";
+		};
+
+		lan4 {
+			label = "bcm53xx:green:lan4";
+			gpios = <&chipcommon 2 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "none";
+		};
+
+		wan {
+			label = "bcm53xx:green:wan";
+			gpios = <&chipcommon 3 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "none";
+		};
+
+		lan2 {
+			label = "bcm53xx:green:lan2";
+			gpios = <&chipcommon 6 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "none";
+		};
+
+		usb {
+			label = "bcm53xx:green:usb";
+			gpios = <&chipcommon 8 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "none";
+		};
+
+		status {
+			label = "bcm53xx:green:status";
+			gpios = <&chipcommon 10 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "timer";
+		};
+
+		2ghz {
+			label = "bcm53xx:green:2ghz";
+			gpios = <&chipcommon 13 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "none";
+		};
+
+		5ghz {
+			label = "bcm53xx:green:5ghz";
+			gpios = <&chipcommon 14 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "none";
+		};
+
+		lan1 {
+			label = "bcm53xx:green:lan1";
+			gpios = <&chipcommon 15 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "none";
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
+&usb2 {
+	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+};
+
+&spi_nor {
+	status = "okay";
+};
-- 
1.7.9.5
