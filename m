Return-Path: <SRS0=akoX=SD=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 09/12] ARM: dts: r8a77470: Add USB2.0 Host (EHCI/OHCI) device
Date: Mon,  1 Apr 2019 13:53:49 +0100
Message-Id: <1554123232-58942-10-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
References: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Define the r8a77470 generic part of the USB2.0 Host Controller device
nodes (ehci[01]/ohci[01]).

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
 * New patch
---
 arch/arm/boot/dts/r8a77470.dtsi | 50 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index d6438fb..c8a4651 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -624,6 +624,56 @@
 			status = "disabled";
 		};
 
+		ohci0: usb@ee080000 {
+			compatible = "generic-ohci";
+			reg = <0 0xee080000 0 0x100>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 703>;
+			phys = <&usb0 0>;
+			phy-names = "usb";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 703>;
+			status = "disabled";
+		};
+
+		ohci1: usb@ee0c0000 {
+			compatible = "generic-ohci";
+			reg = <0 0xee0c0000 0 0x100>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 705>;
+			phys = <&usb0 1>, <&usb1 0>;
+			phy-names = "usb";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 705>;
+			status = "disabled";
+		};
+
+		ehci0: usb@ee080100 {
+			compatible = "renesas,ehci-r8a77470";
+			reg = <0 0xee080100 0 0x800>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 703>;
+			phys = <&usb0 0>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 703>;
+			status = "disabled";
+		};
+
+		ehci1: usb@ee0c0100 {
+			compatible = "renesas,ehci-r8a77470";
+			reg = <0 0xee0c0100 0 0x800>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 705>;
+			phys = <&usb0 1>, <&usb1 0>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 705>;
+			status = "disabled";
+		};
+
 		sdhi0: sd@ee100000 {
 			compatible = "renesas,sdhi-r8a77470",
 				     "renesas,rcar-gen2-sdhi";
-- 
2.7.4
