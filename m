From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [RFC 2/2] linux.c32: Add initrd= parameter
Date: Thu, 31 May 2012 17:41:36 +0200
Message-ID: <1338478896-11417-3-git-send-email-thierry.reding@avionic-design.de>
References: <1338478896-11417-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1338478896-11417-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: syslinux-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This new parameter can be used to specify a Flattened Device Tree (FDT)
blob to pass to the Linux kernel.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 com32/modules/linux.c |   20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/com32/modules/linux.c b/com32/modules/linux.c
index b902ebc..cc1e6fe 100644
--- a/com32/modules/linux.c
+++ b/com32/modules/linux.c
@@ -112,6 +112,7 @@ int main(int argc, char *argv[])
 {
     const char *kernel_name;
     struct initramfs *initramfs;
+    struct fdt *fdt;
     char *cmdline;
     char *boot_image;
     void *kernel_data;
@@ -207,8 +208,25 @@ int main(int argc, char *argv[])
 	    goto bail;
     }
 
+    fdt = fdt_init();
+    if (!fdt)
+	goto bail;
+
+    if ((arg = find_argument(argp, "fdt="))) {
+	if (!opt_quiet)
+	    printf("Loading %s... ", arg);
+
+	if (fdt_load(fdt, arg)) {
+	    printf("failed!\n");
+	    goto bail;
+	}
+
+	if (!opt_quiet)
+	    printf("ok\n");
+    }
+
     /* This should not return... */
-    syslinux_boot_linux(kernel_data, kernel_len, initramfs, cmdline);
+    syslinux_boot_linux(kernel_data, kernel_len, initramfs, fdt, cmdline);
 
 bail:
     fprintf(stderr, "Kernel load failure (insufficient memory?)\n");
-- 
1.7.10.2
