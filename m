From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH V5 2/2] base/drivers/arch_topology: Default dmips-mhz if they are not set in DT
Date: Tue, 27 Nov 2018 14:24:15 +0100
Message-ID: <1543325060-1599-2-git-send-email-daniel.lezcano@linaro.org>
References: <1543325060-1599-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543325060-1599-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rjw@rjwysocki.net
Cc: linux-kernel@vger.kernel.org, viresh.kumar@linaro.org, Chris Redpath <chris.redpath@linaro.org>, Quentin Perret <quentin.perret@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, Rob Herring <robh@kernel.org>, Quentin Perret <quentin.perret@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Li Yang <leoyang.li@nxp.com>, Olof Johansson <olof@lixom.net>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

In the case of asymmetric SoC with the same micro-architecture, we
have a group of CPUs with smaller OPPs than the other group. One
example is the 96boards dragonboard 820c. There is no dmips/MHz
difference between both groups, so no need to specify the values in
the DT. Unfortunately, without these defined, there is no scaling
capacity computation triggered, so we need to write
'capacity-dmips-mhz' for each CPU with the same value in order to
force the scaled capacity computation.

In order to fix this situation, allocate 'raw_capacity' so the pointer
is set and the init_cpu_capacity_callback() function can be called.

This was tested on db820c:
 - specified values in the DT (correct results)
 - partial values defined in the DT (error + fallback to defaults)
 - no specified values in the DT (correct results)

correct results are:
  cat /sys/devices/system/cpu/cpu*/cpu_capacity
   758
   758
  1024
  1024

  ... respectively for CPU0, CPU1, CPU2 and CPU3.

That reflects the capacity for the max frequencies 1593600 and 2150400.

Cc: Chris Redpath <chris.redpath@linaro.org>
Cc: Quentin Perret <quentin.perret@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Amit Kucheria <amit.kucheria@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Niklas Cassel <niklas.cassel@linaro.org>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
Tested-by: Quentin Perret <quentin.perret@arm.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 Documentation/devicetree/bindings/arm/cpu-capacity.txt | 6 ++++++
 drivers/base/arch_topology.c                           | 9 ++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/cpu-capacity.txt b/Documentation/devicetree/bindings/arm/cpu-capacity.txt
index 84262cd..f53a3c9 100644
--- a/Documentation/devicetree/bindings/arm/cpu-capacity.txt
+++ b/Documentation/devicetree/bindings/arm/cpu-capacity.txt
@@ -54,6 +54,12 @@ fall back to the default capacity value for every CPU. If cpufreq is not
 available, final capacities are calculated by directly using capacity-dmips-
 mhz values (normalized w.r.t. the highest value found while parsing the DT).
 
+If capacity-dmips-mhz is not specified or if the parsing fails, the
+default capacity value will be computed against the highest frequency.
+When all CPUs have the same OPP, they will have the same capacity
+value otherwise the capacity will be scaled down for CPUs having lower
+frequencies.
+
 ===========================================
 4 - Examples
 ===========================================
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index fd5325b..696cea5 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -243,9 +243,16 @@ static int __init register_cpufreq_notifier(void)
 	 * until we have the necessary code to parse the cpu capacity, so
 	 * skip registering cpufreq notifier.
 	 */
-	if (!acpi_disabled || !raw_capacity)
+	if (!acpi_disabled)
 		return -EINVAL;
 
+	if (!raw_capacity) {
+		raw_capacity = kmalloc_array(num_possible_cpus(),
+					     sizeof(*raw_capacity), GFP_KERNEL);
+		if (!raw_capacity)
+			return -ENOMEM;
+	}
+
 	if (!alloc_cpumask_var(&cpus_to_visit, GFP_KERNEL)) {
 		pr_err("cpu_capacity: failed to allocate memory for cpus_to_visit\n");
 		return -ENOMEM;
-- 
2.7.4
