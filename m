From: Atish Patra <atish.patra@wdc.com>
Subject: [RFT/RFC PATCH v3 4/5] arm: Use common cpu_topology
Date: Wed, 20 Mar 2019 16:48:05 -0700
Message-ID: <20190320234806.19748-5-atish.patra@wdc.com>
References: <20190320234806.19748-1-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190320234806.19748-1-atish.patra@wdc.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>, Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>, Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>, Morten Rasmussen <morten.rasmussen@arm.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>, Otto Sabart <ottosabart@seberm.com>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

Currently, ARM32 and ARM64 uses different data structures to
represent their cpu toplogies. Since, we are moving the ARM64
topology to common code to be used by other architectures, we
can reuse that for ARM32 as well.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/arm/include/asm/topology.h | 22 +---------------------
 arch/arm/kernel/topology.c      | 10 +++++-----
 include/linux/arch_topology.h   | 10 +++++++++-
 3 files changed, 15 insertions(+), 27 deletions(-)

diff --git a/arch/arm/include/asm/topology.h b/arch/arm/include/asm/topology.h
index 2a786f54..52f99ec8 100644
--- a/arch/arm/include/asm/topology.h
+++ b/arch/arm/include/asm/topology.h
@@ -5,26 +5,6 @@
 #ifdef CONFIG_ARM_CPU_TOPOLOGY
 
 #include <linux/cpumask.h>
-
-struct cputopo_arm {
-	int thread_id;
-	int core_id;
-	int socket_id;
-	cpumask_t thread_sibling;
-	cpumask_t core_sibling;
-};
-
-extern struct cputopo_arm cpu_topology[NR_CPUS];
-
-#define topology_physical_package_id(cpu)	(cpu_topology[cpu].socket_id)
-#define topology_core_id(cpu)		(cpu_topology[cpu].core_id)
-#define topology_core_cpumask(cpu)	(&cpu_topology[cpu].core_sibling)
-#define topology_sibling_cpumask(cpu)	(&cpu_topology[cpu].thread_sibling)
-
-void init_cpu_topology(void);
-void store_cpu_topology(unsigned int cpuid);
-const struct cpumask *cpu_coregroup_mask(int cpu);
-
 #include <linux/arch_topology.h>
 
 /* Replace task scheduler's default frequency-invariant accounting */
@@ -38,7 +18,7 @@ const struct cpumask *cpu_coregroup_mask(int cpu);
 
 #else
 
-static inline void init_cpu_topology(void) { }
+static inline void init_cpu_topology(void) {}
 static inline void store_cpu_topology(unsigned int cpuid) { }
 
 #endif
diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
index 60e375ce..0ddb24c7 100644
--- a/arch/arm/kernel/topology.c
+++ b/arch/arm/kernel/topology.c
@@ -180,7 +180,7 @@ static inline void update_cpu_capacity(unsigned int cpuid) {}
  /*
  * cpu topology table
  */
-struct cputopo_arm cpu_topology[NR_CPUS];
+struct cpu_topology cpu_topology[NR_CPUS];
 EXPORT_SYMBOL_GPL(cpu_topology);
 
 const struct cpumask *cpu_coregroup_mask(int cpu)
@@ -197,9 +197,9 @@ const struct cpumask *cpu_corepower_mask(int cpu)
 	return &cpu_topology[cpu].thread_sibling;
 }
 
-static void update_siblings_masks(unsigned int cpuid)
+void update_siblings_masks(unsigned int cpuid)
 {
-	struct cputopo_arm *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
+	struct cpu_topology *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
 	int cpu;
 
 	/* update core and thread sibling masks */
@@ -230,7 +230,7 @@ static void update_siblings_masks(unsigned int cpuid)
  */
 void store_cpu_topology(unsigned int cpuid)
 {
-	struct cputopo_arm *cpuid_topo = &cpu_topology[cpuid];
+	struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
 	unsigned int mpidr;
 
 	/* If the cpu topology has been already set, just return */
@@ -302,7 +302,7 @@ void __init init_cpu_topology(void)
 
 	/* init core mask and capacity */
 	for_each_possible_cpu(cpu) {
-		struct cputopo_arm *cpu_topo = &(cpu_topology[cpu]);
+		struct cpu_topology *cpu_topo = &(cpu_topology[cpu]);
 
 		cpu_topo->thread_id = -1;
 		cpu_topo->core_id =  -1;
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index d4e76e0a..7c850611 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -36,17 +36,25 @@ unsigned long topology_get_freq_scale(int cpu)
 struct cpu_topology {
 	int thread_id;
 	int core_id;
+#ifdef CONFIG_ARM_CPU_TOPOLOGY
+	int socket_id;
+#else
 	int package_id;
 	int llc_id;
+	cpumask_t llc_sibling;
+#endif
 	cpumask_t thread_sibling;
 	cpumask_t core_sibling;
-	cpumask_t llc_sibling;
 };
 
 #ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
 extern struct cpu_topology cpu_topology[NR_CPUS];
 
+#ifdef CONFIG_ARM_CPU_TOPOLOGY
+#define topology_physical_package_id(cpu)	(cpu_topology[cpu].socket_id)
+#else
 #define topology_physical_package_id(cpu)	(cpu_topology[cpu].package_id)
+#endif
 #define topology_core_id(cpu)		(cpu_topology[cpu].core_id)
 #define topology_core_cpumask(cpu)	(&cpu_topology[cpu].core_sibling)
 #define topology_sibling_cpumask(cpu)	(&cpu_topology[cpu].thread_sibling)
-- 
2.21.0
