From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH/RFC 12/17] MIPS: Create a helper function for DT setup
Date: Mon, 20 Oct 2014 21:28:02 -0700
Message-ID: <1413865687-15255-13-git-send-email-cernekee@gmail.com>
References: <1413865687-15255-1-git-send-email-cernekee@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413865687-15255-1-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

A couple of platforms register two buses and call of_platform_populate().
Move this into a common function to reduce duplication.

Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/include/asm/prom.h |  1 +
 arch/mips/kernel/prom.c      | 18 ++++++++++++++++++
 arch/mips/lantiq/prom.c      | 11 +----------
 arch/mips/ralink/of.c        | 14 ++------------
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/mips/include/asm/prom.h b/arch/mips/include/asm/prom.h
index a9494c0..eaa2627 100644
--- a/arch/mips/include/asm/prom.h
+++ b/arch/mips/include/asm/prom.h
@@ -22,6 +22,7 @@ extern void device_tree_init(void);
 struct boot_param_header;
 
 extern void __dt_setup_arch(void *bph);
+extern int __dt_register_buses(const char *bus0, const char *bus1);
 
 #define dt_setup_arch(sym)						\
 ({									\
diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
index 5d39bb8..452d435 100644
--- a/arch/mips/kernel/prom.c
+++ b/arch/mips/kernel/prom.c
@@ -16,6 +16,7 @@
 #include <linux/debugfs.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
+#include <linux/of_platform.h>
 
 #include <asm/page.h>
 #include <asm/prom.h>
@@ -54,4 +55,21 @@ void __init __dt_setup_arch(void *bph)
 
 	mips_set_machine_name(of_flat_dt_get_machine_name());
 }
+
+int __init __dt_register_buses(const char *bus0, const char *bus1)
+{
+	static struct of_device_id of_ids[3];
+
+	if (!of_have_populated_dt())
+		panic("device tree not present");
+
+	strlcpy(of_ids[0].compatible, bus0, sizeof(of_ids[0].compatible));
+	strlcpy(of_ids[1].compatible, bus1, sizeof(of_ids[1].compatible));
+
+	if (of_platform_populate(NULL, of_ids, NULL, NULL))
+		panic("failed to populate DT");
+
+	return 0;
+}
+
 #endif
diff --git a/arch/mips/lantiq/prom.c b/arch/mips/lantiq/prom.c
index 7447d32..758970e 100644
--- a/arch/mips/lantiq/prom.c
+++ b/arch/mips/lantiq/prom.c
@@ -97,16 +97,7 @@ void __init prom_init(void)
 
 int __init plat_of_setup(void)
 {
-	static struct of_device_id of_ids[3];
-
-	if (!of_have_populated_dt())
-		panic("device tree not present");
-
-	strlcpy(of_ids[0].compatible, soc_info.compatible,
-		sizeof(of_ids[0].compatible));
-	strncpy(of_ids[1].compatible, "simple-bus",
-		sizeof(of_ids[1].compatible));
-	return of_platform_populate(NULL, of_ids, NULL, NULL);
+	return __dt_register_buses(soc_info.compatible, "simple-bus");
 }
 
 arch_initcall(plat_of_setup);
diff --git a/arch/mips/ralink/of.c b/arch/mips/ralink/of.c
index 7c4598c..f68115f 100644
--- a/arch/mips/ralink/of.c
+++ b/arch/mips/ralink/of.c
@@ -74,19 +74,9 @@ void __init plat_mem_setup(void)
 
 static int __init plat_of_setup(void)
 {
-	static struct of_device_id of_ids[3];
-	int len = sizeof(of_ids[0].compatible);
+	__dt_register_buses(soc_info.compatible, "palmbus");
 
-	if (!of_have_populated_dt())
-		panic("device tree not present");
-
-	strlcpy(of_ids[0].compatible, soc_info.compatible, len);
-	strlcpy(of_ids[1].compatible, "palmbus", len);
-
-	if (of_platform_populate(NULL, of_ids, NULL, NULL))
-		panic("failed to populate DT");
-
-	/* make sure ithat the reset controller is setup early */
+	/* make sure that the reset controller is setup early */
 	ralink_rst_init();
 
 	return 0;
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
