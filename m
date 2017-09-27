From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 3/6] dt-bindings: rtc: Add sirf,prima2-sysrtc bindings
Date: Wed, 27 Sep 2017 16:03:42 +0200
Message-ID: <20170927140345.5537-4-alexandre.belloni@free-electrons.com>
References: <20170927140345.5537-1-alexandre.belloni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170927140345.5537-1-alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree bindings for the SiRFSoC Real Time Clock.

Signed-off-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../devicetree/bindings/rtc/sirf,prima2-sysrtc.txt          | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt b/Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt
new file mode 100644
index 000000000000..58885b55da21
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt
@@ -0,0 +1,13 @@
+SiRFSoC Real Time Clock
+
+Required properties:
+- compatible: must be "sirf,prima2-sysrtc"
+- reg: address range of rtc register set.
+- interrupts: rtc alarm interrupts.
+
+Example:
+	rtc@2000 {
+		compatible = "sirf,prima2-sysrtc";
+		reg = <0x2000 0x1000>;
+		interrupts = <52 53 54>;
+	};
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
