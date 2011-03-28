From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 6/6] Add CONFIG_OF_LIBFDT to more boards.
Date: Mon, 28 Mar 2011 13:59:07 -0600
Message-ID: <20110328195906.10235.68517.stgit@ponder>
References: <20110328195231.10235.36716.stgit@ponder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110328195231.10235.36716.stgit@ponder>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, John Rigby <john.rigby-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, wd-ynQEQJNshbs@public.gmane.org, vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

The following boards gain device tree support with this patch:

ca9x4_ct_vxp - Versatile Express

i.mx5 boards:
efikamx
mx51evk
mx53evk

OMAP boards:
devkit8000
igep0020
igep0030
omap3_overo
omap3_pandora
omap4_sdp3430
omap3_zoom1
omap3_zoom2
omap4_panda
omap4_sdp4430

Tegra boards:
Harmony

Signed-off-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 include/configs/ca9x4_ct_vxp.h  |    2 ++
 include/configs/devkit8000.h    |    2 ++
 include/configs/efikamx.h       |    2 ++
 include/configs/igep0020.h      |    2 ++
 include/configs/igep0030.h      |    2 ++
 include/configs/mx51evk.h       |    2 ++
 include/configs/mx53evk.h       |    2 ++
 include/configs/omap3_overo.h   |    2 ++
 include/configs/omap3_pandora.h |    2 ++
 include/configs/omap3_sdp3430.h |    2 ++
 include/configs/omap3_zoom1.h   |    2 ++
 include/configs/omap3_zoom2.h   |    2 ++
 include/configs/omap4_panda.h   |    2 ++
 include/configs/omap4_sdp4430.h |    2 ++
 include/configs/tegra2-common.h |    1 +
 15 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/include/configs/ca9x4_ct_vxp.h b/include/configs/ca9x4_ct_vxp.h
index 63f003d..8f52961 100644
--- a/include/configs/ca9x4_ct_vxp.h
+++ b/include/configs/ca9x4_ct_vxp.h
@@ -43,6 +43,8 @@
 #define CONFIG_L2_OFF			1
 #define CONFIG_INITRD_TAG		1
 
+#define CONFIG_OF_LIBFDT		1
+
 /* Size of malloc() pool */
 #define CONFIG_SYS_MALLOC_LEN		(CONFIG_ENV_SIZE + 128 * 1024)
 
diff --git a/include/configs/devkit8000.h b/include/configs/devkit8000.h
index d898b77..a8f5350 100644
--- a/include/configs/devkit8000.h
+++ b/include/configs/devkit8000.h
@@ -61,6 +61,8 @@
 #define CONFIG_INITRD_TAG		1
 #define CONFIG_REVISION_TAG		1
 
+#define CONFIG_OF_LIBFDT		1
+
 /* Size of malloc() pool */
 #define CONFIG_ENV_SIZE			(128 << 10)	/* 128 KiB */
 						/* Sector */
diff --git a/include/configs/efikamx.h b/include/configs/efikamx.h
index 1424347..571c3cb 100644
--- a/include/configs/efikamx.h
+++ b/include/configs/efikamx.h
@@ -66,6 +66,8 @@
 #define CONFIG_SETUP_MEMORY_TAGS
 #define CONFIG_INITRD_TAG
 
+#define CONFIG_OF_LIBFDT		1
+
 /*
  * Size of malloc() pool
  */
diff --git a/include/configs/igep0020.h b/include/configs/igep0020.h
index c19ecc0..930d50c 100644
--- a/include/configs/igep0020.h
+++ b/include/configs/igep0020.h
@@ -53,6 +53,8 @@
 #define CONFIG_INITRD_TAG		1
 #define CONFIG_REVISION_TAG		1
 
+#define CONFIG_OF_LIBFDT		1
+
 /*
  * NS16550 Configuration
  */
diff --git a/include/configs/igep0030.h b/include/configs/igep0030.h
index 1325bfa..dfccffc 100644
--- a/include/configs/igep0030.h
+++ b/include/configs/igep0030.h
@@ -53,6 +53,8 @@
 #define CONFIG_INITRD_TAG		1
 #define CONFIG_REVISION_TAG		1
 
+#define CONFIG_OF_LIBFDT		1
+
 /*
  * NS16550 Configuration
  */
diff --git a/include/configs/mx51evk.h b/include/configs/mx51evk.h
index 591d6e1..e9d06af 100644
--- a/include/configs/mx51evk.h
+++ b/include/configs/mx51evk.h
@@ -46,6 +46,8 @@
 #define CONFIG_SETUP_MEMORY_TAGS	1
 #define CONFIG_INITRD_TAG		1
 
+#define CONFIG_OF_LIBFDT		1
+
 /*
  * Size of malloc() pool
  */
