From: klightspeed@killerwolves.net
Subject: [PATCH] ARM: parameter initrd must override FDT initrd
Date: Sat, 11 Jan 2014 10:03:58 +1000
Message-ID: <2b2c04$57762f@icp-osb-irony-out4.iinet.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, klightspeed@killerwolves.net
List-Id: devicetree@vger.kernel.org

The initrd_start and initrd_end as set by FDT was overriding
the phys_initrd_start and phys_initrd_size set by the initrd=
kernel parameter.  This patch will ignore the initrd_start
and initrd_end set earlier if phys_initrd_start and
phys_initrd_size (as set by the initrd= parameter) are set.

Signed-off-by: Ben Peddell <klightspeed@killerwolves.net>
---
 arch/arm/mm/init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 1f7b19a..819c539 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -345,10 +345,11 @@ void __init arm_memblock_init(struct meminfo *mi,
 #endif
 #ifdef CONFIG_BLK_DEV_INITRD
 	/* FDT scan will populate initrd_start */
-	if (initrd_start) {
+	if (initrd_start && !phys_initrd_size) {
 		phys_initrd_start = __virt_to_phys(initrd_start);
 		phys_initrd_size = initrd_end - initrd_start;
 	}
+	initrd_start = initrd_end = 0;
 	if (phys_initrd_size &&
 	    !memblock_is_region_memory(phys_initrd_start, phys_initrd_size)) {
 		pr_err("INITRD: 0x%08llx+0x%08lx is not a memory region - disabling initrd\n",
-- 
1.8.3.2
