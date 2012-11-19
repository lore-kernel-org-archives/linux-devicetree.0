From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v4 2/7] ARM: kernel: update topology to use new MPIDR macros
Date: Mon, 19 Nov 2012 12:45:01 +0000
Message-ID: <1353329106-24084-3-git-send-email-lorenzo.pieralisi@arm.com>
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

This patch updates the topology initialization code to use the newly
defined accessors to retrieve the MPIDR affinity levels.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
---
 arch/arm/kernel/topology.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
index 4642c7d..cba99bd 100644
--- a/arch/arm/kernel/topology.c
+++ b/arch/arm/kernel/topology.c
@@ -262,19 +262,14 @@ void store_cpu_topology(unsigned int cpuid)
 
 		if (mpidr & MPIDR_MT_BITMASK) {
 			/* core performance interdependency */
-			cpuid_topo->thread_id = (mpidr >> MPIDR_LEVEL0_SHIFT)
-				& MPIDR_LEVEL0_MASK;
-			cpuid_topo->core_id = (mpidr >> MPIDR_LEVEL1_SHIFT)
-				& MPIDR_LEVEL1_MASK;
-			cpuid_topo->socket_id = (mpidr >> MPIDR_LEVEL2_SHIFT)
-				& MPIDR_LEVEL2_MASK;
+			cpuid_topo->thread_id = MPIDR_AFFINITY_LEVEL(mpidr, 0);
+			cpuid_topo->core_id = MPIDR_AFFINITY_LEVEL(mpidr, 1);
+			cpuid_topo->socket_id = MPIDR_AFFINITY_LEVEL(mpidr, 2);
 		} else {
 			/* largely independent cores */
 			cpuid_topo->thread_id = -1;
-			cpuid_topo->core_id = (mpidr >> MPIDR_LEVEL0_SHIFT)
-				& MPIDR_LEVEL0_MASK;
-			cpuid_topo->socket_id = (mpidr >> MPIDR_LEVEL1_SHIFT)
-				& MPIDR_LEVEL1_MASK;
+			cpuid_topo->core_id = MPIDR_AFFINITY_LEVEL(mpidr, 0);
+			cpuid_topo->socket_id = MPIDR_AFFINITY_LEVEL(mpidr, 1);
 		}
 	} else {
 		/*
-- 
1.7.12
