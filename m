From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/2] regulator: axp20x: Fix axp22x ldo_io voltage ranges
Date: Thu, 17 Mar 2016 19:52:31 +0100
Message-ID: <1458240751-30281-2-git-send-email-hdegoede@redhat.com>
References: <1458240751-30281-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458240751-30281-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The minium voltage of 1800mV is a copy and paste error from the axp20x
regulator info. The correct minimum voltage for the ldo_io regulators
on the axp22x is 700mV.

Fixes: 1b82b4e4f954 ("regulator: axp20x: Add support for AXP22X regulators")
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
Changes in v2:
-Add Fixes, Acked-by Chen-Yu tags
---
 drivers/regulator/axp20x-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index 5041373..500d162 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -217,10 +217,10 @@ static const struct regulator_desc axp22x_regulators[] = {
 		 AXP22X_ELDO2_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(1)),
 	AXP_DESC(AXP22X, ELDO3, "eldo3", "eldoin", 700, 3300, 100,
 		 AXP22X_ELDO3_V_OUT, 0x1f, AXP22X_PWR_OUT_CTRL2, BIT(2)),
-	AXP_DESC_IO(AXP22X, LDO_IO0, "ldo_io0", "ips", 1800, 3300, 100,
+	AXP_DESC_IO(AXP22X, LDO_IO0, "ldo_io0", "ips", 700, 3300, 100,
 		    AXP22X_LDO_IO0_V_OUT, 0x1f, AXP20X_GPIO0_CTRL, 0x07,
 		    AXP22X_IO_ENABLED, AXP22X_IO_DISABLED),
-	AXP_DESC_IO(AXP22X, LDO_IO1, "ldo_io1", "ips", 1800, 3300, 100,
+	AXP_DESC_IO(AXP22X, LDO_IO1, "ldo_io1", "ips", 700, 3300, 100,
 		    AXP22X_LDO_IO1_V_OUT, 0x1f, AXP20X_GPIO1_CTRL, 0x07,
 		    AXP22X_IO_ENABLED, AXP22X_IO_DISABLED),
 	AXP_DESC_FIXED(AXP22X, RTC_LDO, "rtc_ldo", "ips", 3000),
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
