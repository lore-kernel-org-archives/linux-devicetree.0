From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH v3 1/4] extcon: arizona: Remove enable/disable of 32k clock
Date: Fri, 8 Jan 2016 11:29:39 +0000
Message-ID: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, cw00.choi@samsung.com, lee.jones@linaro.org
Cc: sboyd@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

The 32k clock is unconditionally enabled by the MFD core so there is no
need to control it from the extcon device, so this patch removes the
control of the 32k clock.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---

No changes since v2.

Thanks,
Charles

 drivers/extcon/extcon-arizona.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index e4890dd..52d041f 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1571,7 +1571,6 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 		goto err_micdet;
 	}
 
-	arizona_clk32k_enable(arizona);
 	regmap_update_bits(arizona->regmap, ARIZONA_JACK_DETECT_DEBOUNCE,
 			   ARIZONA_JD1_DB, ARIZONA_JD1_DB);
 	regmap_update_bits(arizona->regmap, ARIZONA_JACK_DETECT_ANALOGUE,
@@ -1642,7 +1641,6 @@ static int arizona_extcon_remove(struct platform_device *pdev)
 	cancel_delayed_work_sync(&info->hpdet_work);
 	regmap_update_bits(arizona->regmap, ARIZONA_JACK_DETECT_ANALOGUE,
 			   ARIZONA_JD1_ENA, 0);
-	arizona_clk32k_disable(arizona);
 
 	return 0;
 }
-- 
2.1.4
