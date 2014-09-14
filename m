From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 2/5] regulator: fan53555: set regulator name from constraints name
Date: Sun, 14 Sep 2014 21:23:02 +0200
Message-ID: <1410722585-13393-3-git-send-email-heiko@sntech.de>
References: <1410722585-13393-1-git-send-email-heiko@sntech.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1410722585-13393-1-git-send-email-heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, Heiko Stuebner <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

There is a high potential of more than one of those regulators existing
on a board, so name the regulator according to the name provided in the
initdata instead of statically.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/regulator/fan53555.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/fan53555.c b/drivers/regulator/fan53555.c
index c912ba7..d143790 100644
--- a/drivers/regulator/fan53555.c
+++ b/drivers/regulator/fan53555.c
@@ -206,7 +206,12 @@ static int fan53555_regulator_register(struct fan53555_device_info *di,
 {
 	struct regulator_desc *rdesc = &di->desc;
 
-	rdesc->name = "fan53555-reg";
+	rdesc->name = devm_kstrdup(di->dev,
+				   di->regulator->constraints.name,
+				   GFP_KERNEL);
+	if (!rdesc->name)
+		return -ENOMEM;
+
 	rdesc->supply_name = "vin";
 	rdesc->ops = &fan53555_regulator_ops;
 	rdesc->type = REGULATOR_VOLTAGE;
-- 
2.0.1
