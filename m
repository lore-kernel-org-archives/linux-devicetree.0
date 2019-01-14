From: <Eugen.Hristev@microchip.com>
Subject: [PATCH v2 3/3] drm/panel: simple: add support for PDA 91-00156-A0
 panel
Date: Mon, 14 Jan 2019 09:43:31 +0000
Message-ID: <1547458584-29548-4-git-send-email-eugen.hristev@microchip.com>
References: <1547458584-29548-1-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547458584-29548-1-git-send-email-eugen.hristev@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, thierry.reding@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Nicolas.Ferre@microchip.com
Cc: Eugen.Hristev@microchip.com, Cristian.Birsan@microchip.com
List-Id: devicetree@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

PDA 91-00156-A0 5.0 is a 5.0" WVGA TFT LCD panel.
This panel with backlight is found in PDA 5" LCD screen (TM5000 series or
AC320005-5).

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/p=
anel-simple.c
index 9c69e73..61361ba 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2008,6 +2008,30 @@ static const struct panel_desc ortustech_com43h4m85u=
lc =3D {
 	.bus_flags =3D DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_POSEDGE,
 };
=20
+static const struct drm_display_mode pda_91_00156_a0_mode =3D {
+	.clock =3D 33300,
+	.hdisplay =3D 800,
+	.hsync_start =3D 800 + 1,
+	.hsync_end =3D 800 + 1 + 64,
+	.htotal =3D 800 + 1 + 64 + 64,
+	.vdisplay =3D 480,
+	.vsync_start =3D 480 + 1,
+	.vsync_end =3D 480 + 1 + 23,
+	.vtotal =3D 480 + 1 + 23 + 22,
+	.vrefresh =3D 60,
+};
+
+static const struct panel_desc pda_91_00156_a0  =3D {
+	.modes =3D &pda_91_00156_a0_mode,
+	.num_modes =3D 1,
+	.size =3D {
+		.width =3D 152,
+		.height =3D 91,
+	},
+	.bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,
+};
+
+
 static const struct drm_display_mode qd43003c0_40_mode =3D {
 	.clock =3D 9000,
 	.hdisplay =3D 480,
@@ -2686,6 +2710,9 @@ static const struct of_device_id platform_of_match[] =
=3D {
 		.compatible =3D "ortustech,com43h4m85ulc",
 		.data =3D &ortustech_com43h4m85ulc,
 	}, {
+		.compatible =3D "pda,91-00156-a0",
+		.data =3D &pda_91_00156_a0,
+	}, {
 		.compatible =3D "qiaodian,qd43003c0-40",
 		.data =3D &qd43003c0_40,
 	}, {
--=20
2.7.4
