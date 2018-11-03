From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 05/10] drm/sun4i: sun6i_mipi_dsi: Enable burst mode
Date: Sat,  3 Nov 2018 15:38:55 +0530
Message-ID: <20181103100900.30313-6-jagan@amarulasolutions.com>
References: <20181103100900.30313-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181103100900.30313-1-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Vasily Khoruzhick <anarsoul@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Michael Trimarchi <michael@amarulasolutions.com>, TL Lim <tllim@pine64.org>, linux-sunxi@googlegroups.com
Cc: Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Enable video_mode_burst bit from dsi base control register
for burst mode display panels.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index b6c01891df36..b18a01361f11 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -421,6 +421,10 @@ static void sun6i_dsi_setup_burst(struct sun6i_dsi *dsi,
 	regmap_write(dsi->regs, SUN6I_DSI_BURST_LINE_REG,
 		     SUN6I_DSI_BURST_LINE_NUM(line_num) |
 		     SUN6I_DSI_BURST_LINE_SYNC_POINT(sync_point));
+
+	regmap_read(dsi->regs, SUN6I_DSI_BASIC_CTL_REG, &val);
+	val |= SUN6I_DSI_BASIC_CTL_VIDEO_BURST;
+	regmap_write(dsi->regs, SUN6I_DSI_BASIC_CTL_REG, val);
 }
 
 static void sun6i_dsi_setup_inst_loop(struct sun6i_dsi *dsi,
-- 
2.18.0.321.gffc6fa0e3
