From: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Subject: [RFC PATCH v2 06/12] MIPS: Octeon: Add a irq_create_of_mapping()
	implementation.
Date: Fri,  4 Mar 2011 11:42:18 -0800
Message-ID: <1299267744-17278-7-git-send-email-ddaney@caviumnetworks.com>
References: <1299267744-17278-1-git-send-email-ddaney@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1299267744-17278-1-git-send-email-ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is needed for Octeon to use the Device Tree.

Signed-off-by: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
---
 arch/mips/cavium-octeon/octeon-irq.c |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
index b365710..b0a9261 100644
--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -8,7 +8,9 @@
 
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
+#include <linux/module.h>
 #include <linux/percpu.h>
+#include <linux/of_irq.h>
 #include <linux/irq.h>
 #include <linux/smp.h>
 
@@ -64,6 +66,29 @@ static void __init octeon_irq_set_ciu_mapping(int irq, int line, int bit,
 	octeon_irq_ciu_to_irq[line][bit] = irq;
 }
 
+/*
+ * irq_create_of_mapping - Hook to resolve OF irq specifier into a Linux irq#
+ *
+ * Octeon irq maps are a pair of indexes.  The first selects either
+ * ciu0 or ciu1, the second is the bit within the ciu register.
+ */
+unsigned int irq_create_of_mapping(struct device_node *controller,
+				   const u32 *intspec, unsigned int intsize)
+{
+	int ciu, bit;
+	unsigned int irq = 0;
+
+	ciu = be32_to_cpup(intspec);
+	bit = be32_to_cpup(intspec + 1);
+
+	if (ciu < 8 && bit < 64)
+		irq = octeon_irq_ciu_to_irq[ciu][bit];
+
+	return irq;
+}
+EXPORT_SYMBOL_GPL(irq_create_of_mapping);
+
+
 static int octeon_coreid_for_cpu(int cpu)
 {
 #ifdef CONFIG_SMP
-- 
1.7.2.3
