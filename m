From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 2/8] arm/dt: allow bootmem reservation for device tree blob
	and initrd
Date: Tue, 18 Jan 2011 13:29:07 -0700
Message-ID: <20110118202907.13011.35108.stgit@localhost6.localdomain6>
References: <20110118195933.13011.56098.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110118195933.13011.56098.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Lennert Buijtenhek <buytenh-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds a function, arm_reserve_devtree(), to allow the device
tree code to reserve the memory used by the FDT blob.  It also adds
early_init_dt_setup_initrd() which is the hook used by the flat device
tree code to register the region of memory occupied by an initrd.

[based on original patch written by Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>]
Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 arch/arm/include/asm/setup.h |    2 ++
 arch/arm/mm/init.c           |   23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/arch/arm/include/asm/setup.h b/arch/arm/include/asm/setup.h
index f1e5a9b..0f3e0ac 100644
--- a/arch/arm/include/asm/setup.h
+++ b/arch/arm/include/asm/setup.h
@@ -221,6 +221,8 @@ extern struct meminfo meminfo;
 #define bank_phys_end(bank)	((bank)->start + (bank)->size)
 #define bank_phys_size(bank)	(bank)->size
 
+extern void arm_reserve_devtree(unsigned long start, unsigned long size);
+
 #endif  /*  __KERNEL__  */
 
 #endif
diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 5164069..28ccb21 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -71,6 +71,25 @@ static int __init parse_tag_initrd2(const struct tag *tag)
 
 __tagtable(ATAG_INITRD2, parse_tag_initrd2);
 
+#ifdef CONFIG_OF_FLATTREE
+#include <linux/of_fdt.h>
+
+static unsigned long phys_devtree_start __initdata = 0;
+static unsigned long phys_devtree_size __initdata = 0;
+
+void __init early_init_dt_setup_initrd_arch(unsigned long start, unsigned long end)
+{
+	phys_initrd_start = start;
+	phys_initrd_size = end - start + 1;
+}
+
+void __init arm_reserve_devtree(unsigned long start, unsigned long size)
+{
+	phys_devtree_start = start;
+	phys_devtree_size = size;
+}
+#endif /* CONFIG_OF_FLATTREE */
+
 /*
  * This keeps memory configuration data used by a couple memory
  * initialization functions, as well as show_mem() for the skipping
@@ -305,6 +324,10 @@ void __init arm_memblock_init(struct meminfo *mi, struct machine_desc *mdesc)
 		initrd_end = initrd_start + phys_initrd_size;
 	}
 #endif
+#ifdef CONFIG_OF_FLATTREE
+	if (phys_devtree_size)
+		memblock_reserve(phys_devtree_start, phys_devtree_size);
+#endif
 
 	arm_mm_memblock_reserve();
