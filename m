From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH v2 17/21] of/fdt: introduce of_get_flat_dt_size
Date: Tue, 22 Apr 2014 20:18:17 -0500
Message-ID: <1398215901-25609-18-git-send-email-robherring2@gmail.com>
References: <1398215901-25609-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398215901-25609-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh@kernel.org>

Add a wrapper function to retrieve the FDT size from the FDT header. This
is primarily to avoid libfdt include paths for the whole kernel.

Signed-off-by: Rob Herring <robh@kernel.org>
---
v2: new patch

 drivers/of/fdt.c       | 8 ++++++++
 include/linux/of_fdt.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index d9e6450..358bcf0 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -554,6 +554,14 @@ unsigned long __init of_get_flat_dt_root(void)
 }
 
 /**
+ * of_get_flat_dt_size - Return the total size of the FDT
+ */
+int __init of_get_flat_dt_size(void)
+{
+	return fdt_totalsize(initial_boot_params);
+}
+
+/**
  * of_get_flat_dt_prop - Given a node in the flat blob, return the property ptr
  *
  * This function can be used within scan_flattened_dt callback to get
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 348dae2..e10099c 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -92,6 +92,7 @@ extern const void *of_get_flat_dt_prop(unsigned long node, const char *name,
 extern int of_flat_dt_is_compatible(unsigned long node, const char *name);
 extern int of_flat_dt_match(unsigned long node, const char *const *matches);
 extern unsigned long of_get_flat_dt_root(void);
+extern int of_get_flat_dt_size(void);
 
 extern int early_init_dt_scan_chosen(unsigned long node, const char *uname,
 				     int depth, void *data);
-- 
1.9.1
