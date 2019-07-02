From: Olivier Moysan <olivier.moysan@st.com>
Subject: [PATCH 3/3] drm/bridge: sii902x: make audio mclk optional
Date: Tue, 2 Jul 2019 17:47:06 +0200
Message-ID: <1562082426-14876-4-git-send-email-olivier.moysan@st.com>
References: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: a.hajda@samsung.com, narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@siol.net, airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, benjamin.gaignard@st.com, alexandre.torgue@st.com, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, olivier.moysan@st.com, jsarha@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The master clock on i2s bus is not mandatory,
as sii902X internal PLL can be used instead.
Make use of mclk optional.

Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 36acc256e67e..a08bd9fdc046 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -562,19 +562,21 @@ static int sii902x_audio_hw_params(struct device *dev, void *data,
 		}
 	}
 
-	ret = clk_prepare_enable(sii902x->audio.mclk);
-	if (ret) {
-		dev_err(dev, "Enabling mclk failed: %d\n", ret);
-		return ret;
-	}
+	if (sii902x->audio.mclk) {
+		ret = clk_prepare_enable(sii902x->audio.mclk);
+		if (ret) {
+			dev_err(dev, "Enabling mclk failed: %d\n", ret);
+			return ret;
+		}
 
-	mclk_rate = clk_get_rate(sii902x->audio.mclk);
+		mclk_rate = clk_get_rate(sii902x->audio.mclk);
 
-	ret = sii902x_select_mclk_div(&i2s_config_reg, params->sample_rate,
-				      mclk_rate);
-	if (mclk_rate != ret * params->sample_rate)
-		dev_dbg(dev, "Inaccurate reference clock (%ld/%d != %u)\n",
-			mclk_rate, ret, params->sample_rate);
+		ret = sii902x_select_mclk_div(&i2s_config_reg,
+					      params->sample_rate, mclk_rate);
+		if (mclk_rate != ret * params->sample_rate)
+			dev_dbg(dev, "Inaccurate reference clock (%ld/%d != %u)\n",
+				mclk_rate, ret, params->sample_rate);
+	}
 
 	mutex_lock(&sii902x->mutex);
 
@@ -640,7 +642,8 @@ static int sii902x_audio_hw_params(struct device *dev, void *data,
 	mutex_unlock(&sii902x->mutex);
 
 	if (ret) {
-		clk_disable_unprepare(sii902x->audio.mclk);
+		if (sii902x->audio.mclk)
+			clk_disable_unprepare(sii902x->audio.mclk);
 		dev_err(dev, "%s: hdmi audio enable failed: %d\n", __func__,
 			ret);
 	}
@@ -659,7 +662,8 @@ static void sii902x_audio_shutdown(struct device *dev, void *data)
 
 	mutex_unlock(&sii902x->mutex);
 
-	clk_disable_unprepare(sii902x->audio.mclk);
+	if (sii902x->audio.mclk)
+		clk_disable_unprepare(sii902x->audio.mclk);
 }
 
 int sii902x_audio_digital_mute(struct device *dev, void *data, bool enable)
@@ -752,9 +756,12 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
 
 	sii902x->audio.mclk = devm_clk_get(dev, "mclk");
 	if (IS_ERR(sii902x->audio.mclk)) {
-		dev_err(dev, "%s: No clock (audio mclk) found: %ld\n",
-			__func__, PTR_ERR(sii902x->audio.mclk));
-		return 0;
+		if (PTR_ERR(sii902x->audio.mclk) != -ENOENT) {
+			dev_err(dev, "%s: No clock (audio mclk) found: %ld\n",
+				__func__, PTR_ERR(sii902x->audio.mclk));
+			return PTR_ERR(sii902x->audio.mclk);
+		}
+		sii902x->audio.mclk = NULL;
 	}
 
 	sii902x->audio.pdev = platform_device_register_data(
-- 
2.7.4
