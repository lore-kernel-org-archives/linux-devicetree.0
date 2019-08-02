From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
Subject: [PATCH] drm/stm: ltdc: add pinctrl for DPI encoder mode
Date: Fri, 2 Aug 2019 16:47:42 +0200
Message-ID: <1564757262-6166-1-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>, Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Fabrice Gasnier <fabrice.gasnier@st.com>
List-Id: devicetree@vger.kernel.org

The implementation of functions encoder_enable and encoder_disable
make possible to control the pinctrl according to the encoder type.
The pinctrl must be activated only if the encoder type is DPI.
This helps to move the DPI-related pinctrl configuration from
all the panel or bridge to the LTDC dt node.

Signed-off-by: Yannick Fertré <yannick.fertre@st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 3ab4fbf..1c4fde0 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_graph.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
@@ -1040,6 +1041,36 @@ static const struct drm_encoder_funcs ltdc_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
+static void ltdc_encoder_disable(struct drm_encoder *encoder)
+{
+	struct drm_device *ddev = encoder->dev;
+
+	DRM_DEBUG_DRIVER("\n");
+
+	/* Set to sleep state the pinctrl whatever type of encoder */
+	pinctrl_pm_select_sleep_state(ddev->dev);
+}
+
+static void ltdc_encoder_enable(struct drm_encoder *encoder)
+{
+	struct drm_device *ddev = encoder->dev;
+
+	DRM_DEBUG_DRIVER("\n");
+
+	/*
+	 * Set to default state the pinctrl only with DPI type.
+	 * Others types like DSI, don't need pinctrl due to
+	 * internal bridge (the signals do not come out of the chipset).
+	 */
+	if (encoder->encoder_type == DRM_MODE_ENCODER_DPI)
+		pinctrl_pm_select_default_state(ddev->dev);
+}
+
+static const struct drm_encoder_helper_funcs ltdc_encoder_helper_funcs = {
+	.disable = ltdc_encoder_disable,
+	.enable = ltdc_encoder_enable,
+};
+
 static int ltdc_encoder_init(struct drm_device *ddev, struct drm_bridge *bridge)
 {
 	struct drm_encoder *encoder;
@@ -1055,6 +1086,8 @@ static int ltdc_encoder_init(struct drm_device *ddev, struct drm_bridge *bridge)
 	drm_encoder_init(ddev, encoder, &ltdc_encoder_funcs,
 			 DRM_MODE_ENCODER_DPI, NULL);
 
+	drm_encoder_helper_add(encoder, &ltdc_encoder_helper_funcs);
+
 	ret = drm_bridge_attach(encoder, bridge, NULL);
 	if (ret) {
 		drm_encoder_cleanup(encoder);
@@ -1280,6 +1313,8 @@ int ltdc_load(struct drm_device *ddev)
 
 	clk_disable_unprepare(ldev->pixel_clk);
 
+	pinctrl_pm_select_sleep_state(ddev->dev);
+
 	pm_runtime_enable(ddev->dev);
 
 	return 0;
-- 
2.7.4
