From: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] backlight: lp855x: use private data for regulator control
Date: Tue, 30 Jun 2015 15:16:21 +0900
Message-ID: <1435644981-5568-1-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>;Lee Jones" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

LP855x backlight device can be enabled by external VDD input.
The 'supply' data is used for this purpose.
It's kind of private data which runs internally, so there is no reason to
expose to the platform data.

And LP855x DT property, 'power-supply' is unnecessary.
If a regulator is registered correctly, then lp855x driver can get
regulator resource by using devm_regulator_get().
So devm_regulator_get() is moved from _parse_dt() to _probe().
Ex) The following device tree works without 'power-supply' property.

	i2c0: i2c@10002000 {
		(snip)

		backlight@2c {
			compatible = "ti,lp8556";
			reg = <0x2c>;

			bl-name = "lcd-bl";
			dev-ctrl = /bits/ 8 <0x85>;
			init-brt = /bits/ 8 <0x10>;
		};
	};

	/* 'power' regulator for LP8556 VDD */
	bl_vdd: fixed-regulator@1 {
		compatible = "regulator-fixed";
		regulator-name = "power";
		regulator-min-microvolt = <3300000>;
		regulator-max-microvolt = <3300000>;

		(snip)
	};

Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/video/backlight/lp855x.txt   |  2 --
 drivers/video/backlight/lp855x_bl.c                  | 20 +++++++++-----------
 include/linux/platform_data/lp855x.h                 |  2 --
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/backlight/lp855x.txt b/Documentation/devicetree/bindings/video/backlight/lp855x.txt
index 0a3ecbc..96e83a5 100644
--- a/Documentation/devicetree/bindings/video/backlight/lp855x.txt
+++ b/Documentation/devicetree/bindings/video/backlight/lp855x.txt
@@ -12,7 +12,6 @@ Optional properties:
   - pwm-period: PWM period value. Set only PWM input mode used (u32)
   - rom-addr: Register address of ROM area to be updated (u8)
   - rom-val: Register value to be updated (u8)
-  - power-supply: Regulator which controls the 3V rail
 
 Example:
 
@@ -57,7 +56,6 @@ Example:
 	backlight@2c {
 		compatible = "ti,lp8557";
 		reg = <0x2c>;
-		power-supply = <&backlight_vdd>;
 
 		dev-ctrl = /bits/ 8 <0x41>;
 		init-brt = /bits/ 8 <0x0a>;
diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index a26d3bb..277d5ca 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -73,6 +73,7 @@ struct lp855x {
 	struct device *dev;
 	struct lp855x_platform_data *pdata;
 	struct pwm_device *pwm;
+	struct regulator *supply;	/* regulator for VDD input */
 };
 
 static int lp855x_write_byte(struct lp855x *lp, u8 reg, u8 data)
@@ -384,13 +385,6 @@ static int lp855x_parse_dt(struct lp855x *lp)
 		pdata->rom_data = &rom[0];
 	}
 
-	pdata->supply = devm_regulator_get(dev, "power");
-	if (IS_ERR(pdata->supply)) {
-		if (PTR_ERR(pdata->supply) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		pdata->supply = NULL;
-	}
-
 	lp->pdata = pdata;
 
 	return 0;
@@ -431,8 +425,12 @@ static int lp855x_probe(struct i2c_client *cl, const struct i2c_device_id *id)
 	else
 		lp->mode = REGISTER_BASED;
 
-	if (lp->pdata->supply) {
-		ret = regulator_enable(lp->pdata->supply);
+	lp->supply = devm_regulator_get(lp->dev, "power");
+	if (IS_ERR(lp->supply))
+		lp->supply = NULL;
+
+	if (lp->supply) {
+		ret = regulator_enable(lp->supply);
 		if (ret < 0) {
 			dev_err(&cl->dev, "failed to enable supply: %d\n", ret);
 			return ret;
@@ -470,8 +468,8 @@ static int lp855x_remove(struct i2c_client *cl)
 
 	lp->bl->props.brightness = 0;
 	backlight_update_status(lp->bl);
-	if (lp->pdata->supply)
-		regulator_disable(lp->pdata->supply);
+	if (lp->supply)
+		regulator_disable(lp->supply);
 	sysfs_remove_group(&lp->dev->kobj, &lp855x_attr_group);
 
 	return 0;
diff --git a/include/linux/platform_data/lp855x.h b/include/linux/platform_data/lp855x.h
index 9c7fd1e..1b2ba24 100644
--- a/include/linux/platform_data/lp855x.h
+++ b/include/linux/platform_data/lp855x.h
@@ -136,7 +136,6 @@ struct lp855x_rom_data {
 		Only valid when mode is PWM_BASED.
  * @size_program : total size of lp855x_rom_data
  * @rom_data : list of new eeprom/eprom registers
- * @supply : regulator that supplies 3V input
  */
 struct lp855x_platform_data {
 	const char *name;
@@ -145,7 +144,6 @@ struct lp855x_platform_data {
 	unsigned int period_ns;
 	int size_program;
 	struct lp855x_rom_data *rom_data;
-	struct regulator *supply;
 };
 
 #endif
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
