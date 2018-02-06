From: Lina Iyer <ilina-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v3 2/2] dt-bindings/interrupt-controller: pdc: descibe PDC device binding
Date: Tue,  6 Feb 2018 11:09:05 -0700
Message-ID: <20180206180905.29047-3-ilina@codeaurora.org>
References: <20180206180905.29047-1-ilina@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180206180905.29047-1-ilina-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, asathyak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Lina Iyer <ilina-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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
 .../bindings/interrupt-controller/qcom,pdc.txt     | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
new file mode 100644
index 000000000000..1f26e4853e7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
@@ -0,0 +1,80 @@
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
+		    Must be 2.
+		    The first element of the tuple is the PDC pin for the
+		    interrupt.
+		    The second element is the trigger type.
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
+- qcom,pdc-ranges:
+	Usage: required
+	Value type: <u32 array>
+	Definition: Specifies the PDC pin offset and the number of PDC ports.
+		    The tuples indicates the valid mapping of valid PDC ports
+		    and their hwirq mapping.
+		    The first element of the tuple is the staring PDC port num.
+		    The second element is the hwirq number for the PDC port.
+		    The third element is the number of interrupts in sequence.
+
+Example:
+
+	pdc: interrupt-controller@b220000 {
+		compatible = "qcom,sdm845-pdc";
+		reg = <0xb220000 0x30000>;
+		qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&intc>;
+		interrupt-controller;
+	};
+
+DT binding of a device that wants to use the GIC SPI 514 as a wakeup
+interrupt, must do -
+
+	wake-device {
+		[...]
+		interrupt-controller = <&pdc>;
+		interrupt = <2 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+In this case interrupt 514 would be mapped to port 2 on the PDC as defined by
+the qcom,pdc-ranges property.
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
