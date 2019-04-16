From: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v1 3/4] drm/mediatek: fix boot up for 720 and 480 but 1080
Date: Tue, 16 Apr 2019 16:58:47 +0200
Message-ID: <20190416145848.11932-4-frank-w@public-files.de>
References: <20190416145848.11932-1-frank-w@public-files.de>
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190416145848.11932-1-frank-w@public-files.de>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, chunhui dai <chunhui.dai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: Frank Wunderlich <frank-w@public-files.de>
List-Id: devicetree@vger.kernel.org

From: chunhui dai <chunhui.dai@mediatek.com>

- 1080 plg in/out with ng/ok
- support other resolutions like 1280x1024

Signed-off-by: chunhui dai <chunhui.dai@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
=2D--
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.c        | 3 +++
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.h        | 1 +
 drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c b/drivers/gpu/drm/med=
iatek/mtk_hdmi_phy.c
index 5223498502c4..edadb7a700f1 100644
=2D-- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
@@ -184,6 +184,9 @@ static int mtk_hdmi_phy_probe(struct platform_device *=
pdev)
 		return PTR_ERR(phy_provider);
 	}

+	if (hdmi_phy->conf->pll_default_off)
+		hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);
+
 	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
 				   hdmi_phy->pll);
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h b/drivers/gpu/drm/med=
iatek/mtk_hdmi_phy.h
index 2d8b3182470d..f472fdeb63dc 100644
=2D-- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
@@ -22,6 +22,7 @@ struct mtk_hdmi_phy;
 struct mtk_hdmi_phy_conf {
 	bool tz_disabled;
 	unsigned long flags;
+	bool pll_default_off;
 	const struct clk_ops *hdmi_phy_clk_ops;
 	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
 	void (*hdmi_phy_disable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/gpu/=
drm/mediatek/mtk_mt2701_hdmi_phy.c
index d3cc4022e988..6fbedacfc1e8 100644
=2D-- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
+++ b/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
@@ -239,6 +239,7 @@ static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_=
phy *hdmi_phy)
 struct mtk_hdmi_phy_conf mtk_hdmi_phy_2701_conf =3D {
 	.tz_disabled =3D true,
 	.flags =3D CLK_SET_RATE_GATE,
+	.pll_default_off =3D true,
 	.hdmi_phy_clk_ops =3D &mtk_hdmi_phy_pll_ops,
 	.hdmi_phy_enable_tmds =3D mtk_hdmi_phy_enable_tmds,
 	.hdmi_phy_disable_tmds =3D mtk_hdmi_phy_disable_tmds,
=2D-
2.17.1
