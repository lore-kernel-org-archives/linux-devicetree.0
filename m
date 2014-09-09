From: Matti Vaittinen <matti.vaittinen-OYasijW0DpE@public.gmane.org>
Subject: [PATCH v5 2/2] rtc: ds1307: add trickle charger device tree binding.
Date: Tue, 9 Sep 2014 17:33:49 +0300
Message-ID: <20140909143342.GA2179@fi-ourus-dhcp00977.emea.nsn-net.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, "jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org" <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org" <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, san-KGKi0rHxN0fKWSuBa/xFvVpr/1R2p/CL@public.gmane.org, hs-ynQEQJNshbs@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Sverdlin Alexander <alexander.sverdlin-OYasijW0DpE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some DS13XX devices have "trickle chargers". Introduce a device tree
binding for specifying the trickle charger configuration for ds1339.

Only ds1339 dt binding is supported because this is the only chip I have.
I _assume_ the code would have worked on other allready supported chips.
However I cannot check the resistor values for the other chips or test them.
For other chips the driver code works as earlier Eg. it does not check the
dt bindings at all

Signed-off-by: Matti Vaittinen <matti.vaittinen-OYasijW0DpE@public.gmane.org>
---

Delta to v5
    -Actually sent correct patch

 drivers/rtc/rtc-ds1307.c | 67 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index f03d5ba..bb43cf7 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -126,9 +126,14 @@ struct chip_desc {
 	u16			nvram_offset;
 	u16			nvram_size;
 	u16			trickle_charger_reg;
+	u8			trickle_charger_setup;
+	u8			(*do_trickle_setup)(struct i2c_client *, uint32_t, bool);
 };
 
-static const struct chip_desc chips[last_ds_type] = {
+static u8 do_trickle_setup_ds1339(struct i2c_client *,
+				  uint32_t ohms, bool diode);
+
+static struct chip_desc chips[last_ds_type] = {
 	[ds_1307] = {
 		.nvram_offset	= 8,
 		.nvram_size	= 56,
@@ -143,6 +148,7 @@ static const struct chip_desc chips[last_ds_type] = {
 	[ds_1339] = {
 		.alarm		= 1,
 		.trickle_charger_reg = 0x10,
+		.do_trickle_setup = &do_trickle_setup_ds1339,
 	},
 	[ds_1340] = {
 		.trickle_charger_reg = 0x08,
@@ -833,15 +839,58 @@ ds1307_nvram_write(struct file *filp, struct kobject *kobj,
 	return count;
 }
 
+
 /*----------------------------------------------------------------------*/
 
+static u8 do_trickle_setup_ds1339(struct i2c_client *client,
+				  uint32_t ohms, bool diode)
+{
+	u8 setup = (diode) ? DS1307_TRICKLE_CHARGER_DIODE :
+		DS1307_TRICKLE_CHARGER_NO_DIODE;
+
+	switch (ohms) {
+	case 250:
+		setup |= DS1307_TRICKLE_CHARGER_250_OHM;
+		break;
+	case 2000:
+		setup |= DS1307_TRICKLE_CHARGER_2K_OHM;
+		break;
+	case 4000:
+		setup |= DS1307_TRICKLE_CHARGER_4K_OHM;
+		break;
+	default:
+		dev_warn(&client->dev,
+			 "Unsupported ohm value %u in dt\n", ohms);
+		return 0;
+	}
+	return setup;
+}
+
+static void ds1307_trickle_of_init(struct i2c_client *client,
+				   struct chip_desc *chip)
+{
+	uint32_t ohms = 0;
+	bool diode = true;
+
+	if (!chip->do_trickle_setup)
+		goto out;
+	if (of_property_read_u32(client->dev.of_node, "trickle-resistor-ohms" , &ohms))
+		goto out;
+	if (of_property_read_bool(client->dev.of_node, "trickle-diode-disable"))
+		diode = false;
+	chip->trickle_charger_setup = chip->do_trickle_setup(client,
+							     ohms, diode);
+out:
+	return;
+}
+
 static int ds1307_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
 	struct ds1307		*ds1307;
 	int			err = -ENODEV;
 	int			tmp;
-	const struct chip_desc	*chip = &chips[id->driver_data];
+	struct chip_desc	*chip = &chips[id->driver_data];
 	struct i2c_adapter	*adapter = to_i2c_adapter(client->dev.parent);
 	bool			want_irq = false;
 	unsigned char		*buf;
@@ -866,9 +915,19 @@ static int ds1307_probe(struct i2c_client *client,
 	ds1307->client	= client;
 	ds1307->type	= id->driver_data;
 
-	if (pdata && pdata->trickle_charger_setup && chip->trickle_charger_reg)
+	if (!pdata && client->dev.of_node)
+		ds1307_trickle_of_init(client, chip);
+	else if (pdata && pdata->trickle_charger_setup)
+		chip->trickle_charger_setup = pdata->trickle_charger_setup;
+
+	if (chip->trickle_charger_setup && chip->trickle_charger_reg) {
+		dev_dbg(&client->dev, "writing trickle charger info 0x%x to 0x%x\n",
+		    DS13XX_TRICKLE_CHARGER_MAGIC | chip->trickle_charger_setup,
+		    chip->trickle_charger_reg);
 		i2c_smbus_write_byte_data(client, chip->trickle_charger_reg,
-			DS13XX_TRICKLE_CHARGER_MAGIC | pdata->trickle_charger_setup);
+		    DS13XX_TRICKLE_CHARGER_MAGIC |
+		    chip->trickle_charger_setup);
+	}
 
 	buf = ds1307->regs;
 	if (i2c_check_functionality(adapter, I2C_FUNC_SMBUS_I2C_BLOCK)) {
-- 
1.8.3.1


-- 
=============================================

Matti Vaittinen
Senile SW Specialist
FINLAND 

~~ When things go utterly wrong vim users can always type :help! ~~

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
