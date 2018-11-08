From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH 1/6] regulator: lochnagar: Explicitly include register headers
Date: Thu, 8 Nov 2018 10:14:00 +0000
Message-ID: <20181108101405.14062-2-ckeepax@opensource.cirrus.com>
References: <20181108101405.14062-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181108101405.14062-1-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, broonie@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Review of the MFD component has stated we should not include the
register headers through lochnagar.h and thus removed them from that
header. Explicitly include them in the end drivers manually.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/regulator/lochnagar-regulator.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/regulator/lochnagar-regulator.c b/drivers/regulator/lochnagar-regulator.c
index 2b5073b9ff868..182198246479f 100644
--- a/drivers/regulator/lochnagar-regulator.c
+++ b/drivers/regulator/lochnagar-regulator.c
@@ -20,6 +20,8 @@
 #include <linux/regulator/of_regulator.h>
 
 #include <linux/mfd/lochnagar.h>
+#include <linux/mfd/lochnagar1_regs.h>
+#include <linux/mfd/lochnagar2_regs.h>
 
 static const struct regulator_ops lochnagar_micvdd_ops = {
 	.enable = regulator_enable_regmap,
-- 
2.11.0
