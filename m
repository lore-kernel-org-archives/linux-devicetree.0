From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/5] powerpc/83xx: factor out the common codes of setup arch functions
Date: Tue, 23 Aug 2016 10:06:58 +0800
Message-ID: <1471918019-19472-5-git-send-email-haokexin@gmail.com>
References: <1471918019-19472-1-git-send-email-haokexin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471918019-19472-1-git-send-email-haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Factor out the common codes of setup arch functions to a separate
function. It does make no sense to print a board specific info
in setup arch functions, so use a more general one.

For ASP8347E board, there is no pci device node. So it is safe to
invoke mpc83xx_setup_pci() in its setup arch function even there is
no such invocation in its original setup arch function.

Signed-off-by: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/powerpc/platforms/83xx/asp834x.c     | 4 +---
 arch/powerpc/platforms/83xx/km83xx.c      | 5 +----
 arch/powerpc/platforms/83xx/misc.c        | 8 ++++++++
 arch/powerpc/platforms/83xx/mpc830x_rdb.c | 5 +----
 arch/powerpc/platforms/83xx/mpc831x_rdb.c | 5 +----
 arch/powerpc/platforms/83xx/mpc832x_mds.c | 5 +----
 arch/powerpc/platforms/83xx/mpc832x_rdb.c | 5 +----
 arch/powerpc/platforms/83xx/mpc834x_itx.c | 5 +----
 arch/powerpc/platforms/83xx/mpc834x_mds.c | 5 +----
 arch/powerpc/platforms/83xx/mpc836x_mds.c | 5 +----
 arch/powerpc/platforms/83xx/mpc836x_rdk.c | 5 +----
 arch/powerpc/platforms/83xx/mpc837x_mds.c | 5 +----
 arch/powerpc/platforms/83xx/mpc837x_rdb.c | 5 +----
 arch/powerpc/platforms/83xx/mpc83xx.h     | 1 +
 arch/powerpc/platforms/83xx/sbc834x.c     | 5 +----
 15 files changed, 22 insertions(+), 51 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/asp834x.c b/arch/powerpc/platforms/83xx/asp834x.c
index 17e54339f8d9..575afd6eb36a 100644
--- a/arch/powerpc/platforms/83xx/asp834x.c
+++ b/arch/powerpc/platforms/83xx/asp834x.c
@@ -30,9 +30,7 @@
  */
 static void __init asp834x_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("asp834x_setup_arch()", 0);
-
+	mpc83xx_setup_arch();
 	mpc834x_usb_cfg();
 }
 
diff --git a/arch/powerpc/platforms/83xx/km83xx.c b/arch/powerpc/platforms/83xx/km83xx.c
index e7fbd6366abb..d8642a4afc74 100644
--- a/arch/powerpc/platforms/83xx/km83xx.c
+++ b/arch/powerpc/platforms/83xx/km83xx.c
@@ -130,10 +130,7 @@ static void __init mpc83xx_km_setup_arch(void)
 	struct device_node *np;
 #endif
 
-	if (ppc_md.progress)
-		ppc_md.progress("kmpbec83xx_setup_arch()", 0);
-
-	mpc83xx_setup_pci();
+	mpc83xx_setup_arch();
 
 #ifdef CONFIG_QUICC_ENGINE
 	np = of_find_node_by_name(NULL, "par_io");
diff --git a/arch/powerpc/platforms/83xx/misc.c b/arch/powerpc/platforms/83xx/misc.c
index 8899aa9d11f5..d75c9816a5c9 100644
--- a/arch/powerpc/platforms/83xx/misc.c
+++ b/arch/powerpc/platforms/83xx/misc.c
@@ -142,3 +142,11 @@ void __init mpc83xx_setup_pci(void)
 		mpc83xx_add_bridge(np);
 }
 #endif
+
+void __init mpc83xx_setup_arch(void)
+{
+	if (ppc_md.progress)
+		ppc_md.progress("mpc83xx_setup_arch()", 0);
+
+	mpc83xx_setup_pci();
+}
diff --git a/arch/powerpc/platforms/83xx/mpc830x_rdb.c b/arch/powerpc/platforms/83xx/mpc830x_rdb.c
index 040d5d085467..272c41c387b9 100644
--- a/arch/powerpc/platforms/83xx/mpc830x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc830x_rdb.c
@@ -27,10 +27,7 @@
  */
 static void __init mpc830x_rdb_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc830x_rdb_setup_arch()", 0);
