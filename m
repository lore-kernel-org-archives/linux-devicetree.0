From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 5/7] arm: dts: genmai: Add SCIF2 pin group
Date: Mon, 20 Feb 2017 18:13:06 +0100
Message-ID: <1487610788-6939-6-git-send-email-jacopo+renesas@jmondi.org>
References: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1487610788-6939-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add pin configuration subnode for SCIF2 serial debug interface.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index 118a8e2..f7be440 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -36,6 +36,15 @@
 	};
 };
 
+&pinctrl {
+
+	scif2_pins: serial2 {
+		/* P3_0 as TxD2; P3_2 as RxD2 */
+		renesas,pins = <PIN(3, 0) 6>,
+			       <PIN(3, 2) (4 | INPUT_EN)>;
+	};
+};
+
 &extal_clk {
 	clock-frequency = <13330000>;
 };
@@ -60,6 +69,9 @@
 };
 
 &scif2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scif2_pins>;
+
 	status = "okay";
 };
 
-- 
2.7.4
