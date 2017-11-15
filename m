From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dt-bindings: rtc: imxdi: Improve the bindings text
Date: Wed, 15 Nov 2017 10:59:53 -0200
Message-ID: <1510750793-25564-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Improve the bindings text by doing the following changes:

- Remove the i.MX53 reference, as the RTC on i.MX53 is a different hardware
- Add 'clocks' to the list of required properties
- Explain that the optional security violation irq is the second entry
- Use the real unit address and irq numbers for i.MX25

Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
 Documentation/devicetree/bindings/rtc/imxdi-rtc.txt | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/imxdi-rtc.txt b/Documentation/devicetree/bindings/rtc/imxdi-rtc.txt
index 323cf26..b8f3050 100644
--- a/Documentation/devicetree/bindings/rtc/imxdi-rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/imxdi-rtc.txt
@@ -1,20 +1,20 @@
 * i.MX25 Real Time Clock controller
 
-This binding supports the following chips: i.MX25, i.MX53
-
 Required properties:
 - compatible: should be: "fsl,imx25-rtc"
 - reg: physical base address of the controller and length of memory mapped
   region.
+- clocks: should contain the phandle for the rtc clock
 - interrupts: rtc alarm interrupt
 
 Optional properties:
-- interrupts: dryice security violation interrupt
+- interrupts: dryice security violation interrupt (second entry)
 
 Example:
 
-rtc@80056000 {
-	compatible = "fsl,imx53-rtc", "fsl,imx25-rtc";
-	reg = <0x80056000 2000>;
-	interrupts = <29 56>;
+rtc@53ffc000 {
+	compatible = "fsl,imx25-rtc";
+	reg = <0x53ffc000 0x4000>;
+	clocks = <&clks 81>;
+	interrupts = <25 56>;
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
