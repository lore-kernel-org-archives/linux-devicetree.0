From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 08/18] arm64: dts: ulcb-kf: enable CAN0/1
Date: Thu,  7 Sep 2017 01:36:08 +0300
Message-ID: <1504737368-23152-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

This supports CAN0/1 on ULCB Kingfisher board

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 2449915..ca8de1a 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -16,6 +16,22 @@
 	};
 };
 
+&can0 {
+	pinctrl-0 = <&can0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	renesas,can-clock-select = <0x0>;
+};
+
+&can1 {
+	pinctrl-0 = <&can1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	renesas,can-clock-select = <0x0>;
+};
+
 &hscif0 {
 	pinctrl-0 = <&hscif0_pins>;
 	pinctrl-names = "default";
@@ -25,6 +41,16 @@
 };
 
 &pfc {
+	can0_pins: can0 {
+		groups = "can0_data_a";
+		function = "can0";
+	};
+
+	can1_pins: can1 {
+		groups = "can1_data";
+		function = "can1";
+	};
+
 	hscif0_pins: hscif0 {
 		groups = "hscif0_data", "hscif0_ctrl";
 		function = "hscif0";
-- 
1.9.1
