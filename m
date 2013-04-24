From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH v3 17/17] ARM: DT: kernel: DT cpus/cpu node bindings update
Date: Wed, 24 Apr 2013 18:28:22 +0100
Message-ID: <1366824502-19729-18-git-send-email-lorenzo.pieralisi@arm.com>
References: <1366824502-19729-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1366824502-19729-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, Vinayak Kale <vkale-qTEPVZfXA3Y@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

DT cpu map parsing code must be made compliant with the latest cpus/cpu
nodes bindings updates, hence this patch updates the arm_dt_init_cpu_maps()
function with checks and additional parsing rules.

Uniprocessor systems predating v7 do not parse the cpus node at all
since the reg property is meaningless on those systems.

Device trees for 64-bit systems can be taken as device tree input also
for 64-bit CPUs running in 32-bit mode. The code checks that the reg entries
are zeroed as required in the respective fields and detects automatically
the cpus node #address-cells value so that device tree written for
64-bit ARM platforms (that can have cpus node #address-cells == 2) can still
be taken as input. The correct device tree entries are to be set up by the
boot loader, kernel code just checks that device tree entries in the cpus
node are as expected for a 32-bit CPU (reg[63:24] == 0).

cpu node entries with invalid reg property or containing duplicates are
ignored and the device tree parsing is not stopped anymore when such
entries are encountered, the device tree cpu node entry is just skipped.

A device tree with cpu nodes missing the boot CPU MPIDR is considered a
hard error and the kernel flags this up as a bug to force firmware updates.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/kernel/devtree.c | 78 +++++++++++++++++++++++++++++------------------
 1 file changed, 48 insertions(+), 30 deletions(-)

diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
index f149217..b667217 100644
--- a/arch/arm/kernel/devtree.c
+++ b/arch/arm/kernel/devtree.c
@@ -23,6 +23,7 @@
 #include <asm/setup.h>
 #include <asm/page.h>
 #include <asm/smp_plat.h>
+#include <asm/system_info.h>
 #include <asm/mach/arch.h>
 #include <asm/mach-types.h>
 
@@ -81,48 +82,64 @@ void __init arm_dt_init_cpu_maps(void)
 	static u32 tmp_map[NR_CPUS] __initdata = {
 				[0 ... NR_CPUS-1] = UINT_MAX };
 	struct device_node *cpu, *cpus;
-	u32 i, j, cpuidx = 1;
+	u32 i, j, ac, cpuidx = 1;
 	u32 mpidr = is_smp() ? read_cpuid_mpidr() & MPIDR_HWID_BITMASK : 0;
-
+	int len;
 	bool bootcpu_valid = false;
+
 	cpus = of_find_node_by_path("/cpus");
 
-	if (!cpus)
+	if (!cpus || ((cpu_architecture() < CPU_ARCH_ARMv7) && !is_smp()))
 		return;
 
+	if (WARN_ON(of_property_read_u32(cpus, "#address-cells", &ac)))
+		ac = of_n_addr_cells(cpus);
+
 	for_each_child_of_node(cpus, cpu) {
-		u32 hwid;
+		u64 hwid64;
+		u32 hwid32;
+		const __be32 *prop;
 
 		pr_debug(" * %s...\n", cpu->full_name);
 		/*
-		 * A device tree containing CPU nodes with missing "reg"
-		 * properties is considered invalid to build the
-		 * cpu_logical_map.
+		 * A CPU node with missing or wrong "reg" property is
+		 * considered invalid to build a cpu_logical_map entry.
 		 */
-		if (of_property_read_u32(cpu, "reg", &hwid)) {
-			pr_debug(" * %s missing reg property\n",
-				     cpu->full_name);
-			return;
+		prop = of_get_property(cpu, "reg", &len);
+		if (!prop || len < (ac * sizeof(*prop))) {
+			WARN(1, " * %s node missing/wrong reg property, skipped\n",
+				cpu->full_name);
+				goto next;
 		}
-
 		/*
-		 * 8 MSBs must be set to 0 in the DT since the reg property
-		 * defines the MPIDR[23:0].
+		 * Always read reg as u64 value.
+		 * For dts with #address-cells == 1 hwid64[63:32]
+		 * will be set to 0 by of_read_number.
+		 * Toss away the top 32 bits and store value in hwid32.
+		 */
+		hwid32 = hwid64 = of_read_number(prop, ac);
+		/*
+		 * hwid64[63:24] must be always be 0 since the reg
+		 * property defines the MPIDR[23:0] bits regardless
+		 * of the cpus node #address-cells value.
 		 */
-		if (hwid & ~MPIDR_HWID_BITMASK)
-			return;
+		if (hwid64 & ~MPIDR_HWID_BITMASK) {
+			WARN(1, " * %s node reg[63:24] must be 0 on 32-bit dts, got %#016llx, skipped\n",
+				cpu->full_name, hwid64);
+			goto next;
+		}
 
 		/*
 		 * Duplicate MPIDRs are a recipe for disaster.
 		 * Scan all initialized entries and check for
-		 * duplicates. If any is found just bail out.
+		 * duplicates. If any is found just ignore the CPU.
 		 * temp values were initialized to UINT_MAX
 		 * to avoid matching valid MPIDR[23:0] values.
 		 */
 		for (j = 0; j < cpuidx; j++)
-			if (WARN(tmp_map[j] == hwid, "Duplicate /cpu reg "
-						     "properties in the DT\n"))
-				return;
+			if (WARN(tmp_map[j] == hwid32, " * %s node duplicate cpu reg property, skipped\n",
+						       cpu->full_name))
+				goto next;
 
 		/*
 		 * Build a stashed array of MPIDR values. Numbering scheme
@@ -133,26 +150,27 @@ void __init arm_dt_init_cpu_maps(void)
 		 * logical map built from DT is validated and can be used
 		 * to override the map created in smp_setup_processor_id().
 		 */
-		if (hwid == mpidr) {
+		if (hwid32 == mpidr) {
 			i = 0;
 			bootcpu_valid = true;
 		} else {
 			i = cpuidx++;
 		}
 
-		if (WARN(cpuidx > nr_cpu_ids, "DT /cpu %u nodes greater than "
-					       "max cores %u, capping them\n",
-					       cpuidx, nr_cpu_ids)) {
+		if (WARN_ONCE(cpuidx > nr_cpu_ids, "DT cpu %u nodes greater than max cores %u, capping them\n",
+						    cpuidx, nr_cpu_ids)) {
 			cpuidx = nr_cpu_ids;
-			break;
+			goto next;
 		}
 
-		tmp_map[i] = hwid;
+		tmp_map[i] = hwid32;
+next:	;
 	}
-
-	if (WARN(!bootcpu_valid, "DT missing boot CPU MPIDR[23:0], "
-				 "fall back to default cpu_logical_map\n"))
-		return;
+	/*
+	 * A DT missing the boot CPU MPIDR is a really bad omen
+	 * Flag it up as such and force firmware/dtb updates
+	 */
+	BUG_ON(!bootcpu_valid);
 
 	/*
 	 * Since the boot CPU node contains proper data, and all nodes have
-- 
1.7.12
