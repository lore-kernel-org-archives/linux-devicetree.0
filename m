From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v4 2/4] arm64: dts: juno: refactor CoreSight support on Juno r0
Date: Tue, 17 Jan 2017 12:15:11 +0000
Message-ID: <1484655313-9025-3-git-send-email-sudeep.holla@arm.com>
References: <1484655313-9025-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484655313-9025-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Mike Leach <mike.leach-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "Suzuki K . Poulose" <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, coresight-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Currently the Coresight components are supported only on Juno r0
variant. In preparation to add support to Juno r1/r2 variants, this
patch refactors the existing coresight device nodes so that r1/r2
support can be added easily.

It also cleans up some of the device node names which were previously
named so as they were confused as the labels rather than the node names.

Reviewed-and-Tested-by: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 20 ++++++++++----------
 arch/arm64/boot/dts/arm/juno.dts       |  8 ++++++++
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 580afaee978f..faedf357db3b 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -86,7 +86,7 @@
 	 * The actual size is just 4K though 64K is reserved. Access to the
 	 * unmapped reserved region results in a DECERR response.
 	 */
-	etf@20010000 {
+	etf@20010000 { /* ETF 0 */
 		compatible = "arm,coresight-tmc", "arm,primecell";
 		reg = <0 0x20010000 0 0x1000>;

@@ -100,7 +100,7 @@
 			/* input port */
 			port@0 {
 				reg = <0>;
-				etf_in_port: endpoint {
+				etf0_in_port: endpoint {
 					slave-mode;
 					remote-endpoint = <&main_funnel_out_port>;
 				};
@@ -109,8 +109,7 @@
 			/* output port */
 			port@1 {
 				reg = <0>;
-				etf_out_port: endpoint {
-					remote-endpoint = <&replicator_in_port0>;
+				etf0_out_port: endpoint {
 				};
 			};
 		};
@@ -131,7 +130,8 @@
 		};
 	};

-	main-funnel@20040000 {
+	/* main funnel on Juno r0, cssys0 funnel on Juno r1/r2 as per TRM*/
+	main_funnel: funnel@20040000 {
 		compatible = "arm,coresight-funnel", "arm,primecell";
 		reg = <0 0x20040000 0 0x1000>;

@@ -142,13 +142,15 @@
 			#address-cells = <1>;
 			#size-cells = <0>;

+			/* output port */
 			port@0 {
 				reg = <0>;
 				main_funnel_out_port: endpoint {
-					remote-endpoint = <&etf_in_port>;
+					remote-endpoint = <&etf0_in_port>;
 				};
 			};

+			/* input ports */
 			port@1 {
 				reg = <0>;
 				main_funnel_in_port0: endpoint {
@@ -164,7 +166,6 @@
 					remote-endpoint = <&cluster1_funnel_out_port>;
 				};
 			};
-
 		};
 	};

@@ -198,7 +199,7 @@
 		};
 	};

-	cluster0-funnel@220c0000 {
+	funnel@220c0000 { /* cluster0 funnel */
 		compatible = "arm,coresight-funnel", "arm,primecell";
 		reg = <0 0x220c0000 0 0x1000>;

@@ -262,7 +263,7 @@
 		};
 	};

-	cluster1-funnel@230c0000 {
+	funnel@230c0000 { /* cluster1 funnel */
 		compatible = "arm,coresight-funnel", "arm,primecell";
 		reg = <0 0x230c0000 0 0x1000>;

@@ -385,7 +386,6 @@
 				reg = <0>;
 				replicator_in_port0: endpoint {
 					slave-mode;
-					remote-endpoint = <&etf_out_port>;
 				};
 			};
 		};
diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
index 9967c808a92d..66fa4388d181 100644
--- a/arch/arm64/boot/dts/arm/juno.dts
+++ b/arch/arm64/boot/dts/arm/juno.dts
@@ -202,3 +202,11 @@
 &etm5 {
 	cpu = <&A53_3>;
 };
+
+&etf0_out_port {
+	remote-endpoint = <&replicator_in_port0>;
+};
+
+&replicator_in_port0 {
+	remote-endpoint = <&etf0_out_port>;
+};
--
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
