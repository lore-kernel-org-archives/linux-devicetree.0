From: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 08/11] drm/panel: simple: Add BOE
 HB140WX1-501 panel support
Date: Thu, 14 Feb 2019 21:09:54 -0800
Message-ID: <20190215050957.20755-9-anarsoul@gmail.com>
References: <20190215050957.20755-1-anarsoul@gmail.com>
Reply-To: anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDV3B667TUHBBR4TTHRQKGQEICBQO4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190215050957.20755-1-anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit adds support for the BOE HB140WX1-501 14" WXGA TFT LCD
panel.

Signed-off-by: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../display/panel/boe,hb140wx1-501.txt        |  7 +++++
 drivers/gpu/drm/panel/panel-simple.c          | 26 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,hb140wx1-501.txt

diff --git a/Documentation/devicetree/bindings/display/panel/boe,hb140wx1-501.txt b/Documentation/devicetree/bindings/display/panel/boe,hb140wx1-501.txt
new file mode 100644
index 000000000000..fc6f085eb8d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/boe,hb140wx1-501.txt
@@ -0,0 +1,7 @@
+BOE HB140WX1-501 14" WXGA (1366x768) TFT LCD panel
+
+Required properties:
+- compatible: should be "boe,hb140wx1-501"
+
+This binding is compatible with the simple-panel binding, which is specified
+in simple-panel.txt in this directory.
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9c69e739a524..9a4c9dd02c6c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -828,6 +828,29 @@ static const struct panel_desc bananapi_s070wv20_ct16 = {
 	},
 };
 
+static const struct drm_display_mode boe_hb140wx1_mode = {
+	.clock = 72300,
+	.hdisplay = 1366,
+	.hsync_start = 1366 + 48,
+	.hsync_end = 1366 + 48 + 32,
+	.htotal = 1366 + 48 + 32 + 80,
+	.vdisplay = 768,
+	.vsync_start = 768 + 3,
+	.vsync_end = 768 + 3 + 6,
+	.vtotal = 768 + 3 + 6 + 13,
+	.vrefresh = 60,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc boe_hb140wx1 = {
+	.modes = &boe_hb140wx1_mode,
+	.num_modes = 1,
+	.size = {
+		.width = 310,
+		.height = 170,
+	},
+};
+
 static const struct drm_display_mode boe_hv070wsa_mode = {
 	.clock = 42105,
 	.hdisplay = 1024,
@@ -2541,6 +2564,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "bananapi,s070wv20-ct16",
 		.data = &bananapi_s070wv20_ct16,
+	}, {
+		.compatible = "boe,hb140wx1-501",
+		.data = &boe_hb140wx1
 	}, {
 		.compatible = "boe,hv070wsa-100",
 		.data = &boe_hv070wsa
-- 
2.20.1
