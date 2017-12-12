From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/5] ARM: dts: r8a7743: Add audio clocks
Date: Tue, 12 Dec 2017 18:25:08 +0000
Message-ID: <1513103111-45830-3-git-send-email-biju.das@bp.renesas.com>
References: <1513103111-45830-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1513103111-45830-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Describe the external audio clocks required by the sound driver.
Boards that provide audio clocks need to override the clock frequencies.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7743.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index c09c667..2f0ec9d 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -1238,6 +1238,29 @@
 		clock-frequency = <0>;
 	};
 
+	/*
+	 * The external audio clocks are configured as 0 Hz fixed frequency
+	 * clocks by default.
+	 * Boards that provide audio clocks should override them.
+	 */
+	audio_clk_a: audio_clk_a {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	audio_clk_b: audio_clk_b {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	audio_clk_c: audio_clk_c {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
 	/* External USB clock - can be overridden by the board */
 	usb_extal_clk: usb_extal {
 		compatible = "fixed-clock";
-- 
1.9.1
