From: Xiubo Li <Li.Xiubo@freescale.com>
Subject: [PATCH] of: fix of_update_property()
Date: Fri, 17 Jan 2014 12:46:36 +0800
Message-ID: <1389933996-19306-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@linaro.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Xiubo Li <Li.Xiubo@freescale.com>
List-Id: devicetree@vger.kernel.org

The of_update_property() is intent to update a property in a node
and if the property does not exist, will add it to the node.

The second search of the property is possibly won't be found, that
maybe removed by other thread just before the second search begain,
if so just retry it.

Signed-off-by: Xiubo Li <Li.Xiubo@freescale.com>
---
 drivers/of/base.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index f807d0e..d0c53bc 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1572,6 +1572,7 @@ int of_update_property(struct device_node *np, struct property *newprop)
 	if (!newprop->name)
 		return -EINVAL;
 
+retry:
 	oldprop = of_find_property(np, newprop->name, NULL);
 	if (!oldprop)
 		return of_add_property(np, newprop);
@@ -1593,7 +1594,7 @@ int of_update_property(struct device_node *np, struct property *newprop)
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
 	if (!found)
-		return -ENODEV;
+		goto retry;
 
 #ifdef CONFIG_PROC_DEVICETREE
 	/* try to add to proc as well if it was initialized */
-- 
1.8.4
