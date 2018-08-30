From: Rob Herring <robh@kernel.org>
Subject: [PATCH 1/3] of/fdt: Scan the root node properties earlier
Date: Thu, 30 Aug 2018 14:05:21 -0500
Message-ID: <20180830190523.31474-2-robh@kernel.org>
References: <20180830190523.31474-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830190523.31474-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Scan the root node properties (#{size,address}-cells) earlier, so that
the dt_root_addr_cells and dt_root_size_cells variables are initialized
and can be used.

Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/fdt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 800ad252cf9c..49abe18f1bde 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1215,6 +1215,10 @@ bool __init early_init_dt_verify(void *params)
 	initial_boot_params = params;
 	of_fdt_crc32 = crc32_be(~0, initial_boot_params,
 				fdt_totalsize(initial_boot_params));
+
+	/* Initialize {size,address}-cells info */
+	of_scan_flat_dt(early_init_dt_scan_root, NULL);
+
 	return true;
 }
 
@@ -1224,9 +1228,6 @@ void __init early_init_dt_scan_nodes(void)
 	/* Retrieve various information from the /chosen node */
 	of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
 
-	/* Initialize {size,address}-cells info */
-	of_scan_flat_dt(early_init_dt_scan_root, NULL);
-
 	/* Setup memory, calling early_init_dt_add_memory_arch */
 	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
 }
-- 
2.17.1
