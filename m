From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 3/4] arm64: dts: m3ulcb: enable EthernetAVB
Date: Thu, 26 Jan 2017 17:54:29 +0300
Message-ID: <1485442469-18378-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1485442422-18259-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1485442422-18259-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>

This supports Ethernet AVB on M3ULCB board

Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
index 38bde9d..c7f40f8 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
@@ -20,6 +20,7 @@
 
 	aliases {
 		serial0 = &scif2;
+		ethernet0 = &avb;
 	};
 
 	chosen {
@@ -115,6 +116,11 @@
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
 
+	avb_pins: avb {
+		groups = "avb_mdc";
+		function = "avb";
+	};
+
 	scif2_pins: scif2 {
 		groups = "scif2_data_a";
 		function = "scif2";
@@ -155,6 +161,32 @@
 	};
 };
 
+&avb {
+	pinctrl-0 = <&avb_pins>;
+	pinctrl-names = "default";
+	renesas,no-ether-link;
+	phy-handle = <&phy0>;
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		rxc-skew-ps = <900>;
+		rxdv-skew-ps = <0>;
+		rxd0-skew-ps = <0>;
+		rxd1-skew-ps = <0>;
+		rxd2-skew-ps = <0>;
+		rxd3-skew-ps = <0>;
+		txc-skew-ps = <900>;
+		txen-skew-ps = <0>;
+		txd0-skew-ps = <0>;
+		txd1-skew-ps = <0>;
+		txd2-skew-ps = <0>;
+		txd3-skew-ps = <0>;
+		reg = <0>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &sdhi0 {
 	pinctrl-0 = <&sdhi0_pins>;
 	pinctrl-1 = <&sdhi0_pins_uhs>;
-- 
1.9.1
