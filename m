From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: [PATCH v2 2/2] arch: arm: Show the serial number from devicetree in cpuinfo
Date: Fri, 17 Apr 2015 20:43:55 +0200
Message-ID: <1429296235-14123-2-git-send-email-contact@paulk.fr>
References: <1429296235-14123-1-git-send-email-contact@paulk.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429296235-14123-1-git-send-email-contact-W9ppeneeCTY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This grabs the serial number shown in cpuinfo from the serial-number devicetree
property in priority. When booting with ATAGs (and without device-tree), the
provided number is still shown instead.

Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
---
 arch/arm/include/asm/system_info.h |  1 +
 arch/arm/kernel/setup.c            | 21 +++++++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/system_info.h b/arch/arm/include/asm/system_info.h
index 720ea03..3860cbd40 100644
--- a/arch/arm/include/asm/system_info.h
+++ b/arch/arm/include/asm/system_info.h
@@ -17,6 +17,7 @@
 
 /* information about the system we're running on */
 extern unsigned int system_rev;
+extern const char *system_serial;
 extern unsigned int system_serial_low;
 extern unsigned int system_serial_high;
 extern unsigned int mem_fclk_21285;
diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 1d60beb..d1833ce 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -93,6 +93,9 @@ unsigned int __atags_pointer __initdata;
 unsigned int system_rev;
 EXPORT_SYMBOL(system_rev);
 
+const char *system_serial;
+EXPORT_SYMBOL(system_serial);
+
 unsigned int system_serial_low;
 EXPORT_SYMBOL(system_serial_low);
 
@@ -821,6 +824,21 @@ arch_initcall(customize_machine);
 
 static int __init init_machine_late(void)
 {
+#ifdef CONFIG_OF
+	unsigned long dt_root;
+	int size;
+
+	dt_root = of_get_flat_dt_root();
+
+	/* Scan for serial number */
+	system_serial = of_get_flat_dt_prop(dt_root, "serial-number", &size);
+#endif
+
+	if (!system_serial)
+		system_serial = kasprintf(GFP_KERNEL, "%08x%08x",
+					  system_serial_high,
+					  system_serial_low);
+
 	if (machine_desc->init_late)
 		machine_desc->init_late();
 	return 0;
@@ -1091,8 +1109,7 @@ static int c_show(struct seq_file *m, void *v)
 
 	seq_printf(m, "Hardware\t: %s\n", machine_name);
 	seq_printf(m, "Revision\t: %04x\n", system_rev);
-	seq_printf(m, "Serial\t\t: %08x%08x\n",
-		   system_serial_high, system_serial_low);
+	seq_printf(m, "Serial\t\t: %s\n", system_serial);
 
 	return 0;
 }
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
