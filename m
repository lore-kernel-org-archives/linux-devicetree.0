From: Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH v2 10/15] drm/mxsfb: Add max-res property for MXSFB
Date: Wed, 14 Aug 2019 13:48:46 +0300
Message-ID: <1565779731-1300-11-git-send-email-robert.chiras@nxp.com>
References: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565779731-1300-1-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Because of stability issues, we may want to limit the maximum resolution
supported by the MXSFB (eLCDIF) driver.
This patch add support for a new property which we can use to impose such
limitation.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 59c8ba7..6dae2bd 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -264,6 +264,7 @@ static int mxsfb_load(struct drm_device *drm, unsigned long flags)
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct mxsfb_drm_private *mxsfb;
 	struct resource *res;
+	u32 max_res[2] = {0, 0};
 	int ret;
 
 	mxsfb = devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);
@@ -344,10 +345,17 @@ static int mxsfb_load(struct drm_device *drm, unsigned long flags)
 		}
 	}
 
+	of_property_read_u32_array(drm->dev->of_node, "max-res",
+				   &max_res[0], 2);
+	if (!max_res[0])
+		max_res[0] = MXSFB_MAX_XRES;
+	if (!max_res[1])
+		max_res[1] = MXSFB_MAX_YRES;
+
 	drm->mode_config.min_width	= MXSFB_MIN_XRES;
 	drm->mode_config.min_height	= MXSFB_MIN_YRES;
-	drm->mode_config.max_width	= MXSFB_MAX_XRES;
-	drm->mode_config.max_height	= MXSFB_MAX_YRES;
+	drm->mode_config.max_width	= max_res[0];
+	drm->mode_config.max_height	= max_res[1];
 	drm->mode_config.funcs		= &mxsfb_mode_config_funcs;
 	drm->mode_config.helper_private	= &mxsfb_mode_config_helpers;
 
-- 
2.7.4
