From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v3 02/14] media: ov7670: split register setting from set_framerate() logic
Date: Tue, 20 Nov 2018 11:03:07 +0100
Message-ID: <20181120100318.367987-3-lkundrak@v3.sk>
References: <20181120100318.367987-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120100318.367987-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, James Cameron <quozl@laptop.org>, Pavel Machek <pavel@ucw.cz>, Libin Yang <lbyang@marvell.com>, Albert Wang <twang13@marvell.com>
List-Id: devicetree@vger.kernel.org

This will allow us to restore the last set frame rate after the device
returns from a power off.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
Changes since v2:
- This patch was added to the series

 drivers/media/i2c/ov7670.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index ee2302fbdeee..ead0c360df33 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -810,13 +810,24 @@ static void ov7675_get_framerate(struct v4l2_subdev=
 *sd,
 			(4 * clkrc);
 }
=20
+static int ov7675_apply_framerate(struct v4l2_subdev *sd)
+{
+	struct ov7670_info *info =3D to_state(sd);
+	int ret;
+
+	ret =3D ov7670_write(sd, REG_CLKRC, info->clkrc);
+	if (ret < 0)
+		return ret;
+
+	return ov7670_write(sd, REG_DBLV, info->pll_bypass ? DBLV_BYPASS : DBLV=
_X4);
+}
+
 static int ov7675_set_framerate(struct v4l2_subdev *sd,
 				 struct v4l2_fract *tpf)
 {
 	struct ov7670_info *info =3D to_state(sd);
 	u32 clkrc;
 	int pll_factor;
-	int ret;
=20
 	/*
 	 * The formula is fps =3D 5/4*pixclk for YUV/RGB and
@@ -825,19 +836,10 @@ static int ov7675_set_framerate(struct v4l2_subdev =
*sd,
 	 * pixclk =3D clock_speed / (clkrc + 1) * PLLfactor
 	 *
 	 */
-	if (info->pll_bypass) {
-		pll_factor =3D 1;
-		ret =3D ov7670_write(sd, REG_DBLV, DBLV_BYPASS);
-	} else {
-		pll_factor =3D PLL_FACTOR;
-		ret =3D ov7670_write(sd, REG_DBLV, DBLV_X4);
-	}
-	if (ret < 0)
-		return ret;
-
 	if (tpf->numerator =3D=3D 0 || tpf->denominator =3D=3D 0) {
 		clkrc =3D 0;
 	} else {
+		pll_factor =3D info->pll_bypass ? 1 : PLL_FACTOR;
 		clkrc =3D (5 * pll_factor * info->clock_speed * tpf->numerator) /
 			(4 * tpf->denominator);
 		if (info->fmt->mbus_code =3D=3D MEDIA_BUS_FMT_SBGGR8_1X8)
@@ -859,11 +861,7 @@ static int ov7675_set_framerate(struct v4l2_subdev *=
sd,
 	/* Recalculate frame rate */
 	ov7675_get_framerate(sd, tpf);
=20
-	ret =3D ov7670_write(sd, REG_CLKRC, info->clkrc);
-	if (ret < 0)
-		return ret;
-
-	return ov7670_write(sd, REG_DBLV, DBLV_X4);
+	return ov7675_apply_framerate(sd);
 }
=20
 static void ov7670_get_framerate_legacy(struct v4l2_subdev *sd,
--=20
2.19.1
