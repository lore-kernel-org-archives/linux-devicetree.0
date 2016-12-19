From: Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH 06/21] MIPS memblock: Alter kexec-crashkernel parameters parser
Date: Mon, 19 Dec 2016 05:07:31 +0300
Message-ID: <1482113266-13207-7-git-send-email-fancer.lancer@gmail.com>
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

Memblock API can be successfully used to verify whether crashkernel
memory region belongs to low memory, then it can be reserved within
memblock allocator.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/kernel/setup.c | 105 ++++++++++++++---------------
 1 file changed, 52 insertions(+), 53 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index d2f38ac..cc6d06b 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -426,6 +426,55 @@ static void __init mips_reserve_initrd_mem(void) { }
 
 #endif
 
+#ifdef CONFIG_KEXEC
+/*
+ * Parse passed crashkernel parameter and reserve corresponding memory
+ */
+static void __init mips_parse_crashkernel(void)
+{
+	unsigned long long total_mem;
+	unsigned long long crash_size, crash_base;
+	int ret;
+
+	/* Parse crachkernel parameter */
+	total_mem = memblock_phys_mem_size();
+	ret = parse_crashkernel(boot_command_line, total_mem,
+				&crash_size, &crash_base);
+	if (ret != 0 || crash_size <= 0)
+		return;
+
+	crashk_res.start = crash_base;
+	crashk_res.end	 = crash_base + crash_size - 1;
+
+	/* Check whether the region belogs to lowmem and valid */
+	if (!is_lowmem_and_valid("Crashkernel", crash_base, crash_size))
+		return;
+
+	/* Reserve crashkernel resource */
+	memblock_reserve(crash_base, crash_size);
+}
+
+/*
+ * Reserve crashkernel memory within passed RAM resource
+ */
+static void __init request_crashkernel(struct resource *res)
+{
+	int ret;
+
+	ret = request_resource(res, &crashk_res);
+	if (!ret)
+		pr_info("Reserving %ldMB of memory at %ldMB for crashkernel\n",
+			(unsigned long)((crashk_res.end -
+					 crashk_res.start + 1) >> 20),
+			(unsigned long)(crashk_res.start  >> 20));
+}
+#else /* !CONFIG_KEXEC */
+
+static void __init mips_parse_crashkernel(void) { }
+static void __init request_crashkernel(struct resource *res) { }
+
+#endif /* !CONFIG_KEXEC */
+
 /*
  * Initialize the bootmem allocator. It also setup initrd related data
  * if needed.
@@ -450,6 +499,9 @@ static void __init bootmem_init(void)
 	/* Check and reserve memory occupied by initrd */
 	mips_reserve_initrd_mem();
 
+	/* Parse crashkernel parameter */
+	mips_parse_crashkernel();
+
 	reserved_end = (unsigned long) PFN_UP(__pa_symbol(&_end));
 
 	/*
@@ -717,52 +769,6 @@ static void __init arch_mem_addpart(phys_addr_t mem, phys_addr_t end, int type)
 	add_memory_region(mem, size, type);
 }
 
-#ifdef CONFIG_KEXEC
-static inline unsigned long long get_total_mem(void)
-{
-	unsigned long long total;
-
-	total = max_pfn - min_low_pfn;
-	return total << PAGE_SHIFT;
-}
-
-static void __init mips_parse_crashkernel(void)
-{
-	unsigned long long total_mem;
-	unsigned long long crash_size, crash_base;
-	int ret;
-
-	total_mem = get_total_mem();
-	ret = parse_crashkernel(boot_command_line, total_mem,
-				&crash_size, &crash_base);
-	if (ret != 0 || crash_size <= 0)
-		return;
-
-	crashk_res.start = crash_base;
-	crashk_res.end	 = crash_base + crash_size - 1;
-}
-
-static void __init request_crashkernel(struct resource *res)
-{
-	int ret;
-
-	ret = request_resource(res, &crashk_res);
-	if (!ret)
-		pr_info("Reserving %ldMB of memory at %ldMB for crashkernel\n",
-			(unsigned long)((crashk_res.end -
-					 crashk_res.start + 1) >> 20),
-			(unsigned long)(crashk_res.start  >> 20));
-}
-#else /* !defined(CONFIG_KEXEC)		*/
-static void __init mips_parse_crashkernel(void)
-{
-}
-
-static void __init request_crashkernel(struct resource *res)
-{
-}
-#endif /* !defined(CONFIG_KEXEC)  */
-
 #define USE_PROM_CMDLINE	IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER)
 #define USE_DTB_CMDLINE		IS_ENABLED(CONFIG_MIPS_CMDLINE_FROM_DTB)
 #define EXTEND_WITH_PROM	IS_ENABLED(CONFIG_MIPS_CMDLINE_DTB_EXTEND)
@@ -836,13 +842,6 @@ static void __init arch_mem_init(char **cmdline_p)
 	}
 #endif
 
-	mips_parse_crashkernel();
-#ifdef CONFIG_KEXEC
-	if (crashk_res.start != crashk_res.end)
-		reserve_bootmem(crashk_res.start,
-				crashk_res.end - crashk_res.start + 1,
-				BOOTMEM_DEFAULT);
-#endif
 	device_tree_init();
 	sparse_init();
 	plat_swiotlb_setup();
-- 
2.6.6
