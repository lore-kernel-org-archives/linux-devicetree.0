From: Wanglai Shi <shiwanglai@hisilicon.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: coresight: Support non-configurable funnel
Date: Wed, 20 Mar 2019 20:38:08 +0800
Message-ID: <1553085490-42870-2-git-send-email-shiwanglai@hisilicon.com>
References: <1553085490-42870-1-git-send-email-shiwanglai@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553085490-42870-1-git-send-email-shiwanglai@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mathieu.poirier@linaro.org, suzuki.poulose@arm.com, robh+dt@kernel.org, mark.rutland@arm.com, xuwei5@hisilicon.com, alexander.shishkin@linux.intel.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, leo.yan@linaro.org, suzhuangluan@hisilicon.com
List-Id: devicetree@vger.kernel.org

From: Leo Yan <leo.yan@linaro.org>

Document DT binding for non-configurable funnel and give an example
for it.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../devicetree/bindings/arm/coresight.txt     | 45 +++++++++++++++++--
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
index f8aff65ab921..e63ec3362af8 100644
--- a/Documentation/devicetree/bindings/arm/coresight.txt
+++ b/Documentation/devicetree/bindings/arm/coresight.txt
@@ -8,7 +8,8 @@ through the intermediate links connecting the source to the currently selected
 sink. Each CoreSight component device should use these properties to describe
 its hardware characteristcs.
 
-* Required properties for all components *except* non-configurable replicators:
+* Required properties for all components *except* non-configurable replicators
+  and non-configurable funnels:
 
 	* compatible: These have to be supplemented with "arm,primecell" as
 	  drivers are using the AMBA bus interface.  Possible values include:
@@ -24,7 +25,7 @@ its hardware characteristcs.
 		  discovered at boot time when the device is probed.
 			"arm,coresight-tmc", "arm,primecell";
 
-		- Trace Funnel:
+		- Trace Programmable Funnel:
 			"arm,coresight-funnel", "arm,primecell";
 
 		- Embedded Trace Macrocell (version 3.x) and
@@ -65,11 +66,12 @@ its hardware characteristcs.
 	  "stm-stimulus-base", each corresponding to the areas defined in "reg".
 
 * Required properties for devices that don't show up on the AMBA bus, such as
-  non-configurable replicators:
+  non-configurable replicators and non-configurable funnels:
 
 	* compatible: Currently supported value is (note the absence of the
 	  AMBA markee):
 		- "arm,coresight-replicator"
+		- "arm,coresight-funnel"
 
 	* port or ports: see "Graph bindings for Coresight" below.
 
@@ -200,6 +202,43 @@ Example:
 		};
 	};
 
+	funnel {
+		/*
+		 * non-configurable funnel don't show up on the AMBA
+		 * bus.  As such no need to add "arm,primecell".
+		 */
+		compatible = "arm,coresight-funnel";
+		clocks = <&crg_ctrl HI3660_PCLK>;
+		clock-names = "apb_pclk";
+
+		out-ports {
+			port {
+				combo_funnel_out: endpoint {
+					remote-endpoint = <&top_funnel_in>;
+				};
+			};
+		};
+
+		in-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				combo_funnel_in0: endpoint {
+					remote-endpoint = <&cluster0_etf_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				combo_funnel_in1: endpoint {
+					remote-endpoint = <&cluster1_etf_out>;
+				};
+			};
+		};
+	};
+
 	funnel@20040000 {
 		compatible = "arm,coresight-funnel", "arm,primecell";
 		reg = <0 0x20040000 0 0x1000>;
-- 
2.17.1
