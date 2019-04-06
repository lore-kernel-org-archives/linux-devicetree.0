From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4 3/4] dt-bindings: arm: coresight: Unify funnel DT binding
Date: Sat,  6 Apr 2019 19:21:44 +0800
Message-ID: <20190406112145.15184-4-leo.yan@linaro.org>
References: <20190406112145.15184-1-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190406112145.15184-1-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Wanglai Shi <shiwanglai@hisilicon.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

Following the same fashion with replicator DT binding, this patch is to
unify the DT binding for funnel to support static and dynamic modes;
finally we get the funnel DT binding as below:

Before patch:

  Static funnel, aka. non-configurable funnel:
    Not supported;

  Dynamic funnel, aka. configurable funnel:
    "arm,coresight-funnel", "arm,primecell";

After patch:

  Static funnel:
    "arm,coresight-static-funnel";

  Dynamic funnel:
    "arm,coresight-funnel", "arm,primecell"; (obsolete)
    "arm,coresight-dynamic-funnel", "arm,primecell";

At the end of this patch, it gives an example for static funnel DT
binding, and updates the dynamic funnel example.

Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Wanglai Shi <shiwanglai@hisilicon.com>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../devicetree/bindings/arm/coresight.txt     | 52 +++++++++++++++++--
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
index f8f794869af2..f8ad11a17cd5 100644
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
@@ -24,8 +25,11 @@ its hardware characteristcs.
 		  discovered at boot time when the device is probed.
 			"arm,coresight-tmc", "arm,primecell";
 
-		- Trace Funnel:
+		- Trace Programmable Funnel, the compatible string
+		  "arm,coresight-funnel" is obsolete, keep it to support
+		  the old DT bindings:
 			"arm,coresight-funnel", "arm,primecell";
+			"arm,coresight-dynamic-funnel", "arm,primecell";
 
 		- Embedded Trace Macrocell (version 3.x) and
 					Program Flow Trace Macrocell:
@@ -65,7 +69,7 @@ its hardware characteristcs.
 	  "stm-stimulus-base", each corresponding to the areas defined in "reg".
 
 * Required properties for devices that don't show up on the AMBA bus, such as
-  non-configurable replicators:
+  non-configurable replicators and non-configurable funnels:
 
 	* compatible: Currently supported value is (note the absence of the
 	  AMBA markee):
@@ -75,6 +79,9 @@ its hardware characteristcs.
 			"arm,coresight-replicator";
 			"arm,coresight-static-replicator";
 
+		- Coresight Non-configurable Funnel:
+			"arm,coresight-static-funnel";
+
 	* port or ports: see "Graph bindings for Coresight" below.
 
 * Optional properties for ETM/PTMs:
@@ -204,8 +211,45 @@ Example:
 		};
 	};
 
+	funnel {
+		/*
+		 * non-configurable funnel don't show up on the AMBA
+		 * bus.  As such no need to add "arm,primecell".
+		 */
+		compatible = "arm,coresight-static-funnel";
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
-		compatible = "arm,coresight-funnel", "arm,primecell";
+		compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 		reg = <0 0x20040000 0 0x1000>;
 
 		clocks = <&oscclk6a>;
-- 
2.17.1
