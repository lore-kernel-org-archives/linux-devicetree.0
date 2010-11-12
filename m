From: dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 2/4] of: Add support for linking device tree blobs into vmlinux
Date: Thu, 11 Nov 2010 16:03:48 -0800
Message-ID: <7d0a9d70f1616340115c187547006c76b0135ca7.1289520079.git.dirk.brandewie@gmail.com>
References: <cover.1289520079.git.dirk.brandewie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <cover.1289520079.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1289520079.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1289520079.git.dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

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
-- 
1.7.2.3
