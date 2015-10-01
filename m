From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 11/16] ARM: dts: lpc4357-ea4357: add spifi and flash device
Date: Thu,  1 Oct 2015 22:54:48 +0200
Message-ID: <1443732893-17145-12-git-send-email-manabian@gmail.com>
References: <1443732893-17145-1-git-send-email-manabian@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443732893-17145-1-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The EA4357 dev kit has a Spansion S25FL016K SPI-NOR Flash connected
to the SPIFI perherial.

Signed-off-by: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/lpc4357-ea4357-devkit.dts | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts b/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
index 5f7bdad80963..9fcc0f357c2d 100644
--- a/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
+++ b/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
@@ -363,6 +363,32 @@
 		};
 	};
 
+	spifi_pins: spifi-pins {
+		spifi_clk_cfg {
+			pins = "p3_3";
+			function = "spifi";
+			slew-rate = <1>;
+			bias-disable;
+			input-enable;
+			input-schmitt-disable;
+		};
+
+		spifi_mosi_miso_sio2_3_cfg {
+			pins = "p3_7", "p3_6", "p3_5", "p3_4";
+			function = "spifi";
+			slew-rate = <0>;
+			bias-disable;
+			input-enable;
+			input-schmitt-disable;
+		};
+
+		spifi_cs_cfg {
+			pins = "p3_8";
+			function = "spifi";
+			bias-disable;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		uart0_rx_cfg {
 			pins = "pf_11";
@@ -489,6 +515,26 @@
 	pinctrl-0 = <&sdmmc_pins>;
 };
 
+&spifi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&spifi_pins>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		spi-cpol;
+		spi-cpha;
+		spi-rx-bus-width = <4>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "data";
+			reg = <0 0x200000>;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
1.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
