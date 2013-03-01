From: Linus Walleij <linus.walleij@stericsson.com>
Subject: [PATCH 2/2] mfd: stmpe: DT: Add stmpe-i2c dt alias to get id device
Date: Fri, 1 Mar 2013 13:07:26 +0100
Message-ID: <1362139646-23613-1-git-send-email-linus.walleij@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: Anmar Oueja <anmar.oueja@linaro.org>, Gabriel Fernandez <gabriel.fernandez@stericsson.com>, devicetree-discuss@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@stericsson.com>

This patch augments the STMP driver to read the device id
from the stmpe-i2c dt alias if present.

Cc: devicetree-discuss@lists.ozlabs.org
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@stericsson.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mfd/stmpe.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index e550dcb..bc85877 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1015,7 +1015,10 @@ void stmpe_of_probe(struct stmpe_platform_data *pdata, struct device_node *np)
 {
 	struct device_node *child;
 
-	pdata->id = -1;
+	pdata->id = of_alias_get_id(np, "stmpe-i2c");
+	if (pdata->id < 0)
+		pdata->id = -1;
+
 	pdata->irq_trigger = IRQF_TRIGGER_NONE;
 
 	of_property_read_u32(np, "st,autosleep-timeout",
-- 
1.7.11.3
