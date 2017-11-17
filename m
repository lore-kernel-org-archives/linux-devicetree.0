From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH] omapdrm: hdmi4: Correct the SoC revision matching
Date: Fri, 17 Nov 2017 10:00:43 +0200
Message-ID: <20171117080043.19010-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: tomi.valkeinen@ti.com, laurent.pinchart@ideasonboard.com, jsarha@ti.com
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, daniel@ffwll.ch, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

I believe the intention of the commit 2c9fc9bf45f8
("drm: omapdrm: Move FEAT_HDMI_* features to hdmi4 driver")
was to identify omap4430 ES1.x, omap4430 ES2.x and other OMAP4 revisions,
like omap4460.

By using family=OMAP4 in the match the code will treat omap4460 ES1.x in a
same way as it would treat omap4430 ES1.x

This breaks HDMI audio on OMAP4460 devices (PandaES for example).

Correct the match rule so we are not going to get false positive match.

Fixes: 2c9fc9bf45f8 ("drm: omapdrm: Move FEAT_HDMI_* features to hdmi4 driver")

CC: stable@vger.kernel.org # 4.14
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4_core.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
index 62e451162d96..07945a40c33a 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
@@ -902,9 +902,20 @@ static const struct hdmi4_features hdmi4_es3_features = {
 };
 
 static const struct soc_device_attribute hdmi4_soc_devices[] = {
-	{ .family = "OMAP4", .revision = "ES1.?", .data = &hdmi4_es1_features },
-	{ .family = "OMAP4", .revision = "ES2.?", .data = &hdmi4_es2_features },
-	{ .family = "OMAP4",			  .data = &hdmi4_es3_features },
+	{
+		.machine = "OMAP4430",
+		.revision = "ES1.?",
+		.data = &hdmi4_es1_features,
+	},
+	{
+		.machine = "OMAP4430",
+		.revision = "ES2.?",
+		.data = &hdmi4_es2_features,
+	},
+	{
+		.family = "OMAP4",
+		.data = &hdmi4_es3_features,
+	},
 	{ /* sentinel */ }
 };
 
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
