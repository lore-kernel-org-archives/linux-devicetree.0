Return-Path: <SRS0=mdyH=NS=arm.com=sudeep.holla@kernel.org>
From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH] dt-bindings: cpufreq: remove stale arm_big_little_dt entry
Date: Wed,  7 Nov 2018 17:40:58 +0000
Message-Id: <20181107174058.4131-1-sudeep.holla@arm.com>
To: linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Most of the ARM platforms used v2 OPP bindings to support big-little
configurations. This arm_big_little_dt binding is incomplete and was
never used.

Commit f174e49e4906 ("cpufreq: remove unused arm_big_little_dt driver")
removes the driver supporting this binding. However the binding was left
unnoticed, so let's get rid of it now.

Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 .../bindings/cpufreq/arm_big_little_dt.txt    | 65 -------------------
 1 file changed, 65 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/cpufreq/arm_big_little_dt.txt

Hi,

For some reason, I didn't expect the driver to have an entry in the
DT bindings and didn't look at it before. While I was searching references
to big-little that can be removed, I spotted this. Sorry for that.

Regards,
Sudeep

diff --git a/Documentation/devicetree/bindings/cpufreq/arm_big_little_dt.txt b/Documentation/devicetree/bindings/cpufreq/arm_big_little_dt.txt
deleted file mode 100644
index 2aa06ac0fac5..000000000000
--- a/Documentation/devicetree/bindings/cpufreq/arm_big_little_dt.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-Generic ARM big LITTLE cpufreq driver's DT glue
------------------------------------------------
-
-This is DT specific glue layer for generic cpufreq driver for big LITTLE
-systems.
-
-Both required and optional properties listed below must be defined
-under node /cpus/cpu@x. Where x is the first cpu inside a cluster.
-
-FIXME: Cpus should boot in the order specified in DT and all cpus for a cluster
-must be present contiguously. Generic DT driver will check only node 'x' for
-cpu:x.
-
-Required properties:
-- operating-points: Refer to Documentation/devicetree/bindings/opp/opp.txt
-  for details
-
-Optional properties:
-- clock-latency: Specify the possible maximum transition latency for clock,
-  in unit of nanoseconds.
-
-Examples:
-
-cpus {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	cpu@0 {
-		compatible = "arm,cortex-a15";
-		reg = <0>;
-		next-level-cache = <&L2>;
-		operating-points = <
-			/* kHz    uV */
-			792000  1100000
-			396000  950000
-			198000  850000
-		>;
-		clock-latency = <61036>; /* two CLK32 periods */
-	};
-
-	cpu@1 {
-		compatible = "arm,cortex-a15";
-		reg = <1>;
-		next-level-cache = <&L2>;
-	};
-
-	cpu@100 {
-		compatible = "arm,cortex-a7";
-		reg = <100>;
-		next-level-cache = <&L2>;
-		operating-points = <
-			/* kHz    uV */
-			792000  950000
-			396000  750000
-			198000  450000
-		>;
-		clock-latency = <61036>; /* two CLK32 periods */
-	};
-
-	cpu@101 {
-		compatible = "arm,cortex-a7";
-		reg = <101>;
-		next-level-cache = <&L2>;
-	};
-};
-- 
2.17.1
