From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH 5/9] ARM: at91: Calao USB A926x factorize common binding in
 usb_a9260_common
Date: Wed, 11 Apr 2012 18:01:15 +0200
Message-ID: <1334160079-30831-5-git-send-email-plagnioj@jcrosoft.com>
References: <20120411153515.GK16641@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120411153515.GK16641@game.jcrosoft.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: devicetree@vger.kernel.org

This will simplify the adding of the A9260.

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 .../dts/{usb_a9g20.dts => usb_a9260_common.dtsi}   |   22 +---
 arch/arm/boot/dts/usb_a9g20.dts                    |  165 ++++----------------
 2 files changed, 32 insertions(+), 155 deletions(-)
 rename arch/arm/boot/dts/{usb_a9g20.dts => usb_a9260_common.dtsi} (77%)
 rewrite arch/arm/boot/dts/usb_a9g20.dts (74%)

diff --git a/arch/arm/boot/dts/usb_a9g20.dts b/arch/arm/boot/dts/usb_a9260_common.dtsi
similarity index 77%
rename from arch/arm/boot/dts/usb_a9g20.dts
rename to arch/arm/boot/dts/usb_a9260_common.dtsi
index 0f88ec8..e70d229 100644
--- a/arch/arm/boot/dts/usb_a9g20.dts
+++ b/arch/arm/boot/dts/usb_a9260_common.dtsi
@@ -1,25 +1,12 @@
 /*
- * usb_a9g20.dts - Device Tree file for Caloa USB A9G20 board
+ * usb_a926x.dts - Device Tree file for Caloa USB A926x board
  *
- *  Copyright (C) 2011 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+ *  Copyright (C) 2011-2012 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
  *
  * Licensed under GPLv2 or later.
  */
-/dts-v1/;
-/include/ "at91sam9g20.dtsi"
 
 / {
-	model = "Calao USB A9G20";
-	compatible = "calao,usb-a9g20", "atmel,at91sam9g20", "atmel,at91sam9";
-
-	chosen {
-		bootargs = "mem=64M console=ttyS0,115200 root=/dev/mtdblock5 rw rootfstype=ubifs";
-	};
-
-	memory {
-		reg = <0x20000000 0x4000000>;
-	};
-
 	clocks {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -126,10 +113,5 @@
 
 	i2c@0 {
 		status = "okay";
-
-		rv3029c2@56 {
-			compatible = "rv3029c2";
-			reg = <0x56>;
-		};
 	};
 };
diff --git a/arch/arm/boot/dts/usb_a9g20.dts b/arch/arm/boot/dts/usb_a9g20.dts
dissimilarity index 74%
index 0f88ec8..2dacb16c 100644
--- a/arch/arm/boot/dts/usb_a9g20.dts
+++ b/arch/arm/boot/dts/usb_a9g20.dts
@@ -1,135 +1,30 @@
-/*
- * usb_a9g20.dts - Device Tree file for Caloa USB A9G20 board
- *
- *  Copyright (C) 2011 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
- *
- * Licensed under GPLv2 or later.
- */
-/dts-v1/;
-/include/ "at91sam9g20.dtsi"
-
-/ {
-	model = "Calao USB A9G20";
-	compatible = "calao,usb-a9g20", "atmel,at91sam9g20", "atmel,at91sam9";
-
-	chosen {
-		bootargs = "mem=64M console=ttyS0,115200 root=/dev/mtdblock5 rw rootfstype=ubifs";
-	};
-
-	memory {
-		reg = <0x20000000 0x4000000>;
-	};
-
-	clocks {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		main_clock: clock@0 {
-			compatible = "atmel,osc", "fixed-clock";
-			clock-frequency = <12000000>;
-		};
-	};
-
-	ahb {
-		apb {
-			dbgu: serial@fffff200 {
-				status = "okay";
-			};
-
-			macb0: ethernet@fffc4000 {
-				phy-mode = "rmii";
-				status = "okay";
-			};
-
-			usb1: gadget@fffa4000 {
-				atmel,vbus-gpio = <&pioC 5 0>;
-				status = "okay";
-			};
-		};
-
-		nand0: nand@40000000 {
-			nand-bus-width = <8>;
-			nand-ecc-mode = "soft";
-			nand-on-flash-bbt;
-			status = "okay";
-
-			at91bootstrap@0 {
-				label = "at91bootstrap";
-				reg = <0x0 0x20000>;
-			};
-
-			barebox@20000 {
-				label = "barebox";
-				reg = <0x20000 0x40000>;
-			};
-
-			bareboxenv@60000 {
-				label = "bareboxenv";
-				reg = <0x60000 0x20000>;
-			};
-
-			bareboxenv2@80000 {
-				label = "bareboxenv2";
-				reg = <0x80000 0x20000>;
-			};
-
-			oftree@80000 {
-				label = "oftree";
-				reg = <0xa0000 0x20000>;
-			};
-
-			kernel@a0000 {
-				label = "kernel";
-				reg = <0xc0000 0x400000>;
-			};
-
-			rootfs@4a0000 {
-				label = "rootfs";
-				reg = <0x4c0000 0x7800000>;
-			};
-
-			data@7ca0000 {
-				label = "data";
-				reg = <0x7cc0000 0x8340000>;
-			};
-		};
-
-		usb0: ohci@00500000 {
-			num-ports = <2>;
-			status = "okay";
-		};
-	};
-
-	leds {
-		compatible = "gpio-leds";
-
-		user_led {
-			label = "user_led";
-			gpios = <&pioB 21 1>;
-			linux,default-trigger = "heartbeat";
-		};
-	};
-
-	gpio_keys {
-		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		user_pb {
-			label = "user_pb";
-			gpios = <&pioB 10 1>;
-			linux,code = <28>;
-			gpio-key,wakeup;
-		};
-	};
-
-	i2c@0 {
-		status = "okay";
-
-		rv3029c2@56 {
-			compatible = "rv3029c2";
-			reg = <0x56>;
-		};
-	};
-};
+/*
+ * usb_a9g20.dts - Device Tree file for Caloa USB A9G20 board
+ *
+ *  Copyright (C) 2011 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+ *
+ * Licensed under GPLv2 or later.
+ */
+/dts-v1/;
+/include/ "at91sam9g20.dtsi"
+/include/ "usb_a9260_common.dtsi"
+
+/ {
+	model = "Calao USB A9G20";
+	compatible = "calao,usb-a9g20", "atmel,at91sam9g20", "atmel,at91sam9";
+
+	chosen {
+		bootargs = "mem=64M console=ttyS0,115200 root=/dev/mtdblock5 rw rootfstype=ubifs";
+	};
+
+	memory {
+		reg = <0x20000000 0x4000000>;
+	};
+
+	i2c@0 {
+		rv3029c2@56 {
+			compatible = "rv3029c2";
+			reg = <0x56>;
+		};
+	};
+};
-- 
1.7.9.1
