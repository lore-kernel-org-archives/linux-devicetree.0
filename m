From: Jakub =?UTF-8?B?S2ljacWEc2tp?= <moorray3-5tc4TXWwyLM@public.gmane.org>
Subject: I2C device tree driver compatible strings
Date: Sat, 11 Apr 2015 21:36:14 +0200
Message-ID: <20150411213614.63632aff@north>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

sc16is7xx declares two device id tables, one with OF ids:

static const struct of_device_id __maybe_unused sc16is7xx_dt_ids[] = {
	{ .compatible = "nxp,sc16is740",	.data = &sc16is74x_devtype, },
	{ .compatible = "nxp,sc16is741",	.data = &sc16is74x_devtype, },
	{ .compatible = "nxp,sc16is750",	.data = &sc16is750_devtype, },	
	{ .compatible = "nxp,sc16is752",	.data = &sc16is752_devtype, },
	{ .compatible = "nxp,sc16is760",	.data = &sc16is760_devtype, },
	{ .compatible = "nxp,sc16is762",	.data = &sc16is762_devtype, },
	{ }
};
MODULE_DEVICE_TABLE(of, sc16is7xx_dt_ids);

and one with i2c ids:

static const struct i2c_device_id sc16is7xx_i2c_id_table[] = {
	{ "sc16is74x",	(kernel_ulong_t)&sc16is74x_devtype, },
	{ "sc16is750",	(kernel_ulong_t)&sc16is750_devtype, },
	{ "sc16is752",	(kernel_ulong_t)&sc16is752_devtype, },
	{ "sc16is760",	(kernel_ulong_t)&sc16is760_devtype, },
	{ "sc16is762",	(kernel_ulong_t)&sc16is762_devtype, },
	{ }
};
MODULE_DEVICE_TABLE(i2c, sc16is7xx_i2c_id_table);

I declare my device in DT under I2C controller as
>	compatible = "nxp,sc16is740";
However, the driver does not get loaded automatically because its
i2c id table contains "sc16is74x" instead of "sc16is740".

I have three questions:

(1) What is the relation between i2c_device_id and of_device_id strings
    and why does the driver define both?

(2) What are the rules for loading i2c drivers based on DT and why is the
    driver not loaded even though its compatible with one of the OF ids?

(3) Is it OK for the driver to define incompatible strings or should I
    correct them like this (keeping the old entry for backwards
    compatibility):

diff --git a/drivers/tty/serial/sc16is7xx.c
b/drivers/tty/serial/sc16is7xx.c index eaf0008a39cb..efe286d00174 100644
--- a/drivers/tty/serial/sc16is7xx.c
+++ b/drivers/tty/serial/sc16is7xx.c
@@ -1219,6 +1219,8 @@ static int sc16is7xx_i2c_remove(struct i2c_client
*client) 
 static const struct i2c_device_id sc16is7xx_i2c_id_table[] = {
        { "sc16is74x",  (kernel_ulong_t)&sc16is74x_devtype, },
+       { "sc16is740",  (kernel_ulong_t)&sc16is74x_devtype, },
+       { "sc16is741",  (kernel_ulong_t)&sc16is74x_devtype, },
        { "sc16is750",  (kernel_ulong_t)&sc16is750_devtype, },
        { "sc16is752",  (kernel_ulong_t)&sc16is752_devtype, },
        { "sc16is760",  (kernel_ulong_t)&sc16is760_devtype, },


Thanks,
Kuba
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
