From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 2/9] pinctrl: sunxi: Add bindings define
Date: Mon,  3 Oct 2016 12:21:00 +0200
Message-ID: <f56e271107221a2f41f256e2759a92cfe29624a8.1475489558.git-series.maxime.ripard@free-electrons.com>
References: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard@free-electrons.com>
References: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Since we have some bindings header for our hardcoded flags, let's use them
when we can.

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
