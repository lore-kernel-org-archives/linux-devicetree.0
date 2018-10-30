From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 1/4] nvmem: meson-efuse: add error message on user_max failure.
Date: Tue, 30 Oct 2018 11:22:28 +0100
Message-ID: <20181030102231.4851-2-jbrunet@baylibre.com>
References: <20181030102231.4851-1-jbrunet@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181030102231.4851-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add an explicit error message when SM_EFUSE_USER_MAX command fails

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/nvmem/meson-efuse.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index d769840d1e18..40b9df1d030d 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -48,8 +48,10 @@ static int meson_efuse_probe(struct platform_device *pdev)
 	struct nvmem_config *econfig;
 	unsigned int size;
 
-	if (meson_sm_call(SM_EFUSE_USER_MAX, &size, 0, 0, 0, 0, 0) < 0)
+	if (meson_sm_call(SM_EFUSE_USER_MAX, &size, 0, 0, 0, 0, 0) < 0) {
+		dev_err(dev, "failed to get max user");
 		return -EINVAL;
+	}
 
 	econfig = devm_kzalloc(dev, sizeof(*econfig), GFP_KERNEL);
 	if (!econfig)
-- 
2.17.2
