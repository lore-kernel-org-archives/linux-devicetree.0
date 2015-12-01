From: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 2/5] ARM: BCM: Clean up SMP support for Broadcom Kona
Date: Tue, 1 Dec 2015 11:24:06 -0500
Message-ID: <1448987049-17041-3-git-send-email-kapilh@broadcom.com>
References: <1448987049-17041-1-git-send-email-kapilh@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448987049-17041-1-git-send-email-kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These changes cleans up SMP implementaion for Broadcom's
Kona SoC which are required for handling SMP for iProc
family of SoCs at a single place for BCM NSP and BCM Kona.

Signed-off-by: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/bcm11351.dtsi |  2 +-
 arch/arm/boot/dts/bcm21664.dtsi |  2 +-
 arch/arm/mach-bcm/kona_smp.c    | 82 +++++++++++++++++++++++++++--------------
 3 files changed, 56 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/bcm11351.dtsi b/arch/arm/boot/dts/bcm11351.dtsi
index 2ddaa51..3dc7a8c 100644
--- a/arch/arm/boot/dts/bcm11351.dtsi
+++ b/arch/arm/boot/dts/bcm11351.dtsi
@@ -31,7 +31,6 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		enable-method = "brcm,bcm11351-cpu-method";
-		secondary-boot-reg = <0x3500417c>;
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -42,6 +41,7 @@
 		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
+			secondary-boot-reg = <0x3500417c>;
 			reg = <1>;
 		};
 	};
diff --git a/arch/arm/boot/dts/bcm21664.dtsi b/arch/arm/boot/dts/bcm21664.dtsi
index 2016b72..3f525be 100644
--- a/arch/arm/boot/dts/bcm21664.dtsi
+++ b/arch/arm/boot/dts/bcm21664.dtsi
@@ -31,7 +31,6 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 		enable-method = "brcm,bcm11351-cpu-method";
-		secondary-boot-reg = <0x35004178>;
 
 		cpu0: cpu@0 {
 			device_type = "cpu";
@@ -42,6 +41,7 @@
 		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
+			secondary-boot-reg = <0x35004178>;
 			reg = <1>;
 		};
 	};
diff --git a/arch/arm/mach-bcm/kona_smp.c b/arch/arm/mach-bcm/kona_smp.c
index 66a0465..15af781 100644
--- a/arch/arm/mach-bcm/kona_smp.c
+++ b/arch/arm/mach-bcm/kona_smp.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2014 Broadcom Corporation
+ * Copyright (C) 2014-2015 Broadcom Corporation
  * Copyright 2014 Linaro Limited
  *
  * This program is free software; you can redistribute it and/or
@@ -30,9 +30,10 @@
 
 /* Name of device node property defining secondary boot register location */
 #define OF_SECONDARY_BOOT	"secondary-boot-reg"
+#define MPIDR_CPUID_BITMASK	0x3
 
 /* I/O address of register used to coordinate secondary core startup */
-static u32	secondary_boot;
+static u32	secondary_boot_addr;
 
 /*
  * Enable the Cortex A9 Snoop Control Unit
@@ -78,44 +79,68 @@ static int __init scu_a9_enable(void)
 static void __init bcm_smp_prepare_cpus(unsigned int max_cpus)
 {
 	static cpumask_t only_cpu_0 = { CPU_BITS_CPU0 };
-	struct device_node *node;
+	struct device_node *cpus_node = NULL;
+	struct device_node *cpu_node = NULL;
 	int ret;
 
-	BUG_ON(secondary_boot);		/* We're called only once */
-
 	/*
 	 * This function is only called via smp_ops->smp_prepare_cpu().
 	 * That only happens if a "/cpus" device tree node exists
 	 * and has an "enable-method" property that selects the SMP
 	 * operations defined herein.
 	 */
