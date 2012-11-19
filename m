From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v4 1/7] ARM: kernel: enhance MPIDR macro definitions
Date: Mon, 19 Nov 2012 12:45:00 +0000
Message-ID: <1353329106-24084-2-git-send-email-lorenzo.pieralisi@arm.com>
References: <1353329106-24084-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1353329106-24084-1-git-send-email-lorenzo.pieralisi@arm.com>
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Dave Martin <dave.martin@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Vincent Guittot <vincent.guittot@linaro.org>, David Brown <davidb@codeaurora.org>, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

Kernel subsystems other than the topology layer need the MPIDR
mask definitions to access the MPIDR without relying on hardcoded
masks. This patch moves the MPIDR register masks definition to
a header file and defines a macro to simplify access to MPIDR bit fields
representing affinity levels.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
---
 arch/arm/include/asm/cputype.h | 13 +++++++++++++
 arch/arm/kernel/topology.c     | 27 +--------------------------
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/arch/arm/include/asm/cputype.h b/arch/arm/include/asm/cputype.h
index cb47d28..a59dcb5 100644
--- a/arch/arm/include/asm/cputype.h
+++ b/arch/arm/include/asm/cputype.h
@@ -25,6 +25,19 @@
 #define CPUID_EXT_ISAR4	"c2, 4"
 #define CPUID_EXT_ISAR5	"c2, 5"
 
+#define MPIDR_SMP_BITMASK (0x3 << 30)
+#define MPIDR_SMP_VALUE (0x2 << 30)
+
+#define MPIDR_MT_BITMASK (0x1 << 24)
+
+#define MPIDR_HWID_BITMASK 0xFFFFFF
+
+#define MPIDR_LEVEL_BITS 8
+#define MPIDR_LEVEL_MASK ((1 << MPIDR_LEVEL_BITS) - 1)
+
+#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
+	((mpidr >> (MPIDR_LEVEL_BITS * level)) & MPIDR_LEVEL_MASK)
+
 extern unsigned int processor_id;
 
 #ifdef CONFIG_CPU_CP15
diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
index 317dac6..4642c7d 100644
--- a/arch/arm/kernel/topology.c
+++ b/arch/arm/kernel/topology.c
@@ -196,32 +196,7 @@ static inline void parse_dt_topology(void) {}
 static inline void update_cpu_power(unsigned int cpuid, unsigned int mpidr) {}
 #endif
 
-
-/*
- * cpu topology management
- */
-
-#define MPIDR_SMP_BITMASK (0x3 << 30)
-#define MPIDR_SMP_VALUE (0x2 << 30)
-
-#define MPIDR_MT_BITMASK (0x1 << 24)
-
-/*
- * These masks reflect the current use of the affinity levels.
- * The affinity level can be up to 16 bits according to ARM ARM
- */
-#define MPIDR_HWID_BITMASK 0xFFFFFF
-
-#define MPIDR_LEVEL0_MASK 0x3
-#define MPIDR_LEVEL0_SHIFT 0
-
-#define MPIDR_LEVEL1_MASK 0xF
-#define MPIDR_LEVEL1_SHIFT 8
-
-#define MPIDR_LEVEL2_MASK 0xFF
-#define MPIDR_LEVEL2_SHIFT 16
-
-/*
+ /*
  * cpu topology table
  */
 struct cputopo_arm cpu_topology[NR_CPUS];
-- 
1.7.12
