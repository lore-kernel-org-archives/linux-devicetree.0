From: Rob Herring <robh@kernel.org>
Subject: [PATCH 2/3] of/fdt: avoid re-parsing '#{address,size}-cells' in of_fdt_limit_memory
Date: Thu, 30 Aug 2018 14:05:22 -0500
Message-ID: <20180830190523.31474-3-robh@kernel.org>
References: <20180830190523.31474-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830190523.31474-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that we initialize dt_root_addr_cells and dt_root_size_cells earlier,
use them and simplify of_fdt_limit_memory.

Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/fdt.c | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 49abe18f1bde..fef4b2c8a171 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -44,28 +44,7 @@ void of_fdt_limit_memory(int limit)
 	int memory;
 	int len;
 	const void *val;
-	int nr_address_cells = OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
-	int nr_size_cells = OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
-	const __be32 *addr_prop;
-	const __be32 *size_prop;
-	int root_offset;
-	int cell_size;
-
-	root_offset = fdt_path_offset(initial_boot_params, "/");
-	if (root_offset < 0)
-		return;
-
-	addr_prop = fdt_getprop(initial_boot_params, root_offset,
-				"#address-cells", NULL);
-	if (addr_prop)
-		nr_address_cells = fdt32_to_cpu(*addr_prop);
-
-	size_prop = fdt_getprop(initial_boot_params, root_offset,
-				"#size-cells", NULL);
-	if (size_prop)
-		nr_size_cells = fdt32_to_cpu(*size_prop);
-
-	cell_size = sizeof(uint32_t)*(nr_address_cells + nr_size_cells);
+	int cell_size = sizeof(uint32_t)*(dt_root_addr_cells + dt_root_size_cells);
 
 	memory = fdt_path_offset(initial_boot_params, "/memory");
 	if (memory > 0) {
-- 
2.17.1
