From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v2 2/2] arm64: dts: juno: add SCPI power domains for device power management
Date: Wed,  6 Jul 2016 11:15:37 +0100
Message-ID: <1467800137-17533-3-git-send-email-sudeep.holla@arm.com>
References: <1465228765-14038-1-git-send-email-sudeep.holla@arm.com>
 <1467800137-17533-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467800137-17533-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds power domain information to coresight devices using
SCPI power domains.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Acked-by: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 4ea40a476906..53820fa79bab 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -67,6 +67,7 @@
 
 		clocks = <&soc_smc50mhz>;
 		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -96,6 +97,7 @@
 
 		clocks = <&soc_smc50mhz>;
 		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
 		port {
 			tpiu_in_port: endpoint {
 				slave-mode;
@@ -110,6 +112,7 @@
 
 		clocks = <&soc_smc50mhz>;
 		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -146,6 +149,7 @@
 
 		clocks = <&soc_smc50mhz>;
 		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
 		port {
 			etr_in_port: endpoint {
 				slave-mode;
@@ -160,6 +164,7 @@
 
 		clocks = <&soc_smc50mhz>;
 		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
 		port {
 			cluster0_etm0_out_port: endpoint {
 				remote-endpoint = <&cluster0_funnel_in_port0>;
@@ -173,6 +178,7 @@
 
 		clocks = <&soc_smc50mhz>;
 		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -208,6 +214,7 @@
 
 		clocks = <&soc_smc50mhz>;
 		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
 		port {
 			cluster0_etm1_out_port: endpoint {
 				remote-endpoint = <&cluster0_funnel_in_port1>;
@@ -221,6 +228,7 @@
 
 		clocks = <&soc_smc50mhz>;
 		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
 		port {
 			cluster1_etm0_out_port: endpoint {
 				remote-endpoint = <&cluster1_funnel_in_port0>;
@@ -234,6 +242,7 @@
 
 		clocks = <&soc_smc50mhz>;
 		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -283,6 +292,7 @@
 
 		clocks = <&soc_smc50mhz>;
 		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
 		port {
 			cluster1_etm1_out_port: endpoint {
 				remote-endpoint = <&cluster1_funnel_in_port1>;
@@ -296,6 +306,7 @@
 
 		clocks = <&soc_smc50mhz>;
 		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
 		port {
 			cluster1_etm2_out_port: endpoint {
 				remote-endpoint = <&cluster1_funnel_in_port2>;
@@ -309,6 +320,7 @@
 
 		clocks = <&soc_smc50mhz>;
 		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
 		port {
 			cluster1_etm3_out_port: endpoint {
 				remote-endpoint = <&cluster1_funnel_in_port3>;
@@ -416,6 +428,12 @@
 			};
 		};
 
+		scpi_devpd: scpi-power-domains {
+			compatible = "arm,scpi-power-domains";
+			num-domains = <2>;
+			#power-domain-cells = <1>;
+		};
+
 		scpi_sensors0: sensors {
 			compatible = "arm,scpi-sensors";
 			#thermal-sensor-cells = <1>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
