From: AnilKumar Ch <anilkumar@ti.com>
Subject: [PATCH RESEND 10/10] ARM: dts: AM33XX: Add push-buttons device tree data to am335x-evmsk
Date: Tue, 6 Nov 2012 19:18:38 +0530
Message-ID: <1352209718-5586-11-git-send-email-anilkumar@ti.com>
References: <1352209718-5586-1-git-send-email-anilkumar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1352209718-5586-1-git-send-email-anilkumar@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: tony@atomide.com
Cc: b-cousson@ti.com, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, AnilKumar Ch <anilkumar@ti.com>
List-Id: devicetree@vger.kernel.org

Add gpio based push buttons device tree data to am335x-evmsk device
by adding all the necessary parameters like key-code, gpios and etc.

Signed-off-by: AnilKumar Ch <anilkumar@ti.com>
---
 arch/arm/boot/dts/am335x-evmsk.dts |   31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-evmsk.dts b/arch/arm/boot/dts/am335x-evmsk.dts
index 0f825dd..f5a6162 100644
--- a/arch/arm/boot/dts/am335x-evmsk.dts
+++ b/arch/arm/boot/dts/am335x-evmsk.dts
@@ -139,6 +139,37 @@
 			default-state = "off";
 		};
 	};
+
+	gpio_buttons: gpio_buttons@0 {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		switch@1 {
+			label = "button0";
+			linux,code = <0x100>;
+			gpios = <&gpio3 3 0>;
+		};
+
+		switch@2 {
+			label = "button1";
+			linux,code = <0x101>;
+			gpios = <&gpio3 2 0>;
+		};
+
+		switch@3 {
+			label = "button2";
+			linux,code = <0x102>;
+			gpios = <&gpio1 30 0>;
+			gpio-key,wakeup;
+		};
+
+		switch@4 {
+			label = "button3";
+			linux,code = <0x103>;
+			gpios = <&gpio3 5 0>;
+		};
+	};
 };
 
 /include/ "tps65910.dtsi"
-- 
1.7.9.5

