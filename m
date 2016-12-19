From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 03/21] MIPS memblock: Alter traditional add_memory_region() method
Date: Mon, 19 Dec 2016 05:07:28 +0300
Message-ID: <1482113266-13207-4-git-send-email-fancer.lancer@gmail.com>
References: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1482113266-13207-1-git-send-email-fancer.lancer@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org, paul.burton@imgtec.com, rabinv@axis.com, matt.redfearn@imgtec.com, james.hogan@imgtec.com, alexander.sverdlin@nokia.com, robh+dt@kernel.org, frowand.list@gmail.com
Cc: Sergey.Semin@t-platforms.ru, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
List-Id: devicetree@vger.kernel.org

There is no safe and fast way to get rid of boot_mem_map usage in
the wide set of platform code. But it's luck, that the architecture
specific code doesn't make any direct changes in the boot_mem_map
structure. Additionally the platform specific code registers the
available memory using traditional add_memory_region() method.
It's obvious, that one needs to be modified adding regions to both
new memblock allocator and old boot_mem_map subsystem. In this way
most of architecture specific code won't be broken.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/kernel/setup.c | 51 ++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 084ba6c..9da6f8a 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -82,10 +82,19 @@ static struct resource data_resource = { .name = "Kernel data", };
 
 static void *detect_magic __initdata = detect_memory_region;
 
+/*
+ * General method to add RAM regions to the system
+ *
+ * NOTE Historically this method has been used to register memory blocks within
+ *      MIPS kernel code in the boot_mem_map array. So we need to support it
+ * up until it's discarded from platform-depended code.
+ * On the other hand it might be good to have it, since we can check regions
+ * before actually adding them
+ */
 void __init add_memory_region(phys_addr_t start, phys_addr_t size, long type)
 {
 	int x = boot_mem_map.nr_map;
-	int i;
+	int ret, i;
 
 	/*
 	 * If the region reaches the top of the physical address space, adjust
@@ -94,15 +103,51 @@ void __init add_memory_region(phys_addr_t start, phys_addr_t size, long type)
 	if (start + size - 1 == (phys_addr_t)ULLONG_MAX)
 		--size;
 
-	/* Sanity check */
+	/* Sanity check the region */
 	if (start + size < start) {
 		pr_warn("Trying to add an invalid memory region, skipped\n");
 		return;
 	}
 
+	/* Make sure the type is supported */
+	if (type != BOOT_MEM_RAM && type != BOOT_MEM_INIT_RAM &&
+	    type != BOOT_MEM_ROM_DATA && type != BOOT_MEM_RESERVED) {
+		pr_warn("Invalid type of memory region, skipped\n");
+		return;
+	}
+
 	/*
-	 * Try to merge with existing entry, if any.
+	 * According to the request_resource logic RAM, INIT and ROM shouldn't
+	 * intersect each other but being subset of one memory space
 	 */
+	if (type != BOOT_MEM_RESERVED && memblock_is_memory(start)) {
+		pr_warn("Drop already added memory region %08zx @ %pa\n",
+			(size_t)size, &start);
+		return;
+	}
+
+	/*
+	 * Add the region to the memblock allocator. Reserved regions should be
+	 * in the memory as well to be actually reserved.
+	 */
+	ret = memblock_add_node(start, size, 0);
+	if (ret < 0) {
+		pr_err("Could't add memblock %08zx @ %pa\n",
+			(size_t)size, &start);
+		return;
+	}
+
+	/* Reserve memory region passed with the corresponding flags */
+	if (type != BOOT_MEM_RAM) {
+		ret = memblock_reserve(start, size);
+		if (ret < 0) {
+			pr_err("Could't reserve memblock %08zx @ %pa\n",
+				(size_t)size, &start);
+			return;
+		}
+	}
+
+	/* Try to combine with existing entry, if any. */
 	for (i = 0; i < boot_mem_map.nr_map; i++) {
 		struct boot_mem_map_entry *entry = boot_mem_map.map + i;
 		unsigned long top;
-- 
2.6.6
