From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2] dt/bindings: fsl-fec: add clock properties
Date: Mon, 24 Feb 2014 09:48:10 +0800
Message-ID: <1393206490-25234-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Philippe De Muyter <phdm-KobBqTBAxd8@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update fsl-fec.txt to add 'clocks' and 'clock-names' properties.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
Changes since v1:
 - Leave compatible change out, which should probably be addressed by
   another patch
 - Move clock properties into 'Optional properties:' section

 Documentation/devicetree/bindings/net/fsl-fec.txt |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/fsl-fec.txt b/Documentation/devicetree/bindings/net/fsl-fec.txt
index 845ff84..468736d 100644
--- a/Documentation/devicetree/bindings/net/fsl-fec.txt
+++ b/Documentation/devicetree/bindings/net/fsl-fec.txt
@@ -16,6 +16,15 @@ Optional properties:
   will have the duration be 1 millisecond.  Numbers greater than 1000 are
   invalid and 1 millisecond will be used instead.
 - phy-supply: regulator that powers the Ethernet PHY.
+- clocks: the clocks feeding the FEC controller and phy.
+   - "ipg": the peripheral access clock
+   - "ahb": the bus clock for MAC
+   - "ptp": the sampling clock for PTP (IEEE 1588).  On SoC like i.MX6Q,
+     the clock could come from either the internal clock control module
+     or external oscillator via pad depending on board design.
+   - "enet_out": the phy reference clock provided by SoC via pad, which
+     is available on SoC like i.MX28.
+- clock-names: Must contain the clock names described just above
 
 Example:
 
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
