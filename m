From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v3 1/7] pinctrl: sunxi: refactor irq related
 register function to have desc
Date: Fri, 23 Feb 2018 20:25:46 +0800
Message-ID: <20180223122552.58049-2-icenowy@aosc.io>
References: <20180223122552.58049-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBG4RYDKAKGQE5PHNV5I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180223122552.58049-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As the new H6 SoC has holes in the IRQ registers, refactor the IRQ
related register function for getting the full pinctrl desc structure.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
New patch in v3.

 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 18 ++++++++----------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h | 29 +++++++++++++++++++++--------
 2 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 341312d66512..31bd99f7df50 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -835,7 +835,7 @@ static void sunxi_pinctrl_irq_release_resources(struct irq_data *d)
 static int sunxi_pinctrl_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
-	u32 reg = sunxi_irq_cfg_reg(d->hwirq, pctl->desc->irq_bank_base);
+	u32 reg = sunxi_irq_cfg_reg(d->hwirq, pctl->desc);
 	u8 index = sunxi_irq_cfg_offset(d->hwirq);
 	unsigned long flags;
 	u32 regval;
@@ -882,8 +882,7 @@ static int sunxi_pinctrl_irq_set_type(struct irq_data *d, unsigned int type)
 static void sunxi_pinctrl_irq_ack(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
-	u32 status_reg = sunxi_irq_status_reg(d->hwirq,
-					      pctl->desc->irq_bank_base);
+	u32 status_reg = sunxi_irq_status_reg(d->hwirq, pctl->desc);
 	u8 status_idx = sunxi_irq_status_offset(d->hwirq);
 
 	/* Clear the IRQ */
@@ -893,7 +892,7 @@ static void sunxi_pinctrl_irq_ack(struct irq_data *d)
 static void sunxi_pinctrl_irq_mask(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
-	u32 reg = sunxi_irq_ctrl_reg(d->hwirq, pctl->desc->irq_bank_base);
+	u32 reg = sunxi_irq_ctrl_reg(d->hwirq, pctl->desc);
 	u8 idx = sunxi_irq_ctrl_offset(d->hwirq);
 	unsigned long flags;
 	u32 val;
@@ -910,7 +909,7 @@ static void sunxi_pinctrl_irq_mask(struct irq_data *d)
 static void sunxi_pinctrl_irq_unmask(struct irq_data *d)
 {
 	struct sunxi_pinctrl *pctl = irq_data_get_irq_chip_data(d);
-	u32 reg = sunxi_irq_ctrl_reg(d->hwirq, pctl->desc->irq_bank_base);
+	u32 reg = sunxi_irq_ctrl_reg(d->hwirq, pctl->desc);
 	u8 idx = sunxi_irq_ctrl_offset(d->hwirq);
 	unsigned long flags;
 	u32 val;
@@ -1002,7 +1001,7 @@ static void sunxi_pinctrl_irq_handler(struct irq_desc *desc)
 	if (bank == pctl->desc->irq_banks)
 		return;
 
-	reg = sunxi_irq_status_reg_from_bank(bank, pctl->desc->irq_bank_base);
+	reg = sunxi_irq_status_reg_from_bank(bank, pctl->desc);
 	val = readl(pctl->membase + reg);
 
 	if (val) {
@@ -1234,8 +1233,7 @@ static int sunxi_pinctrl_setup_debounce(struct sunxi_pinctrl *pctl,
 
 		writel(src | div << 4,
 		       pctl->membase +
-		       sunxi_irq_debounce_reg_from_bank(i,
-							pctl->desc->irq_bank_base));
+		       sunxi_irq_debounce_reg_from_bank(i, pctl->desc));
 	}
 
 	return 0;
@@ -1411,10 +1409,10 @@ int sunxi_pinctrl_init_with_variant(struct platform_device *pdev,
 	for (i = 0; i < pctl->desc->irq_banks; i++) {
 		/* Mask and clear all IRQs before registering a handler */
 		writel(0, pctl->membase + sunxi_irq_ctrl_reg_from_bank(i,
-						pctl->desc->irq_bank_base));
+						pctl->desc));
 		writel(0xffffffff,
 		       pctl->membase + sunxi_irq_status_reg_from_bank(i,
-						pctl->desc->irq_bank_base));
+						pctl->desc));
 
 		irq_set_chained_handler_and_data(pctl->irq[i],
 						 sunxi_pinctrl_irq_handler,
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 11b128f54ed2..909ca1504b61 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -263,8 +263,10 @@ static inline u32 sunxi_pull_offset(u16 pin)
 	return pin_num * PULL_PINS_BITS;
 }
 
-static inline u32 sunxi_irq_cfg_reg(u16 irq, unsigned bank_base)
+static inline u32 sunxi_irq_cfg_reg(u16 irq,
+				    const struct sunxi_pinctrl_desc *desc)
 {
+	unsigned bank_base = desc->irq_bank_base;
 	u8 bank = irq / IRQ_PER_BANK;
 	u8 reg = (irq % IRQ_PER_BANK) / IRQ_CFG_IRQ_PER_REG * 0x04;
 
@@ -277,16 +279,20 @@ static inline u32 sunxi_irq_cfg_offset(u16 irq)
 	return irq_num * IRQ_CFG_IRQ_BITS;
 }
 
-static inline u32 sunxi_irq_ctrl_reg_from_bank(u8 bank, unsigned bank_base)
+static inline u32 sunxi_irq_ctrl_reg_from_bank(u8 bank,
+					       const struct sunxi_pinctrl_desc *desc)
 {
+	unsigned bank_base = desc->irq_bank_base;
+
 	return IRQ_CTRL_REG + (bank_base + bank) * IRQ_MEM_SIZE;
 }
 
-static inline u32 sunxi_irq_ctrl_reg(u16 irq, unsigned bank_base)
+static inline u32 sunxi_irq_ctrl_reg(u16 irq,
+				     const struct sunxi_pinctrl_desc *desc)
 {
 	u8 bank = irq / IRQ_PER_BANK;
 
-	return sunxi_irq_ctrl_reg_from_bank(bank, bank_base);
+	return sunxi_irq_ctrl_reg_from_bank(bank, desc);
 }
 
 static inline u32 sunxi_irq_ctrl_offset(u16 irq)
@@ -295,21 +301,28 @@ static inline u32 sunxi_irq_ctrl_offset(u16 irq)
 	return irq_num * IRQ_CTRL_IRQ_BITS;
 }
 
