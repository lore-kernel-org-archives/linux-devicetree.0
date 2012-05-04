From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/9] ARM: mmp: append CONFIG_MACH_MMP2_DT
Date: Fri,  4 May 2012 20:30:19 +0800
Message-ID: <1336134626-12262-3-git-send-email-haojian.zhuang@gmail.com>
References: <1336134626-12262-1-git-send-email-haojian.zhuang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1336134626-12262-1-git-send-email-haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Append CONFIG_MACH_MMP2_DT.

CONFIG_MACH_MMP_DT is used to ARMv5 DT support. CONFIG_MACH_MMP2_DT
is used to ARMv7 DT support. These two machine support can't be
selected at the same time.

Signed-off-by: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/mach-mmp/Kconfig |   29 +++++++++++++++++++----------
 1 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-mmp/Kconfig b/arch/arm/mach-mmp/Kconfig
index 5a90b9a..ede7216 100644
--- a/arch/arm/mach-mmp/Kconfig
+++ b/arch/arm/mach-mmp/Kconfig
@@ -2,16 +2,6 @@ if ARCH_MMP
 
 menu "Marvell PXA168/910/MMP2 Implmentations"
 
-config MACH_MMP_DT
-	bool "Support MMP2 platforms from device tree"
-	select CPU_PXA168
-	select CPU_PXA910
-	select USE_OF
-	help
-	  Include support for Marvell MMP2 based platforms using
-	  the device tree. Needn't select any other machine while
-	  MACH_MMP_DT is enabled.
-
 config MACH_ASPENITE
 	bool "Marvell's PXA168 Aspenite Development Board"
 	select CPU_PXA168
@@ -94,6 +84,25 @@ config MACH_GPLUGD
 	  Say 'Y' here if you want to support the Marvell PXA168-based
 	  GuruPlug Display (gplugD) Board
 
+config MACH_MMP_DT
+	bool "Support MMP (ARMv5) platforms from device tree"
+	select CPU_PXA168
+	select CPU_PXA910
+	select USE_OF
+	help
+	  Include support for Marvell MMP2 based platforms using
+	  the device tree. Needn't select any other machine while
+	  MACH_MMP_DT is enabled.
+
+config MACH_MMP2_DT
+	bool "Support MMP2 (ARMv7) platforms from device tree"
+	depends on !CPU_MOHAWK
+	select CPU_MMP2
+	select USE_OF
+	help
+	  Include support for Marvell MMP2 based platforms using
+	  the device tree.
+
 endmenu
 
 config CPU_PXA168
-- 
1.7.5.4
