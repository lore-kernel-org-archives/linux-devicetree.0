From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v5 2/9] mfd: axp20x: Remove second struct device
 * parameter for axp20x_match_device()
Date: Fri, 27 Nov 2015 14:43:23 +0800
Message-ID: <1448606610-32647-3-git-send-email-wens@csie.org>
References: <1448606610-32647-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBG7X36ZAKGQE243ZS4Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1448606610-32647-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The first argument passed to axp20x_match_device(), struct axp20x_dev *,
already contains a pointer to the device. By rearranging some code,
moving the assignment of the pointer before axp20x_match_device() is
called, we can eliminate the second parameter.

Suggested-by: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/mfd/axp20x.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 9842199e2e6c..685a78614f83 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -606,8 +606,9 @@ static void axp20x_power_off(void)
 		     AXP20X_OFF);
 }
 
-static int axp20x_match_device(struct axp20x_dev *axp20x, struct device *dev)
+static int axp20x_match_device(struct axp20x_dev *axp20x)
 {
+	struct device *dev = axp20x->dev;
 	const struct acpi_device_id *acpi_id;
 	const struct of_device_id *of_id;
 
@@ -673,14 +674,14 @@ static int axp20x_i2c_probe(struct i2c_client *i2c,
 	if (!axp20x)
 		return -ENOMEM;
 
-	ret = axp20x_match_device(axp20x, &i2c->dev);
-	if (ret)
-		return ret;
-
 	axp20x->i2c_client = i2c;
 	axp20x->dev = &i2c->dev;
 	dev_set_drvdata(axp20x->dev, axp20x);
 
+	ret = axp20x_match_device(axp20x);
+	if (ret)
+		return ret;
+
 	axp20x->regmap = devm_regmap_init_i2c(i2c, axp20x->regmap_cfg);
 	if (IS_ERR(axp20x->regmap)) {
 		ret = PTR_ERR(axp20x->regmap);
-- 
2.6.2
