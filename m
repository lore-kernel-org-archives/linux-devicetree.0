From: Rob Herring <robh@kernel.org>
Subject: [PATCH] extcon: Convert to using %pOF instead of full_name
Date: Tue, 18 Jul 2017 16:43:00 -0500
Message-ID: <20170718214339.7774-20-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Now that we have a custom printf format specifier, convert users of
full_name to use %pOF instead. This is preparation to remove storing
of the full path string for each node.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/extcon/extcon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon.c b/drivers/extcon/extcon.c
index 8eccf7b14937..229364a9d868 100644
--- a/drivers/extcon/extcon.c
+++ b/drivers/extcon/extcon.c
@@ -1363,8 +1363,8 @@ struct extcon_dev *extcon_get_edev_by_phandle(struct device *dev, int index)

 	node = of_parse_phandle(dev->of_node, "extcon", index);
 	if (!node) {
-		dev_dbg(dev, "failed to get phandle in %s node\n",
-			dev->of_node->full_name);
+		dev_dbg(dev, "failed to get phandle in %pOF node\n",
+			dev->of_node);
 		return ERR_PTR(-ENODEV);
 	}

--
2.11.0
