From: Sven Van Asbroeck <thesven73@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: bus: imx-weim: document multiple address ranges per child node
Date: Thu,  6 Dec 2018 14:26:32 -0500
Message-ID: <20181206192633.25319-3-TheSven73@googlemail.com>
References: <20181206192633.25319-1-TheSven73@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181206192633.25319-1-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: TheSven73@googlemail.com, Shawn Guo <shawnguo@kernel.org>, Kees Cook <keescook@chromium.org>, Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The imx-weim driver was patched to allow correct WEIM configuration
when multiple address ranges are used in a child node.
Update the dt-bindings to reflect this.

Signed-off-by: Sven Van Asbroeck <TheSven73@googlemail.com>
---
 .../devicetree/bindings/bus/imx-weim.txt      | 32 +++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/imx-weim.txt b/Documentation/devicetree/bindings/bus/imx-weim.txt
index 683eaf3aed79..dda7d6d66479 100644
--- a/Documentation/devicetree/bindings/bus/imx-weim.txt
+++ b/Documentation/devicetree/bindings/bus/imx-weim.txt
@@ -47,9 +47,9 @@ Optional properties:
 Timing property for child nodes. It is mandatory, not optional.
 
  - fsl,weim-cs-timing:	The timing array, contains timing values for the
-			child node. We can get the CS index from the child
-			node's "reg" property. The number of registers depends
-			on the selected chip.
+			child node. We get the CS indexes from the address
+			ranges in the child node's "reg" property.
+			The number of registers depends on the selected chip:
 			For i.MX1, i.MX21 ("fsl,imx1-weim") there are two
 			registers: CSxU, CSxL.
 			For i.MX25, i.MX27, i.MX31 and i.MX35 ("fsl,imx27-weim")
@@ -80,3 +80,29 @@ Example for an imx6q-sabreauto board, the NOR flash connected to the WEIM:
 					0x0000c000 0x1404a38e 0x00000000>;
 		};
 	};
+
+Example for an imx6q-based board, a multi-chipselect device connected to WEIM:
+
+In this case, both chip select 0 and 1 will be configured with the same timing
+array values.
+
+	weim: weim@21b8000 {
+		compatible = "fsl,imx6q-weim";
+		reg = <0x021b8000 0x4000>;
+		clocks = <&clks 196>;
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0 0x08000000 0x02000000
+			  1 0 0x0a000000 0x02000000
+			  2 0 0x0c000000 0x02000000
+			  3 0 0x0e000000 0x02000000>;
+		fsl,weim-cs-gpr = <&gpr>;
+
+		acme@0 {
+			compatible = "acme,whatever";
+			reg = <0 0 0x100>, <0 0x400000 0x800>,
+				<1 0x400000 0x800>;
+			fsl,weim-cs-timing = <0x024400b1 0x00001010 0x20081100
+				0x00000000 0xa0000240 0x00000000>;
+		};
+	};
-- 
2.17.1
