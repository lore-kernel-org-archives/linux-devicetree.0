From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 2/2] ARM: dts: keystone: move i2c0 device node from SoC to board files
Date: Tue, 8 Apr 2014 14:46:07 +0300
Message-ID: <1396957567-14540-3-git-send-email-grygorii.strashko@ti.com>
References: <1396957567-14540-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396957567-14540-1-git-send-email-grygorii.strashko-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh.shilimkar-l0cyMroinI0@public.gmane.org
Cc: ivan.khoronzhuk-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

I2C devices are not the part of Keystone SoC and have to be
defined in board DTS files.
Hence, move i2c0 EEPROM device node from Keystone SoC to
k2hk, k2e, k2l EVM files as they all have similar EEPROM SoCs
installed.

Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/k2e-evm.dts   |    7 +++++++
 arch/arm/boot/dts/k2hk-evm.dts  |    7 +++++++
 arch/arm/boot/dts/k2l-evm.dts   |    7 +++++++
 arch/arm/boot/dts/keystone.dtsi |    5 -----
 4 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/k2e-evm.dts b/arch/arm/boot/dts/k2e-evm.dts
index 74b3b63..d60ce34 100644
--- a/arch/arm/boot/dts/k2e-evm.dts
+++ b/arch/arm/boot/dts/k2e-evm.dts
@@ -58,3 +58,10 @@
 &usb1 {
 	status = "okay";
 };
+
+&i2c0 {
+	dtt@50 {
+		compatible = "at,24c1024";
+		reg = <0x50>;
+	};
+};
diff --git a/arch/arm/boot/dts/k2hk-evm.dts b/arch/arm/boot/dts/k2hk-evm.dts
index c93d06f..d2aa102 100644
--- a/arch/arm/boot/dts/k2hk-evm.dts
+++ b/arch/arm/boot/dts/k2hk-evm.dts
@@ -138,3 +138,10 @@
 		};
 	};
 };
+
+&i2c0 {
+	dtt@50 {
+		compatible = "at,24c1024";
+		reg = <0x50>;
+	};
+};
diff --git a/arch/arm/boot/dts/k2l-evm.dts b/arch/arm/boot/dts/k2l-evm.dts
index 50a7013..bdc94a0 100644
--- a/arch/arm/boot/dts/k2l-evm.dts
+++ b/arch/arm/boot/dts/k2l-evm.dts
@@ -35,3 +35,10 @@
 &usb {
 	status = "okay";
 };
+
+&i2c0 {
+	dtt@50 {
+		compatible = "at,24c1024";
+		reg = <0x50>;
+	};
+};
diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
index f730392..7563934 100644
--- a/arch/arm/boot/dts/keystone.dtsi
+++ b/arch/arm/boot/dts/keystone.dtsi
@@ -102,11 +102,6 @@
 			interrupts = <GIC_SPI 283 IRQ_TYPE_EDGE_RISING>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-
-			dtt@50 {
-				compatible = "at,24c1024";
-				reg = <0x50>;
-			};
 		};
 
 		i2c1: i2c@2530400 {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
