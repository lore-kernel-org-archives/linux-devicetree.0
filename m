From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v2 2/9] pinctrl: sunxi: Use macros from bindings header file for DT parsing
Date: Tue, 11 Oct 2016 17:46:00 +0200
Message-ID: <5de3087f625d6d4a4d552d4a85faafac689f5f54.1476200742.git-series.maxime.ripard@free-electrons.com>
References: <cover.7edc6c25be8a5e2efdda6a82e102dbf7ece6aa64.1476200742.git-series.maxime.ripard@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.7edc6c25be8a5e2efdda6a82e102dbf7ece6aa64.1476200742.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.7edc6c25be8a5e2efdda6a82e102dbf7ece6aa64.1476200742.git-series.maxime.ripard@free-electrons.com>
References: <cover.7edc6c25be8a5e2efdda6a82e102dbf7ece6aa64.1476200742.git-series.maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Since we have some bindings header for our hardcoded flags, let's use them
when we can.

Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 64f7f6dcc027..5be455d5e252 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -28,6 +28,8 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
+#include <dt-bindings/pinctrl/sun4i-a10.h>
+
 #include "../core.h"
 #include "../../gpio/gpiolib.h"
 #include "pinctrl-sunxi.h"
@@ -164,9 +166,9 @@ static int sunxi_pctrl_parse_bias_prop(struct device_node *node)
 		return -EINVAL;
 
 	switch (val) {
-	case 1:
+	case SUN4I_PINCTRL_PULL_UP:
 		return PIN_CONFIG_BIAS_PULL_UP;
-	case 2:
+	case SUN4I_PINCTRL_PULL_DOWN:
 		return PIN_CONFIG_BIAS_PULL_DOWN;
 	}
 
-- 
git-series 0.8.10
