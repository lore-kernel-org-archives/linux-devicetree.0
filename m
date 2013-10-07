From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH v2 09/29] of: Introduce common early_init_dt_scan
Date: Mon,  7 Oct 2013 11:29:17 -0500
Message-ID: <1381163377-21044-10-git-send-email-robherring2@gmail.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Most architectures scan the all the same items early in the FDT and none
are really architecture specific. Create a common early_init_dt_scan to
unify the early scan of root, memory, and chosen nodes in the flattened
DT.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Acked-by: Grant Likely <grant.likely@linaro.org>
---
 drivers/of/fdt.c       | 26 ++++++++++++++++++++++++++
 include/linux/of_fdt.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 5177616..bfbfda5 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -785,6 +785,32 @@ void * __init __weak early_init_dt_alloc_memory_arch(u64 size, u64 align)
 }
 #endif
 
+bool __init early_init_dt_scan(void *params)
+{
+	if (!params)
+		return false;
+
+	/* Setup flat device-tree pointer */
+	initial_boot_params = params;
+
+	/* check device tree validity */
+	if (be32_to_cpu(initial_boot_params->magic) != OF_DT_HEADER) {
+		initial_boot_params = NULL;
+		return false;
+	}
+
+	/* Retrieve various information from the /chosen node */
+	of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
+
+	/* Initialize {size,address}-cells info */
+	of_scan_flat_dt(early_init_dt_scan_root, NULL);
+
+	/* Setup memory, calling early_init_dt_add_memory_arch */
+	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
+
+	return true;
+}
+
 /**
  * unflatten_device_tree - create tree of device_nodes from flat blob
  *
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index 58c28a8..73e1651 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -116,6 +116,8 @@ extern void early_init_dt_setup_initrd_arch(u64 start, u64 end);
 extern int early_init_dt_scan_root(unsigned long node, const char *uname,
 				   int depth, void *data);
 
+extern bool early_init_dt_scan(void *params);
+
 /* Other Prototypes */
 extern void unflatten_device_tree(void);
 extern void unflatten_and_copy_device_tree(void);
-- 
1.8.1.2
