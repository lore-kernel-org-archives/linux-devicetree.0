Return-Path: <SRS0=akoX=SD=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 01/12] dt-bindings: phy: rcar-gen2: Add r8a77470 support
Date: Mon,  1 Apr 2019 13:53:41 +0100
Message-Id: <1554123232-58942-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
References: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add USB PHY support for r8a77470 SoC. Renesas RZ/G1C (R8A77470)
USB PHY is similar to the R-Car Gen2 family, but has the below
feature compared to other RZ/G1 and R-Car Gen2/3 SoCs

It has a shared pll reset for usbphy0/usbphy1 and this register
reside in usbphy0 block.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
  * Incorporated Rob's review comment
    https://patchwork.kernel.org/patch/10655853/
---
 .../devicetree/bindings/phy/rcar-gen2-phy.txt      | 57 ++++++++++++++++++++--
 1 file changed, 53 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
index 4f0879a..ac96d64 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
@@ -7,6 +7,7 @@ Required properties:
 - compatible: "renesas,usb-phy-r8a7743" if the device is a part of R8A7743 SoC.
 	      "renesas,usb-phy-r8a7744" if the device is a part of R8A7744 SoC.
 	      "renesas,usb-phy-r8a7745" if the device is a part of R8A7745 SoC.
+	      "renesas,usb-phy-r8a77470" if the device is a part of R8A77470 SoC.
 	      "renesas,usb-phy-r8a7790" if the device is a part of R8A7790 SoC.
 	      "renesas,usb-phy-r8a7791" if the device is a part of R8A7791 SoC.
 	      "renesas,usb-phy-r8a7794" if the device is a part of R8A7794 SoC.
@@ -30,7 +31,7 @@ channels. These subnodes must contain the following properties:
 - #phy-cells: see phy-bindings.txt in the same directory, must be <1>.
 
 The phandle's argument in the PHY specifier is the USB controller selector for
-the USB channel; see the selector meanings below:
+the USB channel other than r8a77470 SoC; see the selector meanings below:
 
 +-----------+---------------+---------------+
 |\ Selector |               |               |
@@ -41,6 +42,16 @@ the USB channel; see the selector meanings below:
 | 2         | PCI EHCI/OHCI | xHCI          |
 +-----------+---------------+---------------+
 
+For r8a77470 SoC;see the selector meaning below:
+
++-----------+---------------+---------------+
+|\ Selector |               |               |
++ --------- +       0       |       1       |
+| Channel  \|               |               |
++-----------+---------------+---------------+
+| 0         | EHCI/OHCI     | HS-USB        |
++-----------+---------------+---------------+
+
 Example (Lager board):
 
 	usb-phy@e6590100 {
@@ -48,15 +59,53 @@ Example (Lager board):
 		reg = <0 0xe6590100 0 0x100>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&mstp7_clks R8A7790_CLK_HSUSB>;
+		clocks = <&cpg CPG_MOD 704>;
 		clock-names = "usbhs";
+		power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+		resets = <&cpg 704>;
 
-		usb-channel@0 {
+		usb0: usb-channel@0 {
 			reg = <0>;
 			#phy-cells = <1>;
 		};
-		usb-channel@2 {
+		usb2: usb-channel@2 {
 			reg = <2>;
 			#phy-cells = <1>;
 		};
 	};
+
+Example (iWave RZ/G1C sbc):
+
+	usbphy0: usb-phy0@e6590100 {
+		compatible = "renesas,usb-phy-r8a77470",
+			     "renesas,rcar-gen2-usb-phy";
+		reg = <0 0xe6590100 0 0x100>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&cpg CPG_MOD 704>;
+		clock-names = "usbhs";
+		power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+		resets = <&cpg 704>;
+
+		usb0: usb-channel@0 {
+			reg = <0>;
+			#phy-cells = <1>;
+		};
+	};
+
+	usbphy1: usb-phy@e6598100 {
+		compatible = "renesas,usb-phy-r8a77470",
+			     "renesas,rcar-gen2-usb-phy";
+		reg = <0 0xe6598100 0 0x100>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&cpg CPG_MOD 706>;
+		clock-names = "usbhs";
+		power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+		resets = <&cpg 706>;
+
+		usb1: usb-channel@0 {
+			reg = <0>;
+			#phy-cells = <1>;
+		};
+	};
-- 
2.7.4
