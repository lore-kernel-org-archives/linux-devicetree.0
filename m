From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH v2 20/29] arm: set initrd_start/initrd_end for fdt scan
Date: Mon,  7 Oct 2013 11:29:28 -0500
Message-ID: <1381163377-21044-21-git-send-email-robherring2@gmail.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

In order to unify the initrd scanning for DT across architectures, make
arm set initrd_start and initrd_end instead of the physical addresses.
This is aligned with all other architectures.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Acked-by: Grant Likely <grant.likely@linaro.org>
---
 arch/arm/mm/init.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index febaee7..9eeb1cd 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -77,11 +77,11 @@ static int __init parse_tag_initrd2(const struct tag *tag)
 
 __tagtable(ATAG_INITRD2, parse_tag_initrd2);
 
-#ifdef CONFIG_OF_FLATTREE
+#if defined(CONFIG_OF_FLATTREE) && defined(CONFIG_BLK_DEV_INITRD)
 void __init early_init_dt_setup_initrd_arch(u64 start, u64 end)
 {
-	phys_initrd_start = start;
-	phys_initrd_size = end - start;
+	initrd_start = (unsigned long)__va(start);
+	initrd_end = (unsigned long)__va(end);
 }
 #endif /* CONFIG_OF_FLATTREE */
 
@@ -351,6 +351,11 @@ void __init arm_memblock_init(struct meminfo *mi,
 	memblock_reserve(__pa(_stext), _end - _stext);
 #endif
 #ifdef CONFIG_BLK_DEV_INITRD
+	/* FDT scan will populate initrd_start */
+	if (initrd_start) {
+		phys_initrd_start = __virt_to_phys(initrd_start);
+		phys_initrd_size = initrd_end - initrd_start;
+	}
 	if (phys_initrd_size &&
 	    !memblock_is_region_memory(phys_initrd_start, phys_initrd_size)) {
 		pr_err("INITRD: 0x%08llx+0x%08lx is not a memory region - disabling initrd\n",
-- 
1.8.1.2
