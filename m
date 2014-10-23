From: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
Subject: [PATCH] of/fdt: Fix EARLY_FLATTREE crash with no DTB
Date: Thu, 23 Oct 2014 12:10:19 +0100
Message-ID: <5448E21B.4020502@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

of_flat_dt_debugfs_export_fdt uses initial_boot_params without checking
if it is valid, and ends up dereferencing a NULL pointer if there is
no DT blob.

This patch adds a check that initial_boot_params is NULL, returning
-ENOENT if it is.

Signed-off-by: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>
---
  drivers/of/fdt.c | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index d1ffca8..f018e5b 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1085,8 +1085,12 @@ static struct debugfs_blob_wrapper flat_dt_blob;

  static int __init of_flat_dt_debugfs_export_fdt(void)
  {
-    struct dentry *d = debugfs_create_dir("device-tree", NULL);
+    struct dentry *d;

+    if (!initial_boot_params)
+        return -ENOENT;
+
+    d = debugfs_create_dir("device-tree", NULL);
      if (!d)
          return -ENOENT;

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
