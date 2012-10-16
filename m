From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC PATCH 1/4] ARM: kernel: add device tree init map function
Date: Tue, 16 Oct 2012 14:21:45 +0100
Message-ID: <1350393709-23546-2-git-send-email-lorenzo.pieralisi@arm.com>
References: <1350393709-23546-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1350393709-23546-1-git-send-email-lorenzo.pieralisi@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Dave Martin <dave.martin@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Brown <davidb@codeaurora.org>
List-Id: devicetree@vger.kernel.org

When booting through a device tree, the kernel cpu logical id map can be
initialized using device tree data passed by FW or through an embedded blob.

This patch adds a function that parses device tree "cpu" nodes and
retrieves the corresponding CPUs hardware identifiers (MPIDR).
It sets the possible cpus and the cpu logical map values according to
the number of CPUs defined in the device tree and respective properties.

The primary CPU is assigned cpu logical number 0 to keep the current
convention valid.

Current bindings documentation is included in the patch:

Documentation/devicetree/bindings/arm/cpus.txt

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
---
 Documentation/devicetree/bindings/arm/cpus.txt | 42 +++++++++++++++++++++++
 arch/arm/include/asm/prom.h                    |  2 ++
 arch/arm/kernel/devtree.c                      | 47 ++++++++++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cpus.txt

diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Documentation/devicetree/bindings/arm/cpus.txt
new file mode 100644
index 0000000..897f3b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/cpus.txt
@@ -0,0 +1,42 @@
+* ARM CPUs binding description
+
+The device tree allows to describe the layout of CPUs in a system through
+the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
+defining properties for every cpu.
+
+Bindings for CPU nodes follow the ePAPR standard, available from:
+
+http://devicetree.org
+
+For the ARM architecture every CPU node must contain the following property:
+
+- reg : property defining the CPU MPIDR[23:0] register bits
+
+Every cpu node is required to set its device_type to "cpu".
+
+Example:
+
+	cpus {
+		#size-cells = <0>;
+		#address-cells = <1>;
+
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			reg = <0x0>;
+		};
+
+		CPU1: cpu@1 {
+			device_type = "cpu";
+			reg = <0x1>;
+		};
+
+		CPU2: cpu@100 {
+			device_type = "cpu";
+			reg = <0x100>;
+		};
+
+		CPU3: cpu@101 {
+			device_type = "cpu";
+			reg = <0x101>;
+		};
+	};
diff --git a/arch/arm/include/asm/prom.h b/arch/arm/include/asm/prom.h
index aeae9c6..8dd51dc 100644
--- a/arch/arm/include/asm/prom.h
+++ b/arch/arm/include/asm/prom.h
@@ -15,6 +15,7 @@
 
 extern struct machine_desc *setup_machine_fdt(unsigned int dt_phys);
 extern void arm_dt_memblock_reserve(void);
+extern void __init arm_dt_init_cpu_maps(void);
 
 #else /* CONFIG_OF */
 
@@ -24,6 +25,7 @@ static inline struct machine_desc *setup_machine_fdt(unsigned int dt_phys)
 }
 
 static inline void arm_dt_memblock_reserve(void) { }
+static inline void arm_dt_init_cpu_maps(void) { }
 
 #endif /* CONFIG_OF */
 #endif /* ASMARM_PROM_H */
diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
index bee7f9d..c86e414 100644
--- a/arch/arm/kernel/devtree.c
+++ b/arch/arm/kernel/devtree.c
@@ -19,8 +19,10 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 
+#include <asm/cputype.h>
 #include <asm/setup.h>
 #include <asm/page.h>
+#include <asm/smp_plat.h>
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
 
@@ -61,6 +63,51 @@ void __init arm_dt_memblock_reserve(void)
 	}
 }
 
+/*
+ * arm_dt_init_cpu_maps - Function retrieves cpu nodes from the device tree
+ * and builds the cpu logical map array containing MPIDR values related to
+ * logical cpus
+ *
+ * Updates the cpu possible mask with the number of parsed cpu nodes
+ */
+void __init arm_dt_init_cpu_maps(void)
+{
+	struct device_node *dn = NULL;
+	int i, cpu = 1;
+
+	while ((dn = of_find_node_by_type(dn, "cpu")) && cpu <= nr_cpu_ids) {
+		const u32 *hwid;
+		int len;
+
+		pr_debug("  * %s...\n", dn->full_name);
+
+		hwid = of_get_property(dn, "reg", &len);
+
+		if (!hwid || len != 4) {
+			pr_err("  * %s missing reg property\n", dn->full_name);
+			continue;
+		}
+		/*
+		 * We want to assign the boot CPU logical id 0.
+		 * Boot CPU checks its own MPIDR and if matches the current
+		 * cpu node "reg" value it sets the logical cpu index to 0
+		 * and stores the physical id accordingly.
+		 * If MPIDR does not match, assign sequential cpu logical
+		 * id (starting from 1) and increments it.
+		 */
+		i = (be32_to_cpup(hwid) == (read_cpuid_mpidr() & 0xffffff))
+							? 0 : cpu++;
+
+		if (!i)
+			printk(KERN_INFO "Booting Linux on CPU HWID 0x%x\n",
+					be32_to_cpup(hwid));
+
+		cpu_logical_map(i) = be32_to_cpup(hwid);
+
+		set_cpu_possible(i, true);
+	}
+}
+
 /**
  * setup_machine_fdt - Machine setup when an dtb was passed to the kernel
  * @dt_phys: physical address of dt blob
-- 
1.7.12
