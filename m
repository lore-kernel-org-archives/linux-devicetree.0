From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 2/3] drm: Add bus flag for Sharp-specific signals
Date: Fri, 26 Apr 2019 01:18:53 +0200
Message-ID: <20190425231854.24479-2-paul@crapouillou.net>
References: <20190425231854.24479-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190425231854.24479-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: od@zcrc.me, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Add the DRM_BUS_FLAG_SHARP_SIGNALS to the drm_bus_flags enum.

This flags can be used when the display must be driven with the
Sharp-specific signals SPL, CLS, REV, PS.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v3: New patch

 include/drm/drm_connector.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 02a131202add..ac7d58fd1e03 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -323,6 +323,8 @@ enum drm_panel_orientation {
  *					edge of the pixel clock
  * @DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE:	Sync signals are sampled on the falling
  *					edge of the pixel clock
+ * @DRM_BUS_FLAG_SHARP_SIGNALS:		Set if the Sharp-specific signals
+ *					(SPL, CLS, PS, REV) must be used
  */
 enum drm_bus_flags {
 	DRM_BUS_FLAG_DE_LOW = BIT(0),
@@ -341,6 +343,7 @@ enum drm_bus_flags {
 	DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE = DRM_BUS_FLAG_SYNC_NEGEDGE,
 	DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE = DRM_BUS_FLAG_SYNC_NEGEDGE,
 	DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE = DRM_BUS_FLAG_SYNC_POSEDGE,
+	DRM_BUS_FLAG_SHARP_SIGNALS = BIT(8),
 };
 
 /**
-- 
2.21.0.593.g511ec345e18
