From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ARM64: dts: Add clock-frequency to model cpu nodes
Date: Fri,  6 Dec 2013 13:14:43 +0000
Message-ID: <1386335683-11405-1-git-send-email-broonie@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

The clock-frequency property is meaningless for the models but it's a
mandatory property so claim that all the cores run at 1MHz.

Signed-off-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/foundation-v8.dts  | 4 ++++
 arch/arm64/boot/dts/rtsm_ve-aemv8a.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/foundation-v8.dts b/arch/arm64/boot/dts/foundation-v8.dts
index 4a060906809d..f91b2fa41fb3 100644
--- a/arch/arm64/boot/dts/foundation-v8.dts
+++ b/arch/arm64/boot/dts/foundation-v8.dts
@@ -34,6 +34,7 @@
 			reg = <0x0 0x0>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x8000fff8>;
+			clock-frequency = <1000000>;
 		};
 		cpu@1 {
 			device_type = "cpu";
@@ -41,6 +42,7 @@
 			reg = <0x0 0x1>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x8000fff8>;
+			clock-frequency = <1000000>;
 		};
 		cpu@2 {
 			device_type = "cpu";
@@ -48,6 +50,7 @@
 			reg = <0x0 0x2>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x8000fff8>;
+			clock-frequency = <1000000>;
 		};
 		cpu@3 {
 			device_type = "cpu";
@@ -55,6 +58,7 @@
 			reg = <0x0 0x3>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x8000fff8>;
+			clock-frequency = <1000000>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/rtsm_ve-aemv8a.dts b/arch/arm64/boot/dts/rtsm_ve-aemv8a.dts
index 572005ea2217..d7debfe79d9f 100644
--- a/arch/arm64/boot/dts/rtsm_ve-aemv8a.dts
+++ b/arch/arm64/boot/dts/rtsm_ve-aemv8a.dts
@@ -37,6 +37,7 @@
 			reg = <0x0 0x0>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x8000fff8>;
+			clock-frequency = <1000000>;
 		};
 		cpu@1 {
 			device_type = "cpu";
@@ -44,6 +45,7 @@
 			reg = <0x0 0x1>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x8000fff8>;
+			clock-frequency = <1000000>;
 		};
 		cpu@2 {
 			device_type = "cpu";
@@ -51,6 +53,7 @@
 			reg = <0x0 0x2>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x8000fff8>;
+			clock-frequency = <1000000>;
 		};
 		cpu@3 {
 			device_type = "cpu";
@@ -58,6 +61,7 @@
 			reg = <0x0 0x3>;
 			enable-method = "spin-table";
 			cpu-release-addr = <0x0 0x8000fff8>;
+			clock-frequency = <1000000>;
 		};
 	};
 
-- 
1.8.5.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
