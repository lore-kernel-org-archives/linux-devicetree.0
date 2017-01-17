From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v4 4/4] arm64: dts: juno: add missing CoreSight STM component
Date: Tue, 17 Jan 2017 12:15:13 +0000
Message-ID: <1484655313-9025-5-git-send-email-sudeep.holla@arm.com>
References: <1484655313-9025-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484655313-9025-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "Suzuki K . Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This patch adds the missing CoreSight STM component definition to the
device tree of all the juno variants(r0,r1,r2)

STM component is connected to different funnels depending on Juno
platform variant.

Reviewed-and-Tested-by: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
[sudeep.holla-5wv7dgnIgG8@public.gmane.org: minor changelog update and reorganising the STM
	node back into juno-base.dtsi to avoid duplication]
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 15 +++++++++++++++
 arch/arm64/boot/dts/arm/juno-r1.dts    |  4 ++++
 arch/arm64/boot/dts/arm/juno-r2.dts    |  4 ++++
 arch/arm64/boot/dts/arm/juno.dts       | 16 ++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index faedf357db3b..58c1773c3aa4 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -185,6 +185,21 @@
 		};
 	};

+	stm@20100000 {
+		compatible = "arm,coresight-stm", "arm,primecell";
+		reg = <0 0x20100000 0 0x1000>,
+		      <0 0x28000000 0 0x180000>;
+		reg-names = "stm-base", "stm-stimulus-base";
+
+		clocks = <&soc_smc50mhz>;
+		clock-names = "apb_pclk";
+		power-domains = <&scpi_devpd 0>;
+		port {
+			stm_out_port: endpoint {
+			};
+		};
+	};
+
 	etm0: etm@22040000 {
 		compatible = "arm,coresight-etm4x", "arm,primecell";
 		reg = <0 0x22040000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/juno-r1.dts
index aef138aa5765..0033c59a64b5 100644
--- a/arch/arm64/boot/dts/arm/juno-r1.dts
+++ b/arch/arm64/boot/dts/arm/juno-r1.dts
@@ -235,3 +235,7 @@
 &replicator_in_port0 {
 	remote-endpoint = <&csys2_funnel_out_port>;
 };
+
+&stm_out_port {
+	remote-endpoint = <&csys1_funnel_in_port0>;
+};
diff --git a/arch/arm64/boot/dts/arm/juno-r2.dts b/arch/arm64/boot/dts/arm/juno-r2.dts
index 827da7c92607..218d0e4736a8 100644
--- a/arch/arm64/boot/dts/arm/juno-r2.dts
+++ b/arch/arm64/boot/dts/arm/juno-r2.dts
@@ -235,3 +235,7 @@
 &replicator_in_port0 {
 	remote-endpoint = <&csys2_funnel_out_port>;
 };
+
+&stm_out_port {
+	remote-endpoint = <&csys1_funnel_in_port0>;
+};
diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
index 66fa4388d181..bb2820ef3d5b 100644
--- a/arch/arm64/boot/dts/arm/juno.dts
+++ b/arch/arm64/boot/dts/arm/juno.dts
@@ -210,3 +210,19 @@
 &replicator_in_port0 {
 	remote-endpoint = <&etf0_out_port>;
 };
+
+&stm_out_port {
+	remote-endpoint = <&main_funnel_in_port2>;
+};
+
+&main_funnel {
+	ports {
+		port@3 {
+			reg = <2>;
+			main_funnel_in_port2: endpoint {
+				slave-mode;
+				remote-endpoint = <&stm_out_port>;
+			};
+		};
+	};
+};
--
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
