From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC PATCH 3/4] ARM: kernel: add logical mappings look-up
Date: Tue, 16 Oct 2012 14:21:47 +0100
Message-ID: <1350393709-23546-4-git-send-email-lorenzo.pieralisi@arm.com>
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

In ARM SMP systems the MPIDR register ([23:0] bits) is used to uniquely
identify CPUs.

In order to retrieve the logical CPU index corresponding to a given
MPIDR value and guarantee a consistent translation throughout the kernel,
this patch adds a look-up based on the MPIDR[23:0] so that kernel subsystems
can use it whenever the logical cpu index corresponding to a given MPIDR
value is needed.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
---
 arch/arm/include/asm/smp_plat.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/include/asm/smp_plat.h b/arch/arm/include/asm/smp_plat.h
index 558d6c8..aaa61b6 100644
--- a/arch/arm/include/asm/smp_plat.h
+++ b/arch/arm/include/asm/smp_plat.h
@@ -5,6 +5,9 @@
 #ifndef __ASMARM_SMP_PLAT_H
 #define __ASMARM_SMP_PLAT_H
 
+#include <linux/cpumask.h>
+#include <linux/err.h>
+
 #include <asm/cputype.h>
 
 /*
@@ -48,5 +51,19 @@ static inline int cache_ops_need_broadcast(void)
  */
 extern int __cpu_logical_map[];
 #define cpu_logical_map(cpu)	__cpu_logical_map[cpu]
+/*
+ * Retrieve logical cpu index corresponding to a given MPIDR[23:0]
+ *  - mpidr: MPIDR[23:0] to be used for the look-up
+ *
+ * Returns the cpu logical index or -EINVAL on look-up error
+ */
+static inline int get_logical_index(u32 mpidr)
+{
+	int cpu;
+	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
+		if (cpu_logical_map(cpu) == mpidr)
+			return cpu;
+	return -EINVAL;
+}
 
 #endif
-- 
1.7.12
