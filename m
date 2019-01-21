Return-Path: <SRS0=ntIc=P5=gmail.com=robertshearman@kernel.org>
From: Robert Shearman <robertshearman@gmail.com>
Subject: [PATCH 1/2] i2c: mux: pca954x: change the default to deselect after each transfer
Date: Mon, 21 Jan 2019 16:47:41 +0000
Message-Id: <20190121164742.35718-1-robertshearman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Robert Shearman <robert.shearman@att.com>
List-ID: <devicetree@vger.kernel.org>

From: Robert Shearman <robert.shearman@att.com>

The behaviour, by default, to not deselect after each transfer is
not safe/correct when there is a device with an address that conflicts
with another device either on the parent bus, or on another pca954x
mux on the same parent bus.

Therefore, default to the least surprising mode, where the mux
channels are deselected after each transaction, which is safe in the
face of one or more devices hanging off the mux with addresses that
conflict with other devices on different muxes, or on the parent
bus. On systems where it is guaranteed that this is not the case, then
the i2c-mux-no-idle-disconnect devicetree or no_deselect_on_exit
platform data options can be used to improve the performance.

Signed-off-by: Robert Shearman <robert.shearman@att.com>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c   | 16 +++++++++-------
 include/linux/platform_data/pca954x.h |  6 +++---
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index bfabf985e830..c2b6cff4ba3c 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -351,7 +351,7 @@ static int pca954x_probe(struct i2c_client *client,
 	struct pca954x_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct device *dev = &client->dev;
 	struct device_node *np = dev->of_node;
-	bool idle_disconnect_dt;
+	bool no_idle_disconnect_dt;
 	struct gpio_desc *gpio;
 	int num, force, class;
 	struct i2c_mux_core *muxc;
@@ -412,9 +412,10 @@ static int pca954x_probe(struct i2c_client *client,
 	}
 
 	data->last_chan = 0;		   /* force the first selection */
+	data->deselect = GENMASK(data->chip->nchans, 0);
 
-	idle_disconnect_dt = np &&
-		of_property_read_bool(np, "i2c-mux-idle-disconnect");
+	no_idle_disconnect_dt = np &&
+		of_property_read_bool(np, "i2c-mux-no-idle-disconnect");
 
 	ret = pca954x_irq_setup(muxc);
 	if (ret)
@@ -422,7 +423,7 @@ static int pca954x_probe(struct i2c_client *client,
 
 	/* Now create an adapter for each channel */
 	for (num = 0; num < data->chip->nchans; num++) {
-		bool idle_disconnect_pd = false;
+		bool no_idle_disconnect_pd = false;
 
 		force = 0;			  /* dynamic adap number */
 		class = 0;			  /* no class by default */
@@ -434,10 +435,11 @@ static int pca954x_probe(struct i2c_client *client,
 			} else
 				/* discard unconfigured channels */
 				break;
-			idle_disconnect_pd = pdata->modes[num].deselect_on_exit;
+			no_idle_disconnect_pd =
+				pdata->modes[num].no_deselect_on_exit;
 		}
-		data->deselect |= (idle_disconnect_pd ||
-				   idle_disconnect_dt) << num;
+		data->deselect &= ~((no_idle_disconnect_pd ||
+				     no_idle_disconnect_dt) << num);
 
 		ret = i2c_mux_add_adapter(muxc, force, num, class);
 		if (ret)
diff --git a/include/linux/platform_data/pca954x.h b/include/linux/platform_data/pca954x.h
index 1712677d5904..cb5359797867 100644
--- a/include/linux/platform_data/pca954x.h
+++ b/include/linux/platform_data/pca954x.h
@@ -29,13 +29,13 @@
 
 /* Per channel initialisation data:
  * @adap_id: bus number for the adapter. 0 = don't care
- * @deselect_on_exit: set this entry to 1, if your H/W needs deselection
- *                    of this channel after transaction.
+ * @no_deselect_on_exit: set this entry to 1, if your H/W doesn't need
+ *                       deselection of this channel after transaction.
  *
  */
 struct pca954x_platform_mode {
 	int		adap_id;
-	unsigned int	deselect_on_exit:1;
+	unsigned int	no_deselect_on_exit:1;
 	unsigned int	class;
 };
 
-- 
2.20.1
