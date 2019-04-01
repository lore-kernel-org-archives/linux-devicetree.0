Return-Path: <SRS0=akoX=SD=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 11/12] ARM: dts: r8a77470: Add HSUSB device nodes
Date: Mon,  1 Apr 2019 13:53:51 +0100
Message-Id: <1554123232-58942-12-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
References: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Define the r8a77470 generic part of the HSUSB0/1 device nodes.

Currently the renesas_usbhs driver doesn't handle multiple phys and we
don't have a proper hardware to validate such driver changes.

So for hsusb1 it is assumed that usbphy0 will be enabled by either
channel0 host or device.

In future, if any boards support hsusb1, we will need to add multiple phy
support in the renesas_usbhs driver and override the board dts to enable
the same. 

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
 * New patch
---
 arch/arm/boot/dts/r8a77470.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index c8a4651..d1037d7 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -325,6 +325,23 @@
 			status = "disabled";
 		};
 
+		hsusb0: hsusb@e6590000 {
+			compatible = "renesas,usbhs-r8a77470",
+				     "renesas,rcar-gen2-usbhs";
+			reg = <0 0xe6590000 0 0x100>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 704>;
+			dmas = <&usb_dmac00 0>, <&usb_dmac00 1>,
+			       <&usb_dmac10 0>, <&usb_dmac10 1>;
+			dma-names = "ch0", "ch1", "ch2", "ch3";
+			renesas,buswait = <4>;
+			phys = <&usb0 1>;
+			phy-names = "usb";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 704>;
+			status = "disabled";
+		};
+
 		usbphy0: usb-phy@e6590100 {
 			compatible = "renesas,usb-phy-r8a77470",
 				     "renesas,rcar-gen2-usb-phy";
@@ -343,6 +360,24 @@
 			};
 		};
 
+		hsusb1: hsusb@e6598000 {
+			compatible = "renesas,usbhs-r8a77470",
+				     "renesas,rcar-gen2-usbhs";
+			reg = <0 0xe6598000 0 0x100>;
+			interrupts = <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 706>;
+			dmas = <&usb_dmac01 0>, <&usb_dmac01 1>,
+			       <&usb_dmac11 0>, <&usb_dmac11 1>;
+			dma-names = "ch0", "ch1", "ch2", "ch3";
+			renesas,buswait = <4>;
+			/* We need to turn on usbphy0 to make usbphy1 to work */
+			phys = <&usb1 1>;
+			phy-names = "usb";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 706>;
+			status = "disabled";
+		};
+
 		usbphy1: usb-phy@e6598100 {
 			compatible = "renesas,usb-phy-r8a77470",
 				     "renesas,rcar-gen2-usb-phy";
-- 
2.7.4
