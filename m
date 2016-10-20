From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v3 1/6] pinctrl: sunxi: Deal with configless pins
Date: Thu, 20 Oct 2016 15:49:02 +0200
Message-ID: <ae812275bfb0f0ded2a73b571bfcecffcd747126.1476971126.git-series.maxime.ripard@free-electrons.com>
References: <cover.f893b02a9f816dad8fad3986672b05c4b211e2b1.1476971126.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.f893b02a9f816dad8fad3986672b05c4b211e2b1.1476971126.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.f893b02a9f816dad8fad3986672b05c4b211e2b1.1476971126.git-series.maxime.ripard@free-electrons.com>
References: <cover.f893b02a9f816dad8fad3986672b05c4b211e2b1.1476971126.git-series.maxime.ripard@free-electrons.com>
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
Cc: linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Even though the our binding had the assumption that the allwinner,pull and
allwinner,drive properties were optional, the code never took that into
account.

Fix that.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 51 ++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index c44bf1320e08..12650904bd96 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -217,20 +217,29 @@ static unsigned long *sunxi_pctrl_build_pin_config(struct device_node *node,
 {
 	unsigned long *pinconfig;
 	unsigned int configlen = 0, idx = 0;
+	int ret;
 
 	if (sunxi_pctrl_has_drive_prop(node))
 		configlen++;
 	if (sunxi_pctrl_has_bias_prop(node))
 		configlen++;
 
+	/*
+	 * If we don't have any configuration, bail out
+	 */
+	if (!configlen)
+		return NULL;
+
 	pinconfig = kzalloc(configlen * sizeof(*pinconfig), GFP_KERNEL);
 	if (!pinconfig)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	if (sunxi_pctrl_has_drive_prop(node)) {
 		int drive = sunxi_pctrl_parse_drive_prop(node);
-		if (drive < 0)
+		if (drive < 0) {
+			ret = drive;
 			goto err_free;
+		}
 
 		pinconfig[idx++] = pinconf_to_config_packed(PIN_CONFIG_DRIVE_STRENGTH,
 							  drive);
@@ -238,8 +247,10 @@ static unsigned long *sunxi_pctrl_build_pin_config(struct device_node *node,
 
 	if (sunxi_pctrl_has_bias_prop(node)) {
 		int pull = sunxi_pctrl_parse_bias_prop(node);
-		if (pull < 0)
+		if (pull < 0) {
+			ret = pull;
 			goto err_free;
+		}
 
 		pinconfig[idx++] = pinconf_to_config_packed(pull, 0);
 	}
@@ -250,7 +261,7 @@ static unsigned long *sunxi_pctrl_build_pin_config(struct device_node *node,
 
 err_free:
 	kfree(pinconfig);
-	return NULL;
+	return ERR_PTR(ret);
 }
 
 static int sunxi_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
@@ -284,7 +295,10 @@ static int sunxi_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	/*
 	 * We have two maps for each pin: one for the function, one
-	 * for the configuration (bias, strength, etc)
+	 * for the configuration (bias, strength, etc).
+	 *
+	 * We might be slightly overshooting, since we might not have
+	 * any configuration.
 	 */
 	nmaps = npins * 2;
 	*map = kmalloc(nmaps * sizeof(struct pinctrl_map), GFP_KERNEL);
@@ -292,8 +306,8 @@ static int sunxi_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		return -ENOMEM;
 
 	pinconfig = sunxi_pctrl_build_pin_config(node, &configlen);
-	if (!pinconfig) {
-		ret = -EINVAL;
+	if (IS_ERR(pinconfig)) {
+		ret = PTR_ERR(pinconfig);
 		goto err_free_map;
 	}
 
@@ -320,15 +334,24 @@ static int sunxi_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 		i++;
 
-		(*map)[i].type = PIN_MAP_TYPE_CONFIGS_GROUP;
-		(*map)[i].data.configs.group_or_pin = group;
-		(*map)[i].data.configs.configs = pinconfig;
-		(*map)[i].data.configs.num_configs = configlen;
-
-		i++;
+		if (pinconfig) {
+			(*map)[i].type = PIN_MAP_TYPE_CONFIGS_GROUP;
+			(*map)[i].data.configs.group_or_pin = group;
+			(*map)[i].data.configs.configs = pinconfig;
+			(*map)[i].data.configs.num_configs = configlen;
+			i++;
+		}
 	}
 
-	*num_maps = nmaps;
+	*num_maps = i;
+
+	/*
+	 * We know have the number of maps we need, we can resize our
+	 * map array
+	 */
+	*map = krealloc(*map, i * sizeof(struct pinctrl_map), GFP_KERNEL);
+	if (!map)
+		return -ENOMEM;
 
 	return 0;
 
-- 
git-series 0.8.10
