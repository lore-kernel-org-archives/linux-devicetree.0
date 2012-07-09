From: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 2/5] ARM: topology: factorize the update of sibling masks
Date: Mon,  9 Jul 2012 11:27:03 +0200
Message-ID: <1341826026-6504-3-git-send-email-vincent.guittot@linaro.org>
References: <1341826026-6504-1-git-send-email-vincent.guittot@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1341826026-6504-1-git-send-email-vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, yong.zhang0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, namhyung-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This factorization has also been proposed in another patch that has not been
merged yet:
http://lists.infradead.org/pipermail/linux-arm-kernel/2012-January/080873.html
So, this patch could be dropped depending of the state of the other one.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Namhyung Kim <namhyung-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm/kernel/topology.c |   48 +++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
index 51f23b3..eb5fc81 100644
--- a/arch/arm/kernel/topology.c
+++ b/arch/arm/kernel/topology.c
@@ -82,6 +82,32 @@ const struct cpumask *cpu_coregroup_mask(int cpu)
 	return &cpu_topology[cpu].core_sibling;
 }
 
+void update_siblings_masks(unsigned int cpuid)
+{
+	struct cputopo_arm *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
+	int cpu;
+
+	/* update core and thread sibling masks */
+	for_each_possible_cpu(cpu) {
+		cpu_topo = &cpu_topology[cpu];
+
+		if (cpuid_topo->socket_id != cpu_topo->socket_id)
+			continue;
+
+		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
+		if (cpu != cpuid)
+			cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
+
+		if (cpuid_topo->core_id != cpu_topo->core_id)
+			continue;
+
+		cpumask_set_cpu(cpuid, &cpu_topo->thread_sibling);
+		if (cpu != cpuid)
+			cpumask_set_cpu(cpu, &cpuid_topo->thread_sibling);
+	}
+	smp_wmb();
+}
+
 /*
  * store_cpu_topology is called at boot when only one cpu is running
  * and with the mutex cpu_hotplug.lock locked, when several cpus have booted,
@@ -91,7 +117,6 @@ void store_cpu_topology(unsigned int cpuid)
 {
 	struct cputopo_arm *cpuid_topo = &cpu_topology[cpuid];
 	unsigned int mpidr;
-	unsigned int cpu;
 
 	/* If the cpu topology has been already set, just return */
 	if (cpuid_topo->core_id != -1)
@@ -133,26 +158,7 @@ void store_cpu_topology(unsigned int cpuid)
 		cpuid_topo->socket_id = -1;
 	}
 
-	/* update core and thread sibling masks */
-	for_each_possible_cpu(cpu) {
-		struct cputopo_arm *cpu_topo = &cpu_topology[cpu];
-
-		if (cpuid_topo->socket_id == cpu_topo->socket_id) {
-			cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
-			if (cpu != cpuid)
-				cpumask_set_cpu(cpu,
-					&cpuid_topo->core_sibling);
-
-			if (cpuid_topo->core_id == cpu_topo->core_id) {
-				cpumask_set_cpu(cpuid,
-					&cpu_topo->thread_sibling);
-				if (cpu != cpuid)
-					cpumask_set_cpu(cpu,
-						&cpuid_topo->thread_sibling);
-			}
-		}
-	}
-	smp_wmb();
+	update_siblings_masks(cpuid);
 
 	printk(KERN_INFO "CPU%u: thread %d, cpu %d, socket %d, mpidr %x\n",
 		cpuid, cpu_topology[cpuid].thread_id,
-- 
1.7.9.5
