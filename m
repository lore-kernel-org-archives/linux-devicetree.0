From: dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 0/4] [RFC V4] Adding DTB to architecture independent vmlinux
Date: Thu, 11 Nov 2010 15:45:16 -0800
Message-ID: <20101111234257.16185.6076.stgit@localhost6.localdomain6>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: Dirk Brandewie <dirk.j.brandewie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Dirk Brandewie <dirk.j.brandewie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

The following series implements the ability to link device tree
blob(s) into the kernel image.

Changes since V3:
Added kernel command line option to pass a "compatible" string to
select the DTB for the platform.

Added function to find the compatible DTB in the kernel image if any

Added code to dtc to force the DTB to be modulo 32 bytes in size

Changed the alignment of the .dtb section

---

Dirk Brandewie (4):
      x86/of:  Support building device tree blob(s) into image.
      of: Add support for linking device tree blobs into vmlinux
      of/dtc: force dtb size to modulo 32 bytes
      of/fdt: add kernel command line option for dtb_compat string


 arch/x86/Kconfig                  |    6 ++++
 arch/x86/boot/dts/Kconfig         |    8 ++++++
 arch/x86/kernel/Makefile          |   11 ++++++++
 drivers/of/fdt.c                  |   52 +++++++++++++++++++++++++++++++++++++
 include/asm-generic/vmlinux.lds.h |   13 +++++++++
 include/linux/of_fdt.h            |    9 ++++++
 init/Kconfig                      |    7 +++++
 scripts/Makefile.lib              |   14 ++++++++++
 scripts/dtc/flattree.c            |    6 ++++
 9 files changed, 123 insertions(+), 3 deletions(-)
 create mode 100644 arch/x86/boot/dts/Kconfig

-- 
Signature

>From nobody Thu Nov 11 15:42:58 2010
Subject: [PATCH 1/4] x86/of: Support building device tree blob(s) into image.
Bcc: dirk.j.brandewie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
From: Dirk Brandewie <dirk.j.brandewie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Date: Thu, 11 Nov 2010 15:42:58 -0800
Message-ID: <20101111234258.16185.98317.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
In-Reply-To: <20101111234257.16185.6076.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
References: <20101111234257.16185.6076.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
User-Agent: StGit/0.15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This patch adds support for linking device tree blobs into vmlinux.
The blobs linked into the image is controlled via kernel config
variables

Signed-off-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/x86/Kconfig          |    6 +++++-
 arch/x86/boot/dts/Kconfig |    8 ++++++++
 arch/x86/kernel/Makefile  |   11 +++++++++++
 3 files changed, 24 insertions(+), 1 deletions(-)
 create mode 100644 arch/x86/boot/dts/Kconfig

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5904f38..62c195d 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -299,13 +299,17 @@ config X86_BIGSMP
 	---help---
 	  This option is needed for the systems that have more than 8 CPUs
 
-config X86_OF
+menuconfig X86_OF
 	bool "Support for device tree"
 	select OF
 	select OF_FLATTREE
 	---help---
 	  Device tree support on X86.
 
+if X86_OF
+source "arch/x86/boot/dts/Kconfig
+endif
+
 if X86_32
 config X86_EXTENDED_PLATFORM
 	bool "Support for extended (non-PC) x86 platforms"
diff --git a/arch/x86/boot/dts/Kconfig b/arch/x86/boot/dts/Kconfig
new file mode 100644
index 0000000..5380b6b
--- /dev/null
+++ b/arch/x86/boot/dts/Kconfig
@@ -0,0 +1,8 @@
+config CE4100_DTB
+       bool "Intel CE4100"
+       depends on X86_OF && KERNEL_DTB
+
+config TEST_DTB
+       bool "Test DTS"
+       depends on  X86_OF && KERNEL_DTB
+
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 586df14..cf15e8c 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -113,6 +113,17 @@ obj-$(CONFIG_X86_CHECK_BIOS_CORRUPTION) += check.o
 obj-$(CONFIG_SWIOTLB)			+= pci-swiotlb.o
 obj-$(CONFIG_X86_OF)			+= prom.o
 
+ifeq ($(CONFIG_KERNEL_DTB),y)
+obj-$(CONFIG_CE4100_DTB) += ce4100.dtb.o
+obj-$(CONFIG_TEST_DTB) += test.dtb.o
+endif
+
+dtstree	:= $(srctree)/arch/x86/boot/dts
+
+$(obj)/%.dtb: $(dtstree)/%.dts
+	$(call if_changed,dtc)
+
+
 ###
 # 64 bit specific files
 ifeq ($(CONFIG_X86_64),y)


