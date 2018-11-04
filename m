From: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v3 11/28] drm/sun4i: Disable unused DE2 sub-engines
Date: Sun,  4 Nov 2018 19:26:48 +0100
Message-ID: <20181104182705.18047-12-jernej.skrabec@siol.net>
References: <20181104182705.18047-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181104182705.18047-1-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, wens@csie.org
Cc: robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, airlied@linux.ie, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com, jernej.skrabec@siol.net
List-Id: devicetree@vger.kernel.org

Some sub-engines are unused. Disable them explicitly.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 8 ++++++++
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 4 ++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
index 6769ec08c0d3..ec2c264f9481 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -462,6 +462,14 @@ static int sun8i_mixer_bind(struct device *dev, stru=
ct device *master,
 	/* Reset the registers */
 	for (i =3D 0; i < DE2_MIXER_UNIT_SIZE; i +=3D 4)
 		regmap_write(mixer->engine.regs, i, 0);
+	/* Disable unused sub-engines */
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_FCE_EN, 0);
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BWS_EN, 0);
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_LTI_EN, 0);
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_PEAK_EN, 0);
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_ASE_EN, 0);
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_FCC_EN, 0);
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_DCSC_EN, 0);
=20
 	/* Enable the mixer */
 	regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_CTL,
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/=
sun8i_mixer.h
index 09e0f4428c1e..a4175b993e0d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -101,8 +101,8 @@
 #define SUN8I_MIXER_FBFMT_YUV411	14
=20
 /*
- * These sub-engines are still unknown now, the EN registers are here on=
ly to
- * be used to disable these sub-engines.
+ * Sub-engines listed bellow are unused for now. The EN registers are he=
re only
+ * to be used to disable these sub-engines.
  */
 #define SUN8I_MIXER_FCE_EN			0xa0000
 #define SUN8I_MIXER_BWS_EN			0xa2000
--=20
2.19.1
