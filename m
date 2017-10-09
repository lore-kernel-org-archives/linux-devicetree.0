From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH  1/4] ARM: dts: r8a7743: Add HS-USB device node
Date: Mon,  9 Oct 2017 14:21:18 +0100
Message-ID: <1507555281-57845-2-git-send-email-biju.das@bp.renesas.com>
References: <1507555281-57845-1-git-send-email-biju.das@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507555281-57845-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Define the R8A7743 generic part of the HS-USB device node. It is up to the
board file to enable the device.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
This patch has documentation dependency on below patch

* [v2] usb: renesas_usbhs: Add compatible string for r8a7743/5
https://patchwork.kernel.org/patch/9990063/

 arch/arm/boot/dts/r8a7743.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index d541fd9..080eff9 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -945,6 +945,20 @@
 			status = "disabled";
 		};
 
+		hsusb: usb@e6590000 {
+			compatible = "renesas,usbhs-r8a7743",
+				     "renesas,rcar-gen2-usbhs";
+			reg = <0 0xe6590000 0 0x100>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 704>;
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			resets = <&cpg 704>;
+			renesas,buswait = <4>;
+			phys = <&usb0 1>;
+			phy-names = "usb";
+			status = "disabled";
+		};
+
 		usbphy: usb-phy@e6590100 {
 			compatible = "renesas,usb-phy-r8a7743",
 				     "renesas,rcar-gen2-usb-phy";
-- 
1.9.1
