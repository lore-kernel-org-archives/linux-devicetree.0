From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 4/4] nvmem: meson-efuse: add peripheral clock
Date: Tue, 30 Oct 2018 11:22:31 +0100
Message-ID: <20181030102231.4851-5-jbrunet@baylibre.com>
References: <20181030102231.4851-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181030102231.4851-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Get and enable the peripheral clock required by the efuse device.
The driver has been handle to work without it so far because the
clock was left enabled by default but it won't be the case soon.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/nvmem/meson-efuse.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index 40b9df1d030d..99372768446b 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -14,6 +14,7 @@
  * more details.
  */
 
+#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
 #include <linux/of.h>
@@ -46,7 +47,31 @@ static int meson_efuse_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct nvmem_device *nvmem;
 	struct nvmem_config *econfig;
+	struct clk *clk;
 	unsigned int size;
+	int ret;
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to get efuse gate");
+		return ret;
+	}
+
+	ret = clk_prepare_enable(clk);
+	if (ret) {
+		dev_err(dev, "failed to enable gate");
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev,
+				       (void(*)(void *))clk_disable_unprepare,
+				       clk);
+	if (ret) {
+		dev_err(dev, "failed to add disable callback");
+		return ret;
+	}
 
 	if (meson_sm_call(SM_EFUSE_USER_MAX, &size, 0, 0, 0, 0, 0) < 0) {
 		dev_err(dev, "failed to get max user");
-- 
2.17.2
