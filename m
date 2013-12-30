From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v4 4/6] devicetree: bindings: Document Krait L1/L2 EDAC
Date: Mon, 30 Dec 2013 12:14:15 -0800
Message-ID: <1388434457-4194-5-git-send-email-sboyd@codeaurora.org>
References: <1388434457-4194-1-git-send-email-sboyd@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1388434457-4194-1-git-send-email-sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The Krait L1/L2 error reporting device is made up of two
interrupts, one per-CPU interrupt for the L1 caches and one
interrupt for the L2 cache.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 72 ++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index 9130435..54de94b 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -191,6 +191,35 @@ nodes to be present and contain the properties described below.
 			  property identifying a 64-bit zero-initialised
 			  memory location.
 
+	- interrupts
+		Usage: required for cpus with compatible string "qcom,krait".
+		Value type: <prop-encoded-array>
+		Definition: L1/CPU error interrupt
+
+	- next-level-cache
+		Usage: optional
+		Value type: <phandle>
+		Definition: phandle pointing to the next level cache
+
+- cache node
+
+	Description: Describes a cache in an ARM based system
+
+	- compatible
+		Usage: required
+		Value type: <string>
+		Definition: shall contain at least "cache"
+
+	- cache-level
+		Usage: required
+		Value type: <u32>
+		Definition: level in the cache heirachy
+
+	- interrupts
+		Usage: required for cpus with compatible string "qcom,krait"
+		Value type: <prop-encoded-array>
+		Definition: the L2 error interrupt
+
 Example 1 (dual-cluster big.LITTLE system 32-bit):
 
 	cpus {
@@ -382,3 +411,46 @@ cpus {
 		cpu-release-addr = <0 0x20000000>;
 	};
 };
+
+
+Example 5 (Krait 32-bit system):
+
+cpus {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	interrupts = <1 9 0xf04>;
+
+	cpu@0 {
+		device_type = "cpu";
+		compatible = "qcom,krait";
+		reg = <0>;
+		next-level-cache = <&L2>;
+	};
+
+	cpu@1 {
+		device_type = "cpu";
+		compatible = "qcom,krait";
+		reg = <1>;
+		next-level-cache = <&L2>;
+	};
+
+	cpu@2 {
+		device_type = "cpu";
+		compatible = "qcom,krait";
+		reg = <2>;
+		next-level-cache = <&L2>;
+	};
+
+	cpu@3 {
+		device_type = "cpu";
+		compatible = "qcom,krait";
+		reg = <3>;
+		next-level-cache = <&L2>;
+	};
+
+	L2: l2-cache {
+		compatible = "cache";
+		cache-level = <2>;
+		interrupts = <0 2 0x4>;
+	};
+};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
