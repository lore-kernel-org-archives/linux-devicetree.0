From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/4] arm64: dts: renesas: r8a7795: add usb3_phy node
Date: Thu,  7 Dec 2017 18:55:39 +0900
Message-ID: <1512640542-10380-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1512640542-10380-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1512640542-10380-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds USB3.0 PHY node for r8a7795.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 6db4f10..9710814 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -184,6 +184,19 @@
 		clock-frequency = <0>;
 	};
 
+	/* External USB clocks - can be overridden by the board */
+	usb3s0_clk: usb3s0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
+	usb_extal_clk: usb_extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
@@ -1643,6 +1656,19 @@
 			iommus = <&ipmmu_hc 2>;
 		};
 
+		usb3_phy0: usb-phy@e65ee000 {
+			compatible = "renesas,r8a7795-usb3-phy",
+				     "renesas,rcar-gen3-usb3-phy";
+			reg = <0 0xe65ee000 0 0x90>;
+			clocks = <&cpg CPG_MOD 328>, <&usb3s0_clk>,
+				 <&usb_extal_clk>;
+			clock-names = "usb3-if", "usb3s_clk", "usb_extal";
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 328>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		xhci0: usb@ee000000 {
 			compatible = "renesas,xhci-r8a7795", "renesas,rcar-gen3-xhci";
 			reg = <0 0xee000000 0 0xc00>;
-- 
1.9.1
