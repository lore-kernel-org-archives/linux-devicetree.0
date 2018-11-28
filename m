From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 09/15] clk: sunxi-ng: r40: Force LOSC parent to
 RTC LOSC output
Date: Wed, 28 Nov 2018 17:30:07 +0800
Message-ID: <20181128093013.24442-11-wens@csie.org>
References: <20181128093013.24442-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBOWA7HPQKGQEJC6277I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20181128093013.24442-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On the R40, in addition to a mux between the RTC's own RC oscillator and
an external 32768 Hz crystal, which are muxed inside the RTC module, the
CCU also has its own RC oscillator, which runs at around 2 MHz, and can
be muxed with the LOSC output from the RTC. This muxed output is called
"SYS 32K" in the module clock diagram, but otherwise referred to as the
LOSC throughout the CCU documentation.

The RC oscillator is not very accurate, even though it has an undocumented
calibration function. We really want a precise clock at 32768 Hz,
instead of something at around 32 KHz. This patch forces the SYS 32K
clock to use the RTC output as its parent, and doesn't bother
registering the internal oscillator nor a clock mux.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
index 582ebd41d20d..a22d11aa38ba 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
@@ -1284,6 +1284,9 @@ static struct regmap_config sun8i_r40_ccu_regmap_config = {
 	.writeable_reg	= sun8i_r40_ccu_regmap_accessible_reg,
 };
 
+#define SUN8I_R40_SYS_32K_CLK_REG 0x310
+#define SUN8I_R40_SYS_32K_CLK_KEY (0x16AA << 16)
+
 static int sun8i_r40_ccu_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -1312,6 +1315,14 @@ static int sun8i_r40_ccu_probe(struct platform_device *pdev)
 	val &= ~GENMASK(25, 20);
 	writel(val, reg + SUN8I_R40_USB_CLK_REG);
 
+	/*
+	 * Force SYS 32k (otherwise known as LOSC throughout the CCU)
+	 * clock parent to LOSC output from RTC module instead of the
+	 * CCU's internal RC oscillator divided output.
+	 */
+	writel(SUN8I_R40_SYS_32K_CLK_KEY | BIT(8),
+	       reg + SUN8I_R40_SYS_32K_CLK_REG);
+
 	regmap = devm_regmap_init_mmio(&pdev->dev, reg,
 				       &sun8i_r40_ccu_regmap_config);
 	if (IS_ERR(regmap))
-- 
2.20.0.rc1
