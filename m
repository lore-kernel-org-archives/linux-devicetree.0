From: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Subject: [PATCH v2 3/7] gpio: mcp23s08: add support for mcp23018
Date: Fri,  6 Oct 2017 13:08:07 +0800
Message-ID: <1507266491-73971-4-git-send-email-preid@electromag.com.au>
References: <1507266491-73971-1-git-send-email-preid@electromag.com.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507266491-73971-1-git-send-email-preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org, preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds the required definitions for the mcp23018 which is the i2c
variant of the mcp23s18.

Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 3e40d42..8d356df 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -25,6 +25,7 @@
 #define MCP_TYPE_008	2
 #define MCP_TYPE_017	3
 #define MCP_TYPE_S18    4
+#define MCP_TYPE_018    5
 
 #define MCP_MAX_DEV_PER_CS	8
 
@@ -837,6 +838,13 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		mcp->chip.ngpio = 16;
 		mcp->chip.label = "mcp23017";
 		break;
+
+	case MCP_TYPE_018:
+		mcp->regmap = devm_regmap_init_i2c(data, &mcp23x17_regmap);
+		mcp->reg_shift = 1;
+		mcp->chip.ngpio = 16;
+		mcp->chip.label = "mcp23018";
+		break;
 #endif /* CONFIG_I2C */
 
 	default:
@@ -883,7 +891,7 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		if (mirror)
 			status |= IOCON_MIRROR | (IOCON_MIRROR << 8);
 
-		if (type == MCP_TYPE_S18)
+		if (type == MCP_TYPE_S18 || type == MCP_TYPE_018)
 			status |= IOCON_INTCC | (IOCON_INTCC << 8);
 
 		ret = mcp_write(mcp, MCP_IOCON, status);
@@ -964,6 +972,10 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		.compatible = "microchip,mcp23017",
 		.data = (void *) MCP_TYPE_017,
 	},
+	{
+		.compatible = "microchip,mcp23018",
+		.data = (void *) MCP_TYPE_018,
+	},
 /* NOTE: The use of the mcp prefix is deprecated and will be removed. */
 	{
 		.compatible = "mcp,mcp23008",
@@ -1013,6 +1025,7 @@ static int mcp230xx_probe(struct i2c_client *client,
 static const struct i2c_device_id mcp230xx_id[] = {
 	{ "mcp23008", MCP_TYPE_008 },
 	{ "mcp23017", MCP_TYPE_017 },
+	{ "mcp23018", MCP_TYPE_018 },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, mcp230xx_id);
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
