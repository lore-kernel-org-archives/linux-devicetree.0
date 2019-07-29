From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 1/5] nvmem: meson-efuse: Move data to a container struct
Date: Mon, 29 Jul 2019 19:39:37 +0100
Message-ID: <20190729183941.18164-2-ccaione@baylibre.com>
References: <20190729183941.18164-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190729183941.18164-1-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: srinivas.kandagatla@linaro.org, khilman@baylibre.com, narmstrong@baylibre.com, robh+dt@kernel.org, tglx@linutronix.de, jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

No functional changes, just a cleanup commit to tidy up a bit. Move the
nvmem_* and clk structures in a container struct.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/nvmem/meson-efuse.c | 47 ++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index 39bd76306033..9924b98db772 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -14,6 +14,12 @@
 
 #include <linux/firmware/meson/meson_sm.h>
 
+struct meson_efuse {
+	struct nvmem_device *nvmem;
+	struct nvmem_config config;
+	struct clk *clk;
+};
+
 static int meson_efuse_read(void *context, unsigned int offset,
 			    void *val, size_t bytes)
 {
@@ -37,21 +43,23 @@ MODULE_DEVICE_TABLE(of, meson_efuse_match);
 static int meson_efuse_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct nvmem_device *nvmem;
-	struct nvmem_config *econfig;
-	struct clk *clk;
+	struct meson_efuse *efuse;
 	unsigned int size;
 	int ret;
 
-	clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
+	efuse = devm_kzalloc(&pdev->dev, sizeof(*efuse), GFP_KERNEL);
+	if (!efuse)
+		return -ENOMEM;
+
+	efuse->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(efuse->clk)) {
+		ret = PTR_ERR(efuse->clk);
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "failed to get efuse gate");
 		return ret;
 	}
 
-	ret = clk_prepare_enable(clk);
+	ret = clk_prepare_enable(efuse->clk);
 	if (ret) {
 		dev_err(dev, "failed to enable gate");
 		return ret;
@@ -59,7 +67,7 @@ static int meson_efuse_probe(struct platform_device *pdev)
 
 	ret = devm_add_action_or_reset(dev,
 				       (void(*)(void *))clk_disable_unprepare,
-				       clk);
+				       efuse->clk);
 	if (ret) {
 		dev_err(dev, "failed to add disable callback");
 		return ret;
@@ -70,21 +78,18 @@ static int meson_efuse_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	econfig = devm_kzalloc(dev, sizeof(*econfig), GFP_KERNEL);
-	if (!econfig)
-		return -ENOMEM;
-
-	econfig->dev = dev;
-	econfig->name = dev_name(dev);
-	econfig->stride = 1;
-	econfig->word_size = 1;
-	econfig->reg_read = meson_efuse_read;
-	econfig->reg_write = meson_efuse_write;
-	econfig->size = size;
+	efuse->config.dev = dev;
+	efuse->config.name = dev_name(dev);
+	efuse->config.stride = 1;
+	efuse->config.word_size = 1;
+	efuse->config.reg_read = meson_efuse_read;
+	efuse->config.reg_write = meson_efuse_write;
+	efuse->config.size = size;
+	efuse->config.priv = efuse;
 
-	nvmem = devm_nvmem_register(&pdev->dev, econfig);
+	efuse->nvmem = devm_nvmem_register(&pdev->dev, &efuse->config);
 
-	return PTR_ERR_OR_ZERO(nvmem);
+	return PTR_ERR_OR_ZERO(efuse->nvmem);
 }
 
 static struct platform_driver meson_efuse_driver = {
-- 
2.20.1
