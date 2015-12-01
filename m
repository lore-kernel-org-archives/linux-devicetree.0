From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v5 3/4] regulator: tps65086: Update regulator driver for the TPS65086 PMIC
Date: Tue, 1 Dec 2015 12:44:03 -0600
Message-ID: <1448995444-29031-4-git-send-email-afd@ti.com>
References: <1448995444-29031-1-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448995444-29031-1-git-send-email-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Make changes to allow this driver to work with the updated TPS65086 core
driver and bindings.

Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
---
 drivers/regulator/tps65086-regulator.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/tps65086-regulator.c b/drivers/regulator/tps65086-regulator.c
index c26fc7e..33f389d 100644
--- a/drivers/regulator/tps65086-regulator.c
+++ b/drivers/regulator/tps65086-regulator.c
@@ -16,10 +16,9 @@
  */
 
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/driver.h>
-#include <linux/regulator/of_regulator.h>
 
 #include <linux/mfd/tps65086.h>
 
@@ -31,6 +30,7 @@ enum tps65086_regulators { BUCK1, BUCK2, BUCK3, BUCK4, BUCK5, BUCK6, LDOA1,
 		.desc = {						\
 			.name			= _name,		\
 			.of_match		= of_match_ptr(_of),	\
+			.regulators_node	= "regulators",		\
 			.of_parse_cb		= tps65086_of_parse_cb,	\
 			.id			= _id,			\
 			.ops			= &reg_ops,		\
@@ -54,6 +54,7 @@ enum tps65086_regulators { BUCK1, BUCK2, BUCK3, BUCK4, BUCK5, BUCK6, LDOA1,
 		.desc = {						\
 			.name			= _name,		\
 			.of_match		= of_match_ptr(_of),	\
+			.regulators_node	= "regulators",		\
 			.of_parse_cb		= tps65086_of_parse_cb,	\
 			.id			= _id,			\
 			.ops			= &switch_ops,		\
@@ -213,8 +214,8 @@ static int tps65086_regulator_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, tps);
 
 	config.dev = &pdev->dev;
+	config.dev->of_node = tps->dev->of_node;
 	config.driver_data = tps;
-	config.of_node = pdev->dev.of_node;
 	config.regmap = tps->regmap;
 
 	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
