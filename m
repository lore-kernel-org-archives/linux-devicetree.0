From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v5 05/37] MIPS: JZ4740: require & include DT
Date: Sun, 24 May 2015 16:11:15 +0100
Message-ID: <1432480307-23789-6-git-send-email-paul.burton@imgtec.com>
References: <1432480307-23789-1-git-send-email-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432480307-23789-1-git-send-email-paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Require a DT for JZ4740 based systems, and add a stub one for the
qi_lb60 (Ben NanoNote) board. Devices will be migrated to being probed
via this DT over time.

Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
---

Changes in v5: None
Changes in v4: None
Changes in v3:
- Rebase.

Changes in v2: None

 arch/mips/Kconfig                      |  2 ++
 arch/mips/boot/dts/Makefile            |  1 +
 arch/mips/boot/dts/ingenic/Makefile    |  9 +++++++++
 arch/mips/boot/dts/ingenic/jz4740.dtsi |  5 +++++
 arch/mips/boot/dts/ingenic/qi_lb60.dts |  7 +++++++
 arch/mips/jz4740/setup.c               | 19 +++++++++++++++++++
 6 files changed, 43 insertions(+)
 create mode 100644 arch/mips/boot/dts/ingenic/Makefile
 create mode 100644 arch/mips/boot/dts/ingenic/jz4740.dtsi
 create mode 100644 arch/mips/boot/dts/ingenic/qi_lb60.dts

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4a3acca..741e364 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -299,6 +299,8 @@ config MACH_INGENIC
 	select SYS_HAS_EARLY_PRINTK
 	select HAVE_CLK
 	select GENERIC_IRQ_CHIP
+	select BUILTIN_DTB
+	select USE_OF
 
 config LANTIQ
 	bool "Lantiq based platforms"
diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 5d95e4b..9c31b30 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -1,5 +1,6 @@
 dts-dirs	+= brcm
 dts-dirs	+= cavium-octeon
+dts-dirs	+= ingenic
 dts-dirs	+= lantiq
 dts-dirs	+= mti
 dts-dirs	+= netlogic
diff --git a/arch/mips/boot/dts/ingenic/Makefile b/arch/mips/boot/dts/ingenic/Makefile
new file mode 100644
index 0000000..0c84f0b
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/Makefile
@@ -0,0 +1,9 @@
+dtb-$(CONFIG_JZ4740_QI_LB60)	+= qi_lb60.dtb
+
+obj-y				+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
+
+# Force kbuild to make empty built-in.o if necessary
+obj-				+= dummy.o
+
+always				:= $(dtb-y)
+clean-files			:= *.dtb *.dtb.S
diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dts/ingenic/jz4740.dtsi
new file mode 100644
index 0000000..c538691f
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -0,0 +1,5 @@
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "ingenic,jz4740";
+};
diff --git a/arch/mips/boot/dts/ingenic/qi_lb60.dts b/arch/mips/boot/dts/ingenic/qi_lb60.dts
new file mode 100644
index 0000000..0c0f639
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/qi_lb60.dts
@@ -0,0 +1,7 @@
+/dts-v1/;
+
+#include "jz4740.dtsi"
+
+/ {
+	compatible = "qi,lb60", "ingenic,jz4740";
+};
diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
index ef796f9..d6bb7a3 100644
--- a/arch/mips/jz4740/setup.c
+++ b/arch/mips/jz4740/setup.c
@@ -17,8 +17,11 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/of_fdt.h>
+#include <linux/of_platform.h>
 
 #include <asm/bootinfo.h>
+#include <asm/prom.h>
 
 #include <asm/mach-jz4740/base.h>
 
@@ -53,8 +56,24 @@ void __init plat_mem_setup(void)
 {
 	jz4740_reset_init();
 	jz4740_detect_mem();
+	__dt_setup_arch(__dtb_start);
 }
 
+void __init device_tree_init(void)
+{
+	if (!initial_boot_params)
+		return;
+
+	unflatten_and_copy_device_tree();
+}
+
+static int __init populate_machine(void)
+{
+	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
+	return 0;
+}
+arch_initcall(populate_machine);
+
 const char *get_system_type(void)
 {
 	return "JZ4740";
-- 
2.4.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
