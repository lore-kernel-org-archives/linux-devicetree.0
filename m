From: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 1/3] Document: fsl,spdif: Adjust the document making it read more comfortably.
Date: Tue, 19 Aug 2014 12:38:56 +0800
Message-ID: <1408423138-19880-2-git-send-email-Li.Xiubo@freescale.com>
References: <1408423138-19880-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408423138-19880-1-git-send-email-Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/sound/fsl,spdif.txt        | 82 +++++++++++-----------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,spdif.txt b/Documentation/devicetree/bindings/sound/fsl,spdif.txt
index 3e9e82c8..d37bfc2 100644
--- a/Documentation/devicetree/bindings/sound/fsl,spdif.txt
+++ b/Documentation/devicetree/bindings/sound/fsl,spdif.txt
@@ -6,54 +6,54 @@ a fibre cable.
 
 Required properties:
 
-  - compatible : Compatible list, must contain "fsl,imx35-spdif".
+- compatible:	Compatible list, must contain "fsl,imx35-spdif".
 
-  - reg : Offset and length of the register set for the device.
+- reg:		Offset and length of the register set for the device.
 
-  - interrupts : Contains the spdif interrupt.
+- interrupts:	Contains the spdif interrupt.
 
-  - dmas : Generic dma devicetree binding as described in
-  Documentation/devicetree/bindings/dma/dma.txt.
+- dmas:		Generic dma devicetree binding as described in
+		Documentation/devicetree/bindings/dma/dma.txt.
 
-  - dma-names : Two dmas have to be defined, "tx" and "rx".
+- dma-names:	Two dmas have to be defined, "tx" and "rx".
 
-  - clocks : Contains an entry for each entry in clock-names.
+- clocks:	Contains an entry for each entry in clock-names.
 
-  - clock-names : Includes the following entries:
-	"core"		The core clock of spdif controller
-	"rxtx<0-7>"	Clock source list for tx and rx clock.
-			This clock list should be identical to
-			the source list connecting to the spdif
-			clock mux in "SPDIF Transceiver Clock
-			Diagram" of SoC reference manual. It
-			can also be referred to TxClk_Source
-			bit of register SPDIF_STC.
+- clock-names:	Includes the following entries:
+		"core" -- The core clock of spdif controller
+		"rxtx<0-7>" -- Clock source list for tx and rx clock.
+		This clock list should be identical to
+		the source list connecting to the spdif
+		clock mux in "SPDIF Transceiver Clock
+		Diagram" of SoC reference manual. It
+		can also be referred to TxClk_Source
+		bit of register SPDIF_STC.
 
-   - big-endian : If this property is absent, the native endian mode will
-   be in use as default, or the big endian mode will be in use for all the
-   device registers.
+- big-endian:	If this property is absent, the native endian mode will
+		be in use as default, or the big endian mode will be in
+		use for all the device registers.
 
 Example:
 
-spdif: spdif@02004000 {
-	compatible = "fsl,imx35-spdif";
-	reg = <0x02004000 0x4000>;
-	interrupts = <0 52 0x04>;
-	dmas = <&sdma 14 18 0>,
-	       <&sdma 15 18 0>;
-	dma-names = "rx", "tx";
-
-	clocks = <&clks 197>, <&clks 3>,
-	       <&clks 197>, <&clks 107>,
-	       <&clks 0>, <&clks 118>,
-	       <&clks 62>, <&clks 139>,
-	       <&clks 0>;
-	clock-names = "core", "rxtx0",
-		"rxtx1", "rxtx2",
-		"rxtx3", "rxtx4",
-		"rxtx5", "rxtx6",
-		"rxtx7";
-
-	big-endian;
-	status = "okay";
-};
+	spdif: spdif@02004000 {
+		compatible = "fsl,imx35-spdif";
+		reg = <0x02004000 0x4000>;
+		interrupts = <0 52 0x04>;
+		dmas = <&sdma 14 18 0>,
+			<&sdma 15 18 0>;
+		dma-names = "rx", "tx";
+
+		clocks = <&clks 197>, <&clks 3>,
+			<&clks 197>, <&clks 107>,
+			<&clks 0>, <&clks 118>,
+			<&clks 62>, <&clks 139>,
+			<&clks 0>;
+		clock-names = "core", "rxtx0",
+			"rxtx1", "rxtx2",
+			"rxtx3", "rxtx4",
+			"rxtx5", "rxtx6",
+			"rxtx7";
+
+		big-endian;
+		status = "okay";
+	};
-- 
1.8.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
