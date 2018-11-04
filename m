From: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v3 19/28] drm/sun4i: Add support for H6 DW HDMI controller
Date: Sun,  4 Nov 2018 19:26:56 +0100
Message-ID: <20181104182705.18047-20-jernej.skrabec@siol.net>
References: <20181104182705.18047-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181104182705.18047-1-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, wens@csie.org
Cc: robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, airlied@linux.ie, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com, jernej.skrabec@siol.net
List-Id: devicetree@vger.kernel.org

H6 has DW HDMI 2.0b controller v2.12a.

It supports 4K at 60 Hz and HDCP 2.2.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4=
i/sun8i_dw_hdmi.c
index 99b878e380e1..445cca8d9a26 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -44,6 +44,17 @@ sun8i_dw_hdmi_mode_valid_a83t(struct drm_connector *co=
nnector,
 	return MODE_OK;
 }
=20
+static enum drm_mode_status
+sun8i_dw_hdmi_mode_valid_h6(struct drm_connector *connector,
+			    const struct drm_display_mode *mode)
+{
+	/* This is max for HDMI 2.0b (4K@60Hz) */
+	if (mode->clock > 594000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 static bool sun8i_dw_hdmi_node_is_tcon_top(struct device_node *node)
 {
 	return IS_ENABLED(CONFIG_DRM_SUN8I_TCON_TOP) &&
@@ -239,11 +250,19 @@ static const struct sun8i_dw_hdmi_quirks sun8i_a83t=
_quirks =3D {
 	.set_rate =3D true,
 };
=20
+static const struct sun8i_dw_hdmi_quirks sun50i_h6_quirks =3D {
+	.mode_valid =3D sun8i_dw_hdmi_mode_valid_h6,
+};
+
 static const struct of_device_id sun8i_dw_hdmi_dt_ids[] =3D {
 	{
 		.compatible =3D "allwinner,sun8i-a83t-dw-hdmi",
 		.data =3D &sun8i_a83t_quirks,
 	},
+	{
+		.compatible =3D "allwinner,sun50i-h6-dw-hdmi",
+		.data =3D &sun50i_h6_quirks,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, sun8i_dw_hdmi_dt_ids);
--=20
2.19.1
