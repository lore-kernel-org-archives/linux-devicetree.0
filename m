From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dt/bindings: update fsl-fec regarding compatible and clocks
Date: Mon, 10 Feb 2014 19:50:08 +0800
Message-ID: <1392033008-20752-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Philippe De Muyter <phdm-KobBqTBAxd8@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update fsl-fec to explicitly list the supported compatible strings
and add missing 'clocks' and 'clock-names' properties.  It does not
change anything about how kernel drive works.  Instead, it just reflects
how kernel driver works today.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/net/fsl-fec.txt |   19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/fsl-fec.txt b/Documentation/devicetree/bindings/net/fsl-fec.txt
index 845ff84..3ebd395 100644
--- a/Documentation/devicetree/bindings/net/fsl-fec.txt
+++ b/Documentation/devicetree/bindings/net/fsl-fec.txt
@@ -1,9 +1,26 @@
 * Freescale Fast Ethernet Controller (FEC)
 
 Required properties:
-- compatible : Should be "fsl,<soc>-fec"
+- compatible : Should contain one of the following:
+		"fsl,imx25-fec"
+		"fsl,imx27-fec"
+		"fsl,imx28-fec"
+		"fsl,imx6q-fec"
+		"fsl,mvf600-fec"
 - reg : Address and length of the register set for the device
 - interrupts : Should contain fec interrupt
+- clocks: phandle to the clocks feeding the FEC controller and phy. The
+  following two are required:
+   - "ipg": the peripheral access clock
+   - "ahb": the bus clock for MAC
+  The following two are optional:
+   - "ptp": the sampling clock for PTP (IEEE 1588).  On SoC like i.MX6Q,
+     the clock could come from either the internal clock control module
+     or external oscillator via pad depending on board design.
+   - "enet_out": the phy reference clock provided by SoC via pad, which
+     is available on SoC like i.MX28.
+- clock-names: Must contain the clock names described just above
+
 - phy-mode : String, operation mode of the PHY interface.
   Supported values are: "mii", "gmii", "sgmii", "tbi", "rmii",
   "rgmii", "rgmii-id", "rgmii-rxid", "rgmii-txid", "rtbi", "smii".
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
