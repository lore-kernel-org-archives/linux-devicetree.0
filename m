From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 3/7] clk: at91: usb: Add sam9x60 support
Date: Wed, 20 Feb 2019 12:26:01 +0100
Message-ID: <20190220112605.23095-4-alexandre.belloni@bootlin.com>
References: <20190220112605.23095-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190220112605.23095-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: devicetree@vger.kernel.org

The sam9x60 USB clock supports four different parents, ensure they can be
selected.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/clk/at91/clk-usb.c | 33 +++++++++++++++++++++++++++------
 drivers/clk/at91/pmc.h     |  3 +++
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/at91/clk-usb.c b/drivers/clk/at91/clk-usb.c
index 79ee1c760f2a..ebc37ee33518 100644
--- a/drivers/clk/at91/clk-usb.c
+++ b/drivers/clk/at91/clk-usb.c
@@ -23,9 +23,13 @@
 #define RM9200_USB_DIV_SHIFT	28
 #define RM9200_USB_DIV_TAB_SIZE	4
 
+#define SAM9X5_USBS_MASK	GENMASK(0, 0)
+#define SAM9X60_USBS_MASK	GENMASK(1, 0)
+
 struct at91sam9x5_clk_usb {
 	struct clk_hw hw;
 	struct regmap *regmap;
+	u32 usbs_mask;
 };
 
 #define to_at91sam9x5_clk_usb(hw) \
@@ -111,8 +115,7 @@ static int at91sam9x5_clk_usb_set_parent(struct clk_hw *hw, u8 index)
 	if (index > 1)
 		return -EINVAL;
 
-	regmap_update_bits(usb->regmap, AT91_PMC_USB, AT91_PMC_USBS,
-			   index ? AT91_PMC_USBS : 0);
+	regmap_update_bits(usb->regmap, AT91_PMC_USB, usb->usbs_mask, index);
 
 	return 0;
 }
@@ -124,7 +127,7 @@ static u8 at91sam9x5_clk_usb_get_parent(struct clk_hw *hw)
 
 	regmap_read(usb->regmap, AT91_PMC_USB, &usbr);
 
-	return usbr & AT91_PMC_USBS;
+	return usbr & usb->usbs_mask;
 }
 
 static int at91sam9x5_clk_usb_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -190,9 +193,10 @@ static const struct clk_ops at91sam9n12_usb_ops = {
 	.set_rate = at91sam9x5_clk_usb_set_rate,
 };
 
-struct clk_hw * __init
-at91sam9x5_clk_register_usb(struct regmap *regmap, const char *name,
-			    const char **parent_names, u8 num_parents)
+static struct clk_hw * __init
+_at91sam9x5_clk_register_usb(struct regmap *regmap, const char *name,
+			     const char **parent_names, u8 num_parents,
+			     u32 usbs_mask)
 {
 	struct at91sam9x5_clk_usb *usb;
 	struct clk_hw *hw;
@@ -212,6 +216,7 @@ at91sam9x5_clk_register_usb(struct regmap *regmap, const char *name,
 
 	usb->hw.init = &init;
 	usb->regmap = regmap;
+	usb->usbs_mask = SAM9X5_USBS_MASK;
 
 	hw = &usb->hw;
 	ret = clk_hw_register(NULL, &usb->hw);
@@ -223,6 +228,22 @@ at91sam9x5_clk_register_usb(struct regmap *regmap, const char *name,
 	return hw;
 }
 
+struct clk_hw * __init
+at91sam9x5_clk_register_usb(struct regmap *regmap, const char *name,
+			    const char **parent_names, u8 num_parents)
+{
+	return _at91sam9x5_clk_register_usb(regmap, name, parent_names,
+					    num_parents, SAM9X5_USBS_MASK);
+}
+
+struct clk_hw * __init
+sam9x60_clk_register_usb(struct regmap *regmap, const char *name,
+			 const char **parent_names, u8 num_parents)
+{
+	return _at91sam9x5_clk_register_usb(regmap, name, parent_names,
+					    num_parents, SAM9X60_USBS_MASK);
+}
+
 struct clk_hw * __init
 at91sam9n12_clk_register_usb(struct regmap *regmap, const char *name,
 			     const char *parent_name)
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 4027306b904c..44345e4ab1c9 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -194,6 +194,9 @@ struct clk_hw * __init
 at91sam9n12_clk_register_usb(struct regmap *regmap, const char *name,
 			     const char *parent_name);
 struct clk_hw * __init
+sam9x60_clk_register_usb(struct regmap *regmap, const char *name,
+			 const char **parent_names, u8 num_parents);
+struct clk_hw * __init
 at91rm9200_clk_register_usb(struct regmap *regmap, const char *name,
 			    const char *parent_name, const u32 *divisors);
 
-- 
2.20.1
