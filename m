From: <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 05/14] clk: stm32mp1: add Source Clocks for PLLs
Date: Fri, 2 Feb 2018 15:03:33 +0100
Message-ID: <1517580222-23301-6-git-send-email-gabriel.fernandez@st.com>
References: <1517580222-23301-1-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517580222-23301-1-git-send-email-gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gabriel.fernandez.st-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, olivier.bideau-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>

This patch adds source clocks for PLLs
This patch also introduces MUX clock API.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
---
 drivers/clk/clk-stm32mp1.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index be5a4e5..1c9a84a 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -368,6 +368,14 @@ struct div_cfg {
 	const struct clk_div_table *table;
 };
 
+struct mux_cfg {
+	u32 reg_off;
+	u8 shift;
+	u8 width;
+	u8 mux_flags;
+	u32 *table;
+};
+
 static struct clk_hw *
 _clk_hw_register_gate(struct device *dev,
 		      struct clk_hw_onecell_data *clk_data,
@@ -419,6 +427,20 @@ struct div_cfg {
 					     lock);
 }
 
+static struct clk_hw *
+_clk_hw_register_mux(struct device *dev,
+		     struct clk_hw_onecell_data *clk_data,
+		     void __iomem *base, spinlock_t *lock,
+		     const struct clock_config *cfg)
+{
+	struct mux_cfg *mux_cfg = cfg->cfg;
+
+	return clk_hw_register_mux(dev, cfg->name, cfg->parent_names,
+				   cfg->num_parents, cfg->flags,
+				   mux_cfg->reg_off + base, mux_cfg->shift,
+				   mux_cfg->width, mux_cfg->mux_flags, lock);
+}
+
 /* MP1 Gate clock with set & clear registers */
 
 static int mp1_gate_clk_enable(struct clk_hw *hw)
@@ -550,6 +572,22 @@ static struct clk_hw *clk_register_mp1_gate(struct device *dev,
 	DIV_TABLE(_id, _name, _parent, _flags, _offset, _shift, _width,\
 		  _div_flags, NULL)
 
+#define MUX(_id, _name, _parents, _flags, _offset, _shift, _width, _mux_flags)\
+{\
+	.id		= _id,\
+	.name		= _name,\
+	.parent_names	= _parents,\
+	.num_parents	= ARRAY_SIZE(_parents),\
+	.flags		= _flags,\
+	.cfg		=  &(struct mux_cfg) {\
+		.reg_off	= _offset,\
+		.shift		= _shift,\
+		.width		= _width,\
+		.mux_flags	= _mux_flags,\
+	},\
+	.func		= _clk_hw_register_mux,\
+}
+
 #define MP1_GATE(_id, _name, _parent, _flags, _offset, _bit_idx, _gate_flags)\
 {\
 	.id		= _id,\
@@ -577,6 +615,16 @@ static struct clk_hw *clk_register_mp1_gate(struct device *dev,
 	GATE(CK_LSE, "ck_lse", "clk-lse", 0, RCC_BDCR, 0, 0),
 
 	FIXED_FACTOR(CK_HSE_DIV2, "clk-hse-div2", "ck_hse", 0, 1, 2),
+
+	/* ref clock pll */
+	MUX(NO_ID, "ref1", ref12_parents, CLK_OPS_PARENT_ENABLE, RCC_RCK12SELR,
+	    0, 2, CLK_MUX_READ_ONLY),
+
+	MUX(NO_ID, "ref3", ref3_parents, CLK_OPS_PARENT_ENABLE, RCC_RCK3SELR,
+	    0, 2, CLK_MUX_READ_ONLY),
+
+	MUX(NO_ID, "ref4", ref4_parents, CLK_OPS_PARENT_ENABLE, RCC_RCK4SELR,
+	    0, 2, CLK_MUX_READ_ONLY),
 };
 
 struct stm32_clock_match_data {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
