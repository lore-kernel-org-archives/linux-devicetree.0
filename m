From: Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH 07/10] drm/mxsfb: Update mxsfb to support LCD reset
Date: Wed, 26 Jun 2019 16:32:15 +0300
Message-ID: <1561555938-21595-8-git-send-email-robert.chiras@nxp.com>
References: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>
List-Id: devicetree@vger.kernel.org

The eLCDIF controller has control pin for the external LCD reset pin.
Add support for it and assert this pin in enable and de-assert it in
disable.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 10 ++++++++--
 drivers/gpu/drm/mxsfb/mxsfb_regs.h |  1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
index e48396d..d9429fc 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
@@ -222,9 +222,12 @@ static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
 		clk_prepare_enable(mxsfb->clk_disp_axi);
 	clk_prepare_enable(mxsfb->clk);
 
-	if (mxsfb->devdata->ipversion >= 4)
+	if (mxsfb->devdata->ipversion >= 4) {
 		writel(CTRL2_OUTSTANDING_REQS__REQ_16,
 		       mxsfb->base + LCDC_V4_CTRL2 + REG_SET);
+		/* Assert LCD Reset bit */
+		writel(CTRL2_LCD_RESET, mxsfb->base + LCDC_V4_CTRL2 + REG_SET);
+	}
 
 	/* If it was disabled, re-enable the mode again */
 	writel(CTRL_DOTCLK_MODE, mxsfb->base + LCDC_CTRL + REG_SET);
@@ -242,9 +245,12 @@ static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
 {
 	u32 reg;
 
-	if (mxsfb->devdata->ipversion >= 4)
+	if (mxsfb->devdata->ipversion >= 4) {
 		writel(CTRL2_OUTSTANDING_REQS(0x7),
 		       mxsfb->base + LCDC_V4_CTRL2 + REG_CLR);
+		/* De-assert LCD Reset bit */
+		writel(CTRL2_LCD_RESET, mxsfb->base + LCDC_V4_CTRL2 + REG_CLR);
+	}
 
 	writel(CTRL_RUN, mxsfb->base + LCDC_CTRL + REG_CLR);
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_regs.h b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
index 9ee0d3c7..2583a69 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
@@ -87,6 +87,7 @@
 #define CTRL2_OUTSTANDING_REQS(x)	REG_PUT((x), 23, 21)
 #define CTRL2_ODD_LINE_PATTERN(x)	REG_PUT((x), 18, 16)
 #define CTRL2_EVEN_LINE_PATTERN(x)	REG_PUT((x), 14, 12)
+#define CTRL2_LCD_RESET			BIT(0)
 
 #define TRANSFER_COUNT_SET_VCOUNT(x)	(((x) & 0xffff) << 16)
 #define TRANSFER_COUNT_GET_VCOUNT(x)	(((x) >> 16) & 0xffff)
-- 
2.7.4
