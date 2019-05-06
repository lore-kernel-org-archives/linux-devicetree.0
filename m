Return-Path: <SRS0=WgTi=TG=renesas.com=prvs=40290ccc1f=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 09/10] ARM: dts: r7s9210: Add USB Device support
Date: Mon, 6 May 2019 18:46:30 -0500
Message-ID: <20190506234631.113226-10-chris.brandt@renesas.com>
In-Reply-To: <20190506234631.113226-1-chris.brandt@renesas.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add USB Device support for RZ/A2.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s9210.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
index 1a992e6197c3..67ac746142d0 100644
--- a/arch/arm/boot/dts/r7s9210.dtsi
+++ b/arch/arm/boot/dts/r7s9210.dtsi
@@ -354,6 +354,18 @@
 			status = "disabled";
 		};
 
+		usbhs0: usbhs@e8219000 {
+			compatible = "renesas,usbhs-r7s9210","renesas,rza2-usbhs";
+			reg = <0xe8219000 0x724>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 61>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy0>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		ohci1: usbhcd@e821a000 {
 			compatible = "generic-ohci";
 			reg = <0xe821a000 0x100>;
@@ -386,6 +398,18 @@
 			status = "disabled";
 		};
 
+		usbhs1: usbhs@e821b000 {
+			compatible = "renesas,usbhs-r7s9210","renesas,rza2-usbhs";
+			reg = <0xe821b000 0x724>;
+			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 60>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		sdhi0: sd@e8228000 {
 			compatible = "renesas,sdhi-r7s9210";
 			reg = <0xe8228000 0x8c0>;
-- 
2.16.1
