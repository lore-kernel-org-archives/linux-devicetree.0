From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 07/15] dt: binding: add binding for TZ1090 mux bank
Date: Wed, 19 Nov 2014 23:15:35 +0000
Message-ID: <1416438943-11429-8-git-send-email-james.hogan@imgtec.com>
References: <1416438943-11429-1-git-send-email-james.hogan@imgtec.com>
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416438943-11429-1-git-send-email-james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DT binding for a bank of clock muxes in the TZ1090 SoC. There are
several such registers which contain only bits controlling clock muxes.

The bit-mask property determines the mask of bits of the register which
control muxes. The number of output clocks is equal to the number of set
bits in the bit-mask, and the clock-output-names array lists the
names from the least significant set bit in the mask to the most
significant set bit. The number of input clocks is double the number of
output clocks since each bit muxes between two input clocks, so the
clocks array lists two input clocks per set bit.

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
 .../bindings/clock/img,tz1090-mux-bank.txt         | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/img,tz1090-mux-bank.txt

diff --git a/Documentation/devicetree/bindings/clock/img,tz1090-mux-bank.txt b/Documentation/devicetree/bindings/clock/img,tz1090-mux-bank.txt
new file mode 100644
index 0000000..2272f87
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/img,tz1090-mux-bank.txt
@@ -0,0 +1,56 @@
+Binding for TZ1090 clock mux bank.
+
+This binding uses the common clock binding[1]. It assumes a register-mapped bank
+of clock muxes, where each bit in the register can control a single mux. The
+number of clocks in the bank is specified indirectly by the number of set bits
+in the bit-mask property.
+
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Required properties:
+- compatible         : shall be "img,tz1090-mux-bank".
+- #clock-cells       : from common clock binding; shall be set to 1.
+- reg                : base address for register controlling muxes
+- bit-mask           : bitmask of bits in register controlling muxes
+- clocks             : clock specifiers of two parent clocks for each mux with a
+                       bit set in bit-mask
+- clock-output-names : from common clock binding. Name of each mux with bit set
+                       in bit-mask
+
+Clock Specifier Definition:
+- <1st-cell>: mux number, counting from 0 (the mux controlled by the lowest set
+              bit in bit-mask) to the number of muxes - 1 (i.e.  omitting any
+              clear bits in bit-mask).
+
+Examples:
+	/*                       ___________
+	 * xtal1         ------o|clkout0_sw0\______
+	 * afe_progdiv1_to_soc -|___________/  2   |
+	 * sys_clk_undeleted --o|clkout0_sw1\____  |
+	 * if0_sw        -------|___________/  3 | |
+	 *                 ,-;==================='-'
+	 *                 | |   ___________
+	 * clkout0_sw0     | `-o|clkout0_sw2\______
+	 * xtal2         --|----|___________/  4   |
+	 *                 |  _____________________|
+	 *                 | |   ___________
+	 * clkout0_sw2     | `-o|clkout0_sw3\___________
+	 * clkout0_sw1     `----|___________/  5
+	 */
+	clkswitch: clkswitch {
+		compatible = "img,tz1090-mux-bank";
+		#clock-cells = <1>;
+		reg = <0x02005908 0x4>;
+		bit-mask = <0x0000003c>;
+		clock-output-names =
+			"out0_sw0",
+			"out0_sw1",
+			"out0_sw2",
+			"out0_sw3",
+		clocks =
+			<&xtal1>,		<&afe_progdiv1_to_soc>,
+			<&sys_clk_undeleted>,	<&clkswitch2 6>,
+			<&clkswitch 0>,		<&xtal2>,
+			<&clkswitch 2>,		<&clkswitch 1>,
+	};
-- 
2.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
