From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 3/3] ARM: kernel: fix __cpu_logical_map default initialization
Date: Thu, 16 May 2013 16:34:07 +0100
Message-ID: <1368718447-19209-4-git-send-email-lorenzo.pieralisi@arm.com>
References: <1368718447-19209-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1368718447-19209-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
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
To: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

For legacy reasons, the __cpu_logical_map array is initialized to 0.
On old pre-DT ARM platforms, smp_setup_processor_id() generates
__cpu_logical_map entries at boot before the number of possible CPUs is
set-up, with values that can be considered valid MPIDRs even if they are
not present in the system booting; this implies that the __cpu_logical_map[]
might end up containing MPIDR values that can be considered valid at logical
indexes corresponding to CPUs that are not marked as possible.

To prevent issues with the current implementation, this patch defines an
MPIDR_INVALID value, statically initializes the __cpu_logical_map[] array to it
and allows DT parsing code to overwrite values in the __cpu_logical_map array
that were erroneously set-up in smp_setup_processor_id().

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
CC: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/include/asm/cputype.h  |  2 ++
 arch/arm/include/asm/smp_plat.h |  2 +-
 arch/arm/kernel/devtree.c       | 10 ++++++----
 arch/arm/kernel/setup.c         |  2 +-
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/cputype.h b/arch/arm/include/asm/cputype.h
index 7652712..dba62cb 100644
--- a/arch/arm/include/asm/cputype.h
+++ b/arch/arm/include/asm/cputype.h
@@ -32,6 +32,8 @@
 
 #define MPIDR_HWID_BITMASK 0xFFFFFF
 
+#define MPIDR_INVALID (~MPIDR_HWID_BITMASK)
+
 #define MPIDR_LEVEL_BITS 8
 #define MPIDR_LEVEL_MASK ((1 << MPIDR_LEVEL_BITS) - 1)
 
diff --git a/arch/arm/include/asm/smp_plat.h b/arch/arm/include/asm/smp_plat.h
index aaa61b6..e789832 100644
--- a/arch/arm/include/asm/smp_plat.h
+++ b/arch/arm/include/asm/smp_plat.h
@@ -49,7 +49,7 @@ static inline int cache_ops_need_broadcast(void)
 /*
  * Logical CPU mapping.
  */
-extern int __cpu_logical_map[];
+extern u32 __cpu_logical_map[];
 #define cpu_logical_map(cpu)	__cpu_logical_map[cpu]
 /*
  * Retrieve logical cpu index corresponding to a given MPIDR[23:0]
diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
index d2293c0..08f012e 100644
--- a/arch/arm/kernel/devtree.c
+++ b/arch/arm/kernel/devtree.c
@@ -79,12 +79,12 @@ void __init arm_dt_init_cpu_maps(void)
 	 * read as 0.
 	 */
 	static u32 tmp_map[NR_CPUS] __initdata = {
-				[0 ... NR_CPUS-1] = UINT_MAX };
+				[0 ... NR_CPUS-1] = MPIDR_INVALID };
 	struct device_node *cpu, *cpus;
 	u32 i, j, cpuidx = 1;
 	u32 mpidr = is_smp() ? read_cpuid_mpidr() & MPIDR_HWID_BITMASK : 0;
-
 	bool bootcpu_valid = false;
+
 	cpus = of_find_node_by_path("/cpus");
 
 	if (!cpus)
@@ -160,11 +160,13 @@ void __init arm_dt_init_cpu_maps(void)
 	/*
 	 * Since the boot CPU node contains proper data, and all nodes have
 	 * a reg property, the DT CPU list can be considered valid and the
-	 * logical map created in smp_setup_processor_id() can be overridden
+	 * logical map created in smp_setup_processor_id() can be overridden,
+	 * inclusive of entries that must contain invalid MPIDRs
 	 */
+	memcpy(__cpu_logical_map, tmp_map,
+			nr_cpu_ids * sizeof(tmp_map[0]));
 	for (i = 0; i < cpuidx; i++) {
 		set_cpu_possible(i, true);
-		cpu_logical_map(i) = tmp_map[i];
 		pr_debug("cpu logical map 0x%x\n", cpu_logical_map(i));
 	}
 }
diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 6ae71b7..eeac924 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -457,7 +457,7 @@ void notrace cpu_init(void)
 	    : "r14");
 }
 
-int __cpu_logical_map[NR_CPUS];
+u32 __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };
 
 void __init smp_setup_processor_id(void)
 {
-- 
1.8.2.2
