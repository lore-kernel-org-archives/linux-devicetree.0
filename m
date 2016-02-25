From: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH v3 1/2] dt/bindings: Add bindings for the PIC32 real time clock
Date: Thu, 25 Feb 2016 10:30:43 -0700
Message-ID: <1456421449-18225-1-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Document the devicetree bindings for the real time clock found
on Microchip PIC32 class devices.

Signed-off-by: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
Changes since v2: None
Changes since v1: None
---
 .../bindings/rtc/microchip,pic32-rtc.txt           |   21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/microchip,pic32-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/microchip,pic32-rtc.txt b/Documentation/devicetree/bindings/rtc/microchip,pic32-rtc.txt
new file mode 100644
index 0000000..180b714
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/microchip,pic32-rtc.txt
@@ -0,0 +1,21 @@
+* Microchip PIC32 Real Time Clock and Calendar
+
+The RTCC keeps time in hours, minutes, and seconds, and one half second. It
+provides a calendar in weekday, date, month, and year. It also provides a
+configurable alarm.
+
+Required properties:
+- compatible: should be: "microchip,pic32mzda-rtc"
+- reg: physical base address of the controller and length of memory mapped
+    region.
+- interrupts: RTC alarm/event interrupt
+- clocks: clock phandle
+
+Example:
+
+	rtc: rtc@1f8c0000 {
+		compatible = "microchip,pic32mzda-rtc";
+		reg = <0x1f8c0000 0x60>;
+		interrupts = <166 IRQ_TYPE_EDGE_RISING>;
+		clocks = <&PBCLK6>;
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
