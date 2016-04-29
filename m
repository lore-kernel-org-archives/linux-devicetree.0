From: Christian Lamparter <chunkeey@googlemail.com>
Subject: [RFC v5 1/4] gpio: generic: fix GPIO_GENERIC_PLATFORM is set to module case
Date: Fri, 29 Apr 2016 02:53:14 +0200
Message-ID: <e365a17a9080ad6d16fe934121d78adb0402d0d5.1461888822.git.chunkeey@googlemail.com>
References: <cover.1461888822.git.chunkeey@googlemail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1461888822.git.chunkeey@googlemail.com>
In-Reply-To: <cover.1461888822.git.chunkeey@googlemail.com>
References: <cover.1461888822.git.chunkeey@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Christian Lamparter <chunkeey@googlemail.com>, =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>, Kumar Gala <galak@codeaurora.org>, Alexander Shiyan <shc_work@mail.ru>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

GPIO_GENERIC_PLATFORM is a tristate. If the module option is
selected the resulting gpio-generic.ko will lack most of the
module initialzation and probe code.

Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
---
 drivers/gpio/gpio-generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
index 54cddfa..6c1cb3b 100644
--- a/drivers/gpio/gpio-generic.c
+++ b/drivers/gpio/gpio-generic.c
@@ -549,7 +549,7 @@ int bgpio_init(struct gpio_chip *gc, struct device *dev,
 }
 EXPORT_SYMBOL_GPL(bgpio_init);
 
-#ifdef CONFIG_GPIO_GENERIC_PLATFORM
+#if IS_ENABLED(CONFIG_GPIO_GENERIC_PLATFORM)
 
 static void __iomem *bgpio_map(struct platform_device *pdev,
 			       const char *name,
-- 
2.8.1
