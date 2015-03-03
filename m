From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH 2/4] regulator: core: Expose init_data to of_parse_cb
Date: Mon, 2 Mar 2015 20:25:38 -0800
Message-ID: <1425356740-26285-3-git-send-email-bjorn.andersson@sonymobile.com>
References: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425356740-26285-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <agross@codeaurora.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Expose the newly created init_data to the driver's parse callback so
that it can futher enhance it with e.g. constraints of the regulator.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---

This is needed because calling regulator_register() with a of_node and
of_match will overwrite the passed config->init_data. An alternative way
would be to merge the parsed init_data with the driver provided one.

 drivers/regulator/max77686.c     | 3 ++-
 drivers/regulator/of_regulator.c | 2 +-
 include/linux/regulator/driver.h | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/max77686.c b/drivers/regulator/max77686.c
index 15fb141..87cbef2 100644
--- a/drivers/regulator/max77686.c
+++ b/drivers/regulator/max77686.c
@@ -259,7 +259,8 @@ static int max77686_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
 
 static int max77686_of_parse_cb(struct device_node *np,
 		const struct regulator_desc *desc,
-		struct regulator_config *config)
+		struct regulator_config *config,
+		struct regulator_init_data *init_data)
 {
 	struct max77686_data *max77686 = config->driver_data;
 
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 24e812c..f65934f 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -309,7 +309,7 @@ struct regulator_init_data *regulator_of_get_init_data(struct device *dev,
 		}
 
 		if (desc->of_parse_cb) {
-			if (desc->of_parse_cb(child, desc, config)) {
+			if (desc->of_parse_cb(child, desc, config, init_data)) {
 				dev_err(dev,
 					"driver callback failed to parse DT for regulator %s\n",
 					child->name);
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 8a0165f..0f86a182 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -266,7 +266,8 @@ struct regulator_desc {
 	const char *regulators_node;
 	int (*of_parse_cb)(struct device_node *,
 			    const struct regulator_desc *,
-			    struct regulator_config *);
+			    struct regulator_config *,
+			    struct regulator_init_data *);
 	int id;
 	bool continuous_voltage_range;
 	unsigned n_voltages;
-- 
1.8.2.2
