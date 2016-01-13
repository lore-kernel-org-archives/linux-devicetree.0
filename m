From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v7 06/10] mfd: axp20x: Whitespace, open
 parenthesis alignment code style fixes
Date: Wed, 13 Jan 2016 11:30:50 +0800
Message-ID: <1452655854-1528-7-git-send-email-wens@csie.org>
References: <1452655854-1528-1-git-send-email-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB4UJ262AKGQEYE5MT4Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1452655854-1528-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This fixes some leftover code style issues in the axp20x core.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/mfd/axp20x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 8e569bcfe3bc..3054ea4b95e8 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -593,14 +593,14 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 			dev_err(dev, "Unable to match OF ID\n");
 			return -ENODEV;
 		}
-		axp20x->variant = (long) of_id->data;
+		axp20x->variant = (long)of_id->data;
 	} else {
 		acpi_id = acpi_match_device(dev->driver->acpi_match_table, dev);
 		if (!acpi_id || !acpi_id->driver_data) {
 			dev_err(dev, "Unable to match ACPI ID and data\n");
 			return -ENODEV;
 		}
-		axp20x->variant = (long) acpi_id->driver_data;
+		axp20x->variant = (long)acpi_id->driver_data;
 	}
 
 	switch (axp20x->variant) {
@@ -634,7 +634,7 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 		return -EINVAL;
 	}
 	dev_info(dev, "AXP20x variant %s found\n",
-		axp20x_model_names[axp20x->variant]);
+		 axp20x_model_names[axp20x->variant]);
 
 	return 0;
 }
@@ -654,7 +654,7 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
 	}
 
 	ret = mfd_add_devices(axp20x->dev, -1, axp20x->cells,
-			axp20x->nr_cells, NULL, 0, NULL);
+			      axp20x->nr_cells, NULL, 0, NULL);
 
 	if (ret) {
 		dev_err(axp20x->dev, "failed to add MFD devices: %d\n", ret);
-- 
2.6.4
