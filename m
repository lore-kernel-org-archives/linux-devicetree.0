From: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/2] devicetree: add binding for generic mmio clocksource
Date: Wed,  7 Oct 2015 16:37:13 +0100
Message-ID: <1444232234-2133-1-git-send-email-mans@mansr.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds a DT binding for a generic mmio clocksource as implemented
by clocksource_mmio_init().

Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
---
Changed in v2:
- added sched_clock support
---
 .../devicetree/bindings/timer/clocksource-mmio.txt | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/clocksource-mmio.txt

diff --git a/Documentation/devicetree/bindings/timer/clocksource-mmio.txt b/Documentation/devicetree/bindings/timer/clocksource-mmio.txt
new file mode 100644
index 0000000..cfb3601
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/clocksource-mmio.txt
@@ -0,0 +1,28 @@
+Generic MMIO clocksource
+
+Required properties:
+
+- compatible: should be "clocksource-mmio"
+- reg: the physical address of the counter register
+- reg-io-width: size of counter register in bytes, should be 2 or 4
+- clocks: phandle to the source clock
+- clocksource-bits: number of valid bits
+- clocksource-rating: rating of the clocksource
+
+Optional properties:
+
+- clocksource-counts-down: indicates that counter counts down
+- label: name of the clocksource
+- linux,sched-clock: boolean, register clocksource as sched_clock
+
+Example:
+
+clocksource {
+	compatible = "clocksource-mmio";
+	reg = <0x10000 4>;
+	reg-io-width = <4>;
+	clocksource-bits = <32>;
+	clocksource-rating = <300>;
+	clocks = <&clk>;
+	linux,sched_clock;
+}
-- 
2.5.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
