From: frowand.list@gmail.com
Subject: [PATCH v6 2/4] of: make __of_attach_node() static
Date: Tue, 20 Jun 2017 15:02:50 -0700
Message-ID: <1497996172-821-3-git-send-email-frowand.list@gmail.com>
References: <1497996172-821-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497996172-821-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

__of_attach_node() is not used outside of drivers/of/dynamic.c.  Make
it static and remove it from drivers/of/of_private.h.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/dynamic.c    | 2 +-
 drivers/of/of_private.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index be320082178f..3367ed2da9ad 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -216,7 +216,7 @@ int of_property_notify(int action, struct device_node *np,
 	return of_reconfig_notify(action, &pr);
 }
 
-void __of_attach_node(struct device_node *np)
+static void __of_attach_node(struct device_node *np)
 {
 	np->child = NULL;
 	np->sibling = np->parent->child;
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 1a041411b219..73da291a51cd 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -91,7 +91,6 @@ extern int __of_update_property(struct device_node *np,
 extern void __of_update_property_sysfs(struct device_node *np,
 		struct property *newprop, struct property *oldprop);
 
-extern void __of_attach_node(struct device_node *np);
 extern int __of_attach_node_sysfs(struct device_node *np);
 extern void __of_detach_node(struct device_node *np);
 extern void __of_detach_node_sysfs(struct device_node *np);
-- 
Frank Rowand <frank.rowand@sony.com>
