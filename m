From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH v2 1/2] dt-bindings: reset: Add bindings for basic reset controller
Date: Tue, 30 May 2017 15:38:50 +0930
Message-ID: <20170530060851.29923-2-joel@jms.id.au>
References: <20170530060851.29923-1-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170530060851.29923-1-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds the bindings documentation for a basic single-register reset
controller.

The bindings describe a single 32-bit register that contains up to 32
reset lines, each deasserted by clearing the appropriate bit in the
register. Optionally a property can be provided that changes this
behaviour to assert on clear.

Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>

---
V2:
 Address review from Philipp:
 - add note about not auto clearing
 - add property for set to assert behaviour
 - use a decimal for the bit number

Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
 .../devicetree/bindings/reset/reset-basic.txt      | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/reset-basic.txt

diff --git a/Documentation/devicetree/bindings/reset/reset-basic.txt b/Documentation/devicetree/bindings/reset/reset-basic.txt
new file mode 100644
index 000000000000..c19e5368be67
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/reset-basic.txt
@@ -0,0 +1,43 @@
+Basic single-register reset controller
+======================================
+
+This describes a generic reset controller where the reset lines are controlled
+by single bits within a 32-bit memory location. The memory location is assumed
+to be part of a syscon regmap.
+
+By default the bit will be cleared on deassert. This behaviour can be inverted
+with the assert-on-clear property mentioned below.
+
+The bits are assumed to not be auto-clearing, and therefore can be read back to
+determine the status.
+
+Reset controller required properties:
+ - compatible: should be "reset-basic"
+ - #reset-cells: must be set to 1
+ - reg: reset register location within regmap
+
+Reset controller optional properties:
+ - assert-on-clear: add this property when the hardware should clear (set to 0)
+   the bit should to assert the reset.
+   When this property is omitted the default is to set the bit to assert the
+   reset
+
+Device node required properties:
+ - resets phandle
+ - bit number, counting from zero, for the desired reset line. Max is 31.
+
+Example:
+
+syscon {
+	compatible = "syscon";
+
+	uart_reset: reset-controller@c {
+		compatible = "reset-basic";
+		#reset-cells = <1>;
+		reg = <0xc>;
+	};
+}
+
+&uart {
+	resets = <&uart_rest 4>;
+}
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
