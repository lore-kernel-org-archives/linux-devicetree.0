From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v5 2/4] devicetree: bindings: Document Krait CPU/L1 EDAC
Date: Wed, 15 Jan 2014 17:38:40 -0800
Message-ID: <20140116013840.GA674@codeaurora.org>
References: <1389735034-21430-1-git-send-email-sboyd@codeaurora.org>
 <1389735034-21430-3-git-send-email-sboyd@codeaurora.org>
 <20140115102701.GA27314@e102568-lin.cambridge.arm.com>
 <20140115165623.GJ14405@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140115165623.GJ14405-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/15, Stephen Boyd wrote:
> 
> Ah sorry, I forgot to put the compatible property here like in
> the dts change. I'll do that in the next revision. Yes we need a
> compatible property here to match the platform driver.
> 

This is the replacement patch

-----8<------
From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v9] devicetree: bindings: Document Krait CPU/L1 EDAC

The Krait CPU/L1 error reporting device is made up a per-CPU
interrupt. While we're here, document the next-level-cache
property that's used by the Krait EDAC driver.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 58 ++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
index 91304353eea4..03a529e791c4 100644
--- a/Documentation/devicetree/bindings/arm/cpus.txt
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -62,6 +62,20 @@ nodes to be present and contain the properties described below.
 		Value type: <u32>
 		Definition: must be set to 0
 
+	- compatible
+		Usage: optional
+		Value type: <string>
+		Definition: should be one of the compatible strings listed
+			    in the cpu node compatible property. This property
+			    shall only be present if all the cpu nodes have the
+			    same compatible property.
+
+	- interrupts
+		Usage: required when node contains cpus with compatible
+		       string "qcom,krait".
+		Value type: <prop-encoded-array>
+		Definition: L1/CPU error interrupt
+
 - cpu node
 
 	Description: Describes a CPU in an ARM based system
@@ -191,6 +205,11 @@ nodes to be present and contain the properties described below.
 			  property identifying a 64-bit zero-initialised
 			  memory location.
 
+	- next-level-cache
+		Usage: optional
+		Value type: <phandle>
+		Definition: phandle pointing to the next level cache
+
 Example 1 (dual-cluster big.LITTLE system 32-bit):
 
 	cpus {
@@ -382,3 +401,42 @@ cpus {
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
+	compatible = "qcom,krait";
+
+	cpu@0 {
+		device_type = "cpu";
+		reg = <0>;
+		next-level-cache = <&L2>;
+	};
+
+	cpu@1 {
+		device_type = "cpu";
+		reg = <1>;
+		next-level-cache = <&L2>;
+	};
+
+	cpu@2 {
+		device_type = "cpu";
+		reg = <2>;
+		next-level-cache = <&L2>;
+	};
+
+	cpu@3 {
+		device_type = "cpu";
+		reg = <3>;
+		next-level-cache = <&L2>;
+	};
+
+	L2: l2-cache {
+		compatible = "cache";
+		interrupts = <0 2 0x4>;
+	};
+};
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
