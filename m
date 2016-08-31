From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v3 07/12] arm64: dts: h3ulcb: enable I2C2
Date: Wed, 31 Aug 2016 13:03:29 +0300
Message-ID: <1472637809-14858-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

This supports I2C2 bus on H3ULCB board

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
Changes in version 3:
- initially added

 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index 5be0cf6..3682bcc 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -88,6 +88,11 @@
 		function = "scif_clk";
 	};
 
+	i2c2_pins: i2c2 {
+		groups = "i2c2_a";
+		function = "i2c2";
+	};
+
 	avb_pins: avb {
 		groups = "avb_mdc";
 		function = "avb";
@@ -118,6 +123,13 @@
 	status = "okay";
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_pins_3v3>;
 	pinctrl-1 = <&sdhi0_pins_1v8>;
-- 
1.9.1
