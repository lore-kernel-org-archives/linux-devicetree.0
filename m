From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 3/3] pinctrl: meson: add optional region for drive strength
Date: Thu, 17 Jan 2019 11:23:15 +0100
Message-ID: <20190117102315.1833-4-jbrunet@baylibre.com>
References: <20190117102315.1833-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117102315.1833-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On the G12a, there is a new 'region' to handle the drive-strength.
This is optional since the older do not have this.

Fixes: 29ae0952e85f ("pinctrl: meson-g12a: add pinctrl driver support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 6 ++++++
 drivers/pinctrl/meson/pinctrl-meson.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index a4ae1ac5369e..96a4a72708e4 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -507,6 +507,12 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
 	if (IS_ERR(pc->reg_pullen))
 		pc->reg_pullen = pc->reg_pull;
 
+	pc->reg_ds = meson_map_resource(pc, gpio_np, "ds");
+	if (IS_ERR(pc->reg_ds)) {
+		dev_dbg(pc->dev, "ds registers not found - skipping\n");
+		pc->reg_ds = NULL;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
index eff61ea1c67e..5eaab925f427 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.h
+++ b/drivers/pinctrl/meson/pinctrl-meson.h
@@ -120,6 +120,7 @@ struct meson_pinctrl {
 	struct regmap *reg_pullen;
 	struct regmap *reg_pull;
 	struct regmap *reg_gpio;
+	struct regmap *reg_ds;
 	struct gpio_chip chip;
 	struct device_node *of_node;
 };
-- 
2.20.1
