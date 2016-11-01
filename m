From: Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/2] of/platform: clarify of_find_device_by_node refcounting
Date: Tue,  1 Nov 2016 11:53:22 +0100
Message-ID: <1477997602-29652-2-git-send-email-johan@kernel.org>
References: <1477997602-29652-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477997602-29652-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

Add comment clarifying that of_find_device_by_node() takes a reference
to the embedded struct device which needs to be dropped after use.

Note that most current users fail to do so.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/of/platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index cb4c7800f37d..b8064bc2b6eb 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -45,6 +45,9 @@ static int of_dev_node_match(struct device *dev, void *data)
  * of_find_device_by_node - Find the platform_device associated with a node
  * @np: Pointer to device tree node
  *
+ * Takes a reference to the embedded struct device which needs to be dropped
+ * after use.
+ *
  * Returns platform_device pointer, or NULL if not found
  */
 struct platform_device *of_find_device_by_node(struct device_node *np)
-- 
2.7.3
