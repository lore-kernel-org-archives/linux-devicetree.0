From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v2 1/3] [media] mt9v032: Add reset and standby gpios
Date: Mon, 14 Dec 2015 15:41:51 +0100
Message-ID: <1450104113-6392-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add optional reset and standby gpios. The reset gpio is used to reset
the chip in power_on().

The standby gpio is not used currently. It is just unset, so the chip i=
s
not in standby.

Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Reviewed-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/media/i2c/mt9v032.txt      |  2 ++
 drivers/media/i2c/mt9v032.c                        | 28 ++++++++++++++=
++++++++
 2 files changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/mt9v032.txt b/=
Documentation/devicetree/bindings/media/i2c/mt9v032.txt
index 202565313e82..100f0ae43269 100644
--- a/Documentation/devicetree/bindings/media/i2c/mt9v032.txt
+++ b/Documentation/devicetree/bindings/media/i2c/mt9v032.txt
@@ -20,6 +20,8 @@ Optional Properties:
=20
 - link-frequencies: List of allowed link frequencies in Hz. Each frequ=
ency is
 	expressed as a 64-bit big-endian integer.
+- reset-gpios: GPIO handle which is connected to the reset pin of the =
chip.
+- standby-gpios: GPIO handle which is connected to the standby pin of =
the chip.
=20
 For further reading on port node refer to
 Documentation/devicetree/bindings/media/video-interfaces.txt.
diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index a68ce94ee097..c1bc564a0979 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -14,6 +14,7 @@
=20
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/log2.h>
 #include <linux/mutex.h>
@@ -251,6 +252,8 @@ struct mt9v032 {
=20
 	struct regmap *regmap;
 	struct clk *clk;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *standby_gpio;
=20
 	struct mt9v032_platform_data *pdata;
 	const struct mt9v032_model_info *model;
@@ -312,16 +315,31 @@ static int mt9v032_power_on(struct mt9v032 *mt9v0=
32)
 	struct regmap *map =3D mt9v032->regmap;
 	int ret;
=20
+	if (mt9v032->reset_gpio)
+		gpiod_set_value_cansleep(mt9v032->reset_gpio, 1);
+
 	ret =3D clk_set_rate(mt9v032->clk, mt9v032->sysclk);
 	if (ret < 0)
 		return ret;
=20
+	/* System clock has to be enabled before releasing the reset */
 	ret =3D clk_prepare_enable(mt9v032->clk);
 	if (ret)
 		return ret;
=20
 	udelay(1);
=20
+	if (mt9v032->reset_gpio) {
+		gpiod_set_value_cansleep(mt9v032->reset_gpio, 0);
+
+		/* After releasing reset we need to wait 10 clock cycles
+		 * before accessing the sensor over I2C. As the minimum SYSCLK
+		 * frequency is 13MHz, waiting 1=C2=B5s will be enough in the worst
+		 * case.
+		 */
+		udelay(1);
+	}
+
 	/* Reset the chip and stop data read out */
 	ret =3D regmap_write(map, MT9V032_RESET, 1);
 	if (ret < 0)
@@ -954,6 +972,16 @@ static int mt9v032_probe(struct i2c_client *client=
,
 	if (IS_ERR(mt9v032->clk))
 		return PTR_ERR(mt9v032->clk);
=20
+	mt9v032->reset_gpio =3D devm_gpiod_get_optional(&client->dev, "reset"=
,
+						      GPIOD_OUT_HIGH);
+	if (IS_ERR(mt9v032->reset_gpio))
+		return PTR_ERR(mt9v032->reset_gpio);
+
+	mt9v032->standby_gpio =3D devm_gpiod_get_optional(&client->dev, "stan=
dby",
+							GPIOD_OUT_LOW);
+	if (IS_ERR(mt9v032->standby_gpio))
+		return PTR_ERR(mt9v032->standby_gpio);
+
 	mutex_init(&mt9v032->power_lock);
 	mt9v032->pdata =3D pdata;
 	mt9v032->model =3D (const void *)did->driver_data;
--=20
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
