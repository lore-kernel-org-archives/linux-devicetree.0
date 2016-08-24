From: Brendan Jackman <brendan.jackman@arm.com>
Subject: [RFC 4/6] cpuidle: dt: Add support for reading states from power domains
Date: Wed, 24 Aug 2016 14:48:20 +0100
Message-ID: <20160824134822.3591-5-brendan.jackman@arm.com>
References: <1470351902-43103-3-git-send-email-lina.iyer@linaro.org>
 <20160824134822.3591-1-brendan.jackman@arm.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160824134822.3591-1-brendan.jackman@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: ulf.hansson@linaro.org, khilman@kernel.org, rjw@rjwysocki.net
Cc: andy.gross@linaro.org, sboyd@codeaurora.org, linux-arm-msm@vger.kernel.org, Axel Haslam <ahaslam+renesas@baylibre.com>, devicetree@vger.kernel.org, Marc Titinger <mtitinger+renesas@baylibre.com>, Lina Iyer <lina.iyer@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

This commit allows the list of phandles to idle state nodes for a CPU to
be read from its hierarchy of power domain nodes, in preference to its
cpu-idle-states property. Each CPU's power domain hierarchy is walked,
and at each power domain topology level, all idle states discovered are
appended to the list for that CPU. If a CPU node does not contain a
power-domains property (i.e. has no power domain hierarchy), we fall
back to cpu-idle-states.

This will later be used for the derivation of idle state energy cost
data for Energy Aware Scheduling, for which we need to know the power
domain topology level to which an idle state applies in hardware.

The logic for locating idle state nodes was previously trivial (simply
read the cpu-idle-states property), so was duplicated between
dt_idle_states.c and the PSCI driver. To avoid duplicating the new
logic, the PSCI driver is modified to locate the idle state nodes via
the cpuidle driver's states list.
---

NB This assumes that #power-domain-cells is always 0. I'm not sure how we'd
   work this out for platforms where multiple power domains share a controller
   and are therefore represented by the same node. I'm guessing in those cases
   all of those power domains would share idle states, and if not we'd add
   intermediary subdomains in which we could point to the states.

 drivers/cpuidle/dt_idle_states.c | 205 ++++++++++++++++++++++++++++++++-------
 drivers/firmware/psci.c          |  38 ++++----
 2 files changed, 187 insertions(+), 56 deletions(-)

diff --git a/drivers/cpuidle/dt_idle_states.c b/drivers/cpuidle/dt_idle_states.c
index 61a70ec..c2b590f 100644
--- a/drivers/cpuidle/dt_idle_states.c
+++ b/drivers/cpuidle/dt_idle_states.c
@@ -18,9 +18,128 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/slab.h>

 #include "dt_idle_states.h"

+struct {
+	unsigned int count;
+	struct device_node *nodes[CPUIDLE_STATE_MAX + 1];
+} *state_node_arrays;
+
+static unsigned int __init parse_phandles(struct device_node *np,
+					  const char *prop_name,
+					  struct device_node **nodes_out,
+					  int nodes_out_len)
+{
+	unsigned int i;
+
+	for (i = 0; i < nodes_out_len; i++) {
+		struct device_node *state_node;
+
+		state_node = of_parse_phandle(np, prop_name, i);
+		if (!state_node)
+			break;
+
+		nodes_out[i] = state_node;
+
+		of_node_put(state_node);
+	}
+
+	return i;
+}
+
+static unsigned int __init find_cpu_state_nodes(struct device_node *cpu_node,
+						struct device_node **nodes_out,
+						int nodes_out_len)
+{
+	struct device_node *consumer_node;
+	unsigned int i, state_idx;
+
+	if (!of_property_read_bool(cpu_node, "power-domains")) {
+		return parse_phandles(cpu_node, "cpu-idle-states",
+				      nodes_out, nodes_out_len);
+	}
+
+	consumer_node = of_node_get(cpu_node);
+
+	/*
+	 * Use a loop counter, i, so we don't infiniloop if there's a cycle in
+	 * the power-domains graph (i.e. the DT is borken).
+	 */
+	for (i = 0, state_idx = 0;
+	     (i < 8) && (state_idx < nodes_out_len);
+	     i++) {
+		/*
+		 * TODO
+		 * - Make this work with parent PDs that are parent DT nodes too
+		 *   (i.e. see if parent node has #power-domain-cells)
+		 */
+		struct device_node *pd_node = of_parse_phandle(
+			consumer_node, "power-domains", 0);
+		if (!pd_node) {
+			of_node_put(consumer_node);
+			break;
+		}
+
+		state_idx += parse_phandles(pd_node, "domain-idle-states",
+					    &nodes_out[state_idx],
+					    nodes_out_len - state_idx);
+
+		of_node_put(consumer_node);
+		consumer_node = pd_node;
+	}
+
+	if (i == 8) {
+		pr_warn("%s: DT CPU power-domains graph too deep.\n", __func__);
+		pr_warn("%s: Some idle states will be ignored\n", __func__);
+	}
+	if (state_idx == nodes_out_len)
+		pr_warn("%s: Too many idle state phandles in DT, ignoring some",
+			__func__);
+
+	return state_idx;
+}
+
+static int __init find_state_nodes(void)
+{
+	int cpu;
+
+	if (state_node_arrays)
+		return 0;
+
+	state_node_arrays = kmalloc_array(nr_cpu_ids,
+					  sizeof(state_node_arrays[0]),
+					  GFP_KERNEL);
+	if (!state_node_arrays)
+		return -ENOMEM;
+
+	for_each_possible_cpu(cpu) {
+		struct device_node *cpu_node;
+
+		cpu_node = of_node_get(get_cpu_device(cpu)->of_node);
+
+		if (WARN_ON(!cpu_node))
+			return -EINVAL;
+
+		state_node_arrays[cpu].count = find_cpu_state_nodes(
+			cpu_node, state_node_arrays[cpu].nodes,
+			ARRAY_SIZE(state_node_arrays[cpu].nodes));
+
+		of_node_put(cpu_node);
+	}
+
+	return 0;
+}
+
+static int __init free_state_node_arrays(void)
+{
+	kfree(state_node_arrays);
+	state_node_arrays = NULL;
+	return 0;
+}
+late_initcall(free_state_node_arrays);
+
 static int init_state_node(struct cpuidle_state *idle_state,
 			   const struct of_device_id *matches,
 			   struct device_node *state_node)