-static inline u32 sunxi_irq_debounce_reg_from_bank(u8 bank, unsigned bank_base)
+static inline u32 sunxi_irq_debounce_reg_from_bank(u8 bank,
+						   const struct sunxi_pinctrl_desc *desc)
 {
+	unsigned bank_base = desc->irq_bank_base;
+
 	return IRQ_DEBOUNCE_REG + (bank_base + bank) * IRQ_MEM_SIZE;
 }
 
-static inline u32 sunxi_irq_status_reg_from_bank(u8 bank, unsigned bank_base)
+static inline u32 sunxi_irq_status_reg_from_bank(u8 bank,
+						 const struct sunxi_pinctrl_desc *desc)
 {
+	unsigned bank_base = desc->irq_bank_base;
+
 	return IRQ_STATUS_REG + (bank_base + bank) * IRQ_MEM_SIZE;
 }
 
-static inline u32 sunxi_irq_status_reg(u16 irq, unsigned bank_base)
+static inline u32 sunxi_irq_status_reg(u16 irq,
+				       const struct sunxi_pinctrl_desc *desc)
 {
 	u8 bank = irq / IRQ_PER_BANK;
 
-	return sunxi_irq_status_reg_from_bank(bank, bank_base);
+	return sunxi_irq_status_reg_from_bank(bank, desc);
 }
 
 static inline u32 sunxi_irq_status_offset(u16 irq)
-- 
2.15.1
