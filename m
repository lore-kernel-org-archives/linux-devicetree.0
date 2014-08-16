From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH v3 2/7] net: cpsw: Add missing return value
Date: Sat, 16 Aug 2014 17:18:30 +0200
Message-ID: <1408202315-20006-3-git-send-email-mpa@pengutronix.de>
References: <1408202315-20006-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1408202315-20006-1-git-send-email-mpa@pengutronix.de>
Sender: linux-omap-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Wolfram Sang <wsa@the-dreams.de>, Steven Rostedt <rostedt@goodmis.org>, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>
List-Id: devicetree@vger.kernel.org

ret is set 0 at this point, so jumping to that error label would result
in a return value of 0. Set ret to -ENOMEM to return a proper error
value.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 drivers/net/ethernet/ti/cpsw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index ff380dac6629..43b2777f8e04 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -2043,6 +2043,7 @@ static int cpsw_probe(struct platform_device *pdev)
 	priv->irq_enabled = true;
 	if (!priv->cpts) {
 		dev_err(&pdev->dev, "error allocating cpts\n");
+		ret = -ENOMEM;
 		goto clean_ndev_ret;
 	}
 
-- 
2.0.1