@@ -95,38 +214,40 @@ static int init_state_node(struct cpuidle_state *idle_state,
 }

 /*
- * Check that the idle state is uniform across all CPUs in the CPUidle driver
+ * Check that the idle states are uniform across all CPUs in the CPUidle driver
  * cpumask
  */
-static bool idle_state_valid(struct device_node *state_node, unsigned int idx,
-			     const cpumask_t *cpumask)
+static bool idle_states_valid(struct device_node **state_nodes,
+			      unsigned int count, const cpumask_t *cpumask)
 {
 	int cpu;
-	struct device_node *cpu_node, *curr_state_node;
-	bool valid = true;
+	struct device_node **curr_state_nodes;
+	unsigned int curr_count;
+	unsigned int i;

 	/*
-	 * Compare idle state phandles for index idx on all CPUs in the
+	 * Compare idle states on all CPUs in the
 	 * CPUidle driver cpumask. Start from next logical cpu following
-	 * cpumask_first(cpumask) since that's the CPU state_node was
+	 * cpumask_first(cpumask) since that's the CPU state_nodes were
 	 * retrieved from. If a mismatch is found bail out straight
 	 * away since we certainly hit a firmware misconfiguration.
 	 */
 	for (cpu = cpumask_next(cpumask_first(cpumask), cpumask);
 	     cpu < nr_cpu_ids; cpu = cpumask_next(cpu, cpumask)) {
-		cpu_node = of_cpu_device_node_get(cpu);
-		curr_state_node = of_parse_phandle(cpu_node, "cpu-idle-states",
-						   idx);
-		if (state_node != curr_state_node)
-			valid = false;

-		of_node_put(curr_state_node);
-		of_node_put(cpu_node);
-		if (!valid)
-			break;
+		curr_state_nodes = state_node_arrays[cpu].nodes;
+		curr_count = state_node_arrays[cpu].count;
+
+		if (curr_count != count)
+			return false;
+
+		for (i = 0; i < count; i++) {
+			if (state_nodes[i] != curr_state_nodes[i])
+				return false;
+		}
 	}

-	return valid;
+	return true;
 }

 /**
@@ -156,13 +277,21 @@ int dt_init_idle_driver(struct cpuidle_driver *drv,
 			unsigned int start_idx)
 {
 	struct cpuidle_state *idle_state;
-	struct device_node *state_node, *cpu_node;
+	struct device_node *state_node;
 	int i, err = 0;
 	const cpumask_t *cpumask;
+	int cpu;
 	unsigned int state_idx = start_idx;
+	struct device_node **state_nodes;
+	unsigned int state_nodes_count;

 	if (state_idx >= CPUIDLE_STATE_MAX)
 		return -EINVAL;
+
+	err = find_state_nodes();
+	if (err)
+		return err;
+
 	/*
 	 * We get the idle states for the first logical cpu in the
 	 * driver mask (or cpu_possible_mask if the driver cpumask is not set)
@@ -170,27 +299,28 @@ int dt_init_idle_driver(struct cpuidle_driver *drv,
 	 * across CPUs, otherwise we hit a firmware misconfiguration.
 	 */
 	cpumask = drv->cpumask ? : cpu_possible_mask;
-	cpu_node = of_cpu_device_node_get(cpumask_first(cpumask));
+	cpu = cpumask_first(cpumask);
+	state_nodes = state_node_arrays[cpu].nodes;
+	state_nodes_count = state_node_arrays[cpu].count;

