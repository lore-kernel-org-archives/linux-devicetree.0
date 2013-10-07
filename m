From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 01/29] c6x: use boot_command_line instead of private c6x_command_line
Date: Mon,  7 Oct 2013 11:29:09 -0500
Message-ID: <1381163377-21044-2-git-send-email-robherring2@gmail.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381163377-21044-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Aurelien Jacquiot <a-jacquiot-l0cyMroinI0@public.gmane.org>, linux-c6x-dev-jPsnJVOj+W6hPH1hqNUYSQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Save some pointless copying of the kernel command line and just use
boot_command_line instead.

Also remove default_command_line as it is not referenced anywhere, and
the DT code already handles the default command line.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Salter <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Aurelien Jacquiot <a-jacquiot-l0cyMroinI0@public.gmane.org>
Cc: linux-c6x-dev-jPsnJVOj+W6hPH1hqNUYSQ@public.gmane.org
Reviewed-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/c6x/include/asm/setup.h  |  2 --
 arch/c6x/kernel/devicetree.c  |  2 +-
 arch/c6x/kernel/setup.c       | 11 +----------
 arch/c6x/kernel/vmlinux.lds.S |  6 ------
 4 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/arch/c6x/include/asm/setup.h b/arch/c6x/include/asm/setup.h
index ecead15..6968044 100644
--- a/arch/c6x/include/asm/setup.h
+++ b/arch/c6x/include/asm/setup.h
@@ -14,8 +14,6 @@
 #include <uapi/asm/setup.h>
 
 #ifndef __ASSEMBLY__
-extern char c6x_command_line[COMMAND_LINE_SIZE];
-
 extern int c6x_add_memory(phys_addr_t start, unsigned long size);
 
 extern unsigned long ram_start;
diff --git a/arch/c6x/kernel/devicetree.c b/arch/c6x/kernel/devicetree.c
index 9e15ab9..5e8c838 100644
--- a/arch/c6x/kernel/devicetree.c
+++ b/arch/c6x/kernel/devicetree.c
@@ -24,7 +24,7 @@ void __init early_init_devtree(void *params)
 	 * device-tree, including the platform type, initrd location and
 	 * size and more ...
 	 */
-	of_scan_flat_dt(early_init_dt_scan_chosen, c6x_command_line);
+	of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
 
 	/* Scan memory nodes and rebuild MEMBLOCKs */
 	of_scan_flat_dt(early_init_dt_scan_root, NULL);
diff --git a/arch/c6x/kernel/setup.c b/arch/c6x/kernel/setup.c
index f4e72bd..0e5a812 100644
--- a/arch/c6x/kernel/setup.c
+++ b/arch/c6x/kernel/setup.c
@@ -68,13 +68,6 @@ unsigned long ram_end;
 static unsigned long dma_start __initdata;
 static unsigned long dma_size __initdata;
 
-char c6x_command_line[COMMAND_LINE_SIZE];
-
-#if defined(CONFIG_CMDLINE_BOOL)
-static const char default_command_line[COMMAND_LINE_SIZE] __section(.cmdline) =
-	CONFIG_CMDLINE;
-#endif
-
 struct cpuinfo_c6x {
 	const char *cpu_name;
 	const char *cpu_voltage;
@@ -296,8 +289,6 @@ notrace void __init machine_init(unsigned long dt_ptr)
 	/* Do some early initialization based on the flat device tree */
 	early_init_devtree(fdt);
 
-	/* parse_early_param needs a boot_command_line */
-	strlcpy(boot_command_line, c6x_command_line, COMMAND_LINE_SIZE);
 	parse_early_param();
 }
 
@@ -309,7 +300,7 @@ void __init setup_arch(char **cmdline_p)
 	printk(KERN_INFO "Initializing kernel\n");
 
 	/* Initialize command line */
-	*cmdline_p = c6x_command_line;
+	*cmdline_p = boot_command_line;
 
 	memory_end = ram_end;
 	memory_end &= ~(PAGE_SIZE - 1);
diff --git a/arch/c6x/kernel/vmlinux.lds.S b/arch/c6x/kernel/vmlinux.lds.S
index 279d807..5a6e141 100644
--- a/arch/c6x/kernel/vmlinux.lds.S
+++ b/arch/c6x/kernel/vmlinux.lds.S
@@ -37,12 +37,6 @@ SECTIONS
 		_vectors_end = .;
 	}
 
-	. = ALIGN(0x1000);
-	.cmdline :
-	{
-		*(.cmdline)
-	}
-
 	/*
 	 * This section contains data which may be shared with other
 	 * cores. It needs to be a fixed offset from PAGE_OFFSET
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
