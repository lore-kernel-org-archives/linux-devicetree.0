From: Christian Lamparter <chunkeey@googlemail.com>
Subject: [RFC v3 3/3] gpio: generic: fix GPIO_GENERIC_PLATFORM is set to module case
Date: Wed, 27 Apr 2016 00:51:54 +0200
Message-ID: <dead7dfa3d5f9f298a7506391f167c81fc067291.1461710784.git.chunkeey@googlemail.com>
References: <cover.1461710784.git.chunkeey@googlemail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <cover.1461710784.git.chunkeey@googlemail.com>
In-Reply-To: <cover.1461710784.git.chunkeey@googlemail.com>
References: <cover.1461710784.git.chunkeey@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc: Christian Lamparter <chunkeey@googlemail.com>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

GPIO_GENERIC_PLATFORM is a tristate. If the module option is
selected the resulting gpio-generic.ko will lack most of the
module initialzation and probe code.

Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
---
 drivers/gpio/gpio-generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index f535299..b2170d0 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -551,7 +551,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 }
 EXPORT_SYMBOL_GPL(bgpio_init);
 
-#ifdef CONFIG_GPIO_GENERIC_PLATFORM
+#if IS_ENABLED(CONFIG_GPIO_GENERIC_PLATFORM)
 
 static void __iomem *bgpio_map(struct platform_device *pdev,
 			       const char *name,
-- 
2.8.1

