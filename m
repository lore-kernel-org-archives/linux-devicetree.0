Return-Path: <SRS0=35J/=4G=xps15.kernel.org=frowand@kernel.org>
From: Frank Rowand <frank.rowand@sony.com>
Subject: [PATCH] of: undeclared variable when CONFIG_DEBUG_LOCK_ALLOC
Date: Sun, 30 Apr 2017 13:00:03 -0700
Message-Id: <1493582403-12291-1-git-send-email-frank.rowand@sony.com>
To: Rob Herring <robh+dt@kernel.org>, stephen.boyd@linaro.org
Cc: Frank Rowand <frank.rowand@sony.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

An undeclared variable was used in a macro that evaluates to nothing
when CONFIG_DEBUG_LOCK_ALLOC is not defined.  Change to use the correct
variable that does exist.

---

reported by kbuild test robot on on robh/for-next
   https://lkml.org/lkml/2017/4/29/134

   drivers/of/base.c: In function '__of_add_phandle_sysfs':
>> drivers/of/base.c:198:23: error: 'pp' undeclared (first use in this function)
     sysfs_bin_attr_init(&pp->attr);

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 9fe42346925b..8a7ca2a49ba8 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -195,7 +195,7 @@ int __of_add_phandle_sysfs(struct device_node *np)
 	if (!np->phandle || np->phandle == 0xffffffff)
 		return 0;
 
-	sysfs_bin_attr_init(&pp->attr);
+	sysfs_bin_attr_init(&np->attr_phandle);
 	np->attr_phandle.attr.name = "phandle";
 	np->attr_phandle.attr.mode = 0444;
 	np->attr_phandle.size = sizeof(np->phandle);
-- 
Frank Rowand <frank.rowand@sony.com>
