Return-Path: <SRS0=SDjf=NF=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 3/7] ARM: dts: r8a77470: Add USB PHY DT support
Date: Thu, 25 Oct 2018 14:56:55 +0100
Message-Id: <1540475819-47950-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
References: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Define the r8a77470 generic part of the USB PHY device node.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
This patch is tested against renesas-devel
---
 arch/arm/boot/dts/r8a77470.dtsi | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 6ac7f46..7d20c3b 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -315,6 +315,44 @@
 			status = "disabled";
 		};
 
+		usbphy0: usb-phy@e6590100 {
+			compatible = "renesas,usb-phy-r8a77470",
+				     "renesas,rcar-gen2-usb-phy";
+			reg = <0 0xe6590100 0 0x100>,
+				<0 0xee080200 0 0x118>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
+			clock-names = "usbhs", "usb20_host";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 704>, <&cpg 703>;
+			status = "disabled";
+
+			usb0: usb-channel@0 {
+				reg = <0>;
+				#phy-cells = <1>;
+			};
+		};
+
+		usbphy1: usb-phy@e6598100 {
+			compatible = "renesas,usb-phy-r8a77470",
+				     "renesas,rcar-gen2-usb-phy";
+			reg = <0 0xe6598100 0 0x100>,
+			      <0 0xee0c0200 0 0x118>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&cpg CPG_MOD 706>, <&cpg CPG_MOD 705>;
+			clock-names = "usbhs", "usb20_host";
+			status = "disabled";
+			resets = <&cpg 706>, <&cpg 705>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+
+			usb1: usb-channel@0 {
+				reg = <0>;
+				#phy-cells = <1>;
+			};
+		};
+
 		dmac0: dma-controller@e6700000 {
 			compatible = "renesas,dmac-r8a77470",
 				     "renesas,rcar-dmac";
-- 
2.7.4