-	for (i = 0; ; i++) {
-		state_node = of_parse_phandle(cpu_node, "cpu-idle-states", i);
-		if (!state_node)
-			break;
+	if (start_idx + state_nodes_count > CPUIDLE_STATE_MAX) {
+		pr_warn("%s: Too many idle state nodes, ignoring some\n",
+			__func__);
+		state_nodes_count = (CPUIDLE_STATE_MAX - start_idx);
+	}

-		if (!of_device_is_available(state_node))
-			continue;
+	if (!idle_states_valid(state_nodes, state_nodes_count, cpumask)) {
+		pr_warn("CPU%d idle states not valid, bailing out\n", cpu);
+		return -EINVAL;
+	}

-		if (!idle_state_valid(state_node, i, cpumask)) {
-			pr_warn("%s idle state not valid, bailing out\n",
-				state_node->full_name);
-			err = -EINVAL;
-			break;
-		}
+	for (i = 0; i < state_nodes_count; i++) {
+		state_node = of_node_get(state_nodes[i]);
+		if (WARN_ON(!state_node))
+			return -EINVAL;

-		if (state_idx == CPUIDLE_STATE_MAX) {
-			pr_warn("State index reached static CPU idle driver states array size\n");
-			break;
-		}
+		if (!of_device_is_available(state_node))
+			goto next;

 		idle_state = &drv->states[state_idx++];
 		err = init_state_node(idle_state, matches, state_node);
@@ -198,13 +328,14 @@ int dt_init_idle_driver(struct cpuidle_driver *drv,
 			pr_err("Parsing idle state node %s failed with err %d\n",
 			       state_node->full_name, err);
 			err = -EINVAL;
+			of_node_put(state_node);
 			break;
 		}
+
+next:
 		of_node_put(state_node);
 	}

-	of_node_put(state_node);
-	of_node_put(cpu_node);
 	if (err)
 		return err;
 	/*
diff --git a/drivers/firmware/psci.c b/drivers/firmware/psci.c
index 8263429..4bdf0f2 100644
--- a/drivers/firmware/psci.c
+++ b/drivers/firmware/psci.c
@@ -25,6 +25,7 @@
 #include <linux/reboot.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
+#include <linux/cpuidle.h>

 #include <uapi/linux/psci.h>

@@ -251,21 +252,21 @@ static int __init psci_features(u32 psci_func_id)
 #ifdef CONFIG_CPU_IDLE
 static DEFINE_PER_CPU_READ_MOSTLY(u32 *, psci_power_state);

-static int psci_dt_cpu_init_idle(struct device_node *cpu_node, int cpu)
+static int psci_dt_cpu_init_idle(int cpu)
 {
-	int i, ret, count = 0;
+	int i, ret, count;
 	u32 *psci_states;
-	struct device_node *state_node;
+	struct cpuidle_driver *cpuidle_drv;
+	struct device_node *state_node = NULL;

-	/* Count idle states */
-	while ((state_node = of_parse_phandle(cpu_node, "cpu-idle-states",
-					      count))) {
-		count++;
-		of_node_put(state_node);
+	cpuidle_drv = cpuidle_get_cpu_driver(cpu);
+	if (!cpuidle_drv) {
+		pr_warn("%s: Couldn't get cpuidle driver for CPU%d\n",
+			__func__, cpu);
+		return -ENODEV;
 	}

-	if (!count)
-		return -ENODEV;
+	count = cpuidle_drv->state_count - 1;

 	psci_states = kcalloc(count, sizeof(*psci_states), GFP_KERNEL);
 	if (!psci_states)
@@ -274,7 +275,13 @@ static int psci_dt_cpu_init_idle(struct device_node *cpu_node, int cpu)
 	for (i = 0; i < count; i++) {
 		u32 state;

-		state_node = of_parse_phandle(cpu_node, "cpu-idle-states", i);
+		state_node = of_node_get(cpuidle_drv->states[i + 1].of_node);
+		if (!state_node) {
+			pr_warn("%s: No DT node for cpuidle state %d on CPU%d\n",
+				__func__, i, cpu);
+			ret = -ENODEV;
+			goto free_mem;
+		}

 		ret = of_property_read_u32(state_node,
 					   "arm,psci-suspend-param",
@@ -354,7 +361,6 @@ static int __maybe_unused psci_acpi_cpu_init_idle(unsigned int cpu)

 int psci_cpu_init_idle(unsigned int cpu)
 {
-	struct device_node *cpu_node;
 	int ret;

 	/*
@@ -367,13 +373,7 @@ int psci_cpu_init_idle(unsigned int cpu)
 	if (!acpi_disabled)
 		return psci_acpi_cpu_init_idle(cpu);

-	cpu_node = of_get_cpu_node(cpu, NULL);
-	if (!cpu_node)
-		return -ENODEV;
-
-	ret = psci_dt_cpu_init_idle(cpu_node, cpu);
-
-	of_node_put(cpu_node);
+	ret = psci_dt_cpu_init_idle(cpu);

 	return ret;
 }
--
2.9.3
