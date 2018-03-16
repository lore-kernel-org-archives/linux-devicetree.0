From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v4 3/9] pinctrl: sunxi: change irq_bank_base to irq_bank_map
Date: Fri, 16 Mar 2018 22:02:09 +0800
Message-ID: <20180316140215.28663-4-icenowy@aosc.io>
References: <20180316140215.28663-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBVM5V7KQKGQETHVSQXI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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
GPIO bank at IRQ bank 1 and the second bank at IRQ bank 5.

Change the current code that uses IRQ bank base to a IRQ bank map, in
order to support the case that holes exist among IRQ banks.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
Extracted in v4.

 drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c | 4 +++-
 drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c | 4 +++-
 drivers/pinctrl/sunxi/pinctrl-sunxi.h     | 7 +++++--
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c
index da387211a75e..f043afa1aac5 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-a33.c
@@ -481,11 +481,13 @@ static const struct sunxi_desc_pin sun8i_a33_pins[] = {
 		  SUNXI_FUNCTION(0x3, "uart3")),	/* CTS */
 };
 
+static const unsigned int sun8i_a33_pinctrl_irq_bank_map[] = { 1, 2 };
+
 static const struct sunxi_pinctrl_desc sun8i_a33_pinctrl_data = {
 	.pins = sun8i_a33_pins,
 	.npins = ARRAY_SIZE(sun8i_a33_pins),
 	.irq_banks = 2,
-	.irq_bank_base = 1,
+	.irq_bank_map = sun8i_a33_pinctrl_irq_bank_map,
 	.disable_strict_mode = true,
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
index 496ba34e1f5f..6704ce8e5e3d 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-v3s.c
@@ -293,11 +293,13 @@ static const struct sunxi_desc_pin sun8i_v3s_pins[] = {
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 5)),	/* PG_EINT5 */
 };
 
+static const unsigned int sun8i_v3s_pinctrl_irq_bank_map[] = { 1, 2 };
+
 static const struct sunxi_pinctrl_desc sun8i_v3s_pinctrl_data = {
 	.pins = sun8i_v3s_pins,
 	.npins = ARRAY_SIZE(sun8i_v3s_pins),
 	.irq_banks = 2,
-	.irq_bank_base = 1,
+	.irq_bank_map = sun8i_v3s_pinctrl_irq_bank_map,
 	.irq_read_needs_mux = true
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 466840d886f6..4a892e7dde66 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -110,7 +110,7 @@ struct sunxi_pinctrl_desc {
 	int				npins;
 	unsigned			pin_base;
 	unsigned			irq_banks;
-	unsigned			irq_bank_base;
+	const unsigned int		*irq_bank_map;
 	bool				irq_read_needs_mux;
 	bool				disable_strict_mode;
 };
@@ -265,7 +265,10 @@ static inline u32 sunxi_pull_offset(u16 pin)
 
 static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc, u8 bank)
 {
-	return desc->irq_bank_base + bank;
+	if (!desc->irq_bank_map)
+		return bank;
+	else
+		return desc->irq_bank_map[bank];
 }
 
 static inline u32 sunxi_irq_cfg_reg(const struct sunxi_pinctrl_desc *desc,
-- 
2.15.1
