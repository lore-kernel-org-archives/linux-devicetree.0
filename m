From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/3] drm: rcar-du: lvds: refactor LVDS startup
Date: Thu, 11 Jan 2018 19:54:33 +0300
Message-ID: <20180111170055.878913975__10953.1020782471$1515689953$gmane$org@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline; filename=drm-rcar-du-lvds-refactor-LVDS-startup.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

After the recent correction of the R-Car gen3 LVDCR1 value, already similar
enough at their  ends rcar_du_lvdsenc_start_gen{2|3}() started asking for a
merge and it's becoming actually necessary with the addition the R-Car V3M
(R8A77970) support -- this  gen3 SoC  has gen2-like LVDPLLCR layout.

BTW, such a merge saves 72 bytes of the object code with AArch64 gcc 4.8.5.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c |  132 ++++++++++++------------------
 1 file changed, 54 insertions(+), 78 deletions(-)

Index: linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
===================================================================
--- linux.orig/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
+++ linux/drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
@@ -39,98 +39,41 @@ static void rcar_lvds_write(struct rcar_
 	iowrite32(data, lvds->mmio + reg);
 }
 
-static void rcar_du_lvdsenc_start_gen2(struct rcar_du_lvdsenc *lvds,
-				       struct rcar_du_crtc *rcrtc)
+static u32 rcar_lvds_gen2_lvdpllcr(unsigned int freq)
 {
-	const struct drm_display_mode *mode = &rcrtc->crtc.mode;
-	unsigned int freq = mode->clock;
-	u32 lvdcr0;
-	u32 pllcr;
+	u32 lvdpllcr;
 
-	/* PLL clock configuration */
 	if (freq < 39000)
-		pllcr = LVDPLLCR_CEEN | LVDPLLCR_COSEL | LVDPLLCR_PLLDLYCNT_38M;
+		lvdpllcr = LVDPLLCR_PLLDLYCNT_38M;
 	else if (freq < 61000)
-		pllcr = LVDPLLCR_CEEN | LVDPLLCR_COSEL | LVDPLLCR_PLLDLYCNT_60M;
+		lvdpllcr = LVDPLLCR_PLLDLYCNT_60M;
 	else if (freq < 121000)
-		pllcr = LVDPLLCR_CEEN | LVDPLLCR_COSEL | LVDPLLCR_PLLDLYCNT_121M;
+		lvdpllcr = LVDPLLCR_PLLDLYCNT_121M;
 	else
-		pllcr = LVDPLLCR_PLLDLYCNT_150M;
-
-	rcar_lvds_write(lvds, LVDPLLCR, pllcr);
-
-	/*
-	 * Select the input, hardcode mode 0, enable LVDS operation and turn
-	 * bias circuitry on.
-	 */
-	lvdcr0 = (lvds->mode << LVDCR0_LVMD_SHIFT) | LVDCR0_BEN | LVDCR0_LVEN;
-	if (rcrtc->index == 2)
-		lvdcr0 |= LVDCR0_DUSEL;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+		return LVDPLLCR_PLLDLYCNT_150M;
 
-	/* Turn all the channels on. */
-	rcar_lvds_write(lvds, LVDCR1,
-			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
-			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
-
-	/*
-	 * Turn the PLL on, wait for the startup delay, and turn the output
-	 * on.
-	 */
-	lvdcr0 |= LVDCR0_PLLON;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
-
-	usleep_range(100, 150);
-
-	lvdcr0 |= LVDCR0_LVRES;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	return lvdpllcr | LVDPLLCR_CEEN | LVDPLLCR_COSEL;
 }
 
-static void rcar_du_lvdsenc_start_gen3(struct rcar_du_lvdsenc *lvds,
-				       struct rcar_du_crtc *rcrtc)
+static u32 rcar_lvds_gen3_lvdpllcr(unsigned int freq)
 {
-	const struct drm_display_mode *mode = &rcrtc->crtc.mode;
-	unsigned int freq = mode->clock;
-	u32 lvdcr0;
-	u32 pllcr;
-
-	/* PLL clock configuration */
 	if (freq < 42000)
-		pllcr = LVDPLLCR_PLLDIVCNT_42M;
+		return LVDPLLCR_PLLDIVCNT_42M;
 	else if (freq < 85000)
-		pllcr = LVDPLLCR_PLLDIVCNT_85M;
+		return LVDPLLCR_PLLDIVCNT_85M;
 	else if (freq < 128000)
-		pllcr = LVDPLLCR_PLLDIVCNT_128M;
-	else
-		pllcr = LVDPLLCR_PLLDIVCNT_148M;
-
-	rcar_lvds_write(lvds, LVDPLLCR, pllcr);
-
-	/* Turn all the channels on. */
-	rcar_lvds_write(lvds, LVDCR1,
-			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
-			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
-
-	/*
-	 * Turn the PLL on, set it to LVDS normal mode, wait for the startup
-	 * delay and turn the output on.
-	 */
-	lvdcr0 = (lvds->mode << LVDCR0_LVMD_SHIFT) | LVDCR0_PLLON;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
-
-	lvdcr0 |= LVDCR0_PWD;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+		return LVDPLLCR_PLLDIVCNT_128M;
 
-	usleep_range(100, 150);
-
-	lvdcr0 |= LVDCR0_LVRES;
-	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	return LVDPLLCR_PLLDIVCNT_148M;
 }
 
 static int rcar_du_lvdsenc_start(struct rcar_du_lvdsenc *lvds,
 				 struct rcar_du_crtc *rcrtc)
 {
-	u32 lvdhcr;
+	u32 lvdhcr, lvdpllcr, lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
+	const struct drm_display_mode *mode = &rcrtc->crtc.mode;
+	unsigned int gen = lvds->dev->info->gen;
+	unsigned int freq = mode->clock;
 	int ret;
 
 	if (lvds->enabled)
@@ -158,14 +101,47 @@ static int rcar_du_lvdsenc_start(struct
 	else
 		lvdhcr = LVDCHCR_CHSEL_CH(0, 0) | LVDCHCR_CHSEL_CH(1, 1)
 		       | LVDCHCR_CHSEL_CH(2, 2) | LVDCHCR_CHSEL_CH(3, 3);
-
 	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
 
-	/* Perform generation-specific initialization. */
-	if (lvds->dev->info->gen < 3)
-		rcar_du_lvdsenc_start_gen2(lvds, rcrtc);
+	/* PLL clock configuration */
+	if (gen < 3)
+		lvdpllcr = rcar_lvds_gen2_lvdpllcr(freq);
 	else
-		rcar_du_lvdsenc_start_gen3(lvds, rcrtc);
+		lvdpllcr = rcar_lvds_gen3_lvdpllcr(freq);
+	rcar_lvds_write(lvds, LVDPLLCR,	lvdpllcr);
+
+	if (gen < 3) {
+		/*
+		 * Select the input, enable LVDS operation, and turn
+		 * the bias circuitry on.
+		 */
+		lvdcr0 |= LVDCR0_BEN | LVDCR0_LVEN;
+		if (rcrtc->index == 2)
+			lvdcr0 |= LVDCR0_DUSEL;
+		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	}
+
+	/* Turn all the channels on. */
+	rcar_lvds_write(lvds, LVDCR1,
+			LVDCR1_CHSTBY(3) | LVDCR1_CHSTBY(2) |
+			LVDCR1_CHSTBY(1) | LVDCR1_CHSTBY(0) | LVDCR1_CLKSTBY);
+
+	/* Turn the PLL on. */
+	lvdcr0 |= LVDCR0_PLLON;
+	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+
+	if (gen > 2) {
+		/* Turn on the LVDS normal mode. */
+		lvdcr0 |= LVDCR0_PWD;
+		rcar_lvds_write(lvds, LVDCR0, lvdcr0);
+	}
+
+	/* Wait for the startup delay. */
+	usleep_range(100, 150);
+
+	/* Turn the output on. */
+	lvdcr0 |= LVDCR0_LVRES;
+	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
 
 	lvds->enabled = true;
 
