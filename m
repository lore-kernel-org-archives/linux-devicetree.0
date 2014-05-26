From: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] regulator: pfuze100: Don't allocate an invalid gpio
Date: Mon, 26 May 2014 16:45:41 +0800
Message-ID: <1401093941-12386-3-git-send-email-xobs@kosagi.com>
References: <1401093941-12386-1-git-send-email-xobs@kosagi.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401093941-12386-1-git-send-email-xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Previously, the PFUZE100 would try to allocate gpio0 io0 because
config.ena_gpio defaults to 0, which can be a valid GPIO.  To prevent this
from happening, set this parameter to -EINVAL.

Signed-off-by: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/pfuze100-regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/pfuze100-regulator.c
index b20304b..930eb13 100644
--- a/drivers/regulator/pfuze100-regulator.c
+++ b/drivers/regulator/pfuze100-regulator.c
@@ -506,6 +506,7 @@ static int pfuze100_regulator_probe(struct i2c_client *client,
 		config.init_data = init_data;
 		config.driver_data = pfuze_chip;
 		config.of_node = match_of_node(i);
+		config.ena_gpio = -EINVAL;
 
 		pfuze_chip->regulators[i] =
 			devm_regulator_register(&client->dev, desc, &config);
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
