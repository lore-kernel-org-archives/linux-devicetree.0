From: frowand.list@gmail.com
Subject: [PATCH 3/4] of: be consistent in form of file mode
Date: Fri, 14 Apr 2017 20:55:19 -0700
Message-ID: <1492228520-12450-4-git-send-email-frowand.list@gmail.com>
References: <1492228520-12450-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1492228520-12450-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

checkpatch whined about using S_IRUGO instead of octal equivalent
when adding phandle sysfs code, so used octal in that patch.
Change other instances of the S_* constants in the same file to
the octal form.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 197946615503..4a8bd9623140 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -168,7 +168,7 @@ int __of_add_property_sysfs(struct device_node *np, struct property *pp)
 
 	sysfs_bin_attr_init(&pp->attr);
 	pp->attr.attr.name = safe_name(&np->kobj, pp->name);
-	pp->attr.attr.mode = secure ? S_IRUSR : S_IRUGO;
+	pp->attr.attr.mode = secure ? 0400 : 0444;
 	pp->attr.size = secure ? 0 : pp->length;
 	pp->attr.read = of_node_property_read;
 
-- 
Frank Rowand <frank.rowand@sony.com>
