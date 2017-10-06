From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 1/3] arm64: dts: r8a7796: Add INTC-EX device node
Date: Fri,  6 Oct 2017 14:05:51 +0200
Message-ID: <1507291553-24396-2-git-send-email-geert+renesas@glider.be>
References: <1507291553-24396-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507291553-24396-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a device node for the Interrupt Controller for External Devices
(INTC-EX) on R-Car M3-W, which serves external IRQ pins IRQ[0-5].

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
Tested on Salvator-X by:
  1) Enabling pinctrl and pull-up for IRQ1/GP2_01 in
     salvator-common.dtsi:

	@@ -376,7 +376,7 @@
	 };

	 &pfc {
	-	pinctrl-0 = <&scif_clk_pins>;
	+	pinctrl-0 = <&scif_clk_pins &irq1_pins &keyboard_pins>;
		pinctrl-names = "default";

		avb_pins: avb {
	@@ -407,6 +407,16 @@
			function = "i2c2";
		};

	+	irq1_pins: irq1 {
	+		groups = "intc_ex_irq1";
	+		function = "intc_ex";
	+	};
	+
	+	keyboard_pins: keyboard {
	+		pins = "GP_2_1";
	+		bias-pull-up;
	+	};
	+
		pwm1_pins: pwm1 {
			groups = "pwm1_a";
			function = "pwm1";

  2) Triggering IRQ1 by tying EXIO-D pin 50 to GND,
  3) Verifying that the IRQC_MONITOR register contents change due to
     triggering.
---
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index d9c928f9d224015d..afee3360cb4f0f56 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -725,6 +725,22 @@
 			#power-domain-cells = <1>;
 		};
 
+		intc_ex: interrupt-controller@e61c0000 {
+			compatible = "renesas,intc-ex-r8a7796", "renesas,irqc";
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			reg = <0 0xe61c0000 0 0x200>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 407>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 407>;
+		};
+
 		i2c_dvfs: i2c@e60b0000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
