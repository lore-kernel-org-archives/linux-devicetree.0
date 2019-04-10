From: xiaojiangfeng <xiaojiangfeng@huawei.com>
Subject: [PATCH] of: del redundant type conversion
Date: Wed, 10 Apr 2019 16:29:41 +0800
Message-ID: <1554884981-20309-1-git-send-email-xiaojiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com, robh@kernel.org, xiaojiangfeng@huawei.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The type of variable l in early_init_dt_scan_chosen is
int, there is no need to convert to int.

Signed-off-by: xiaojiangfeng <xiaojiangfeng@huawei.com>
---
 drivers/of/fdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 4734223..de893c9 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1091,7 +1091,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
 	/* Retrieve command line */
 	p = of_get_flat_dt_prop(node, "bootargs", &l);
 	if (p != NULL && l > 0)
-		strlcpy(data, p, min((int)l, COMMAND_LINE_SIZE));
+		strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
 
 	/*
 	 * CONFIG_CMDLINE is meant to be a default in case nothing else
-- 
1.8.5.6
