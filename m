From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 09/15] dt: binding: add binding for TZ1090 clock deleter
Date: Wed, 19 Nov 2014 23:15:37 +0000
Message-ID: <1416438943-11429-10-git-send-email-james.hogan@imgtec.com>
References: <1416438943-11429-1-git-send-email-james.hogan@imgtec.com>
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416438943-11429-1-git-send-email-james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DT binding for the clock deleters in the TZ1090 SoC, which delete up
to 1023 out of every 1024 clock pulses of the input clock.

Signed-off-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 .../bindings/clock/img,tz1090-deleter.txt          | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/img,tz1090-deleter.txt

diff --git a/Documentation/devicetree/bindings/clock/img,tz1090-deleter.txt b/Documentation/devicetree/bindings/clock/img,tz1090-deleter.txt
new file mode 100644
index 0000000..0f595be
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/img,tz1090-deleter.txt
@@ -0,0 +1,40 @@
+Binding for TZ1090 clock deleter.
+
+This binding uses the common clock binding[1]. The TZ1090 clock deleters can be
+configured to delete a certain fraction of the input clock pulses, so the output
+frequency is:
+
+    deleted_cycles = (reg & bit_mask) >> bit_shift
+    f_out = f_in * (cycle_period - deleted_cycles) / cycle_period
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Required properties:
+- compatible         : Shall be "img,tz1090-deleter".
+- #clock-cells       : From common clock binding; shall be set to 0.
+- reg                : Address of configuration register.
+- bit-mask           : Shift of config value field in configuration register.
+- clocks             : From common clock binding.
+
+Required source clocks:
+- 0                  : Reference clock which is deleted to produce the output
+                       clock (doesn't have to be named).
+
+Optional properties:
+- clock-output-names : From common clock binding.
+- bit-shift          : Number of bits to shift the bit-mask, defaults to
+                       (ffs(mask) - 1) if not present.
+- cycle-period       : Period from which clocks are deleted, defaults to
+                       (1 << (fls(mask) - bit-shift)) if not present.
+
+Example:
+	meta_clkdelete {
+		compatible = "img,tz1090-deleter";
+		#clock-cells = <0>;
+		clocks = <&sys_clk_x2_undeleted>;
+		reg = <0x0200591c 0x4>;
+		bit-mask = <0x000003ff>;
+		/* implicit bit-shift = <0> */
+		/* implicit cycle-period = <1024> */
+		clock-output-names = "meta";
+	};
-- 
2.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
