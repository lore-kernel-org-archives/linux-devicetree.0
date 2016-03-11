From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] regulator: axp20x: Fix axp22x ldo_io
 registration error on cold boot
Date: Fri, 11 Mar 2016 21:12:31 +0100
Message-ID: <1457727151-16392-2-git-send-email-hdegoede@redhat.com>
References: <1457727151-16392-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBPGNRS3QKGQEVSGLCNI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1457727151-16392-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The maximum supported voltage for ldo_io# is 3.3V, but on cold
boot the selector comes up at 0x1f, which maps to 3.8V.

This causes _regulator_get_voltage() to fail with -EINVAL which
causes regulator registration to fail when constrains are used:

[    1.467788] vcc-touchscreen: failed to get the current voltage(-22)
[    1.474209] axp20x-regulator axp20x-regulator: Failed to register ldo_io1
[    1.483363] axp20x-regulator: probe of axp20x-regulator failed with error -22

This commits makes axp20x_probe fix-up the selector values in
the chip before registering regulators avoiding the above errors.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/axp20x-regulator.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index 0c0e7a3..679018c 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -345,6 +345,7 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
 		.driver_data = axp20x,
 	};
 	int ret, i, nregulators;
+	unsigned int reg, sel;
 	u32 workmode;
 	const char *axp22x_dc1_name = axp22x_regulators[AXP22X_DCDC1].name;
 	const char *axp22x_dc5_name = axp22x_regulators[AXP22X_DCDC5].name;
@@ -359,6 +360,24 @@ static int axp20x_regulator_probe(struct platform_device *pdev)
 	case AXP223_ID:
 		regulators = axp22x_regulators;
 		nregulators = AXP22X_REG_ID_MAX;
+		/*
+		 * On cold boot ldo_io# sel is 0x1f which is out of spec,
+		 * fix this up here to avoid _regulator_get_voltage returning
+		 * -EINVAL when applying constraints.
+		 */
+		for (reg = AXP22X_LDO_IO0_V_OUT;
+		     reg <= AXP22X_LDO_IO1_V_OUT; reg += 2) {
+			ret = regmap_read(axp20x->regmap, reg, &sel);
+			if (ret)
+				return ret;
+			sel &= 0x1f;
+			if (sel > 0x1a) {
+				ret = regmap_update_bits(axp20x->regmap, reg,
+							 0x1f, 0x1a);
+				if (ret)
+					return ret;
+			}
+		}
 		break;
 	default:
 		dev_err(&pdev->dev, "Unsupported AXP variant: %ld\n",
-- 
2.7.2
