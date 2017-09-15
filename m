From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] dt-bindings: RTC: Add sirf,prima2-sysrtc bindings
Date: Fri, 15 Sep 2017 02:20:35 +0200
Message-ID: <20170915002035.13284-1-alexandre.belloni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree bindings for the SiRFSoC Real Time Clock.

Signed-off-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../devicetree/bindings/rtc/sirf,prima2-sysrtc.txt         | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt b/Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt
new file mode 100644
index 000000000000..206a5b44af48
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt
@@ -0,0 +1,14 @@
+SiRFSoC Real Time Clock
+
+Required properties:
+- compatible: must be "sirf,prima2-sysrtc"
+- reg: address range of rtc register set.
+- interrupts: rtc alarm interrupts.
+
+Example:
+			sysrtc@2000 {
+				compatible = "sirf,prima2-sysrtc";
+				reg = <0x2000 0x1000>;
+				interrupts = <52 53 54>;
+			};
+
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
