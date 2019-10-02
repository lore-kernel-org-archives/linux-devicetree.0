From: Dan Haab <riproute@gmail.com>
Subject: [PATCH] ARM: dts: BCM5301X: Add DT for Luxul XWC-2000
Date: Wed,  2 Oct 2019 09:57:26 -0600
Message-ID: <1570031846-8330-1-git-send-email-dan.haab@luxul.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, Dan Haab <dan.haab@legrand.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Dan Haab <dan.haab@legrand.com>

It's a simple network device based on BCM47094 with just a single
Ethernet port.

Signed-off-by: Dan Haab <dan.haab@legrand.com>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts | 53 +++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b21b3a6..f6b578d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -113,6 +113,7 @@ dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm47094-luxul-abr-4500.dtb \
 	bcm47094-luxul-xap-1610.dtb \
 	bcm47094-luxul-xbr-4500.dtb \
+	bcm47094-luxul-xwc-2000.dtb \
 	bcm47094-luxul-xwr-3100.dtb \
 	bcm47094-luxul-xwr-3150-v1.dtb \
 	bcm47094-netgear-r8500.dtb \
diff --git a/arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts b/arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts
new file mode 100644
index 0000000..3343253
--- /dev/null
+++ b/arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2019 Legrand AV Inc.
+ */
+
+/dts-v1/;
+
+#include "bcm47094.dtsi"
+#include "bcm5301x-nand-cs0-bch8.dtsi"
+
+/ {
+	compatible = "luxul,xwc-2000-v1", "brcm,bcm47094", "brcm,bcm4708";
+	model = "Luxul XWC-2000 V1";
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
+		status	{
+			label = "bcm53xx:green:status";
+			gpios = <&chipcommon 18 GPIO_ACTIVE_LOW>;
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
+			gpios = <&chipcommon 19 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&spi_nor {
+	status = "okay";
+};
-- 
1.9.1
