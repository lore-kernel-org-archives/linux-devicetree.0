From: Mesih Kilinc <mesihkilinc@gmail.com>
Subject: [RFC PATCH v3 15/17] watchdog: Add support for Allwinner ARMv5 F1C100s wdt
Date: Wed, 21 Nov 2018 21:30:48 +0300
Message-ID: <09c57147e53dda00eaae83178d0a25fe3f50dd1e.1542824904.git.mesihkilinc@gmail.com>
References: <cover.1542824904.git.mesihkilinc@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1542824904.git.mesihkilinc@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Mesih Kilinc <mesihkilinc@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Russell King <linux@armlinux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>, Julian Calaby <julian.calaby@gmail.com>
List-Id: devicetree@vger.kernel.org

Allwinner ARMv5 F1C100s has similar watchdog timer to sun6i A31.
Add compatible string for it.

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
---
 drivers/watchdog/sunxi_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/sunxi_wdt.c b/drivers/watchdog/sunxi_wdt.c
index c6c7365..bc70742 100644
--- a/drivers/watchdog/sunxi_wdt.c
+++ b/drivers/watchdog/sunxi_wdt.c
@@ -227,6 +227,7 @@ static const struct sunxi_wdt_reg sun6i_wdt_reg = {
 static const struct of_device_id sunxi_wdt_dt_ids[] = {
 	{ .compatible = "allwinner,sun4i-a10-wdt", .data = &sun4i_wdt_reg },
 	{ .compatible = "allwinner,sun6i-a31-wdt", .data = &sun6i_wdt_reg },
+	{ .compatible = "allwinner,suniv-f1c100s-wdt", .data = &sun6i_wdt_reg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sunxi_wdt_dt_ids);
-- 
2.7.4
