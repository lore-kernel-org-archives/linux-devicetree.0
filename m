From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 1/1] of/fdt: failed to mark hotplug range message
Date: Thu, 22 Dec 2016 06:34:05 +0100
Message-ID: <20161222053405.27190-1-xypron.glpk@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>
List-Id: devicetree@vger.kernel.org

If marking a hotplug range fails a message
"failed to mark hotplug range" is written.

The end address is base + size - 1.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 drivers/of/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index c9b5cac03b36..fd129b6e5396 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1057,7 +1057,7 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
 
 		if (early_init_dt_mark_hotplug_memory_arch(base, size))
 			pr_warn("failed to mark hotplug range 0x%llx - 0x%llx\n",
-				base, base + size);
+				base, base + size - 1);
 	}
 
 	return 0;
-- 
2.11.0
