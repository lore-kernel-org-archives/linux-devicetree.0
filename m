From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH RESEND 2/2] pinctrl: samsung: Fix link error with CONFIG_PINCTRL_EXYNOS disabled
Date: Wed, 17 Apr 2013 00:29:05 +0200
Message-ID: <2934745.t3ZR6H9zHp@flatron>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com> <20130416163331.GP26958@opensource.wolfsonmicro.com> <30362001.FF4K7WsZvh@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <30362001.FF4K7WsZvh@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linus.walleij@linaro.org, thomas.abraham@linaro.org
List-Id: devicetree@vger.kernel.org

Commit f67faf487 added driver data for Exynos5250, which is available
only if CONFIG_PINCTRL_EXYNOS is enabled. However probably due to merge
error, the reference to this driver data structure was located outside
of relevant ifdef and compiled unconditionally, leading to link error
with CONFIG_PINCTRL_EXYNOS.

This patch fixes mentioned link error by moving driver data entry under
ifdef CONFIG_PINCTRL_EXYNOS.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/pinctrl/pinctrl-samsung.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-samsung.c b/drivers/pinctrl/pinctrl-samsung.c
index f95dd69..9763668 100644
--- a/drivers/pinctrl/pinctrl-samsung.c
+++ b/drivers/pinctrl/pinctrl-samsung.c
@@ -970,13 +970,13 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 		.data = (void *)exynos4210_pin_ctrl },
 	{ .compatible = "samsung,exynos4x12-pinctrl",
 		.data = (void *)exynos4x12_pin_ctrl },
+	{ .compatible = "samsung,exynos5250-pinctrl",
+		.data = (void *)exynos5250_pin_ctrl },
 #endif
 #ifdef CONFIG_PINCTRL_S3C64XX
 	{ .compatible = "samsung,s3c64xx-pinctrl",
 		.data = s3c64xx_pin_ctrl },
 #endif
-	{ .compatible = "samsung,exynos5250-pinctrl",
-		.data = (void *)exynos5250_pin_ctrl },
 	{},
 };
 MODULE_DEVICE_TABLE(of, samsung_pinctrl_dt_match);
-- 
1.8.1.5
