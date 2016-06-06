From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 04/22] i2c: core: Use of_device_match()
Date: Mon,  6 Jun 2016 10:31:46 +0200
Message-ID: <20160606083204.19760-5-thierry.reding@gmail.com>
References: <20160606083204.19760-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160606083204.19760-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use the common implementation rather than the I2C-private variant.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/i2c/i2c-core.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
index af11b658984d..f0c7d8a64013 100644
--- a/drivers/i2c/i2c-core.c
+++ b/drivers/i2c/i2c-core.c
@@ -1426,18 +1426,13 @@ static void of_i2c_register_devices(struct i2c_adapter *adap)
 	}
 }
 
-static int of_dev_node_match(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 /* must call put_device() when done with returned i2c_client device */
 struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
 {
 	struct device *dev;
 	struct i2c_client *client;
 
-	dev = bus_find_device(&i2c_bus_type, NULL, node, of_dev_node_match);
+	dev = bus_find_device(&i2c_bus_type, NULL, node, of_device_match);
 	if (!dev)
 		return NULL;
 
@@ -1455,7 +1450,7 @@ struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node)
 	struct device *dev;
 	struct i2c_adapter *adapter;
 
-	dev = bus_find_device(&i2c_bus_type, NULL, node, of_dev_node_match);
+	dev = bus_find_device(&i2c_bus_type, NULL, node, of_device_match);
 	if (!dev)
 		return NULL;
 
-- 
2.8.3