-	node = of_find_node_by_path("/cpus");
-	BUG_ON(!node);
-
-	/*
-	 * Our secondary enable method requires a "secondary-boot-reg"
-	 * property to specify a register address used to request the
-	 * ROM code boot a secondary code.  If we have any trouble
-	 * getting this we fall back to uniprocessor mode.
-	 */
-	if (of_property_read_u32(node, OF_SECONDARY_BOOT, &secondary_boot)) {
-		pr_err("%s: missing/invalid " OF_SECONDARY_BOOT " property\n",
-			node->name);
-		ret = -ENOENT;		/* Arrange to disable SMP */
-		goto out;
+	cpus_node = of_find_node_by_path("/cpus");
+	if (!cpus_node)
+		return;
+
+	for_each_child_of_node(cpus_node, cpu_node) {
+		u32 cpuid;
+
+		if (of_node_cmp(cpu_node->type, "cpu"))
+			continue;
+
+		if (of_property_read_u32(cpu_node, "reg", &cpuid)) {
+			pr_debug("%s: missing reg property\n",
+				     cpu_node->full_name);
+			ret = -ENOENT;
+			goto out;
+		}
+
+		/*
+		 * "secondary-boot-reg" property should be defined only
+		 * for secondary cpu
+		 */
+		if ((cpuid & MPIDR_CPUID_BITMASK) == 1) {
+			/*
+			 * Our secondary enable method requires a
+			 * "secondary-boot-reg" property to specify a register
+			 * address used to request the ROM code boot a secondary
+			 * core. If we have any trouble getting this we fall
+			 * back to uniprocessor mode.
+			 */
+			if (of_property_read_u32(cpu_node,
+						OF_SECONDARY_BOOT,
+						&secondary_boot_addr)) {
+				pr_warn("%s: no" OF_SECONDARY_BOOT "property\n",
+					cpu_node->name);
+				ret = -ENOENT;
+				goto out;
+			}
+		}
 	}
 
 	/*
-	 * Enable the SCU on Cortex A9 based SoCs.  If -ENOENT is
+	 * Enable the SCU on Cortex A9 based SoCs. If -ENOENT is
 	 * returned, the SoC reported a uniprocessor configuration.
 	 * We bail on any other error.
 	 */
 	ret = scu_a9_enable();
 out:
-	of_node_put(node);
+	of_node_put(cpu_node);
+	of_node_put(cpus_node);
+
 	if (ret) {
 		/* Update the CPU present map to reflect uniprocessor mode */
-		BUG_ON(ret != -ENOENT);
 		pr_warn("disabling SMP\n");
 		init_cpu_present(&only_cpu_0);
 	}
@@ -139,7 +164,7 @@ out:
  * - Wait for the secondary boot register to be re-written, which
  *   indicates the secondary core has started.
  */
-static int bcm_boot_secondary(unsigned int cpu, struct task_struct *idle)
+static int kona_boot_secondary(unsigned int cpu, struct task_struct *idle)
 {
 	void __iomem *boot_reg;
 	phys_addr_t boot_func;
@@ -154,15 +179,16 @@ static int bcm_boot_secondary(unsigned int cpu, struct task_struct *idle)
 		return -EINVAL;
 	}
 
-	if (!secondary_boot) {
+	if (!secondary_boot_addr) {
 		pr_err("required secondary boot register not specified\n");
 		return -EINVAL;
 	}
 
-	boot_reg = ioremap_nocache((phys_addr_t)secondary_boot, sizeof(u32));
+	boot_reg = ioremap_nocache(
+			(phys_addr_t)secondary_boot_addr, sizeof(u32));
 	if (!boot_reg) {
 		pr_err("unable to map boot register for cpu %u\n", cpu_id);
-		return -ENOSYS;
+		return -ENOMEM;
 	}
 
 	/*
@@ -191,12 +217,12 @@ static int bcm_boot_secondary(unsigned int cpu, struct task_struct *idle)
 
 	pr_err("timeout waiting for cpu %u to start\n", cpu_id);
 
-	return -ENOSYS;
+	return -ENXIO;
 }
 
 static struct smp_operations bcm_smp_ops __initdata = {
 	.smp_prepare_cpus	= bcm_smp_prepare_cpus,
-	.smp_boot_secondary	= bcm_boot_secondary,
+	.smp_boot_secondary	= kona_boot_secondary,
 };
 CPU_METHOD_OF_DECLARE(bcm_smp_bcm281xx, "brcm,bcm11351-cpu-method",
 			&bcm_smp_ops);
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
