Return-Path: <SRS0=jssF=H2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-db5eur01on0104.outbound.protection.outlook.com ([104.47.2.104]:38928
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750795AbeEGHEX (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 7 May 2018 03:04:23 -0400
Subject: Re: [PATCH v2 3/3] i2c: mux: pca954x: add option to use as mux-locked
References: <20180504130449.13730-1-bst@pengutronix.de>
 <20180504130449.13730-3-bst@pengutronix.de>
From: Peter Rosin <peda@axentia.se>
Message-ID: <918ab218-c516-6936-26e0-aeabb6ac737e@axentia.se>
Date: Mon, 7 May 2018 09:04:15 +0200
MIME-Version: 1.0
In-Reply-To: <20180504130449.13730-3-bst@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Bastian Stender <bst@pengutronix.de>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Michael Lawnick <ml.lawnick@gmx.de>, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On 2018-05-04 15:04, Bastian Stender wrote:
> Commit 6ef91fcca8a8 ("i2c: mux: relax locking of the top i2c adapter
> during mux-locked muxing") introduced a new locking concept "mux-locked",
> so that these muxes lock only the muxes on the parent adapter instead of
> the whole i2c bus.
> 
> In case the dt property "mux-locked" is present make use of this
> concept. This makes interaction between i2c devices behind the mux and
> devices directly on the bus possible - at least in simple cases. It
> might not work properly for complex i2c topologies.
> 
> If the dt property is not present use the parent-locked concept as
> before.
> 
> Signed-off-by: Bastian Stender <bst@pengutronix.de>
> ---
> Changes since implicit v1 ("i2c: mux: pca954x: use relaxed locking of
> the top i2c adapter during mux-locked muxing"):
> 
> - fix unlocked SMBus access
> - make mux-locked optional via dt
> ---
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 32 +++++++++++++++++++++++------
>  1 file changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 09bafd3e68fa..dfa9e8d350c7 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -219,6 +219,7 @@ MODULE_DEVICE_TABLE(of, pca954x_of_match);
>  static int pca954x_reg_write(struct i2c_adapter *adap,
>  			     struct i2c_client *client, u8 val)
>  {
> +	struct i2c_mux_core *muxc = i2c_get_clientdata(client);
>  	int ret = -ENODEV;
>  
>  	if (adap->algo->master_xfer) {
> @@ -230,16 +231,26 @@ static int pca954x_reg_write(struct i2c_adapter *adap,
>  		msg.len = 1;
>  		buf[0] = val;
>  		msg.buf = buf;
> -		ret = __i2c_transfer(adap, &msg, 1);
> +
> +		if (muxc->mux_locked)
> +			ret = i2c_transfer(adap, &msg, 1);
> +		else
> +			ret = __i2c_transfer(adap, &msg, 1);
>  
>  		if (ret >= 0 && ret != 1)
>  			ret = -EREMOTEIO;
>  	} else {
>  		union i2c_smbus_data data;
> -		ret = adap->algo->smbus_xfer(adap, client->addr,
> +		if (muxc->mux_locked)
> +			ret = i2c_smbus_xfer(adap, client->addr,
>  					     client->flags,
>  					     I2C_SMBUS_WRITE,
>  					     val, I2C_SMBUS_BYTE, &data);
> +		else
> +			ret = adap->algo->smbus_xfer(adap, client->addr,
> +						     client->flags,
> +						     I2C_SMBUS_WRITE, val,
> +						     I2C_SMBUS_BYTE, &data);
>  	}
>  
>  	return ret;


Hmm, there is no need to handle the smbus/i2c_transfer differently when
mux-locked. Hence, I would prefer to "just" have three branches instead
of four. Also, the comment at the top of the function is now incorrect.
So, I suggest something like this (only compile-tested, I have no pca954x):

--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -214,33 +214,38 @@ static const struct of_device_id pca954x_of_match[] = {
 MODULE_DEVICE_TABLE(of, pca954x_of_match);
 #endif
 
-/* Write to mux register. Don't use i2c_transfer()/i2c_smbus_xfer()
-   for this as they will try to lock adapter a second time */
 static int pca954x_reg_write(struct i2c_adapter *adap,
 			     struct i2c_client *client, u8 val)
 {
-	int ret = -ENODEV;
-
-	if (adap->algo->master_xfer) {
-		struct i2c_msg msg;
-		char buf[1];
-
-		msg.addr = client->addr;
-		msg.flags = 0;
-		msg.len = 1;
-		buf[0] = val;
-		msg.buf = buf;
-		ret = __i2c_transfer(adap, &msg, 1);
-
-		if (ret >= 0 && ret != 1)
-			ret = -EREMOTEIO;
-	} else {
-		union i2c_smbus_data data;
-		ret = adap->algo->smbus_xfer(adap, client->addr,
-					     client->flags,
-					     I2C_SMBUS_WRITE,
-					     val, I2C_SMBUS_BYTE, &data);
-	}
+	struct i2c_mux_core *muxc = i2c_get_clientdata(client);
+	struct i2c_msg msg = {
+		.addr = client->addr,
+		.len = 1,
+		.buf = &val,
+	};
+	int ret;
+
+	if (muxc->mux_locked)
+		return i2c_smbus_write_byte(client, val);
+
+	/*
+	 * Since we are not mux-locked, we can't use i2c_transfer() or
+	 * i2c_smbus_xfer() as they will try to lock the adapter a second
+	 * time.
+	 */
+	if (!adap->algo->master_xfer) {
+		union i2c_smbus_data data;
+
+		return adap->algo->smbus_xfer(adap, client->addr,
+					      client->flags,
+					      I2C_SMBUS_WRITE,
+					      val, I2C_SMBUS_BYTE, &data);
+	}
+
+	ret = __i2c_transfer(adap, &msg, 1);
+
+	if (ret >= 0 && ret != 1)
+		return -EREMOTEIO;
 
 	return ret;
 }

Otherwise, this patch LGTM. It could be squashed with 2/3 though.

Cheers,
Peter

> @@ -371,7 +382,9 @@ static int pca954x_probe(struct i2c_client *client,
>  	bool idle_disconnect_dt;
>  	struct gpio_desc *gpio;
>  	int num, force, class;
> +	bool mux_locked;
>  	struct i2c_mux_core *muxc;
> +	u32 mux_alloc_flags;
>  	struct pca954x *data;
>  	const struct of_device_id *match;
>  	int ret;
> @@ -379,9 +392,13 @@ static int pca954x_probe(struct i2c_client *client,
>  	if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_BYTE))
>  		return -ENODEV;
>  
> +	mux_locked = of_property_read_bool(of_node, "mux-locked");
> +
> +	mux_alloc_flags = mux_locked ? I2C_MUX_LOCKED : 0;
>  	muxc = i2c_mux_alloc(adap, &client->dev,
> -			     PCA954X_MAX_NCHANS, sizeof(*data), 0,
> -			     pca954x_select_chan, pca954x_deselect_mux);
> +			     PCA954X_MAX_NCHANS, sizeof(*data),
> +			     mux_alloc_flags, pca954x_select_chan,
> +			     pca954x_deselect_mux);
>  	if (!muxc)
>  		return -ENOMEM;
>  	data = i2c_mux_priv(muxc);
> @@ -389,6 +406,8 @@ static int pca954x_probe(struct i2c_client *client,
>  	i2c_set_clientdata(client, muxc);
>  	data->client = client;
>  
> +	muxc->mux_locked = mux_locked;
> +
>  	/* Get the mux out of reset if a reset GPIO is specified. */
>  	gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(gpio))
> @@ -470,8 +489,9 @@ static int pca954x_probe(struct i2c_client *client,
>  	}
>  
>  	dev_info(&client->dev,
> -		 "registered %d multiplexed busses for I2C %s %s\n",
> -		 num, data->chip->muxtype == pca954x_ismux
> +		 "registered %d multiplexed busses for %s-locked I2C %s %s\n",
> +		 num, muxc->mux_locked ? "mux" : "parent",
> +		 data->chip->muxtype == pca954x_ismux
>  				? "mux" : "switch", client->name);
>  
>  	return 0;
> 

