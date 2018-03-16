From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v4 2/9] pinctrl: sunxi: introduce IRQ bank
 conversion function
Date: Fri, 16 Mar 2018 22:02:08 +0800
Message-ID: <20180316140215.28663-3-icenowy@aosc.io>
References: <20180316140215.28663-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBTU5V7KQKGQEROEGPGQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180316140215.28663-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Allwinner H6 SoC have its pin controllers with the first IRQ-capable
GPIO bank at IRQ bank 1 and the second bank at IRQ bank 5. Some
refactors in the sunxi pinctrl framework are needed.

This commit introduces a IRQ bank conversion function, which replaces
the "(bank_base + bank)" code in IRQ register access.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
Extracted in v4.

 drivers/pinctrl/sunxi/pinctrl-sunxi.h | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index a13bd57d880d..466840d886f6 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -263,14 +263,19 @@ static inline u32 sunxi_pull_offset(u16 pin)
 	return pin_num * PULL_PINS_BITS;
 }
 
+static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc, u8 bank)
+{
+	return desc->irq_bank_base + bank;
+}
+
 static inline u32 sunxi_irq_cfg_reg(const struct sunxi_pinctrl_desc *desc,
 				    u16 irq)
 {
-	unsigned bank_base = desc->irq_bank_base;
 	u8 bank = irq / IRQ_PER_BANK;
 	u8 reg = (irq % IRQ_PER_BANK) / IRQ_CFG_IRQ_PER_REG * 0x04;
 
-	return IRQ_CFG_REG + (bank_base + bank) * IRQ_MEM_SIZE + reg;
+	return IRQ_CFG_REG +
+	       sunxi_irq_hw_bank_num(desc, bank) * IRQ_MEM_SIZE + reg;
 }
 
 static inline u32 sunxi_irq_cfg_offset(u16 irq)
@@ -281,9 +286,7 @@ static inline u32 sunxi_irq_cfg_offset(u16 irq)
 
 static inline u32 sunxi_irq_ctrl_reg_from_bank(const struct sunxi_pinctrl_desc *desc, u8 bank)
 {
-	unsigned bank_base = desc->irq_bank_base;
-
-	return IRQ_CTRL_REG + (bank_base + bank) * IRQ_MEM_SIZE;
+	return IRQ_CTRL_REG + sunxi_irq_hw_bank_num(desc, bank) * IRQ_MEM_SIZE;
 }
 
 static inline u32 sunxi_irq_ctrl_reg(const struct sunxi_pinctrl_desc *desc,
@@ -302,16 +305,14 @@ static inline u32 sunxi_irq_ctrl_offset(u16 irq)
 
 static inline u32 sunxi_irq_debounce_reg_from_bank(const struct sunxi_pinctrl_desc *desc, u8 bank)
 {
-	unsigned bank_base = desc->irq_bank_base;
-
-	return IRQ_DEBOUNCE_REG + (bank_base + bank) * IRQ_MEM_SIZE;
+	return IRQ_DEBOUNCE_REG +
+	       sunxi_irq_hw_bank_num(desc, bank) * IRQ_MEM_SIZE;
 }
 
 static inline u32 sunxi_irq_status_reg_from_bank(const struct sunxi_pinctrl_desc *desc, u8 bank)
 {
-	unsigned bank_base = desc->irq_bank_base;
-
-	return IRQ_STATUS_REG + (bank_base + bank) * IRQ_MEM_SIZE;
+	return IRQ_STATUS_REG +
+	       sunxi_irq_hw_bank_num(desc, bank) * IRQ_MEM_SIZE;
 }
 
 static inline u32 sunxi_irq_status_reg(const struct sunxi_pinctrl_desc *desc,
-- 
2.15.1
