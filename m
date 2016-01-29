From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: [PATCH 2/2] doc: dt: add documentation for alphascale,asm9260-rtc
Date: Fri, 29 Jan 2016 09:40:02 +0100
Message-ID: <1454056802-23386-3-git-send-email-linux@rempel-privat.de>
References: <1454056802-23386-1-git-send-email-linux@rempel-privat.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454056802-23386-1-git-send-email-linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document Alphascale asm9260 RTC bindings

Signed-off-by: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
---
 .../bindings/rtc/alphascale,asm9260-rtc.txt        | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/alphascale,asm9260-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/alphascale,asm9260-rtc.txt b/Documentation/devicetree/bindings/rtc/alphascale,asm9260-rtc.txt
new file mode 100644
index 0000000..2c0ff3c
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/alphascale,asm9260-rtc.txt
@@ -0,0 +1,25 @@
+* Alphascale asm9260 SoC Real Time Clock
+
+Required properties:
+- compatible: Should be "alphascale,asm9260-rtc"
+- reg: Physical base address of the controller and length
+       of memory mapped region.
+- interrupts: IRQ line for the RTC.
+- clocks: Reference to the clock entry.
+- clock-names: should contain:
+  * "ahb" for the SoC RTC clock
+
+Optional:
+- calibration: calibration value for 1 sec period.
+		Max value for forward calibration is 0x1ffff (131071),
+		Min value for backward calibration is 0xfffe0001 (-131071).
+
+Example:
+rtc0: rtc@800a0000 {
+	compatible = "alphascale,asm9260-rtc";
+	reg = <0x800a0000 0x100>;
+	clocks = <&acc CLKID_AHB_RTC>;
+	clock-names = "ahb";
+	interrupts = <2>;
+	calibration = <0x129c>;
+};
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
