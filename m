From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v4 3/4] arm64: dts: juno: add CoreSight support for Juno r1/r2 variants
Date: Tue, 17 Jan 2017 12:15:12 +0000
Message-ID: <1484655313-9025-4-git-send-email-sudeep.holla@arm.com>
References: <1484655313-9025-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484655313-9025-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "Suzuki K . Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

The CoreSight support added for Juno is valid for only Juno r0.
The Juno r1 and r2 variants have additional components and alternative
connection routes between trace source and sinks.

This patch builds on top of the existing r0 support and extends it to
Juno r1/r2 variants.

Reviewed-by: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
[sudeep.holla-5wv7dgnIgG8@public.gmane.org: minor changelog update and major reorganisation of
	the common coresight components back into juno-base.dtsi to avoid
	duplication, also renamed funnel node names]
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi | 100 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/arm/juno-r1.dts       |   9 +++
 arch/arm64/boot/dts/arm/juno-r2.dts       |   9 +++
 3 files changed, 118 insertions(+)
 create mode 100644 arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi

diff --git a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
new file mode 100644
index 000000000000..563463ed28c7
--- /dev/null
+++ b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
@@ -0,0 +1,100 @@
+/ {
+	funnel@20130000 { /* cssys2 */
+		compatible = "arm,coresight-funnel", "arm,primecell";
+		reg = <0 0x20130000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* output port */
+			port@0 {
+				reg = <0>;
+				csys1_funnel_out_port: endpoint {
+					remote-endpoint = <&etf1_in_port>;
+				};
+			};
+
+			/* input port */
+			port@1 {
+				reg = <0>;
+				csys1_funnel_in_port0: endpoint {
+					slave-mode;
+				};
+			};
+
+		};
+	};
+
+	etf@20140000 { /* ETF 1 */
+		compatible = "arm,coresight-tmc", "arm,primecell";
+		reg = <0 0x20140000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* input port */
+			port@0 {
+				reg = <0>;
+				etf1_in_port: endpoint {
+					slave-mode;
+					remote-endpoint = <&csys1_funnel_out_port>;
+				};
+			};
+
+			/* output port */
+			port@1 {
+				reg = <0>;
+				etf1_out_port: endpoint {
+					remote-endpoint = <&csys2_funnel_in_port1>;
+				};
+			};
+		};
+	};
+
+	funnel@20150000 { /* cssys2 */
+		compatible = "arm,coresight-funnel", "arm,primecell";
+		reg = <0 0x20150000 0 0x1000>;
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* output port */
+			port@0 {
+				reg = <0>;
+				csys2_funnel_out_port: endpoint {
+					remote-endpoint = <&replicator_in_port0>;
+				};
+			};
+
+			/* input ports */
+			port@1 {
+				reg = <0>;
+				csys2_funnel_in_port0: endpoint {
+					slave-mode;
+					remote-endpoint = <&etf0_out_port>;
+				};
+			};
+
+			port@2 {
+				reg = <1>;
+				csys2_funnel_in_port1: endpoint {
+					slave-mode;
+					remote-endpoint = <&etf1_out_port>;
+				};
+			};
+
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/juno-r1.dts
index b883a8afb6f4..aef138aa5765 100644
--- a/arch/arm64/boot/dts/arm/juno-r1.dts
+++ b/arch/arm64/boot/dts/arm/juno-r1.dts
@@ -10,6 +10,7 @@

 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include "juno-base.dtsi"
+#include "juno-cs-r1r2.dtsi"

 / {
 	model = "ARM Juno development board (r1)";
@@ -226,3 +227,11 @@
 &gpu1_thermal_zone {
 	status = "okay";
 };
+
+&etf0_out_port {
+	remote-endpoint = <&csys2_funnel_in_port0>;
+};
+
+&replicator_in_port0 {
+	remote-endpoint = <&csys2_funnel_out_port>;
+};
diff --git a/arch/arm64/boot/dts/arm/juno-r2.dts b/arch/arm64/boot/dts/arm/juno-r2.dts
index cfd8150bf30a..827da7c92607 100644
--- a/arch/arm64/boot/dts/arm/juno-r2.dts
+++ b/arch/arm64/boot/dts/arm/juno-r2.dts
@@ -10,6 +10,7 @@

 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include "juno-base.dtsi"
+#include "juno-cs-r1r2.dtsi"

 / {
 	model = "ARM Juno development board (r2)";
@@ -226,3 +227,11 @@
 &gpu1_thermal_zone {
 	status = "okay";
 };
+
+&etf0_out_port {
+	remote-endpoint = <&csys2_funnel_in_port0>;
+};
+
+&replicator_in_port0 {
+	remote-endpoint = <&csys2_funnel_out_port>;
+};
--
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
