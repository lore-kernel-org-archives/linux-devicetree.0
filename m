From: Raghavendra Rao Ananta <rananta@codeaurora.org>
Subject: [PATCH] of: Add of_get_memory_prop()
Date: Wed, 18 Sep 2019 11:46:56 -0700
Message-ID: <20190918184656.7633-1-rananta@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com
Cc: tsoni@codeaurora.org, kernel-team@android.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Raghavendra Rao Ananta <rananta@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On some embedded systems, the '/memory' dt-property gets updated
by the bootloader (for example, the DDR configuration) and then
gets passed onto the kernel. The device drivers may have to read
the properties at runtime to make decisions. Hence, add
of_get_memory_prop() for the device drivers to query the requested
properties.

Signed-off-by: Raghavendra Rao Ananta <rananta@codeaurora.org>
---
 drivers/of/fdt.c       | 27 +++++++++++++++++++++++++++
 include/linux/of_fdt.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 223d617ecfe1..925cf2852433 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -79,6 +79,33 @@ void __init of_fdt_limit_memory(int limit)
 	}
 }
 
+/**
+ * of_fdt_get_memory_prop - Return the requested property from the /memory node
+ *
+ * On match, returns a non-zero positive value which represents the property
+ * value. Otherwise returns -ENOENT.
+ */
+int of_fdt_get_memory_prop(const char *pname)
+{
+	int memory;
+	int len;
+	fdt32_t *prop = NULL;
+
+	if (!pname)
+		return -EINVAL;
+
+	memory = fdt_path_offset(initial_boot_params, "/memory");
+	if (memory > 0)
+		prop = fdt_getprop_w(initial_boot_params, memory,
+				  pname, &len);
+
+	if (!prop || len != sizeof(u32))
+		return -ENOENT;
+
+	return fdt32_to_cpu(*prop);
+}
+EXPORT_SYMBOL_GPL(of_fdt_get_memory_prop);
+
 static bool of_fdt_device_is_available(const void *blob, unsigned long node)
 {
 	const char *status = fdt_getprop(blob, node, "status", NULL);
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index acf820e88952..537f29373358 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -38,6 +38,7 @@ extern char __dtb_end[];
 /* Other Prototypes */
 extern u64 of_flat_dt_translate_address(unsigned long node);
 extern void of_fdt_limit_memory(int limit);
+extern int of_fdt_get_memory_prop(const char *pname);
 #endif /* CONFIG_OF_FLATTREE */
 
 #ifdef CONFIG_OF_EARLY_FLATTREE
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
