From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 1/2] extcon: arizona: Add device bindings for the micd configurations
Date: Thu, 10 Dec 2015 17:08:18 +0000
Message-ID: <1449767299-29691-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Add device bindings to support configuring the jack detection
configurations. Each configuration needs to specify the connection of
the mic det pins, which micbias should be used and the value of the
micd polarity GPIO required to activate that configuration.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/extcon/extcon-arizona.c | 53 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-arizona.c
index 8647533..edbf2e1 100644
--- a/drivers/extcon/extcon-arizona.c
+++ b/drivers/extcon/extcon-arizona.c
@@ -1201,7 +1201,54 @@ static void arizona_micd_set_level(struct arizona *arizona, int index,
 	regmap_update_bits(arizona->regmap, reg, mask, level);
 }
 
-static int arizona_extcon_device_get_pdata(struct arizona *arizona)
+static int arizona_extcon_get_micd_configs(struct device *dev,
+					   struct arizona *arizona)
+{
+	const char * const prop = "wlf,micd-configs";
+	const int entries_per_config = 3;
+	struct arizona_micd_config *micd_configs;
+	int nconfs, ret;
+	int i, j;
+	u32 *vals;
+
+	nconfs = device_property_read_u32_array(arizona->dev, prop, NULL, 0);
+	if (nconfs <= 0)
+		return 0;
+
+	vals = kcalloc(nconfs, sizeof(u32), GFP_KERNEL);
+	if (!vals)
+		return -ENOMEM;
+
+	ret = device_property_read_u32_array(arizona->dev, prop, vals, nconfs);
+	if (ret < 0)
+		goto out;
+
+	nconfs /= entries_per_config;
+
+	micd_configs = devm_kzalloc(dev,
+				    nconfs * sizeof(struct arizona_micd_range),
+				    GFP_KERNEL);
+	if (!micd_configs) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	for (i = 0, j = 0; i < nconfs; ++i) {
+		micd_configs[i].src = vals[j++] ? ARIZONA_ACCDET_SRC : 0;
+		micd_configs[i].bias = vals[j++];
+		micd_configs[i].gpio = vals[j++];
+	}
+
+	arizona->pdata.micd_configs = micd_configs;
+	arizona->pdata.num_micd_configs = nconfs;
+
+out:
+	kfree(vals);
+	return ret;
+}
+
+static int arizona_extcon_device_get_pdata(struct device *dev,
+					   struct arizona *arizona)
 {
 	struct arizona_pdata *pdata = &arizona->pdata;
 	unsigned int val = ARIZONA_ACCDET_MODE_HPL;
@@ -1249,6 +1296,8 @@ static int arizona_extcon_device_get_pdata(struct arizona *arizona)
 	pdata->jd_gpio5_nopull = device_property_read_bool(arizona->dev,
 						"wlf,use-jd2-nopull");
 
+	arizona_extcon_get_micd_configs(dev, arizona);
+
 	return 0;
 }
 
@@ -1270,7 +1319,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (!dev_get_platdata(arizona->dev))
-		arizona_extcon_device_get_pdata(arizona);
+		arizona_extcon_device_get_pdata(&pdev->dev, arizona);
 
 	info->micvdd = devm_regulator_get(&pdev->dev, "MICVDD");
 	if (IS_ERR(info->micvdd)) {
-- 
2.1.4
