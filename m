From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: new cpu iteration code...
Date: Thu, 03 Oct 2013 17:24:51 -0400 (EDT)
Message-ID: <20131003.172451.54508059414505899.davem@davemloft.net>
References: <20130922.162915.1269060096375052591.davem@davemloft.net>
	<CAL_JsqKNVqJbn559ruvFHg+FVGt8ou4v_Ntf-HphwxCNXQ7GfQ@mail.gmail.com>
	<CACxGe6soxNN6TjDw9h15c39FHzyGzY1OZX9cZ8FRQ_k4PinYvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6soxNN6TjDw9h15c39FHzyGzY1OZX9cZ8FRQ_k4PinYvw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Can people on powerpc/arm/etc. give this a spin?  This works on my
T4-2 sparc64 box.

--------------------
of: Make cpu node handling more portable.

Use for_each_node_by_type() to iterate all cpu nodes in the
system.

Provide and overridable function arch_find_n_match_cpu_physical_id,
which sees if the given device node matches 'cpu' and if so sets
'*thread' when non-NULL to the cpu thread number within the core.

The default implementation behaves the same as the existing code.

Add a sparc64 implementation.

Signed-off-by: David S. Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>

diff --git a/arch/sparc/kernel/prom_64.c b/arch/sparc/kernel/prom_64.c
index d397d7f..6b39125 100644
--- a/arch/sparc/kernel/prom_64.c
+++ b/arch/sparc/kernel/prom_64.c
@@ -373,6 +373,59 @@ static const char *get_mid_prop(void)
 	return (tlb_type == spitfire ? "upa-portid" : "portid");
 }
 
+bool arch_find_n_match_cpu_physical_id(struct device_node *cpun,
+				       int cpu, unsigned int *thread)
+{
+	const char *mid_prop = get_mid_prop();
+	int this_cpu_id;
+
+	/* On hypervisor based platforms we interrogate the 'reg'
+	 * property.  On everything else we look for a 'upa-portis',
+	 * 'portid', or 'cpuid' property.
+	 */
+
+	if (tlb_type == hypervisor) {
+		struct property *prop = of_find_property(cpun, "reg", NULL);
+		u32 *regs;
+
+		if (!prop) {
+			pr_warn("CPU node missing reg property\n");
+			return false;
+		}
+		regs = prop->value;
+		this_cpu_id = regs[0] & 0x0fffffff;
+	} else {
+		this_cpu_id = of_getintprop_default(cpun, mid_prop, -1);
+
+		if (this_cpu_id < 0) {
+			mid_prop = "cpuid";
+			this_cpu_id = of_getintprop_default(cpun, mid_prop, -1);
+		}
+		if (this_cpu_id < 0) {
+			pr_warn("CPU node missing cpu ID property\n");
+			return false;
+		}
+	}
+	if (this_cpu_id == cpu) {
+		if (thread) {
+			int proc_id = cpu_data(cpu).proc_id;
+
+			/* On sparc64, the cpu thread information is obtained
+			 * either from OBP or the machine description.  We've
+			 * actually probed this information already long before
+			 * this interface gets called so instead of interrogating
+			 * both the OF node and the MDESC again, just use what
+			 * we discovered already.
+			 */
+			if (proc_id < 0)
+				proc_id = 0;
+			*thread = proc_id;
+		}
+		return true;
+	}
+	return false;
+}
+
 static void *of_iterate_over_cpus(void *(*func)(struct device_node *, int, int), int arg)
 {
 	struct device_node *dp;
diff --git a/drivers/of/base.c b/drivers/of/base.c
index 865d3f6..e4c9945 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -280,6 +280,31 @@ static bool __of_find_n_match_cpu_property(struct device_node *cpun,
 	return false;
 }
 
+/*
+ * arch_find_n_match_cpu_physical_id - See if the given device node is
+ * for the cpu corresponding to logical cpu 'cpu'.  Return true if so,
+ * else false.  If 'thread' is non-NULL, the local thread number within the
+ * core is returned in it.
+ */
+bool __weak arch_find_n_match_cpu_physical_id(struct device_node *cpun,
+					      int cpu, unsigned int *thread)
+{
+	/* Check for non-standard "ibm,ppc-interrupt-server#s" property
+	 * for thread ids on PowerPC. If it doesn't exist fallback to
+	 * standard "reg" property.
+	 */
+	if (IS_ENABLED(CONFIG_PPC) &&
+	    __of_find_n_match_cpu_property(cpun,
+					   "ibm,ppc-interrupt-server#s",
+					   cpu, thread))
+		return true;
+
+	if (__of_find_n_match_cpu_property(cpun, "reg", cpu, thread))
+		return true;
+
+	return false;
+}
+
 /**
  * of_get_cpu_node - Get device node associated with the given logical CPU
  *
@@ -300,26 +325,10 @@ static bool __of_find_n_match_cpu_property(struct device_node *cpun,
  */
 struct device_node *of_get_cpu_node(int cpu, unsigned int *thread)
 {
-	struct device_node *cpun, *cpus;
-
-	cpus = of_find_node_by_path("/cpus");
-	if (!cpus) {
-		pr_warn("Missing cpus node, bailing out\n");
-		return NULL;
-	}
+	struct device_node *cpun;
 
-	for_each_child_of_node(cpus, cpun) {
-		if (of_node_cmp(cpun->type, "cpu"))
-			continue;
-		/* Check for non-standard "ibm,ppc-interrupt-server#s" property
-		 * for thread ids on PowerPC. If it doesn't exist fallback to
-		 * standard "reg" property.
-		 */
-		if (IS_ENABLED(CONFIG_PPC) &&
-			__of_find_n_match_cpu_property(cpun,
-				"ibm,ppc-interrupt-server#s", cpu, thread))
-			return cpun;
-		if (__of_find_n_match_cpu_property(cpun, "reg", cpu, thread))
+	for_each_node_by_type(cpun, "cpu") {
+		if (arch_find_n_match_cpu_physical_id(cpun, cpu, thread))
 			return cpun;
 	}
 	return NULL;
diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index 801ff9e..fbd25c3 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -18,6 +18,7 @@
 #include <linux/cpumask.h>
 
 struct device;
+struct device_node;
 
 struct cpu {
 	int node_id;		/* The node which contains the CPU */
@@ -29,6 +30,8 @@ extern int register_cpu(struct cpu *cpu, int num);
 extern struct device *get_cpu_device(unsigned cpu);
 extern bool cpu_is_hotpluggable(unsigned cpu);
 extern bool arch_match_cpu_phys_id(int cpu, u64 phys_id);
+extern bool arch_find_n_match_cpu_physical_id(struct device_node *cpun,
+					      int cpu, unsigned int *thread);
 
 extern int cpu_add_dev_attr(struct device_attribute *attr);
 extern void cpu_remove_dev_attr(struct device_attribute *attr);
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