diff --git a/include/configs/mx53evk.h b/include/configs/mx53evk.h
index f2a5752..78122a7 100644
--- a/include/configs/mx53evk.h
+++ b/include/configs/mx53evk.h
@@ -38,6 +38,8 @@
 #define CONFIG_SETUP_MEMORY_TAGS	1
 #define CONFIG_INITRD_TAG		1
 
+#define CONFIG_OF_LIBFDT		1
+
 /* Size of malloc() pool */
 #define CONFIG_SYS_MALLOC_LEN		(CONFIG_ENV_SIZE + 2 * 1024 * 1024)
 
diff --git a/include/configs/omap3_overo.h b/include/configs/omap3_overo.h
index 1b3d439..4b91b73 100644
--- a/include/configs/omap3_overo.h
+++ b/include/configs/omap3_overo.h
@@ -52,6 +52,8 @@
 #define CONFIG_INITRD_TAG		1
 #define CONFIG_REVISION_TAG		1
 
+#define CONFIG_OF_LIBFDT		1
+
 /*
  * Size of malloc() pool
  */
diff --git a/include/configs/omap3_pandora.h b/include/configs/omap3_pandora.h
index 72b0cc2..b4f08c8 100644
--- a/include/configs/omap3_pandora.h
+++ b/include/configs/omap3_pandora.h
@@ -55,6 +55,8 @@
 #define CONFIG_INITRD_TAG		1
 #define CONFIG_REVISION_TAG		1
 
+#define CONFIG_OF_LIBFDT		1
+
 /*
  * Size of malloc() pool
  */
diff --git a/include/configs/omap3_sdp3430.h b/include/configs/omap3_sdp3430.h
index 4708981..91354a9 100644
--- a/include/configs/omap3_sdp3430.h
+++ b/include/configs/omap3_sdp3430.h
@@ -71,6 +71,8 @@
 #define CONFIG_INITRD_TAG		1
 #define CONFIG_REVISION_TAG		1
 
+#define CONFIG_OF_LIBFDT		1
+
 /*
  * Size of malloc() pool
  * Total Size Environment - 256k
diff --git a/include/configs/omap3_zoom1.h b/include/configs/omap3_zoom1.h
index f7d0652..d74ff5b 100644
--- a/include/configs/omap3_zoom1.h
+++ b/include/configs/omap3_zoom1.h
@@ -61,6 +61,8 @@
 #define CONFIG_INITRD_TAG		1
 #define CONFIG_REVISION_TAG		1
 
+#define CONFIG_OF_LIBFDT		1
+
 /*
  * Size of malloc() pool
  */
diff --git a/include/configs/omap3_zoom2.h b/include/configs/omap3_zoom2.h
index 7377933..e2fd057 100644
--- a/include/configs/omap3_zoom2.h
+++ b/include/configs/omap3_zoom2.h
@@ -62,6 +62,8 @@
 #define CONFIG_INITRD_TAG		1
 #define CONFIG_REVISION_TAG		1
 
+#define CONFIG_OF_LIBFDT		1
+
 /*
  * Size of malloc() pool
  */
diff --git a/include/configs/omap4_panda.h b/include/configs/omap4_panda.h
index 2b03b0f..ffcc9aa 100644
--- a/include/configs/omap4_panda.h
+++ b/include/configs/omap4_panda.h
@@ -60,6 +60,8 @@
 #define CONFIG_INITRD_TAG		1
 #define CONFIG_REVISION_TAG		1
 
+#define CONFIG_OF_LIBFDT		1
+
 /*
  * Size of malloc() pool
  * Total Size Environment - 256k
diff --git a/include/configs/omap4_sdp4430.h b/include/configs/omap4_sdp4430.h
index 9a8bb73..8d04d07 100644
--- a/include/configs/omap4_sdp4430.h
+++ b/include/configs/omap4_sdp4430.h
@@ -56,6 +56,8 @@
 #undef CONFIG_USE_IRQ				/* no support for IRQs */
 #define CONFIG_MISC_INIT_R
 
+#define CONFIG_OF_LIBFDT		1
+
 #define CONFIG_CMDLINE_TAG		1	/* enable passing of ATAGs */
 #define CONFIG_SETUP_MEMORY_TAGS	1
 #define CONFIG_INITRD_TAG		1
diff --git a/include/configs/tegra2-common.h b/include/configs/tegra2-common.h
index 4f4374a..4fcd8bb 100644
--- a/include/configs/tegra2-common.h
+++ b/include/configs/tegra2-common.h
@@ -45,6 +45,7 @@
 #define CONFIG_SKIP_LOWLEVEL_INIT
 
 #define CONFIG_CMDLINE_TAG		/* enable passing of ATAGs */
+#define CONFIG_OF_LIBFDT		/* enable passing of devicetree */
 
 /* Environment */
 #define CONFIG_ENV_IS_NOWHERE
