From: frowand.list@gmail.com
Subject: [PATCH] of: fdt.c header comment typo
Date: Tue, 20 Jun 2017 16:46:28 -0700
Message-ID: <1498002388-12908-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Fix typo in header comment for early_init_dt_scan_memory()

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 3080d9dd031d..c053b4f4fbc1 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1050,7 +1050,7 @@ u64 __init dt_mem_next_cell(int s, const __be32 **cellp)
 }
 
 /**
- * early_init_dt_scan_memory - Look for an parse memory nodes
+ * early_init_dt_scan_memory - Look for and parse memory nodes
  */
 int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
 				     int depth, void *data)
-- 
Frank Rowand <frank.rowand@sony.com>
