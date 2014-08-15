From: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: [RFC] arm64: Add cpu-return-addr to dts files
Date: Fri, 15 Aug 2014 12:50:29 -0700
Message-ID: <1408132229.22761.66.camel@smoke>
References: <1408132130.22761.64.camel@smoke>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408132130.22761.64.camel@smoke>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add entries for the new device tree property cpu-return-addr to the
existing arm64 dts files.

Signed-off-by: Geoff Levand <geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
---

Just FYI.

 arch/arm64/boot/dts/apm-storm.dtsi     | 8 ++++++++
 arch/arm64/boot/dts/foundation-v8.dts  | 4 ++++
 arch/arm64/boot/dts/rtsm_ve-aemv8a.dts | 4 ++++
 3 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
index 40aa96c..c40e25f 100644
--- a/arch/arm64/boot/dts/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm-storm.dtsi
@@ -25,6 +25,7 @@
 			reg = <0x0 0x000>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x1 0x0000fff8>;
+			cpu-return-addr = <0x0 0x0>; /* Updated by bootloader */
 		};
 		cpu@001 {
 			device_type = "cpu";
@@ -32,6 +33,7 @@
 			reg = <0x0 0x001>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x1 0x0000fff8>;
+			cpu-return-addr = <0x0 0x0>; /* Updated by bootloader */
 		};
 		cpu@100 {
 			device_type = "cpu";
@@ -39,6 +41,7 @@
 			reg = <0x0 0x100>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x1 0x0000fff8>;
+			cpu-return-addr = <0x0 0x0>; /* Updated by bootloader */
 		};
 		cpu@101 {
 			device_type = "cpu";
@@ -46,6 +49,7 @@
 			reg = <0x0 0x101>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x1 0x0000fff8>;
+			cpu-return-addr = <0x0 0x0>; /* Updated by bootloader */
 		};
 		cpu@200 {
 			device_type = "cpu";
@@ -53,6 +57,7 @@
 			reg = <0x0 0x200>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x1 0x0000fff8>;
+			cpu-return-addr = <0x0 0x0>; /* Updated by bootloader */
 		};
 		cpu@201 {
 			device_type = "cpu";
@@ -60,6 +65,7 @@
 			reg = <0x0 0x201>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x1 0x0000fff8>;
+			cpu-return-addr = <0x0 0x0>; /* Updated by bootloader */
 		};
 		cpu@300 {
 			device_type = "cpu";
@@ -67,6 +73,7 @@
 			reg = <0x0 0x300>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x1 0x0000fff8>;
+			cpu-return-addr = <0x0 0x0>; /* Updated by bootloader */
 		};
 		cpu@301 {
 			device_type = "cpu";
@@ -74,6 +81,7 @@
 			reg = <0x0 0x301>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x1 0x0000fff8>;
+			cpu-return-addr = <0x0 0x0>; /* Updated by bootloader */
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/foundation-v8.dts b/arch/arm64/boot/dts/foundation-v8.dts
index 4a06090..b8166b9 100644
--- a/arch/arm64/boot/dts/foundation-v8.dts
+++ b/arch/arm64/boot/dts/foundation-v8.dts
@@ -34,6 +34,7 @@
 			reg = <0x0 0x0>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x8000fff8>;
+			cpu-return-addr = <0x0 0x8000ffc0>;
 		};
 		cpu@1 {
 			device_type = "cpu";
@@ -41,6 +42,7 @@
 			reg = <0x0 0x1>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x8000fff8>;
+			cpu-return-addr = <0x0 0x8000ffc0>;
 		};
 		cpu@2 {
 			device_type = "cpu";
@@ -48,6 +50,7 @@
 			reg = <0x0 0x2>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x8000fff8>;
+			cpu-return-addr = <0x0 0x8000ffc0>;
 		};
 		cpu@3 {
 			device_type = "cpu";
@@ -55,6 +58,7 @@
 			reg = <0x0 0x3>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x8000fff8>;
+			cpu-return-addr = <0x0 0x8000ffc0>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/rtsm_ve-aemv8a.dts b/arch/arm64/boot/dts/rtsm_ve-aemv8a.dts
index 572005e..92116cd 100644
--- a/arch/arm64/boot/dts/rtsm_ve-aemv8a.dts
+++ b/arch/arm64/boot/dts/rtsm_ve-aemv8a.dts
@@ -37,6 +37,7 @@
 			reg = <0x0 0x0>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x8000fff8>;
+			cpu-return-addr = <0x0 0x8000ffc0>;
 		};
 		cpu@1 {
 			device_type = "cpu";
@@ -44,6 +45,7 @@
 			reg = <0x0 0x1>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x8000fff8>;
+			cpu-return-addr = <0x0 0x8000ffc0>;
 		};
 		cpu@2 {
 			device_type = "cpu";
@@ -51,6 +53,7 @@
 			reg = <0x0 0x2>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x8000fff8>;
+			cpu-return-addr = <0x0 0x8000ffc0>;
 		};
 		cpu@3 {
 			device_type = "cpu";
@@ -58,6 +61,7 @@
 			reg = <0x0 0x3>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x8000fff8>;
+			cpu-return-addr = <0x0 0x8000ffc0>;
 		};
 	};
 
-- 
1.9.1



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
