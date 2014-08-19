From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 2/2] drm/panel: Add HannStar HSD070PWW1 7.0" WXGA TFT LCD panel
Date: Tue, 19 Aug 2014 17:52:12 +0200
Message-ID: <1408463532-14903-2-git-send-email-p.zabel@pengutronix.de>
References: <1408463532-14903-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1408463532-14903-1-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

This patch adds support for the HannStar Display Corp. HSD070PWW1 7.0"
WXGA TFT LCD panel to the simple-panel driver. The binding documentation
is included.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 .../bindings/panel/hannstar,hsd070pww1.txt         |  7 ++++++
 drivers/gpu/drm/panel/panel-simple.c               | 25 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/hannstar,hsd070pww1.txt

diff --git a/Documentation/devicetree/bindings/panel/hannstar,hsd070pww1.txt b/Documentation/devicetree/bindings/panel/hannstar,hsd070pww1.txt
new file mode 100644
index 0000000..211c226
--- /dev/null
+++ b/Documentation/devicetree/bindings/panel/hannstar,hsd070pww1.txt
@@ -0,0 +1,7 @@
+HannStar Display Corp. HSD070PWW1 7.0" WXGA TFT LCD panel
+
+Required properties:
+- compatible: should be "hannstar,hsd070pww1"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4ce1db0..ddd651d 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -518,6 +518,28 @@ static const struct panel_desc foxlink_fl500wvr00_a0t = {
 	},
 };
 
+static const struct drm_display_mode hannstar_hsd070pww1_mode = {
+	.clock = 71100,
+	.hdisplay = 1280,
+	.hsync_start = 1280 + 0,
+	.hsync_end = 1280 + 0 + 160,
+	.htotal = 1280 + 0 + 160 + 0,
+	.vdisplay = 800,
+	.vsync_start = 800 + 0,
+	.vsync_end = 800 + 0 + 23,
+	.vtotal = 800 + 0 + 23 + 0,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc hannstar_hsd070pww1 = {
+	.modes = &hannstar_hsd070pww1_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 151,
+		.height = 94,
+	},
+};
+
 static const struct drm_display_mode innolux_n116bge_mode = {
 	.clock = 71000,
 	.hdisplay = 1366,
@@ -640,6 +662,9 @@ static const struct of_device_id platform_of_match[] = {
 		.compatible = "foxlink,fl500wvr00-a0t",
 		.data = &foxlink_fl500wvr00_a0t,
 	}, {
+		.compatible = "hannstar,hsd070pww1",
+		.data = &hannstar_hsd070pww1,
+	}, {
 		.compatible = "innolux,n116bge",
 		.data = &innolux_n116bge,
 	}, {
-- 
2.1.0.rc1
