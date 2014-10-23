From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 2/2] drm/panel: Add HannStar HSD070PWW1 7.0" WXGA TFT LCD
 panel
Date: Thu, 23 Oct 2014 16:31:06 +0200
Message-ID: <1414074666-3783-2-git-send-email-p.zabel@pengutronix.de>
References: <1414074666-3783-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1414074666-3783-1-git-send-email-p.zabel@pengutronix.de>
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
This panel is connected via LVDS and uses the data enable signal for
timing. Since HSYNC/VSYNC are ignored, the split between sync length and
porches is arbitrary, as long as the complete horizontal blanking interval
is 160 clocks, and the vertical blanking interval is 23 lines.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v1:
 - Added bpc in panel_desc
 - Use non-zero front and back-porches
---
 .../bindings/panel/hannstar,hsd070pww1.txt         |  7 ++++++
 drivers/gpu/drm/panel/panel-simple.c               | 26 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)
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
index 23de22f..1dc5e52 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -542,6 +542,29 @@ static const struct panel_desc foxlink_fl500wvr00_a0t = {
 	},
 };
 
+static const struct drm_display_mode hannstar_hsd070pww1_mode = {
+	.clock = 71100,
+	.hdisplay = 1280,
+	.hsync_start = 1280 + 1,
+	.hsync_end = 1280 + 1 + 158,
+	.htotal = 1280 + 1 + 158 + 1,
+	.vdisplay = 800,
+	.vsync_start = 800 + 1,
+	.vsync_end = 800 + 1 + 21,
+	.vtotal = 800 + 1 + 21 + 1,
+	.vrefresh = 60,
+};
+
+static const struct panel_desc hannstar_hsd070pww1 = {
+	.modes = &hannstar_hsd070pww1_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 151,
+		.height = 94,
+	},
+};
+
 static const struct drm_display_mode innolux_n116bge_mode = {
 	.clock = 71000,
 	.hdisplay = 1366,
@@ -667,6 +690,9 @@ static const struct of_device_id platform_of_match[] = {
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
2.1.1
