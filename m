From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 2/7] ARM: dts: r8a7790: Add L2 cache-controller nodes
Date: Mon, 15 Feb 2016 21:38:30 +0100
Message-ID: <1455568715-20880-3-git-send-email-geert+renesas@glider.be>
References: <1455568715-20880-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1455568715-20880-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, Sudeep Holla <sudeep.holla@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Add device nodes for the L2 caches, and link the CPU nodes to them.

The L2 cache for the Cortex-A15 CPU cores is 2 MiB large (organized as
128 KiB x 16 ways).

The L2 cache for the Cortex-A7 CPU cores is 512 KiB large (organized as
64 KiB x 8 ways).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Drop "arm,data-latency" and "arm,tag-latency" properties, as they
    may not be valid when using virtualization,
  - Change one-line summary prefix to match current arm-soc practices,

v2:
  - Drop (incorrect) optional cache-{size,sets,{block,line}-size}
    properties, as this information is auto-detected,
  - Integrate linking CPUs to L2 caches into this patch,
  - Extracted from series "[PATCH/RFC 00/15] ARM: shmobile: R-Car: Add
    SYSC PM Domain DT Support".
---
 arch/arm/boot/dts/r8a7790.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 76ddf5c6cca79c3c..e40aa6585831c520 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -52,6 +52,7 @@
 			voltage-tolerance = <1>; /* 1% */
 			clocks = <&cpg_clocks R8A7790_CLK_Z>;
 			clock-latency = <300000>; /* 300 us */
+			next-level-cache = <&L2_CA15>;
 
 			/* kHz - uV - OPPs unknown yet */
 			operating-points = <1400000 1000000>,
@@ -67,6 +68,7 @@
 			compatible = "arm,cortex-a15";
 			reg = <1>;
 			clock-frequency = <1300000000>;
+			next-level-cache = <&L2_CA15>;
 		};
 
 		cpu2: cpu@2 {
@@ -74,6 +76,7 @@
 			compatible = "arm,cortex-a15";
 			reg = <2>;
 			clock-frequency = <1300000000>;
+			next-level-cache = <&L2_CA15>;
 		};
 
 		cpu3: cpu@3 {
@@ -81,6 +84,7 @@
 			compatible = "arm,cortex-a15";
 			reg = <3>;
 			clock-frequency = <1300000000>;
+			next-level-cache = <&L2_CA15>;
 		};
 
 		cpu4: cpu@4 {
@@ -88,6 +92,7 @@
 			compatible = "arm,cortex-a7";
 			reg = <0x100>;
 			clock-frequency = <780000000>;
+			next-level-cache = <&L2_CA7>;
 		};
 
 		cpu5: cpu@5 {
@@ -95,6 +100,7 @@
 			compatible = "arm,cortex-a7";
 			reg = <0x101>;
 			clock-frequency = <780000000>;
+			next-level-cache = <&L2_CA7>;
 		};
 
 		cpu6: cpu@6 {
@@ -102,6 +108,7 @@
 			compatible = "arm,cortex-a7";
 			reg = <0x102>;
 			clock-frequency = <780000000>;
+			next-level-cache = <&L2_CA7>;
 		};
 
 		cpu7: cpu@7 {
@@ -109,9 +116,22 @@
 			compatible = "arm,cortex-a7";
 			reg = <0x103>;
 			clock-frequency = <780000000>;
+			next-level-cache = <&L2_CA7>;
 		};
 	};
 
+	L2_CA15: cache-controller@0 {
+		compatible = "cache";
+		cache-unified;
+		cache-level = <2>;
+	};
+
+	L2_CA7: cache-controller@1 {
+		compatible = "cache";
+		cache-unified;
+		cache-level = <2>;
+	};
+
 	gic: interrupt-controller@f1001000 {
 		compatible = "arm,gic-400";
 		#interrupt-cells = <3>;
-- 
1.9.1
