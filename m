From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 2/4] drm/exynos: add mout_hdmi clock in hdmi driver to change
 parent
Date: Tue, 11 Jun 2013 12:24:03 +0530
Message-ID: <1370933645-18344-3-git-send-email-rahul.sharma@samsung.com>
References: <1370933645-18344-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1370933645-18344-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, seanpaul@chromium.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: devicetree@vger.kernel.org

HDMI driver needs to configure the mout_hdmi mux clock to change
the parent between sclk_hdmiphy and sclk_pixel.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 5a98194..3b5e215 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -83,6 +83,7 @@ struct hdmi_resources {
 	struct clk			*sclk_pixel;
 	struct clk			*sclk_hdmiphy;
 	struct clk			*hdmiphy;
+	struct clk			*mout_hdmi;
 	struct regulator_bulk_data	*regul_bulk;
 	int				regul_count;
 };
@@ -1118,7 +1119,7 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 	}
 
 	clk_disable_unprepare(hdata->res.sclk_hdmi);
-	clk_set_parent(hdata->res.sclk_hdmi, hdata->res.sclk_hdmiphy);
+	clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_hdmiphy);
 	clk_prepare_enable(hdata->res.sclk_hdmi);
 
 	/* enable HDMI and timing generator */
@@ -1285,7 +1286,7 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 	}
 
 	clk_disable_unprepare(hdata->res.sclk_hdmi);
-	clk_set_parent(hdata->res.sclk_hdmi, hdata->res.sclk_hdmiphy);
+	clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_hdmiphy);
 	clk_prepare_enable(hdata->res.sclk_hdmi);
 
 	/* enable HDMI and timing generator */
@@ -1311,7 +1312,7 @@ static void hdmiphy_conf_reset(struct hdmi_context *hdata)
 	u32 reg;
 
 	clk_disable_unprepare(hdata->res.sclk_hdmi);
-	clk_set_parent(hdata->res.sclk_hdmi, hdata->res.sclk_pixel);
+	clk_set_parent(hdata->res.mout_hdmi, hdata->res.sclk_pixel);
 	clk_prepare_enable(hdata->res.sclk_hdmi);
 
 	/* operation mode */
@@ -1832,8 +1833,13 @@ static int hdmi_resources_init(struct hdmi_context *hdata)
 		DRM_ERROR("failed to get clock 'hdmiphy'\n");
 		goto fail;
 	}
+	res->mout_hdmi = devm_clk_get(dev, "mout_hdmi");
+	if (IS_ERR(res->mout_hdmi)) {
+		DRM_ERROR("failed to get clock 'mout_hdmi'\n");
+		goto fail;
+	}
 
-	clk_set_parent(res->sclk_hdmi, res->sclk_pixel);
+	clk_set_parent(res->mout_hdmi, res->sclk_pixel);
 
 	res->regul_bulk = devm_kzalloc(dev, ARRAY_SIZE(supply) *
 		sizeof(res->regul_bulk[0]), GFP_KERNEL);
-- 
1.7.10.4
