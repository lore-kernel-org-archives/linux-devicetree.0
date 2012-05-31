From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [RFC 1/2] com32: Add device tree support
Date: Thu, 31 May 2012 17:41:35 +0200
Message-ID: <1338478896-11417-2-git-send-email-thierry.reding@avionic-design.de>
References: <1338478896-11417-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1338478896-11417-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: syslinux-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This commit adds support for passing a Flattened Device Tree (FDT) blob
to the Linux kernel.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 com32/gfxboot/gfxboot.c         |    2 +-
 com32/include/syslinux/linux.h  |   25 +++++++++++++++++++++++-
 com32/lib/Makefile              |    4 +++-
 com32/lib/syslinux/fdt.c        |   28 ++++++++++++++++++++++++++
 com32/lib/syslinux/load_linux.c |   41 ++++++++++++++++++++++++++++++++++++++-
 com32/lua/src/syslinux.c        |    4 ++--
 6 files changed, 98 insertions(+), 6 deletions(-)
 create mode 100644 com32/lib/syslinux/fdt.c

diff --git a/com32/gfxboot/gfxboot.c b/com32/gfxboot/gfxboot.c
index 35d180a..aa05caf 100644
--- a/com32/gfxboot/gfxboot.c
+++ b/com32/gfxboot/gfxboot.c
@@ -962,7 +962,7 @@ void boot_entry(menu_t *menu_ptr, char *arg)
 
   gfx_done();
 
-  syslinux_boot_linux(kernel, kernel_size, initrd, arg);
+  syslinux_boot_linux(kernel, kernel_size, initrd, NULL, arg);
 }
 
 
diff --git a/com32/include/syslinux/linux.h b/com32/include/syslinux/linux.h
index 754d1b6..6a5c2db 100644
--- a/com32/include/syslinux/linux.h
+++ b/com32/include/syslinux/linux.h
@@ -51,8 +51,26 @@ struct initramfs {
 };
 #define INITRAMFS_MAX_ALIGN	4096
 
+struct fdt {
+	void *data;
+	size_t len;
+};
+#define DEVICETREE_MAX_ALIGN	4096
+
+struct setup_data {
+	uint64_t next;
+	uint32_t type;
+	uint32_t len;
+	uint8_t data[0];
+};
+
+#define SETUP_NONE	0
+#define SETUP_E820_EXT	1
+#define SETUP_DTB	2
+
 int syslinux_boot_linux(void *kernel_buf, size_t kernel_size,
-			struct initramfs *initramfs, char *cmdline);
+			struct initramfs *initramfs, struct fdt *fdt,
+			char *cmdline);
 
 /* Initramfs manipulation functions */
 
