Return-Path: <SRS0=qLWK=TP=renesas.com=prvs=4038260dfd=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v4 12/13] ARM: dts: r7s9210: Add USB Device support
Date: Wed, 15 May 2019 10:20:47 -0500
Message-ID: <20190515152048.42363-13-chris.brandt@renesas.com>
In-Reply-To: <20190515152048.42363-1-chris.brandt@renesas.com>
References: <20190515152048.42363-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris
List-ID: <devicetree@vger.kernel.org>

Add USB Device support for RZ/A2.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
 * added reviewed-by
v2:
 * changed to generic name usb@xxx
 * Add space between compatible strings
---
 arch/arm/boot/dts/r7s9210.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210.dtsi b/arch/arm/boot/dts/r7s9210.dtsi
index 066e6fed11aa..3d0bbc1f4543 100644
--- a/arch/arm/boot/dts/r7s9210.dtsi
+++ b/arch/arm/boot/dts/r7s9210.dtsi
@@ -362,6 +362,18 @@
 			status = "disabled";
 		};
 
+		usbhs0: usb@e8219000 {
+			compatible = "renesas,usbhs-r7s9210", "renesas,rza2-usbhs";
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
 		ohci1: usb@e821a000 {
 			compatible = "generic-ohci";
 			reg = <0xe821a000 0x100>;
@@ -395,6 +407,18 @@
 			status = "disabled";
 		};
 
+		usbhs1: usb@e821b000 {
+			compatible = "renesas,usbhs-r7s9210", "renesas,rza2-usbhs";
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
