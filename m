From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 14/14] tegra: fdt: Enable FDT support for Seaboard
Date: Wed, 23 Nov 2011 19:54:56 -0800
Message-ID: <1322106896-23054-15-git-send-email-sjg@chromium.org>
References: <1322106896-23054-2-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322106896-23054-2-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This switches Seaboard over to use FDT for run-time config instead of
CONFIG options. USB is the only user at present.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 include/configs/seaboard.h |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/include/configs/seaboard.h b/include/configs/seaboard.h
index df1b44a..03e9824 100644
--- a/include/configs/seaboard.h
+++ b/include/configs/seaboard.h
@@ -27,6 +27,11 @@
 #include <asm/sizes.h>
 #include "tegra2-common.h"
 
+/* Enable fdt support for Seaboard. Flash the image in u-boot-dtb.bin */
+#define CONFIG_DEFAULT_DEVICE_TREE	tegra2-seaboard
+#define CONFIG_OF_CONTROL
+#define CONFIG_OF_SEPARATE
+
 /* High-level configuration options */
 #define TEGRA2_SYSMEM		"mem=384M@0M nvmem=128M@384M mem=512M@512M"
 #define V_PROMPT		"Tegra2 (SeaBoard) # "
@@ -79,6 +84,8 @@
 #define CONFIG_USB_STORAGE
 #define CONFIG_CMD_USB
 
+#ifndef CONFIG_OF_CONTROL
+
 /* Select the order in which U-Boot sees USB ports */
 #define CONFIG_TEGRA_USB0	TEGRA_USB3_BASE
 #define CONFIG_TEGRA_USB1	TEGRA_USB1_BASE
@@ -86,4 +93,6 @@
 /* Put USB1 in host mode */
 #define CONFIG_TEGRA_USB1_HOST
 
+#endif
+
 #endif /* __CONFIG_H */
-- 
1.7.3.1
