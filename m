From: Dan Haab <riproute@gmail.com>
Subject: [PATCH 2/2] ARM: dts: BCM5301X: Add DT for Luxul XAP-1610
Date: Fri,  4 May 2018 10:08:44 -0600
Message-ID: <1525450124-21665-2-git-send-email-dan.haab@luxul.com>
References: <1525450124-21665-1-git-send-email-dan.haab@luxul.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1525450124-21665-1-git-send-email-dan.haab@luxul.com>
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

It's an access point based on BCM47094 SoC with two BCM4366E wireless
chipsets.

Signed-off-by: Dan Haab <dan.haab@luxul.com>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts | 57 +++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index a00b279..d041508 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -102,6 +102,7 @@ dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm47094-dlink-dir-885l.dtb \
 	bcm47094-linksys-panamera.dtb \
 	bcm47094-luxul-abr-4500.dtb \
+	bcm47094-luxul-xap-1610.dtb \
 	bcm47094-luxul-xbr-4500.dtb \
 	bcm47094-luxul-xwr-3100.dtb \
 	bcm47094-luxul-xwr-3150-v1.dtb \
diff --git a/arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts b/arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts
new file mode 100644
index 0000000..7fd8547
--- /dev/null
+++ b/arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2018 Luxul Inc.
+ */
+
+/dts-v1/;
+
+#include "bcm47094.dtsi"
+
+/ {
+	compatible = "luxul,xap-1610-v1", "brcm,bcm47094", "brcm,bcm4708";
+	model = "Luxul XAP-1610 V1";
+
+	chosen {
+		bootargs = "earlycon";
+	};
+
+	memory {
+		reg = <0x00000000 0x08000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		status	{
+			label = "bcm53xx:green:status";
+			gpios = <&chipcommon 0 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "timer";
+		};
+
+		2ghz {
+			label = "bcm53xx:blue:2ghz";
+			gpios = <&chipcommon 13 GPIO_ACTIVE_LOW>;
+		};
+
+		5ghz {
+			label = "bcm53xx:blue:5ghz";
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
+&spi_nor {
+	status = "okay";
+};
-- 
1.9.1
