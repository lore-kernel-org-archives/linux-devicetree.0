From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH] of: Properly set the OF_POPULATED_BUS flag on root node
Date: Thu, 20 Nov 2014 10:19:42 +0000
Message-ID: <1416478782-5351-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pawel Moll <pawel.moll@arm.com>
List-Id: devicetree@vger.kernel.org

of_platform_populate() takes a subset of the device tree and turns it
into a set of platform_devices. At the same time it sets the
OF_POPULATED_BUS flag in each bus nodes so that of_platform_depopulate()
can undo the operation at a later time. However, it doesn't set the flag
on the root of the population tree which means that dynamic modifications
of the device tree at runtime will not create/destroy devices correctly.

Fix of_platform_populate() to set the OF_POPULATED_BUS flag on the node
it is called with.

Signed-off-by: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Pawel Moll <pawel.moll@arm.com>
---
 drivers/of/platform.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 770a8e0a14f2..69f6dff85d15 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -500,6 +500,7 @@ int of_platform_populate(struct device_node *root,
 		if (rc)
 			break;
 	}
+	of_node_set_flag(root, OF_POPULATED_BUS);
 
 	of_node_put(root);
 	return rc;
@@ -542,7 +543,10 @@ static int of_platform_device_destroy(struct device *dev, void *data)
  */
 void of_platform_depopulate(struct device *parent)
 {
-	device_for_each_child(parent, NULL, of_platform_device_destroy);
+	if (parent->of_node && of_node_check_flag(parent->of_node, OF_POPULATED_BUS)) {
+		device_for_each_child(parent, NULL, of_platform_device_destroy);
+		of_node_clear_flag(parent->of_node, OF_POPULATED_BUS);
+	}
 }
 EXPORT_SYMBOL_GPL(of_platform_depopulate);
 
-- 
1.9.1
