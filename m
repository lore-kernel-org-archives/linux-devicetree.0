Return-Path: <SRS0=/mGh=FN=electromag.com.au=preid@kernel.org>
From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH v4 1/3] pinctrl: mcp23s08: fix probing of mcp23s18
Date: Mon, 19 Feb 2018 17:25:18 +0800
Message-Id: <1519032320-103817-2-git-send-email-preid@electromag.com.au>
In-Reply-To: <1519032320-103817-1-git-send-email-preid@electromag.com.au>
References: <1519032320-103817-1-git-send-email-preid@electromag.com.au>
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, sre@kernel.org, preid@electromag.com.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, jan.kundrat@cesnet.cz
List-ID: <devicetree@vger.kernel.org>

one_regmap_config is always null if mcp type is MCP_TYPE_S18.
Remove the null check so that the mcp23s18 will probe.

Fixes: 1781af563aef66c2eb7cda ("pinctrl: mcp23s08: spi: Fix
duplicate pinctrl debugfs entries")

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index f3f9f19..83277570 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -823,8 +823,6 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		break;
 
 	case MCP_TYPE_S18:
-		if (!one_regmap_config)
-			return -ENOMEM;
 		mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
 					       &mcp23x17_regmap);
 		mcp->reg_shift = 1;
-- 
1.8.3.1
