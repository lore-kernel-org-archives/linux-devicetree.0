From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/2] regulator: axp20x: Fix axp209 ldo4 ranges
Date: Thu, 17 Mar 2016 19:52:30 +0100
Message-ID: <1458240751-30281-1-git-send-email-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The axp209 ldo4 regulator has a hole at (skips) 2600 mV and 2900 mV, fix
its range table to match.

Fixes: 13d57e64352a ("regulator: axp20x: Use linear voltage ranges for AXP20X LDO4")
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
Changes in v2:
-Add Fixes, Acked-by Chen-Yu tags
---
 drivers/regulator/axp20x-regulator.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index 3f82e87..5041373 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -157,7 +157,9 @@ static struct regulator_ops axp20x_ops_sw = {
 static const struct regulator_linear_range axp20x_ldo4_ranges[] = {
 	REGULATOR_LINEAR_RANGE(1250000, 0x0, 0x0, 0),
 	REGULATOR_LINEAR_RANGE(1300000, 0x1, 0x8, 100000),
-	REGULATOR_LINEAR_RANGE(2500000, 0x9, 0xf, 100000),
+	REGULATOR_LINEAR_RANGE(2500000, 0x9, 0x9, 0),
+	REGULATOR_LINEAR_RANGE(2700000, 0xa, 0xb, 100000),
+	REGULATOR_LINEAR_RANGE(3000000, 0xc, 0xf, 100000),
 };
 
 static const struct regulator_desc axp20x_regulators[] = {
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
