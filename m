From: Lina Iyer <ilina-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH RFC v2 2/3] dt-bindings/interrupt-controller: pdc: descibe PDC device binding
Date: Fri,  2 Feb 2018 07:21:59 -0700
Message-ID: <20180202142200.6229-3-ilina@codeaurora.org>
References: <20180202142200.6229-1-ilina@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180202142200.6229-1-ilina-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, asathyak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Lina Iyer <ilina-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Archana Sathyakumar <asathyak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

Add device binding documentation for the PDC Interrupt controller on
QCOM SoC's like the SDM845. The interrupt-controller can be used to
sense edge low interrupts and wakeup interrupts when the GIC is
non-operational.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Archana Sathyakumar <asathyak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Signed-off-by: Lina Iyer <ilina-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 .../bindings/interrupt-controller/qcom,pdc.txt     | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
new file mode 100644
index 000000000000..7bf40cb6a4f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
@@ -0,0 +1,78 @@
+PDC interrupt controller
+
+Qualcomm Technologies Inc. SoCs based on the RPM Hardened architecture have a
+Power Domain Controller (PDC) that is on always-on domain. In addition to
+providing power control for the power domains, the hardware also has an
+interrupt controller that can be used to help detect edge low interrupts as
+well detect interrupts when the GIC is non-operational.
+
+GIC is parent interrupt controller at the highest level. Platform interrupt
+controller PDC is next in hierarchy, followed by others. Drivers requiring
+wakeup capabilities of their device interrupts routed through the PDC, must
+specify PDC as their interrupt controller and request the PDC port associated
+with the GIC interrupt. See example below.
+
+Properties:
+
+- compatible:
+	Usage: required
+	Value type: <string>
+	Definition: Should contain "qcom,<soc>-pdc"
+		    - "qcom,sdm845-pdc": For SDM845
+
+- reg:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: Specifies the base physical address for PDC hardware.
+
+- interrupt-cells:
+	Usage: required
+	Value type: <u32>
+	Definition: Specifies the number of cells needed to encode an interrupt
+		    source.
+		    The value must match that of the parent interrupt
+		    controller defined in the DT.
+		    The encoding of these cells are same as described in [1].
+
+- interrupt-parent:
+	Usage: required
+	Value type: <phandle>
+	Definition: Specifies the interrupt parent necessary for hierarchical
+		    domain to operate.
+
+- interrupt-controller:
+	Usage: required
+	Value type: <bool>
+	Definition: Identifies the node as an interrupt controller.
+
+- qcom,pdc-range:
+	Usage: required
+	Value type: <u32 array>
+	Definition: Specifies the PDC pin offset and the number of PDC ports.
+		    The tuples indicates the valid mapping of valid PDC ports
+		    and their hwirq mapping.
+		    The first element of the tuple is the staring PDC port num.
+		    The second element is the hwirq number for the PDC port.
+		    The third element is the number of elements in sequence.
+
+Example:
+
+	pdc: interrupt-controller@b220000 {
+		compatible = "qcom,sdm845-pdc";
+		reg = <0xb220000 0x30000>;
+		qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&intc>;
+		interrupt-controller;
+	};
+
+The DT binding of a device that wants to use the GIC SPI 514 as a wakeup
+interrupt, would look like this -
+
+	wake-device {
+		[...]
+		interrupt-parent = <&pdc>;
+		interrupt = <0 2 0>;
+	};
+
+[1]. Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
