From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 17/17] tegra: fdt: Enable FDT support for Seaboard
Date: Fri,  2 Dec 2011 18:11:40 -0800
Message-ID: <1322878300-5551-18-git-send-email-sjg@chromium.org>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322878300-5551-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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

 include/configs/seaboard.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/configs/seaboard.h b/include/configs/seaboard.h
index b6d9f7a..1dc775a 100644
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
-- 
1.7.3.1
