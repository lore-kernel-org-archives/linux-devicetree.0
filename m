From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 2/4] regulator: pass device_node to
 of_get_regulator_init_data()
Date: Thu,  1 Dec 2011 17:21:06 +0800
Message-ID: <1322731268-12158-3-git-send-email-shawn.guo@linaro.org>
References: <1322731268-12158-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1322731268-12158-1-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It's not always true that the device_node of regulator can be found
at dev->of_node at the time when of_get_regulator_init_data() is being
called, because in some cases the regulator nodes in device tree do
not have 'struct device' behind them until regulator_dev gets created
for it by core function regulator_register().

The patch adds device_node as a new parameter to
of_get_regulator_init_data(), so that caller can pass in the node of
regulator directly.

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
---
 drivers/regulator/fixed.c              |    2 +-
 drivers/regulator/of_regulator.c       |    7 ++++---
 include/linux/regulator/of_regulator.h |    6 ++++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
index 72abbf5..a44a017 100644
--- a/drivers/regulator/fixed.c
+++ b/drivers/regulator/fixed.c
@@ -64,7 +64,7 @@ of_get_fixed_voltage_config(struct device *dev)
 	if (!config)
 		return NULL;
 
-	config->init_data = of_get_regulator_init_data(dev);
+	config->init_data = of_get_regulator_init_data(dev, dev->of_node);
 	if (!config->init_data)
 		return NULL;
 
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index acd7045..6caf641 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -66,18 +66,19 @@ static void of_get_regulation_constraints(struct device_node *np,
  * tree node, returns a pointer to the populated struture or NULL if memory
  * alloc fails.
  */
-struct regulator_init_data *of_get_regulator_init_data(struct device *dev)
+struct regulator_init_data *of_get_regulator_init_data(struct device *dev,
+						struct device_node *node)
 {
 	struct regulator_init_data *init_data;
 
-	if (!dev->of_node)
+	if (!node)
 		return NULL;
 
 	init_data = devm_kzalloc(dev, sizeof(*init_data), GFP_KERNEL);
 	if (!init_data)
 		return NULL; /* Out of memory? */
 
-	of_get_regulation_constraints(dev->of_node, &init_data);
+	of_get_regulation_constraints(node, &init_data);
 	return init_data;
 }
 EXPORT_SYMBOL_GPL(of_get_regulator_init_data);
diff --git a/include/linux/regulator/of_regulator.h b/include/linux/regulator/of_regulator.h
index d83a98d..769704f 100644
--- a/include/linux/regulator/of_regulator.h
+++ b/include/linux/regulator/of_regulator.h
@@ -8,10 +8,12 @@
 
 #if defined(CONFIG_OF)
 extern struct regulator_init_data
-	*of_get_regulator_init_data(struct device *dev);
+	*of_get_regulator_init_data(struct device *dev,
+				    struct device_node *node);
 #else
 static inline struct regulator_init_data
-	*of_get_regulator_init_data(struct device *dev)
+	*of_get_regulator_init_data(struct device *dev,
+				    struct device_node *node)
 {
 	return NULL;
 }
-- 
1.7.4.1
