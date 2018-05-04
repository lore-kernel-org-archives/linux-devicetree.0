Return-Path: <SRS0=Xnq8=HX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:39603 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751236AbeEDNFg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 4 May 2018 09:05:36 -0400
From: Bastian Stender <bst@pengutronix.de>
Subject: [PATCH v2 3/3] i2c: mux: pca954x: add option to use as mux-locked
Date: Fri,  4 May 2018 15:04:49 +0200
Message-Id: <20180504130449.13730-3-bst@pengutronix.de>
In-Reply-To: <20180504130449.13730-1-bst@pengutronix.de>
References: <20180504130449.13730-1-bst@pengutronix.de>
Sender: devicetree-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Michael Lawnick <ml.lawnick@gmx.de>, kernel@pengutronix.de, Bastian Stender <bst@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

Commit 6ef91fcca8a8 ("i2c: mux: relax locking of the top i2c adapter
during mux-locked muxing") introduced a new locking concept "mux-locked",
so that these muxes lock only the muxes on the parent adapter instead of
the whole i2c bus.

In case the dt property "mux-locked" is present make use of this
concept. This makes interaction between i2c devices behind the mux and
devices directly on the bus possible - at least in simple cases. It
might not work properly for complex i2c topologies.

If the dt property is not present use the parent-locked concept as
before.

Signed-off-by: Bastian Stender <bst@pengutronix.de>
---
Changes since implicit v1 ("i2c: mux: pca954x: use relaxed locking of
the top i2c adapter during mux-locked muxing"):

- fix unlocked SMBus access
- make mux-locked optional via dt
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 32 +++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 09bafd3e68fa..dfa9e8d350c7 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -219,6 +219,7 @@ MODULE_DEVICE_TABLE(of, pca954x_of_match);
 static int pca954x_reg_write(struct i2c_adapter *adap,
 			     struct i2c_client *client, u8 val)
 {
+	struct i2c_mux_core *muxc = i2c_get_clientdata(client);
 	int ret = -ENODEV;
 
 	if (adap->algo->master_xfer) {
@@ -230,16 +231,26 @@ static int pca954x_reg_write(struct i2c_adapter *adap,
 		msg.len = 1;
 		buf[0] = val;
 		msg.buf = buf;
-		ret = __i2c_transfer(adap, &msg, 1);
+
+		if (muxc->mux_locked)
+			ret = i2c_transfer(adap, &msg, 1);
+		else
+			ret = __i2c_transfer(adap, &msg, 1);
 
 		if (ret >= 0 && ret != 1)
 			ret = -EREMOTEIO;
 	} else {
 		union i2c_smbus_data data;
-		ret = adap->algo->smbus_xfer(adap, client->addr,
+		if (muxc->mux_locked)
+			ret = i2c_smbus_xfer(adap, client->addr,
 					     client->flags,
 					     I2C_SMBUS_WRITE,
 					     val, I2C_SMBUS_BYTE, &data);
+		else
+			ret = adap->algo->smbus_xfer(adap, client->addr,
+						     client->flags,
+						     I2C_SMBUS_WRITE, val,
+						     I2C_SMBUS_BYTE, &data);
 	}
 
 	return ret;
@@ -371,7 +382,9 @@ static int pca954x_probe(struct i2c_client *client,
 	bool idle_disconnect_dt;
 	struct gpio_desc *gpio;
 	int num, force, class;
+	bool mux_locked;
 	struct i2c_mux_core *muxc;
+	u32 mux_alloc_flags;
 	struct pca954x *data;
 	const struct of_device_id *match;
 	int ret;
@@ -379,9 +392,13 @@ static int pca954x_probe(struct i2c_client *client,
 	if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_BYTE))
 		return -ENODEV;
 
+	mux_locked = of_property_read_bool(of_node, "mux-locked");
+
+	mux_alloc_flags = mux_locked ? I2C_MUX_LOCKED : 0;
 	muxc = i2c_mux_alloc(adap, &client->dev,
-			     PCA954X_MAX_NCHANS, sizeof(*data), 0,
-			     pca954x_select_chan, pca954x_deselect_mux);
+			     PCA954X_MAX_NCHANS, sizeof(*data),
+			     mux_alloc_flags, pca954x_select_chan,
+			     pca954x_deselect_mux);
 	if (!muxc)
 		return -ENOMEM;
 	data = i2c_mux_priv(muxc);
@@ -389,6 +406,8 @@ static int pca954x_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, muxc);
 	data->client = client;
 
+	muxc->mux_locked = mux_locked;
+
 	/* Get the mux out of reset if a reset GPIO is specified. */
 	gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(gpio))
@@ -470,8 +489,9 @@ static int pca954x_probe(struct i2c_client *client,
 	}
 
 	dev_info(&client->dev,
-		 "registered %d multiplexed busses for I2C %s %s\n",
-		 num, data->chip->muxtype == pca954x_ismux
+		 "registered %d multiplexed busses for %s-locked I2C %s %s\n",
+		 num, muxc->mux_locked ? "mux" : "parent",
+		 data->chip->muxtype == pca954x_ismux
 				? "mux" : "switch", client->name);
 
 	return 0;
-- 
2.17.0

