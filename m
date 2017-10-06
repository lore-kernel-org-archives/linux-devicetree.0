From: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Subject: [PATCH v2 7/7] pinctrl: mcp23s08: remove unused variables from pinconf_set
Date: Fri,  6 Oct 2017 13:08:11 +0800
Message-ID: <1507266491-73971-8-git-send-email-preid@electromag.com.au>
References: <1507266491-73971-1-git-send-email-preid@electromag.com.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507266491-73971-1-git-send-email-preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org, preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Variable mask and val are not used in the mcp_pinconf_set().

Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 8dceaa1..8e461cc 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -279,8 +279,7 @@ static int mcp_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 {
 	struct mcp23s08 *mcp = pinctrl_dev_get_drvdata(pctldev);
 	enum pin_config_param param;
-	u32 arg, mask;
-	u16 val;
+	u32 arg;
 	int ret = 0;
 	int i;
 
@@ -290,8 +289,6 @@ static int mcp_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 
 		switch (param) {
 		case PIN_CONFIG_BIAS_PULL_UP:
-			val = arg ? 0xFFFF : 0x0000;
-			mask = BIT(pin);
 			ret = mcp_set_bit(mcp, MCP_GPPU, pin, arg);
 			break;
 		default:
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
