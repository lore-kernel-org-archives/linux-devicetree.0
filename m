From: <linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Subject: [PATCH] Documentation: dt: rtc-imxdi: imx53-rtc is not compatible
Date: Thu, 16 Nov 2017 10:34:25 +0100
Message-ID: <20171116093425.32145-1-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Juergen Borleis <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Noel Vellemans <Noel.Vellemans-8UENEgx6w+makBO8gow8eQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>

rtc-imxdi driver is not compatible with imx53-rtc like the example
suggested.
Only the raw timestamp register offsets match by accident, which has the
effect, that during startup/shutdown system clock syncronization with
rtc seems to work for imx53, too.
However hwclock and rtctest, will not work as expected on imx53.
To avoid future reverts like [1], we should adjust the documentation.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2017-November/542312.html

Signed-off-by: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>

---

To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM)
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list)
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: Juergen Borleis <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Noel Vellemans <Noel.Vellemans-8UENEgx6w+makBO8gow8eQ@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/rtc/imxdi-rtc.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/imxdi-rtc.txt b/Documentation/devicetree/bindings/rtc/imxdi-rtc.txt
index 323cf26374cb..af853b0ceac5 100644
--- a/Documentation/devicetree/bindings/rtc/imxdi-rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/imxdi-rtc.txt
@@ -1,6 +1,6 @@
 * i.MX25 Real Time Clock controller
 
-This binding supports the following chips: i.MX25, i.MX53
+This binding supports the following chips: i.MX25
 
 Required properties:
 - compatible: should be: "fsl,imx25-rtc"
@@ -14,7 +14,7 @@ Optional properties:
 Example:
 
 rtc@80056000 {
-	compatible = "fsl,imx53-rtc", "fsl,imx25-rtc";
+	compatible = "fsl,imx25-rtc";
 	reg = <0x80056000 2000>;
 	interrupts = <29 56>;
 };
-- 
2.11.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
