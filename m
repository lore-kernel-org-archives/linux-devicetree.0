From: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Subject: [PATCH v4 2/6] dt/bindings: qman: Add phandle to the portals
Date: Wed, 3 Dec 2014 04:02:40 -0600
Message-ID: <1417600964-24647-3-git-send-email-Emilian.Medve@Freescale.com>
References: <1417600964-24647-1-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417600964-24647-1-git-send-email-Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: scottwood-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This supports SoC(s) with multiple QMan instances

Signed-off-by: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/soc/fsl/qman.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/qman.txt b/Documentation/devicetree/bindings/soc/fsl/qman.txt
index 063e3a0..85d6059 100644
--- a/Documentation/devicetree/bindings/soc/fsl/qman.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/qman.txt
@@ -38,6 +38,11 @@ are located at offsets 0xbf8 and 0xbfc
 	Value type:	<prop-encoded-array>
 	Definition:	Standard property. The error interrupt
 
+- fsl,qman-portals
+	Usage:		Required
+	Value type:	<phandle>
+	Definition:	Phandle to this QMan's instance portals
+
 - fsl,liodn
 	Usage:		See pamu.txt
 	Value type:	<prop-encoded-array>
@@ -127,6 +132,10 @@ The example below shows a QMan FQD and a PFDR dynamic allocation memory nodes
 
 The example below shows a (P4080) QMan CCSR-space node
 
+	qportals: qman-portals@ff4200000 {
+		...
+	};
+
 	clockgen: global-utilities@e1000 {
 		...
 		sysclk: sysclk {
@@ -154,6 +163,7 @@ The example below shows a (P4080) QMan CCSR-space node
 		reg = <0x318000 0x1000>;
 		interrupts = <16 2 1 3>
 		fsl,liodn = <0x16>;
+		fsl,qman-portals = <&qportals>;
 		memory-region = <&qman_fqd &qman_pfdr>;
 		clocks = <&platform_pll 1>;
 	};
-- 
2.2.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