>From nobody Thu Nov 11 15:42:58 2010
Subject: [PATCH 2/4] of: Add support for linking device tree blobs into vmlinux
Bcc: dirk.j.brandewie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
From: Dirk Brandewie <dirk.j.brandewie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Date: Thu, 11 Nov 2010 15:42:58 -0800
Message-ID: <20101111234258.16185.42704.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
In-Reply-To: <20101111234257.16185.6076.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
References: <20101111234257.16185.6076.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
User-Agent: StGit/0.15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This patch adds support for linking device tree blobs into
vmlinux. The device tree blobs are placed in the init.data
section.

Signed-off-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 include/asm-generic/vmlinux.lds.h |   13 ++++++++++++-
 init/Kconfig                      |    7 +++++++
 scripts/Makefile.lib              |   14 ++++++++++++++
 3 files changed, 33 insertions(+), 1 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index bd69d79..c8f600e 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -146,6 +146,16 @@
 #define TRACE_SYSCALLS()
 #endif
 
+#ifdef CONFIG_KERNEL_DTB
+#define KERNEL_DTB							\
+	. = ALIGN(32);							\
+	VMLINUX_SYMBOL(__dtb_start) = .;				\
+	*(.dtb)			       					\
+	VMLINUX_SYMBOL(__dtb_end) = .;
+#else
+#define KERNEL_DTB
+#endif
+
 /* .data section */
 #define DATA_DATA							\
 	*(.data)							\
@@ -468,7 +478,8 @@
 	MCOUNT_REC()							\
 	DEV_DISCARD(init.rodata)					\
 	CPU_DISCARD(init.rodata)					\
-	MEM_DISCARD(init.rodata)
+	MEM_DISCARD(init.rodata)					\
+	KERNEL_DTB
 
 #define INIT_TEXT							\
 	*(.init.text)							\
diff --git a/init/Kconfig b/init/Kconfig
index 88c1046..fddfc0f 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1083,6 +1083,13 @@ config PCI_QUIRKS
           bugs/quirks. Disable this only if your target machine is
           unaffected by PCI quirks.
 
+config KERNEL_DTB
+       bool "Support linking a device tree blob into vmlinux"
+       default n
+       help
+         This option provides support for adding a device tree blob(s)
+	 directly to vmlinux
+
 config SLUB_DEBUG
 	default y
 	bool "Enable SLUB debugging support" if EMBEDDED
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 4c72c11..c4487b2 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -200,6 +200,20 @@ quiet_cmd_gzip = GZIP    $@
 cmd_gzip = (cat $(filter-out FORCE,$^) | gzip -f -9 > $@) || \
 	(rm -f $@ ; false)
 
+# DTC
+#  ---------------------------------------------------------------------------
+$(obj)/%.dtb.S: $(obj)/%.dtb FORCE
+	@echo '.section .dtb,"a"' > $@
+	@echo '.global __dtb_$(*F)_begin' >> $@
+	@echo '__dtb_$(*F)_begin:' >> $@
+	@echo '.incbin "$<" ' >> $@
+	@echo '__dtb_$(*F)_end:' >> $@
+	@echo '.global __dtb_$(*F)_end' >> $@
+
+DTC = $(objtree)/scripts/dtc/dtc
+
+quiet_cmd_dtc = DTC	$@
+      cmd_dtc = $(DTC) -O dtb -o $(obj)/$*.dtb -b 0  $(dtstree)/$*.dts
 
 # Bzip2
 # ---------------------------------------------------------------------------


>From nobody Thu Nov 11 15:42:58 2010
Subject: [PATCH 3/4] of/dtc: force dtb size to modulo 32 bytes
Bcc: dirk.j.brandewie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
From: Dirk Brandewie <dirk.j.brandewie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Date: Thu, 11 Nov 2010 15:42:58 -0800
Message-ID: <20101111234258.16185.25714.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
In-Reply-To: <20101111234257.16185.6076.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
References: <20101111234257.16185.6076.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
User-Agent: StGit/0.15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This patch forces the size of the DTB to be modulo 32 bytes. This is
needed to support linking multiple DTB's into a single section in the
image. GCC wants structures to be 32 byte aligned without this change
DTB's after the first in the section may not be properly aligned so
the flat tree parsing code will fall over.

Signed-off-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 scripts/dtc/flattree.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/scripts/dtc/flattree.c b/scripts/dtc/flattree.c
index 76acd28..ccca797 100644
--- a/scripts/dtc/flattree.c
+++ b/scripts/dtc/flattree.c
@@ -358,6 +358,7 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int version)
 	struct data strbuf     = empty_data;
 	struct fdt_header fdt;
 	int padlen = 0;
