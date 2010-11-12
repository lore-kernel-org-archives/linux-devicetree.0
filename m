From: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 1/3] x86: of: define irq functions to allow drivers/of/* to
	build on x86
Date: Thu, 11 Nov 2010 21:45:26 -0800
Message-ID: <20101111214526.5de7121b@queued.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


 - Define a stub irq_create_of_mapping for x86 as a stop-gap solution until
   drivers/of/irq is further along.
 - Define irq_dispose_mapping for x86 to appease of_i2c.c

These are needed to allow stuff in drivers/of/ to build on x86.  This stuff
will eventually get replaced; quoting Grant,

"The long term plan is to have the drivers/of/ code handling the mapping
intelligently like powerpc currently does."  But for now, just provide
these functions.

Signed-off-by: Andres Salomon <dilinger-pFFUokh25LWsTnJN9+BGXg@public.gmane.org>
---
 arch/x86/include/asm/irq.h |    3 +++
 arch/x86/kernel/irq.c      |   10 ++++++++++
 2 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/arch/x86/include/asm/irq.h b/arch/x86/include/asm/irq.h
index 13b0eba..8d2c671 100644
--- a/arch/x86/include/asm/irq.h
+++ b/arch/x86/include/asm/irq.h
@@ -10,6 +10,9 @@
 #include <asm/apicdef.h>
 #include <asm/irq_vectors.h>
 
+/* Even though we don't support this, supply it to appease OF */
+static inline void irq_dispose_mapping(unsigned int virq) { }
+
 static inline int irq_canonicalize(int irq)
 {
 	return ((irq == 2) ? 9 : irq);
diff --git a/arch/x86/kernel/irq.c b/arch/x86/kernel/irq.c
index 83ec017..d833d1b 100644
--- a/arch/x86/kernel/irq.c
+++ b/arch/x86/kernel/irq.c
@@ -4,6 +4,7 @@
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/kernel_stat.h>
+#include <linux/of.h>
 #include <linux/seq_file.h>
 #include <linux/smp.h>
 #include <linux/ftrace.h>
@@ -275,6 +276,15 @@ void smp_x86_platform_ipi(struct pt_regs *regs)
 
 EXPORT_SYMBOL_GPL(vector_used_by_percpu_irq);
 
+#ifdef CONFIG_OF
+unsigned int irq_create_of_mapping(struct device_node *controller,
+		const u32 *intspec, unsigned int intsize)
+{
+	return intspec[0];
+}
+EXPORT_SYMBOL_GPL(irq_create_of_mapping);
+#endif
+
 #ifdef CONFIG_HOTPLUG_CPU
 /* A cpu has been removed from cpu_online_mask.  Reset irq affinities. */
 void fixup_irqs(void)
-- 
1.7.2.3
