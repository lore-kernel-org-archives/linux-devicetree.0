From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v3 12/14] drm/sun4i: hdmi: Add support for A31's
 HDMI controller
Date: Fri, 29 Sep 2017 16:23:04 +0800
Message-ID: <20170929082306.16193-13-wens@csie.org>
References: <20170929082306.16193-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB6MFXDHAKGQETNOODXA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170929082306.16193-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

The HDMI controller found in the A31 SoCs is slightly different
from the one already supported, which is found in the A10s:

  - Need different initial values for the PLL related registers

  - Different behavior of the DDC and TMDS clocks

  - Different register layout for the DDC portion

  - Separate DDC parent clock

This patch adds support for it.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi.h     |  3 ++
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 58 ++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi.h b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
index da4ea9efc6fa..186624de9b60 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
@@ -59,10 +59,13 @@
 #define SUN4I_HDMI_PAD_CTRL0_TXEN		BIT(23)
 
 #define SUN4I_HDMI_PAD_CTRL1_REG	0x204
+#define SUN4I_HDMI_PAD_CTRL1_UNKNOWN		BIT(24)	/* set on A31 */
 #define SUN4I_HDMI_PAD_CTRL1_AMP_OPT		BIT(23)
 #define SUN4I_HDMI_PAD_CTRL1_AMPCK_OPT		BIT(22)
 #define SUN4I_HDMI_PAD_CTRL1_EMP_OPT		BIT(20)
 #define SUN4I_HDMI_PAD_CTRL1_EMPCK_OPT		BIT(19)
+#define SUN4I_HDMI_PAD_CTRL1_PWSCK		BIT(18)
+#define SUN4I_HDMI_PAD_CTRL1_PWSDT		BIT(17)
 #define SUN4I_HDMI_PAD_CTRL1_REG_DEN		BIT(15)
 #define SUN4I_HDMI_PAD_CTRL1_REG_DENCK		BIT(14)
 #define SUN4I_HDMI_PAD_CTRL1_REG_EMP(n)		(((n) & 7) << 10)
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 114cbe60b3e6..027b5608dbe6 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -324,6 +324,63 @@ static const struct sun4i_hdmi_variant sun5i_variant = {
 	.ddc_fifo_has_dir	= true,
 };
 
+static const struct sun4i_hdmi_variant sun6i_variant = {
+	.has_ddc_parent_clk	= true,
+	.has_reset_control	= true,
+	.pad_ctrl0_init_val	= 0xff |
+				  SUN4I_HDMI_PAD_CTRL0_TXEN |
+				  SUN4I_HDMI_PAD_CTRL0_CKEN |
+				  SUN4I_HDMI_PAD_CTRL0_PWENG |
+				  SUN4I_HDMI_PAD_CTRL0_PWEND |
+				  SUN4I_HDMI_PAD_CTRL0_PWENC |
+				  SUN4I_HDMI_PAD_CTRL0_LDODEN |
+				  SUN4I_HDMI_PAD_CTRL0_LDOCEN,
+	.pad_ctrl1_init_val	= SUN4I_HDMI_PAD_CTRL1_REG_AMP(6) |
+				  SUN4I_HDMI_PAD_CTRL1_REG_EMP(4) |
+				  SUN4I_HDMI_PAD_CTRL1_REG_DENCK |
+				  SUN4I_HDMI_PAD_CTRL1_REG_DEN |
+				  SUN4I_HDMI_PAD_CTRL1_EMPCK_OPT |
+				  SUN4I_HDMI_PAD_CTRL1_EMP_OPT |
+				  SUN4I_HDMI_PAD_CTRL1_PWSDT |
+				  SUN4I_HDMI_PAD_CTRL1_PWSCK |
+				  SUN4I_HDMI_PAD_CTRL1_AMPCK_OPT |
+				  SUN4I_HDMI_PAD_CTRL1_AMP_OPT |
+				  SUN4I_HDMI_PAD_CTRL1_UNKNOWN,
+	.pll_ctrl_init_val	= SUN4I_HDMI_PLL_CTRL_VCO_S(8) |
+				  SUN4I_HDMI_PLL_CTRL_CS(3) |
+				  SUN4I_HDMI_PLL_CTRL_CP_S(10) |
+				  SUN4I_HDMI_PLL_CTRL_S(4) |
+				  SUN4I_HDMI_PLL_CTRL_VCO_GAIN(4) |
+				  SUN4I_HDMI_PLL_CTRL_SDIV2 |
+				  SUN4I_HDMI_PLL_CTRL_LDO2_EN |
+				  SUN4I_HDMI_PLL_CTRL_LDO1_EN |
+				  SUN4I_HDMI_PLL_CTRL_HV_IS_33 |
+				  SUN4I_HDMI_PLL_CTRL_PLL_EN,
+
+	.ddc_clk_reg		= REG_FIELD(SUN6I_HDMI_DDC_CLK_REG, 0, 6),
+	.ddc_clk_pre_divider	= 1,
+	.ddc_clk_m_offset	= 2,
+
+	.tmds_clk_div_offset	= 1,
+
+	.field_ddc_en		= REG_FIELD(SUN6I_HDMI_DDC_CTRL_REG, 0, 0),
+	.field_ddc_start	= REG_FIELD(SUN6I_HDMI_DDC_CTRL_REG, 27, 27),
+	.field_ddc_reset	= REG_FIELD(SUN6I_HDMI_DDC_CTRL_REG, 31, 31),
+	.field_ddc_addr_reg	= REG_FIELD(SUN6I_HDMI_DDC_ADDR_REG, 1, 31),
+	.field_ddc_slave_addr	= REG_FIELD(SUN6I_HDMI_DDC_ADDR_REG, 1, 7),
+	.field_ddc_int_status	= REG_FIELD(SUN6I_HDMI_DDC_INT_STATUS_REG, 0, 8),
+	.field_ddc_fifo_clear	= REG_FIELD(SUN6I_HDMI_DDC_FIFO_CTRL_REG, 18, 18),
+	.field_ddc_fifo_rx_thres = REG_FIELD(SUN6I_HDMI_DDC_FIFO_CTRL_REG, 4, 7),
+	.field_ddc_fifo_tx_thres = REG_FIELD(SUN6I_HDMI_DDC_FIFO_CTRL_REG, 0, 3),
+	.field_ddc_byte_count	= REG_FIELD(SUN6I_HDMI_DDC_CMD_REG, 16, 25),
+	.field_ddc_cmd		= REG_FIELD(SUN6I_HDMI_DDC_CMD_REG, 0, 2),
+	.field_ddc_sda_en	= REG_FIELD(SUN6I_HDMI_DDC_CTRL_REG, 6, 6),
+	.field_ddc_sck_en	= REG_FIELD(SUN6I_HDMI_DDC_CTRL_REG, 4, 4),
+
+	.ddc_fifo_reg		= SUN6I_HDMI_DDC_FIFO_DATA_REG,
+	.ddc_fifo_thres_incl	= true,
+};
+
 static const struct regmap_config sun4i_hdmi_regmap_config = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -551,6 +608,7 @@ static int sun4i_hdmi_remove(struct platform_device *pdev)
 
 static const struct of_device_id sun4i_hdmi_of_table[] = {
 	{ .compatible = "allwinner,sun5i-a10s-hdmi", .data = &sun5i_variant, },
+	{ .compatible = "allwinner,sun6i-a31-hdmi", .data = &sun6i_variant, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_hdmi_of_table);
-- 
2.14.2
