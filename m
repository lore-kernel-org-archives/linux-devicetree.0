From: Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH v2 2/3] mfd: rt5033: Add RT5033 Flash led sub device
Date: Mon, 12 Oct 2015 22:12:57 +0900
Message-ID: <1444655578-19806-3-git-send-email-ingi2.kim@samsung.com>
References: <1444655578-19806-1-git-send-email-ingi2.kim@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
In-reply-to: <1444655578-19806-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sameo@linux.intel.com, lee.jones@linaro.org, rpurdie@rpsys.net, j.anaszewski@samsung.com
Cc: inki.dae@samsung.com, sw0312.kim@samsung.com, beomho.seo@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Ingi Kim <ingi2.kim@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch adds rt5033-led sub device to support it.

Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
---
 drivers/mfd/rt5033.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/rt5033.c b/drivers/mfd/rt5033.c
index d60f916..b7f374b 100644
--- a/drivers/mfd/rt5033.c
+++ b/drivers/mfd/rt5033.c
@@ -40,13 +40,17 @@ static const struct regmap_irq_chip rt5033_irq_chip = {
 };
 
 static const struct mfd_cell rt5033_devs[] = {
-	{ .name = "rt5033-regulator", },
 	{
+		.name = "rt5033-regulator",
+	}, {
 		.name = "rt5033-charger",
 		.of_compatible = "richtek,rt5033-charger",
 	}, {
 		.name = "rt5033-battery",
 		.of_compatible = "richtek,rt5033-battery",
+	}, {
+		.name = "rt5033-led",
+		.of_compatible = "richtek,rt5033-led",
 	},
 };
 
-- 
2.0.5
