From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] dt-bindings: RTC: add stericsson,coh901331 bindings
Date: Fri, 15 Sep 2017 02:19:52 +0200
Message-ID: <20170915001952.13170-1-alexandre.belloni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree bindings for the ST-Ericsson COH 901 331 Real Time Clock

Signed-off-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 .../devicetree/bindings/rtc/stericsson,coh901331.txt   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/stericsson,coh901331.txt

diff --git a/Documentation/devicetree/bindings/rtc/stericsson,coh901331.txt b/Documentation/devicetree/bindings/rtc/stericsson,coh901331.txt
new file mode 100644
index 000000000000..b592faca1612
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/stericsson,coh901331.txt
@@ -0,0 +1,18 @@
+ST-Ericsson COH 901 331 Real Time Clock
+
+Required properties:
+- compatible: must be "stericsson,coh901331"
+- reg: address range of rtc register set.
+- interrupt-parent: phandle for the interrupt controller.
+- interrupts: rtc alarm interrupt.
+- clocks: phandle to the rtc clock source
+
+Example:
+	rtc: rtc@c0017000 {
+		compatible = "stericsson,coh901331";
+		reg = <0xc0017000 0x1000>;
+		interrupt-parent = <&vicb>;
+		interrupts = <10>;
+		clocks = <&rtc_clk>;
+	};
+
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
