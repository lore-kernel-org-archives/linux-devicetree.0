From: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] arm64: dts: zx: add pcu_domain node for zx296718
Date: Sat,  3 Dec 2016 19:59:14 +0800
Message-ID: <1480766354-25168-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, chen.chaokai-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, wang.qiang01-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the pcu_domain node, so it can be used
by zte-soc's power domain driver.

Furthermore, it adds the document of the node.

Signed-off-by: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 Documentation/devicetree/bindings/arm/zte.txt | 11 +++++++++++
 arch/arm64/boot/dts/zte/zx296718.dtsi         |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/zte.txt b/Documentation/devicetree/bindings/arm/zte.txt
index 83369785..19a7e1b 100644
--- a/Documentation/devicetree/bindings/arm/zte.txt
+++ b/Documentation/devicetree/bindings/arm/zte.txt
@@ -27,6 +27,9 @@ System management required properties:
       - compatible = "zte,zx296718-aon-sysctrl"
       - compatible = "zte,zx296718-sysctrl"
 
+Low power management required properties:
+      - compatible = "zte,zx296718-pcu"
+
 Example:
 aon_sysctrl: aon-sysctrl@116000 {
 	compatible = "zte,zx296718-aon-sysctrl", "syscon";
@@ -37,3 +40,11 @@ sysctrl: sysctrl@1463000 {
 	compatible = "zte,zx296718-sysctrl", "syscon";
 	reg = <0x1463000 0x1000>;
 };
+
+pcu_domain: pcu@0x00117000 {
+        compatible = "zte,zx296718-pcu";
+        reg = <0x00117000 0x1000>;
+        #power-domain-cells = <1>;
+        status = "ok";
+};
+
diff --git a/arch/arm64/boot/dts/zte/zx296718.dtsi b/arch/arm64/boot/dts/zte/zx296718.dtsi
index b44d1d1..39e70c7 100644
--- a/arch/arm64/boot/dts/zte/zx296718.dtsi
+++ b/arch/arm64/boot/dts/zte/zx296718.dtsi
@@ -351,5 +351,12 @@
 			reg = <0x01480000 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		pcu_domain: pcu@0x00117000 {
+			compatible = "zte,zx296718-pcu";
+			reg = <0x00117000 0x1000>;
+			#power-domain-cells = <1>;
+			status = "ok";
+		};
 	};
 };
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
