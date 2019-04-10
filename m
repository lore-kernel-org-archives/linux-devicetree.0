Return-Path: <SRS0=uE6T=SM=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH V5 10/13] ARM: dts: r8a77470: Add USB2.0 Host (EHCI/OHCI) device
Date: Wed, 10 Apr 2019 15:48:47 +0100
Message-Id: <1554907730-14792-11-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
References: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Define the r8a77470 generic part of the USB2.0 Host Controller device
nodes (ehci[01]/ohci[01]).

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
V4-->V5
 * No change
V3-->V4
 * Added missing usb2_phy1 in ohci1 node.
V2-->V3
 * Updated phys property on host nodes. using generic-ehci compatible for ehci nodes.
V1-->V2
 * New patch
---
 arch/arm/boot/dts/r8a77470.dtsi | 50 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index dcd2975..e7a2234 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -624,6 +624,31 @@
 			status = "disabled";
 		};
 
+		ohci0: usb@ee080000 {
+			compatible = "generic-ohci";
+			reg = <0 0xee080000 0 0x100>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 703>;
+			phys = <&usb0 0>, <&usb2_phy0>;
+			phy-names = "usb";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 703>;
+			status = "disabled";
+		};
+
+		ehci0: usb@ee080100 {
+			compatible = "generic-ehci";
+			reg = <0 0xee080100 0 0x100>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 703>;
+			phys = <&usb0 0>, <&usb2_phy0>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 703>;
+			status = "disabled";
+		};
+
 		usb2_phy0: usb-phy@ee080200 {
 			compatible = "renesas,usb2-phy-r8a77470";
 			reg = <0 0xee080200 0 0x700>;
@@ -634,6 +659,31 @@
 			status = "disabled";
 		};
 
+		ohci1: usb@ee0c0000 {
+			compatible = "generic-ohci";
+			reg = <0 0xee0c0000 0 0x100>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 705>;
+			phys = <&usb0 1>, <&usb2_phy1>, <&usb1 0>;
+			phy-names = "usb";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 705>;
+			status = "disabled";
+		};
+
+		ehci1: usb@ee0c0100 {
+			compatible = "generic-ehci";
+			reg = <0 0xee0c0100 0 0x100>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 705>;
+			phys = <&usb0 1>, <&usb2_phy1>, <&usb1 0>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 705>;
+			status = "disabled";
+		};
+
 		usb2_phy1: usb-phy@ee0c0200 {
 			compatible = "renesas,usb2-phy-r8a77470";
 			reg = <0 0xee0c0200 0 0x700>;
-- 
2.7.4
