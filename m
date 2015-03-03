From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [RESEND PATCH 4/6] gpio: arizona: Add support for WM8280/WM8281
Date: Tue,  3 Mar 2015 16:19:34 +0000
Message-ID: <1425399576-26428-4-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1425399576-26428-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425399576-26428-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, galak@codeaurora.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com, linus.walleij@linaro.org, gnurou@gmail.com, sameo@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org, rf@opensource.wolfsonmicro.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>

Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/gpio/gpio-arizona.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index fe369f5..9665d0a 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -116,6 +116,7 @@ static int arizona_gpio_probe(struct platform_device *pdev)
 	switch (arizona->type) {
 	case WM5102:
 	case WM5110:
+	case WM8280:
 	case WM8997:
 		arizona_gpio->gpio_chip.ngpio = 5;
 		break;
-- 
1.7.2.5
