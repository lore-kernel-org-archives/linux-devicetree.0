From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v1 4/4] drm/mediatek: fix possible_crtcs
Date: Tue, 16 Apr 2019 16:58:48 +0200
Message-ID: <20190416145848.11932-5-frank-w@public-files.de>
References: <20190416145848.11932-1-frank-w@public-files.de>
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416145848.11932-1-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, chunhui dai <chunhui.dai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Ryder Lee <ryder.lee@mediatek.com>

without this patch there is purple stretched font on fbconsole

source: http://forum.banana-pi.org/t/kernel-4-19-rc1-for-testers/6618/52

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
=2D--
 drivers/gpu/drm/mediatek/mtk_dpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek=
/mtk_dpi.c
index 5d333138f913..c171b01f77e0 100644
=2D-- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -610,7 +610,7 @@ static int mtk_dpi_bind(struct device *dev, struct dev=
ice *master, void *data)
 	drm_encoder_helper_add(&dpi->encoder, &mtk_dpi_encoder_helper_funcs);

 	/* Currently DPI0 is fixed to be driven by OVL1 */
-	dpi->encoder.possible_crtcs =3D BIT(1);
+	dpi->encoder.possible_crtcs =3D BIT(0)|BIT(1);

 	ret =3D drm_bridge_attach(&dpi->encoder, dpi->bridge, NULL);
 	if (ret) {
=2D-
2.17.1
