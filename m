From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] of/flattree: print memory scan node results in CPU endian
Date: Tue,  7 Apr 2015 23:44:10 -0700
Message-ID: <1428475450-12072-1-git-send-email-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, grant.likely@linaro.org, Florian Fainelli <f.fainelli@gmail.com>
List-Id: devicetree@vger.kernel.org

Commit 51975db0b7333 ("of/flattree: merge early_init_dt_scan_memory()
common code") consolidated some code from PowerPC (typically
big-endian), and ended-up adding a pr_debug() printing reg properties in
big-endian (DT native) format, not CPU endian. Unsurprisingly, when
these messages are turned on a little-endian systems, this is confusing,
so do the conversion while printing the values.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/of/fdt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 3a896c9aeb74..0d8f0e4bd107 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -880,7 +880,8 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
 	endp = reg + (l / sizeof(__be32));
 
 	pr_debug("memory scan node %s, reg size %d, data: %x %x %x %x,\n",
-	    uname, l, reg[0], reg[1], reg[2], reg[3]);
+	    uname, l, be32_to_cpu(reg[0]), be32_to_cpu(reg[1]),
+	    be32_to_cpu(reg[2]), be32_to_cpu(reg[3]));
 
 	while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
 		u64 base, size;
-- 
2.1.0
