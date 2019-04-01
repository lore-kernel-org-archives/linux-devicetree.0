Return-Path: <SRS0=akoX=SD=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 03/12] dt-bindings: usb: ehci-r8a77470 devicetree binding document
Date: Mon,  1 Apr 2019 13:53:43 +0100
Message-Id: <1554123232-58942-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
References: <1554123232-58942-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add device tree binding document for Renesas r8a77470(a.k.a RZ/G1C)
on-chip EHCI controller driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
  * New patch
---
 .../devicetree/bindings/usb/ehci-r8a77470.txt      | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ehci-r8a77470.txt

diff --git a/Documentation/devicetree/bindings/usb/ehci-r8a77470.txt b/Documentation/devicetree/bindings/usb/ehci-r8a77470.txt
new file mode 100644
index 0000000..4646adcf
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ehci-r8a77470.txt
@@ -0,0 +1,35 @@
+Renesas R8A77470(RZ/G1C) USB EHCI controller
+
+Required properties:
+ - compatible		: must be "renesas,r8a77470"
+ - reg			: physical base addresses of the controller and length
+			  of memory mapped region
+ - interrupts		: one EHCI interrupt should be described here
+ - clocks		: a list of phandle + clock specifier pairs.
+ - phys			: see usb-hcd.txt in the current directory
+ - resets		: phandle + reset specifier pair
+
+Additionally the properties from usb-hcd.txt (in the current directory) are
+supported.
+
+Example:
+
+	ehci0: usb@ee080100 {
+		compatible = "renesas,ehci-r8a77470";
+		reg = <0 0xee080100 0 0x800>;
+		interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD 703>;
+		phys = <&usb0 0>;
+		phy-names = "usb";
+		resets = <&cpg 703>;
+	};
+
+	ehci1: usb@ee0c0100 {
+		compatible = "renesas,ehci-r8a77470";
+		reg = <0 0xee0c0100 0 0x800>;
+		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD 705>;
+		phys = <&usb0 1>, <&usb1 0>;
+		phy-names = "usb";
+		resets = <&cpg 705>;
+	};
-- 
2.7.4
