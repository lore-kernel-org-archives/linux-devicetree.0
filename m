From: frowand.list@gmail.com
Subject: [PATCH 4/6] of: remove kbasename(of->full_name) from kobj.c
Date: Sun, 25 Feb 2018 18:22:28 -0800
Message-ID: <1519611750-22355-5-git-send-email-frowand.list@gmail.com>
References: <1519611750-22355-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519611750-22355-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, geert@linux-m68k.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

struct device_node full_name has been changed to include the
basename instead of the full path.  kbasename() is no longer
needed to extract the basename from full_name.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/kobj.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/kobj.c b/drivers/of/kobj.c
index 7a0a18980b98..b0aecea35706 100644
--- a/drivers/of/kobj.c
+++ b/drivers/of/kobj.c
@@ -128,7 +128,7 @@ int __of_attach_node_sysfs(struct device_node *np)
 		name = safe_name(&of_kset->kobj, "base");
 		parent = NULL;
 	} else {
-		name = safe_name(&np->parent->kobj, kbasename(np->full_name));
+		name = safe_name(&np->parent->kobj, np->full_name);
 		parent = &np->parent->kobj;
 	}
 	if (!name)
-- 
Frank Rowand <frank.rowand@sony.com>