-
-	mpc83xx_setup_pci();
+	mpc83xx_setup_arch();
 	mpc831x_usb_cfg();
 }
 
diff --git a/arch/powerpc/platforms/83xx/mpc831x_rdb.c b/arch/powerpc/platforms/83xx/mpc831x_rdb.c
index 40e0d8307b59..fd80fd570e67 100644
--- a/arch/powerpc/platforms/83xx/mpc831x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc831x_rdb.c
@@ -28,10 +28,7 @@
  */
 static void __init mpc831x_rdb_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc831x_rdb_setup_arch()", 0);
-
-	mpc83xx_setup_pci();
+	mpc83xx_setup_arch();
 	mpc831x_usb_cfg();
 }
 
diff --git a/arch/powerpc/platforms/83xx/mpc832x_mds.c b/arch/powerpc/platforms/83xx/mpc832x_mds.c
index cdfa47c4d394..bb7b25acf26f 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_mds.c
@@ -58,8 +58,7 @@ static void __init mpc832x_sys_setup_arch(void)
 	struct device_node *np;
 	u8 __iomem *bcsr_regs = NULL;
 
-	if (ppc_md.progress)
-		ppc_md.progress("mpc832x_sys_setup_arch()", 0);
+	mpc83xx_setup_arch();
 
 	/* Map BCSR area */
 	np = of_find_node_by_name(NULL, "bcsr");
@@ -71,8 +70,6 @@ static void __init mpc832x_sys_setup_arch(void)
 		of_node_put(np);
 	}
 
-	mpc83xx_setup_pci();
-
 #ifdef CONFIG_QUICC_ENGINE
 	if ((np = of_find_node_by_name(NULL, "par_io")) != NULL) {
 		par_io_init(np);
diff --git a/arch/powerpc/platforms/83xx/mpc832x_rdb.c b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
index 2ef03e7d248c..09d1bbf25b5d 100644
--- a/arch/powerpc/platforms/83xx/mpc832x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
@@ -197,10 +197,7 @@ static void __init mpc832x_rdb_setup_arch(void)
 	struct device_node *np;
 #endif
 
-	if (ppc_md.progress)
-		ppc_md.progress("mpc832x_rdb_setup_arch()", 0);
-
-	mpc83xx_setup_pci();
+	mpc83xx_setup_arch();
 
 #ifdef CONFIG_QUICC_ENGINE
 	if ((np = of_find_node_by_name(NULL, "par_io")) != NULL) {
diff --git a/arch/powerpc/platforms/83xx/mpc834x_itx.c b/arch/powerpc/platforms/83xx/mpc834x_itx.c
index 8fd0c1e8b182..73a5267df497 100644
--- a/arch/powerpc/platforms/83xx/mpc834x_itx.c
+++ b/arch/powerpc/platforms/83xx/mpc834x_itx.c
@@ -57,10 +57,7 @@ machine_device_initcall(mpc834x_itx, mpc834x_itx_declare_of_platform_devices);
  */
 static void __init mpc834x_itx_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc834x_itx_setup_arch()", 0);
-
-	mpc83xx_setup_pci();
+	mpc83xx_setup_arch();
 
 	mpc834x_usb_cfg();
 }
diff --git a/arch/powerpc/platforms/83xx/mpc834x_mds.c b/arch/powerpc/platforms/83xx/mpc834x_mds.c
index eeaee6123bb3..009cfc18a4ee 100644
--- a/arch/powerpc/platforms/83xx/mpc834x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc834x_mds.c
@@ -76,10 +76,7 @@ static int mpc834xemds_usb_cfg(void)
  */
 static void __init mpc834x_mds_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc834x_mds_setup_arch()", 0);
-
-	mpc83xx_setup_pci();
+	mpc83xx_setup_arch();
 
 	mpc834xemds_usb_cfg();
 }
