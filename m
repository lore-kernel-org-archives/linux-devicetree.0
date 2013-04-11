From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] regulator: wm8994: Use GPIO parsed from DT when registering
 regulators
Date: Thu, 11 Apr 2013 18:36:57 +0200
Message-ID: <1365698217-17771-1-git-send-email-s.nawrocki@samsung.com>
References: <20130411162315.GF9243@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20130411162315.GF9243@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@opensource.wolfsonmicro.com
Cc: linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

Ensure the regulators are registered with a GPIO parsed from the device
tree when available.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/regulator/wm8994-regulator.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/wm8994-regulator.c b/drivers/regulator/wm8994-regulator.c
index 086be66..dab41ae 100644
--- a/drivers/regulator/wm8994-regulator.c
+++ b/drivers/regulator/wm8994-regulator.c
@@ -149,9 +149,11 @@ static int wm8994_ldo_probe(struct platform_device *pdev)
 	config.init_data = &ldo->init_data;
 	if (pdata)
 		config.ena_gpio = pdata->ldo[id].enable;
+	else if (wm8994->dev->of_node)
+		config.ena_gpio = wm8994->pdata.ldo[id].enable;
 
 	/* Use default constraints if none set up */
-	if (!pdata || !pdata->ldo[id].init_data) {
+	if (!pdata || !pdata->ldo[id].init_data || wm8994->dev->of_node) {
 		dev_dbg(wm8994->dev, "Using default init data, supply %s %s\n",
 			ldo->supply.dev_name, ldo->supply.supply);
 
-- 
1.7.9.5