+	int align_size;
 
 	for (i = 0; i < ARRAY_SIZE(version_table); i++) {
 		if (version_table[i].version == version)
@@ -395,6 +396,9 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int version)
 		fdt.totalsize = cpu_to_fdt32(tsize);
 	}
 
+	align_size = ALIGN(fdt32_to_cpu(fdt.totalsize), 32);
+	fdt.totalsize = cpu_to_fdt32(align_size);
+
 	/*
 	 * Assemble the blob: start with the header, add with alignment
 	 * the reserve buffer, add the reserve map terminating zeroes,
@@ -412,7 +416,7 @@ void dt_to_blob(FILE *f, struct boot_info *bi, int version)
 	 */
 	if (padlen > 0)
 		blob = data_append_zeroes(blob, padlen);
-
+	blob = data_append_align(blob, 32);
 	fwrite(blob.val, blob.len, 1, f);
 
 	if (ferror(f))


>From nobody Thu Nov 11 15:42:58 2010
Subject: [PATCH 4/4] of/fdt: add kernel command line option for dtb_compat
	string
Bcc: dirk.j.brandewie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
From: Dirk Brandewie <dirk.j.brandewie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Date: Thu, 11 Nov 2010 15:42:58 -0800
Message-ID: <20101111234258.16185.25736.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
In-Reply-To: <20101111234257.16185.6076.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
References: <20101111234257.16185.6076.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
User-Agent: StGit/0.15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Add support for specifying a "compatible" string from the kernel
command line and functions for the platform to find the compatible
blob present in the kernel image if any.

Signed-off-by: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/fdt.c       |   52 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_fdt.h |    9 ++++++++
 2 files changed, 61 insertions(+), 0 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index c1360e0..07fe4c6 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -604,3 +604,55 @@ void __init unflatten_device_tree(void)
 
 	pr_debug(" <- unflatten_device_tree()\n");
 }
+
+#ifndef MODULE
+#ifdef CONFIG_OF_FLATTREE
+static char dtb_compat_name[MAX_DTB_COMPAT_STR] = "";
+
+char __init *of_get_dtb_compatible_string(void)
+{
+	return dtb_compat_name;
+}
+
+#ifdef CONFIG_KERNEL_DTB
+extern char __dtb_start[];
+extern char __dtb_end[];
+
+void *of_find_compatible_dtb(char *name)
+{
+	void *rc = NULL;
+	char *hdr;
+	unsigned long node, root;
+	struct boot_param_header *blob, *orig_initial_boot_params;
+	
+	orig_initial_boot_params = initial_boot_params;
+	
+	if (__dtb_start != __dtb_end){
+		blob = (struct boot_param_header *)__dtb_start;
+		do{
+			node = ((unsigned long)blob) +  
+				be32_to_cpu(blob->off_dt_struct);
+			initial_boot_params = blob;
+			root = of_get_flat_dt_root();
+			if (of_flat_dt_is_compatible(root, name) > 0) {
+				rc = (void*) blob;
+				break;
+			}
+			blob = (unsigned long)blob+be32_to_cpu(blob->totalsize);
+		}while (blob < (struct boot_param_header *)__dtb_end);
+	}
+	if (rc == NULL)
+		initial_boot_params = orig_initial_boot_params;	
+	return rc;
+}
+#endif
+
+static int __init dtb_compat_setup(char *line)
+{
+	strncpy(dtb_compat_name, line, MAX_DTB_COMPAT_STR);
+	return 1;
+}
+
+__setup("dtb_compat=", dtb_compat_setup);
+#endif
+#endif
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 7bbf5b3..181e413 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -58,6 +58,8 @@ struct boot_param_header {
 };
 
 #if defined(CONFIG_OF_FLATTREE)
+#define MAX_DTB_COMPAT_STR 64
+
 /* TBD: Temporary export of fdt globals - remove when code fully merged */
 extern int __initdata dt_root_addr_cells;
 extern int __initdata dt_root_size_cells;
@@ -82,6 +84,13 @@ extern void early_init_dt_add_memory_arch(u64 base, u64 size);
 extern u64 early_init_dt_alloc_memory_arch(u64 size, u64 align);
 extern u64 dt_mem_next_cell(int s, __be32 **cellp);
 
+extern char *of_get_dtb_compatible_string(void);
+#ifdef CONFIG_KERNEL_DTB
+extern void *of_find_compatible_dtb(char *name);
+#else
+static inline void *of_find_compatible_dtb(char *name) {return 0;}
+
+#endif 
 /*
  * If BLK_DEV_INITRD, the fdt early init code will call this function,
  * to be provided by the arch code. start and end are specified as