diff --git a/arch/powerpc/platforms/83xx/mpc836x_mds.c b/arch/powerpc/platforms/83xx/mpc836x_mds.c
index dacf4c2df069..4fc3051c2b2e 100644
--- a/arch/powerpc/platforms/83xx/mpc836x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc836x_mds.c
@@ -66,8 +66,7 @@ static void __init mpc836x_mds_setup_arch(void)
 	struct device_node *np;
 	u8 __iomem *bcsr_regs = NULL;
 
-	if (ppc_md.progress)
-		ppc_md.progress("mpc836x_mds_setup_arch()", 0);
+	mpc83xx_setup_arch();
 
 	/* Map BCSR area */
 	np = of_find_node_by_name(NULL, "bcsr");
@@ -79,8 +78,6 @@ static void __init mpc836x_mds_setup_arch(void)
 		of_node_put(np);
 	}
 
-	mpc83xx_setup_pci();
-
 #ifdef CONFIG_QUICC_ENGINE
 	if ((np = of_find_node_by_name(NULL, "par_io")) != NULL) {
 		par_io_init(np);
diff --git a/arch/powerpc/platforms/83xx/mpc836x_rdk.c b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
index cf67ac93ddcb..93f024fd9b45 100644
--- a/arch/powerpc/platforms/83xx/mpc836x_rdk.c
+++ b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
@@ -31,10 +31,7 @@ machine_device_initcall(mpc836x_rdk, mpc83xx_declare_of_platform_devices);
 
 static void __init mpc836x_rdk_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc836x_rdk_setup_arch()", 0);
-
-	mpc83xx_setup_pci();
+	mpc83xx_setup_arch();
 }
 
 /*
diff --git a/arch/powerpc/platforms/83xx/mpc837x_mds.c b/arch/powerpc/platforms/83xx/mpc837x_mds.c
index 652b97d699c9..3b34cc1f626c 100644
--- a/arch/powerpc/platforms/83xx/mpc837x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc837x_mds.c
@@ -79,10 +79,7 @@ out:
  */
 static void __init mpc837x_mds_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc837x_mds_setup_arch()", 0);
-
-	mpc83xx_setup_pci();
+	mpc83xx_setup_arch();
 	mpc837xmds_usb_cfg();
 }
 
diff --git a/arch/powerpc/platforms/83xx/mpc837x_rdb.c b/arch/powerpc/platforms/83xx/mpc837x_rdb.c
index 667731d81676..0c55fa6af2d5 100644
--- a/arch/powerpc/platforms/83xx/mpc837x_rdb.c
+++ b/arch/powerpc/platforms/83xx/mpc837x_rdb.c
@@ -50,10 +50,7 @@ static void mpc837x_rdb_sd_cfg(void)
  */
 static void __init mpc837x_rdb_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("mpc837x_rdb_setup_arch()", 0);
-
-	mpc83xx_setup_pci();
+	mpc83xx_setup_arch();
 	mpc837x_usb_cfg();
 	mpc837x_rdb_sd_cfg();
 }
diff --git a/arch/powerpc/platforms/83xx/mpc83xx.h b/arch/powerpc/platforms/83xx/mpc83xx.h
index ad484199eff7..636eb9d0401a 100644
--- a/arch/powerpc/platforms/83xx/mpc83xx.h
+++ b/arch/powerpc/platforms/83xx/mpc83xx.h
@@ -86,5 +86,6 @@ extern void mpc83xx_setup_pci(void);
 #endif
 
 extern int mpc83xx_declare_of_platform_devices(void);
+extern void mpc83xx_setup_arch(void);
 
 #endif				/* __MPC83XX_H__ */
diff --git a/arch/powerpc/platforms/83xx/sbc834x.c b/arch/powerpc/platforms/83xx/sbc834x.c
index b867e88dfb0d..cb4bdabfdf1c 100644
--- a/arch/powerpc/platforms/83xx/sbc834x.c
+++ b/arch/powerpc/platforms/83xx/sbc834x.c
@@ -47,10 +47,7 @@
  */
 static void __init sbc834x_setup_arch(void)
 {
-	if (ppc_md.progress)
-		ppc_md.progress("sbc834x_setup_arch()", 0);
-
-	mpc83xx_setup_pci();
+	mpc83xx_setup_arch();
 }
 
 machine_device_initcall(sbc834x, mpc83xx_declare_of_platform_devices);
-- 
2.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
