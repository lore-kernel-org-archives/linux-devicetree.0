Return-Path: <SRS0=sliF=I4=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: phy: Renesas R-Car Gen3 PCIe PHY bindings
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
References: <04384ce6-b696-715d-2072-345654e3fccf@cogentembedded.com>
Message-ID: <9293ae00-8684-962a-346e-13cb12e5cddb@cogentembedded.com>
Date: Sun, 10 Jun 2018 21:22:46 +0300
MIME-Version: 1.0
In-Reply-To: <04384ce6-b696-715d-2072-345654e3fccf@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This PHY is  still  mostly undocumented --  the only documented registers
exist on R-Car V3H (R8A77980) SoC.  Add the corresponding device tree
bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
Changes in version 2:
- split from the big driver/bindings patch;
- got rid of the generic R-Car gen3 "compatible" prop value.

 Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt |   24 +++++++++++
 1 file changed, 24 insertions(+)

Index: linux-phy/Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt
===================================================================
--- /dev/null
+++ linux-phy/Documentation/devicetree/bindings/phy/rcar-gen3-phy-pcie.txt
@@ -0,0 +1,24 @@
+* Renesas R-Car generation 3 PCIe PHY
+
+This file provides information on what the device node for the R-Car
+generation 3 PCIe PHY contains.
+
+Required properties:
+- compatible: "renesas,r8a77980-pcie-phy" if the device is a part of the
+	      R8A77980 SoC.
+- reg: offset and length of the register block.
+- clocks: clock phandle and specifier pair.
+- power-domains: power domain phandle and specifier pair.
+- resets: reset phandle and specifier pair.
+- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
+
+Example (R-Car V3H):
+
+	pcie-phy@e65d0000 {
+		compatible = "renesas,r8a77980-pcie-phy";
+		reg = <0 0xe65d0000 0 0x8000>;
+		#phy-cells = <0>;
+		clocks = <&cpg CPG_MOD 319>;
+		power-domains = <&sysc 32>;
+		resets = <&cpg 319>;
+	};
