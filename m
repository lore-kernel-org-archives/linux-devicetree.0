From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 1/5] ARM: kernel: smp_setup_processor_id() updates
Date: Fri,  9 Nov 2012 14:34:10 +0000
Message-ID: <1352471654-20207-2-git-send-email-lorenzo.pieralisi@arm.com>
References: <1352471654-20207-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1352471654-20207-1-git-send-email-lorenzo.pieralisi@arm.com>
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Dave Martin <dave.martin@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Brown <davidb@codeaurora.org>, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch applies some basic changes to the smp_setup_processor_id()
ARM implementation to make the code that builds cpu_logical_map more
uniform across the kernel.

The function now prints the full extent of the boot CPU MPIDR[23:0] and
initializes the cpu_logical_map for CPUs up to nr_cpu_ids.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
---
 arch/arm/kernel/setup.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index da1d1aa..ede7c84 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -426,13 +426,14 @@ int __cpu_logical_map[NR_CPUS];
 void __init smp_setup_processor_id(void)
 {
 	int i;
-	u32 cpu = is_smp() ? read_cpuid_mpidr() & 0xff : 0;
+	u32 mpidr = read_cpuid_mpidr() & 0xffffff;
+	u32 cpu = is_smp() ? mpidr & 0xff : 0;
 
 	cpu_logical_map(0) = cpu;
-	for (i = 1; i < NR_CPUS; ++i)
+	for (i = 1; i < nr_cpu_ids; ++i)
 		cpu_logical_map(i) = i == cpu ? 0 : i;
 
-	printk(KERN_INFO "Booting Linux on physical CPU %d\n", cpu);
+	printk(KERN_INFO "Booting Linux on physical CPU 0x%x\n", mpidr);
 }
 
 static void __init setup_processor(void)
-- 
1.7.12
