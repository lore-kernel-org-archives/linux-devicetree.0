From: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 2/3] Document: fsl,esai: Adjust the document making it read more comfortably.
Date: Tue, 19 Aug 2014 12:38:57 +0800
Message-ID: <1408423138-19880-3-git-send-email-Li.Xiubo@freescale.com>
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
 .../devicetree/bindings/sound/fsl,esai.txt         | 73 ++++++++++++----------
 1 file changed, 39 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,esai.txt b/Documentation/devicetree/bindings/sound/fsl,esai.txt
index aeb8c4a..4dce656 100644
--- a/Documentation/devicetree/bindings/sound/fsl,esai.txt
+++ b/Documentation/devicetree/bindings/sound/fsl,esai.txt
@@ -7,49 +7,54 @@ other DSPs. It has up to six transmitters and four receivers.
 
 Required properties:
 
-  - compatible : Compatible list, must contain "fsl,imx35-esai".
+- compatible:	Compatible list, must contain "fsl,imx35-esai".
 
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
 
-  - clocks: Contains an entry for each entry in clock-names.
+- clocks:	Contains an entry for each entry in clock-names.
 
-  - clock-names : Includes the following entries:
-	"core"		The core clock used to access registers
-	"extal"		The esai baud clock for esai controller used to derive
-			HCK, SCK and FS.
-	"fsys"		The system clock derived from ahb clock used to derive
-			HCK, SCK and FS.
+- clock-names:	Includes the following entries:
+		"core" -- The core clock used to access registers
+		"extal"-- The esai baud clock for esai controller used to
+		derive HCK, SCK and FS.
+		"fsys" -- The system clock derived from ahb clock used to
+		derive HCK, SCK and FS.
 
-  - fsl,fifo-depth: The number of elements in the transmit and receive FIFOs.
-    This number is the maximum allowed value for TFCR[TFWM] or RFCR[RFWM].
+- fsl,fifo-depth:
+		The number of elements in the transmit and receive FIFOs.
+		This number is the maximum allowed value for TFCR[TFWM] or
+		RFCR[RFWM].
 
-  - fsl,esai-synchronous: This is a boolean property. If present, indicating
-    that ESAI would work in the synchronous mode, which means all the settings
-    for Receiving would be duplicated from Transmition related registers.
+- fsl,esai-synchronous:
+		This is a boolean property. If present, indicating that ESAI
+		would work in the synchronous mode, which means all the settings
+		for Receiving would be duplicated from Transmition related
+		registers.
 
-  - big-endian : If this property is absent, the native endian mode will
-    be in use as default, or the big endian mode will be in use for all the
-    device registers.
+- big-endian:
+		If this property is absent, the native endian mode will be in
+		use as default, or the big endian mode will be in use for all the
+		device registers.
 
 Example:
 
-esai: esai@02024000 {
-	compatible = "fsl,imx35-esai";
-	reg = <0x02024000 0x4000>;
-	interrupts = <0 51 0x04>;
-	clocks = <&clks 208>, <&clks 118>, <&clks 208>;
-	clock-names = "core", "extal", "fsys";
-	dmas = <&sdma 23 21 0>, <&sdma 24 21 0>;
-	dma-names = "rx", "tx";
-	fsl,fifo-depth = <128>;
-	fsl,esai-synchronous;
-	big-endian;
-	status = "disabled";
-};
+	esai: esai@02024000 {
+		compatible = "fsl,imx35-esai";
+		reg = <0x02024000 0x4000>;
+		interrupts = <0 51 0x04>;
+		clocks = <&clks 208>, <&clks 118>, <&clks 208>;
+		clock-names = "core", "extal", "fsys";
+		dmas = <&sdma 23 21 0>, <&sdma 24 21 0>;
+		dma-names = "rx", "tx";
+		fsl,fifo-depth = <128>;
+		fsl,esai-synchronous;
+		big-endian;
+		status = "disabled";
+	};
-- 
1.8.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
