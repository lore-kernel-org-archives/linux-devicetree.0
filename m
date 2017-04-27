From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v5 06/10] arm: dts: r7s72100: Add pin controller node
Date: Thu, 27 Apr 2017 10:19:50 +0200
Message-ID: <1493281194-5200-7-git-send-email-jacopo+renesas@jmondi.org>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add pin controller node with 12 gpio controller sub-nodes to
r7s72100 dtsi.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r7s72100.dtsi | 78 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index b8aa256..9342ff4 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -180,6 +180,84 @@
 		};
 	};
 
+	pinctrl: pin-controller@fcfe3000 {
+		compatible = "renesas,r7s72100-ports";
+
+		reg = <0xfcfe3000 0x4230>;
+
+		port0: gpio-0 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 6>;
+		};
+
+		port1: gpio-1 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 16 16>;
+		};
+
+		port2: gpio-2 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 32 16>;
+		};
+
+		port3: gpio-3 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 48 16>;
+		};
+
+		port4: gpio-4 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 64 16>;
+		};
+
+		port5: gpio-5 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 80 11>;
+		};
+
+		port6: gpio-6 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 96 16>;
+		};
+
+		port7: gpio-7 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 112 16>;
+		};
+
+		port8: gpio-8 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 128 16>;
+		};
+
+		port9: gpio-9 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 144 8>;
+		};
+
+		port10: gpio-10 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 160 16>;
+		};
+
+		port11: gpio-11 {
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 176 16>;
+		};
+	};
+
 	scif0: serial@e8007000 {
 		compatible = "renesas,scif-r7s72100", "renesas,scif";
 		reg = <0xe8007000 64>;
-- 
2.7.4

