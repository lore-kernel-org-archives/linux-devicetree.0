From: bjorn-UYDU3/A3LUY@public.gmane.org
Subject: [PATCH v2 01/11] soc: qcom: Add device tree binding for SMEM
Date: Fri, 26 Jun 2015 14:50:09 -0700
Message-ID: <1435355419-23602-2-git-send-email-bjorn.andersson@sonymobile.com>
References: <1435355419-23602-1-git-send-email-bjorn.andersson@sonymobile.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435355419-23602-1-git-send-email-bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Jeffrey Hugo <jhugo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Add device tree binding documentation for the Qualcom Shared Memory
Manager.

Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
---
 .../devicetree/bindings/soc/qcom/qcom,smem.txt     | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
new file mode 100644
index 0000000..19cad6c
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
@@ -0,0 +1,51 @@
+Qualcomm Shared Memory Manager binding
+
+This binding describes the Qualcomm Shared Memory Manager, used to share data
+between various subsystems and OSes in Qualcomm platforms.
+
+- compatible:
+	Usage: required
+	Value type: <stringlist>
+	Definition: must be:
+		    "qcom,smem"
+
+- memory-region:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: handle to memory reservation for main SMEM memory region.
+
+- reg:
+	Usage: optional
+	Value type: <prop-encoded-array>
+	Definition: base address and size pair for any additional memory areas
+		    of the shared memory.
+
+- hwlocks:
+	Usage: required
+	Value type: <prop-encoded-array>
+	Definition: reference to a hwspinlock used to protect allocations from
+		    the shared memory
+
+= EXAMPLE
+The following example shows the SMEM setup for MSM8974, with a main SMEM region
+at 0xfa00000 and an auxiliary region at 0xfc428000:
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		smem_region: smem@fa00000 {
+			reg = <0xfa00000 0x200000>;
+			no-map;
+		};
+	};
+
+	smem@fa00000 {
+		compatible = "qcom,smem";
+
+		memory-region = <&smem_region>;
+		reg = <0xfc428000 0x4000>;
+
+		hwlocks = <&tcsr_mutex 3>;
+	};
-- 
1.9.3 (Apple Git-50)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
