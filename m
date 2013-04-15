From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH v5 3/6] gpio: samsung: Skip legacy GPIO registration if pinctrl-s3c64xx is present
Date: Mon, 15 Apr 2013 23:14:40 +0200
Message-ID: <1366060483-20342-4-git-send-email-tomasz.figa@gmail.com>
References: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1366060483-20342-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, kwangwoo.lee@gmail.com, jacmet@sunsite.dk, augulis.darius@gmail.com, mcuelenaere@gmail.com, linux@arm.linux.org.uk, Rob Herring <robherring2@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: devicetree@vger.kernel.org

The new driver handles GPIO on DT-enabled platforms.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 drivers/gpio/gpio-samsung.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index 99e0fa4..dc06a6f 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -3012,7 +3012,7 @@ static __init int samsung_gpiolib_init(void)
 	int i, nr_chips;
 	int group = 0;
 
-#if defined(CONFIG_PINCTRL_EXYNOS) || defined(CONFIG_PINCTRL_EXYNOS5440)
+#if defined(CONFIG_PINCTRL_SAMSUNG) || defined(CONFIG_PINCTRL_EXYNOS5440)
 	/*
 	* This gpio driver includes support for device tree support and there
 	* are platforms using it. In order to maintain compatibility with those
@@ -3026,10 +3026,12 @@ static __init int samsung_gpiolib_init(void)
 	*/
 	struct device_node *pctrl_np;
 	static const struct of_device_id exynos_pinctrl_ids[] = {
+		{ .compatible = "samsung,s3c64xx-pinctrl", },
 		{ .compatible = "samsung,exynos4210-pinctrl", },
 		{ .compatible = "samsung,exynos4x12-pinctrl", },
 		{ .compatible = "samsung,exynos5250-pinctrl", },
 		{ .compatible = "samsung,exynos5440-pinctrl", },
+		{ },
 	};
 	for_each_matching_node(pctrl_np, exynos_pinctrl_ids)
 		if (pctrl_np && of_device_is_available(pctrl_np))
-- 
1.8.1.5
