From: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 3/3] Document: fsl-sai: Adjust the document making it read more comfortably.
Date: Tue, 19 Aug 2014 12:38:58 +0800
Message-ID: <1408423138-19880-4-git-send-email-Li.Xiubo@freescale.com>
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
 .../devicetree/bindings/sound/fsl-sai.txt          | 54 ++++++++++++----------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
index e25ef38..cd2930e 100644
--- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
@@ -7,30 +7,34 @@ codec/DSP interfaces.
 
 
 Required properties:
-- compatible: Compatible list, contains "fsl,vf610-sai" or "fsl,imx6sx-sai".
-- reg: Offset and length of the register set for the device.
-- clocks: Must contain an entry for each entry in clock-names.
+- compatible:	Compatible list, contains "fsl,vf610-sai" or "fsl,imx6sx-sai".
+- reg: 		Offset and length of the register set for the device.
+- clocks: 	Must contain an entry for each entry in clock-names.
 - clock-names : Must include the "bus" for register access and "mclk1" "mclk2"
-  "mclk3" for bit clock and frame clock providing.
-- dmas : Generic dma devicetree binding as described in
-  Documentation/devicetree/bindings/dma/dma.txt.
-- dma-names : Two dmas have to be defined, "tx" and "rx".
-- pinctrl-names: Must contain a "default" entry.
-- pinctrl-NNN: One property must exist for each entry in pinctrl-names.
-  See ../pinctrl/pinctrl-bindings.txt for details of the property values.
-- big-endian: Boolean property, required if all the SAI device registers
-  are big-endian rather than little-endian.
-- msb-first: Configures whether the LSB or the MSB is transmitted first for
-  the fifo data. If this property is absent, the LSB is transmitted first as
-  default, or the MSB is transmitted first.
-- fsl,sai-synchronous-rx: This is a boolean property. If present, indicating
-  that SAI will work in the synchronous mode (sync Tx with Rx) which means
-  both the transimitter and receiver will send and receive data by following
-  receiver's bit clocks and frame sync clocks.
-- fsl,sai-asynchronous: This is a boolean property. If present, indicating
-  that SAI will work in the asynchronous mode, which means both transimitter
-  and receiver will send and receive data by following their own bit clocks
-  and frame sync clocks separately.
+		"mclk3" for bit clock and frame clock providing.
+- dmas : 	Generic dma devicetree binding as described in
+		Documentation/devicetree/bindings/dma/dma.txt.
+- dma-names :	Two dmas have to be defined, "tx" and "rx".
+- pinctrl-names:Must contain a "default" entry.
+- pinctrl-NNN: 	One property must exist for each entry in pinctrl-names.
+		See ../pinctrl/pinctrl-bindings.txt for details of the property
+		avalues.
+- big-endian: 	Boolean property, required if all the SAI device registers
+		are big-endian rather than little-endian.
+- msb-first: 	Configures whether the LSB or the MSB is transmitted first for
+		the fifo data. If this property is absent, the LSB is transmitted
+		first as default, or the MSB is transmitted first.
+- fsl,sai-synchronous-rx:
+		This is a boolean property. If present, indicating
+		that SAI will work in the synchronous mode (sync Tx with Rx)
+		which means both the transimitter and receiver will send and
+		receive data by following receiver's bit clocks and frame sync
+		clocks.
+- fsl,sai-asynchronous:
+		This is a boolean property. If present, indicating that SAI will
+		work in the asynchronous mode, which means both transimitter and
+		receiver will send and receive data by following their own bit
+		clocks and frame sync clocks separately.
 
 Note:
 - If both fsl,sai-asynchronous and fsl,sai-synchronous-rx are absent, the
@@ -40,7 +44,7 @@ Note:
 - fsl,sai-asynchronous and fsl,sai-synchronous-rx are exclusive.
 
 Example:
-sai2: sai@40031000 {
+	sai2: sai@40031000 {
 	      compatible = "fsl,vf610-sai";
 	      reg = <0x40031000 0x1000>;
 	      pinctrl-names = "default";
@@ -54,4 +58,4 @@ sai2: sai@40031000 {
 		   <&edma0 0 VF610_EDMA_MUXID0_SAI2_RX>;
 	      big-endian;
 	      msb-first;
-};
+	};
-- 
1.8.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
