From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH v2 09/11] drm/rockchip/dsi: decrease the value of Ths-prepare
Date: Mon, 16 Jan 2017 18:08:29 +0800
Message-ID: <1484561311-494-10-git-send-email-zyw@rock-chips.com>
References: <1484561311-494-1-git-send-email-zyw@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484561311-494-1-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dianders@chromium.org, tfiga@chromium.org, heiko@sntech.de, yzq@rock-chips.com, mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org, pawel.moll@arm.com, seanpaul@chromium.org
Cc: linux-rockchip@lists.infradead.org, xubilv <xbl@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>, Mark Yao <mark.yao@rock-chips.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: xubilv <xbl@rock-chips.com>

Signed-off-by: xubilv <xbl@rock-chips.com>
Signed-off-by: Chris Zhong <zyw@rock-chips.com>
---

 drivers/gpu/drm/rockchip/dw-mipi-dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
index 4a2691c..f50909e 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
@@ -455,7 +455,7 @@ static int dw_mipi_dsi_phy_init(struct dw_mipi_dsi *dsi)
 					 BANDGAP_SEL(BANDGAP_96_10));
 
 	dw_mipi_dsi_phy_write(dsi, 0x70, TLP_PROGRAM_EN | 0xf);
-	dw_mipi_dsi_phy_write(dsi, 0x71, THS_PRE_PROGRAM_EN | 0x55);
+	dw_mipi_dsi_phy_write(dsi, 0x71, THS_PRE_PROGRAM_EN | 0x2d);
 	dw_mipi_dsi_phy_write(dsi, 0x72, THS_ZERO_PROGRAM_EN | 0xa);
 
 	dsi_write(dsi, DSI_PHY_RSTZ, PHY_ENFORCEPLL | PHY_ENABLECLK |
-- 
2.6.3