@@ -70,4 +88,9 @@ int initramfs_load_file(struct initramfs *ihead, const char *src_filename,
 int initramfs_add_trailer(struct initramfs *ihead);
 int initramfs_load_archive(struct initramfs *ihead, const char *filename);
 
+/* Device Tree manipulation functions */
+
+struct fdt *fdt_init(void);
+int fdt_load(struct fdt *fdt, const char *filename);
+
 #endif /* _SYSLINUX_LINUX_H */
diff --git a/com32/lib/Makefile b/com32/lib/Makefile
index eace321..a4959f6 100644
--- a/com32/lib/Makefile
+++ b/com32/lib/Makefile
@@ -129,7 +129,9 @@ LIBOBJS = \
 	syslinux/video/fontquery.o syslinux/video/forcetext.o		\
 	syslinux/video/reportmode.o					\
 	\
-	syslinux/disk.o
+	syslinux/disk.o							\
+	\
+	syslinux/fdt.o
 
 # These are the objects which are also imported into the core
 LIBCOREOBJS = 	\
diff --git a/com32/lib/syslinux/fdt.c b/com32/lib/syslinux/fdt.c
new file mode 100644
index 0000000..1bcd90b
--- /dev/null
+++ b/com32/lib/syslinux/fdt.c
@@ -0,0 +1,28 @@
+#include <stdlib.h>
+#include <syslinux/linux.h>
+#include <syslinux/loadfile.h>
+
+struct fdt *fdt_init(void)
+{
+	struct fdt *fdt;
+
+	fdt = calloc(1, sizeof(*fdt));
+	if (!fdt)
+		return NULL;
+
+	return fdt;
+}
+
+int fdt_load(struct fdt *fdt, const char *filename)
+{
+	void *data;
+	size_t len;
+
+	if (loadfile(filename, &data, &len))
+		return -1;
+
+	fdt->data = data;
+	fdt->len = len;
+
+	return 0;
+}
diff --git a/com32/lib/syslinux/load_linux.c b/com32/lib/syslinux/load_linux.c
index 45cd696..b68aef7 100644
--- a/com32/lib/syslinux/load_linux.c
+++ b/com32/lib/syslinux/load_linux.c
@@ -180,7 +180,8 @@ static int map_initramfs(struct syslinux_movelist **fraglist,
 }
 
 int syslinux_boot_linux(void *kernel_buf, size_t kernel_size,
-			struct initramfs *initramfs, char *cmdline)
+			struct initramfs *initramfs, struct fdt *fdt,
+			char *cmdline)
 {
     struct linux_header hdr, *whdr;
     size_t real_mode_size, prot_mode_size;
@@ -449,6 +450,44 @@ int syslinux_boot_linux(void *kernel_buf, size_t kernel_size,
 	}
     }
 
+    if (fdt && fdt->len > 0) {
+	const addr_t align_mask = DEVICETREE_MAX_ALIGN - 1;
+	struct syslinux_memmap *ml;
+	struct setup_data *setup;
+	addr_t best_addr = 0;
+	size_t size;
+
+	size = sizeof(*setup) + fdt->len;
+
+	setup = malloc(size);
+	if (!setup)
+		goto bail;
+
+	setup->next = 0;
+	setup->type = SETUP_DTB;
+	setup->len = fdt->len;
+	memcpy(setup->data, fdt->data, fdt->len);
+
+	for (ml = amap; ml->type != SMT_END; ml = ml->next) {
+		addr_t adj_start = (ml->start + align_mask) & ~align_mask;
+		addr_t adj_end = ml->next->start & ~align_mask;
+
+		if (ml->type == SMT_FREE && adj_end - adj_start >= size)
+			best_addr = (adj_end - size) & ~align_mask;
+	}
+
+	if (!best_addr)
+		goto bail;
+
+	whdr->setup_data = best_addr;
+
+	if (syslinux_add_memmap(&amap, best_addr, size, SMT_ALLOC))
+	    goto bail;
+
+	if (syslinux_add_movelist(&fraglist, best_addr, (addr_t) setup, size))
+	    goto bail;
+    }
+
     /* Set up the registers on entry */
     memset(&regs, 0, sizeof regs);
     regs.es = regs.ds = regs.ss = regs.fs = regs.gs = real_mode_base >> 4;
diff --git a/com32/lua/src/syslinux.c b/com32/lua/src/syslinux.c
index 9b207db..af5db83 100644
--- a/com32/lua/src/syslinux.c
+++ b/com32/lua/src/syslinux.c
@@ -278,7 +278,7 @@ static int sl_boot_linux(lua_State * L)
        msleep(10000);
      */
 
-    ret = syslinux_boot_linux(kernel_data, kernel_len, initramfs, newcmdline);
+    ret = syslinux_boot_linux(kernel_data, kernel_len, initramfs, NULL, newcmdline);
 
     printf("syslinux_boot_linux returned %d\n", ret);
 
@@ -405,7 +405,7 @@ static int sl_boot_it(lua_State * L)
     (void)mem_limit;
 
     return syslinux_boot_linux(kernel->data, kernel->size,
-			       initramfs, (char *)cmdline);
+			       initramfs, NULL, (char *)cmdline);
 }
 
 static int sl_derivative(lua_State * L)
-- 
1.7.10.2
