From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 11/14] fdt: Tell the FDT library where the device tree is
Date: Thu, 25 Oct 2012 19:31:08 -0700
Message-ID: <1351218671-15228-12-git-send-email-sjg@chromium.org>
References: <1351218671-15228-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1351218671-15228-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Gabe Black <gabeblack-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gabe Black <gabeblack-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Gabe Black <gabeblack-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

This change adds a call to set_working_fdt_addr near the end of u-boot
initialization which tells the fdt command/library where the device tree is.
This makes it possible to use the fdt command to look at the active device tree
since otherwise there would be no way to know what address it was at to set
things up manually.

Signed-off-by: Gabe Black <gabeblack-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 common/main.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/common/main.c b/common/main.c
index 23a68ee..cf1b5f9 100644
--- a/common/main.c
+++ b/common/main.c
@@ -45,6 +45,10 @@
 #include <fdtdec.h>
 #endif
 
+#ifdef CONFIG_OF_LIBFDT
+#include <fdt_support.h>
+#endif /* CONFIG_OF_LIBFDT */
+
 #include <post.h>
 #include <linux/ctype.h>
 #include <menu.h>
@@ -418,6 +422,10 @@ void main_loop (void)
 #endif /* CONFIG_MENUKEY */
 #endif /* CONFIG_BOOTDELAY */
 
+#if defined CONFIG_OF_CONTROL
+	set_working_fdt_addr((void *)gd->fdt_blob);
+#endif /* CONFIG_OF_CONTROL */
+
 	/*
 	 * Main Loop for Monitor Command Processing
 	 */
-- 
1.7.7.3
