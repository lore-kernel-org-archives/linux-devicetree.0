From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v7 16/22] ARM: mvebu: Remove the harcoded BootROM window
 allocation
Date: Tue,  9 Jul 2013 13:41:18 -0300
Message-ID: <1373388084-29520-17-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1373388084-29520-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373388084-29520-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The address decoding window to access the BootROM should not be
allocated programatically, but instead declared in the device tree.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/mach-mvebu/platsmp.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-mvebu/platsmp.c b/arch/arm/mach-mvebu/platsmp.c
index ce81d30..7be1ec2 100644
--- a/arch/arm/mach-mvebu/platsmp.c
+++ b/arch/arm/mach-mvebu/platsmp.c
@@ -21,6 +21,7 @@
 #include <linux/smp.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/mbus.h>
 #include <asm/cacheflush.h>
 #include <asm/smp_plat.h>
@@ -29,6 +30,9 @@
 #include "pmsu.h"
 #include "coherency.h"
 
+#define AXP_BOOTROM_BASE 0xfff00000
+#define AXP_BOOTROM_SIZE 0x100000
+
 void __init set_secondary_cpus_clock(void)
 {
 	int thiscpu;
@@ -114,10 +118,29 @@ static void __init armada_xp_smp_init_cpus(void)
 
 void __init armada_xp_smp_prepare_cpus(unsigned int max_cpus)
 {
+	struct device_node *node;
+	struct resource res;
+	int err;
+
 	set_secondary_cpus_clock();
 	flush_cache_all();
 	set_cpu_coherent(cpu_logical_map(smp_processor_id()), 0);
-	mvebu_mbus_add_window("bootrom", 0xfff00000, SZ_1M);
+
+	/*
+	 * In order to boot the secondary CPUs we need to ensure
+	 * the bootROM is mapped at the correct address.
+	 */
+	node = of_find_compatible_node(NULL, NULL, "marvell,bootrom");
+	if (!node)
+		panic("Cannot find 'marvell,bootrom' compatible node");
+
+	err = of_address_to_resource(node, 0, &res);
+	if (err < 0)
+		panic("Cannot get 'bootrom' node address");
+
+	if (res.start != AXP_BOOTROM_BASE||
+	    resource_size(&res) != AXP_BOOTROM_SIZE)
+		panic("The address for the BootROM is incorrect");
 }
 
 struct smp_operations armada_xp_smp_ops __initdata = {
-- 
1.8.1.5
