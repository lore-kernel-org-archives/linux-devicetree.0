Return-Path: <SRS0=Wrd/=O3=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a774a1: Fix hsusb reg size
Date: Tue, 18 Dec 2018 12:02:14 +0000
Message-Id: <1545134534-22392-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

HS-USB has registers outside the currently specified memory area,
therefore change the definition accordingly.

Fixes: ed898d4fc19d ("arm64: dts: renesas: r8a774a1: Add USB-DMAC and
HSUSB device nodes")
Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
Thank you Simon for spotting this

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 20745a8..46a8fd2 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -599,7 +599,7 @@
 		hsusb: usb@e6590000 {
 			compatible = "renesas,usbhs-r8a774a1",
 				     "renesas,rcar-gen3-usbhs";
-			reg = <0 0xe6590000 0 0x100>;
+			reg = <0 0xe6590000 0 0x200>;
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 704>;
 			dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
-- 
2.7.4
