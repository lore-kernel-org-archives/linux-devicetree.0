From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Subject: [PATCH] of/i2c: don't register disabled devices
Date: Wed, 20 Feb 2013 22:28:24 +0400
Message-ID: <1361384904-13853-1-git-send-email-dmitry_eremin@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Don't register i2c slave device tree nodes which have
status = "disabled" property.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 drivers/of/of_i2c.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/of_i2c.c b/drivers/of/of_i2c.c
index 1e173f3..63f3236 100644
--- a/drivers/of/of_i2c.c
+++ b/drivers/of/of_i2c.c
@@ -35,6 +35,9 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
 		const __be32 *addr;
 		int len;
 
+		if (!of_device_is_available(node))
+			continue;
+
 		dev_dbg(&adap->dev, "of_i2c: register %s\n", node->full_name);
 
 		if (of_modalias_node(node, info.type, sizeof(info.type)) < 0) {
-- 
1.7.10.4
