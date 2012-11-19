From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v4 5/7] ARM: kernel: add cpu logical map DT init in setup_arch
Date: Mon, 19 Nov 2012 12:45:04 +0000
Message-ID: <1353329106-24084-6-git-send-email-lorenzo.pieralisi@arm.com>
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

As soon as the device tree is unflattened the cpu logical to physical
mapping is carried out in setup_arch to build a proper array of MPIDR and
corresponding logical indexes.

The mapping could have been carried out using the flattened DT blob and
related primitives, but since the mapping is not needed by early boot
code it can safely be executed when the device tree has been uncompressed to
its tree data structure.

This patch adds the arm_dt_init_cpu maps() function call in setup_arch().

If the kernel is not compiled with DT support the function is empty and
no logical mapping takes place through it; the mapping carried out in
smp_setup_processor_id() is left unchanged.
If DT is supported the mapping created in smp_setup_processor_id() is overriden.
The DT mapping also sets the possible cpus mask, hence platform
code need not set it again in the respective smp_init_cpus() functions.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Acked-by: Will Deacon <will.deacon@arm.com>
Acked-by: Nicolas Pitre <nico@linaro.org>
---
 arch/arm/kernel/setup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 4515bf6..d15f1c5 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -759,6 +759,7 @@ void __init setup_arch(char **cmdline_p)
 
 	unflatten_device_tree();
 
+	arm_dt_init_cpu_maps();
 #ifdef CONFIG_SMP
 	if (is_smp()) {
 		smp_set_ops(mdesc->smp);
-- 
1.7.12
