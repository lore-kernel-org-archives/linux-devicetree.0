From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 2/3] pinctrl: meson: fix G12A ao pull registers base address
Date: Thu, 17 Jan 2019 11:23:14 +0100
Message-ID: <20190117102315.1833-3-jbrunet@baylibre.com>
References: <20190117102315.1833-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117102315.1833-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Xingyu Chen <xingyu.chen@amlogic.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Xingyu Chen <xingyu.chen@amlogic.com>

Since Meson G12A SoC, Introduce new ao registers AO_RTI_PULL_UP_EN_REG
and AO_GPIO_O.

These bits of controlling output level are remapped to the new register
AO_GPIO_O, and the AO_GPIO_O_EN_N support only controlling output enable.

These bits of controlling pull enable are remapped to the new register
AO_RTI_PULL_UP_EN_REG, and the AO_RTI_PULL_UP_REG support only controlling
pull type(up/down).

The new layout of ao gpio/pull registers is as follows:
- AO_GPIO_O_EN_N        [offset: 0x9 << 2]
- AO_GPIO_I             [offset: 0xa << 2]
- AO_RTI_PULL_UP_REG    [offset: 0xb << 2]
- AO_RTI_PULL_UP_EN_REG [offset: 0xc << 2]
- AO_GPIO_O             [offset: 0xd << 2]

>From above, we can see ao GPIO registers region has been separated by the
ao pull registers. In order to ensure the continuity of the region on
software, the ao GPIO and ao pull registers use the same base address, but
can be identified by the offset.

Fixes: 29ae0952e85f ("pinctrl: meson-g12a: add pinctrl driver support")
Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index ea87d739f534..a4ae1ac5369e 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -31,6 +31,9 @@
  * In some cases the register ranges for pull enable and pull
  * direction are the same and thus there are only 3 register ranges.
  *
+ * Since Meson G12A SoC, the ao register ranges for gpio, pull enable
+ * and pull direction are the same, so there are only 2 register ranges.
+ *
  * For the pull and GPIO configuration every bank uses a contiguous
  * set of bits in the register sets described above; the same register
  * can be shared by more banks with different offsets.
@@ -488,23 +491,22 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
 		return PTR_ERR(pc->reg_mux);
 	}
 
-	pc->reg_pull = meson_map_resource(pc, gpio_np, "pull");
-	if (IS_ERR(pc->reg_pull)) {
-		dev_err(pc->dev, "pull registers not found\n");
-		return PTR_ERR(pc->reg_pull);
+	pc->reg_gpio = meson_map_resource(pc, gpio_np, "gpio");
+	if (IS_ERR(pc->reg_gpio)) {
+		dev_err(pc->dev, "gpio registers not found\n");
+		return PTR_ERR(pc->reg_gpio);
 	}
 
+	pc->reg_pull = meson_map_resource(pc, gpio_np, "pull");
+	/* Use gpio region if pull one is not present */
+	if (IS_ERR(pc->reg_pull))
+		pc->reg_pull = pc->reg_gpio;
+
 	pc->reg_pullen = meson_map_resource(pc, gpio_np, "pull-enable");
 	/* Use pull region if pull-enable one is not present */
 	if (IS_ERR(pc->reg_pullen))
 		pc->reg_pullen = pc->reg_pull;
 
-	pc->reg_gpio = meson_map_resource(pc, gpio_np, "gpio");
-	if (IS_ERR(pc->reg_gpio)) {
-		dev_err(pc->dev, "gpio registers not found\n");
-		return PTR_ERR(pc->reg_gpio);
-	}
-
 	return 0;
 }
 
-- 
2.20.1
