Return-Path: <mtk10466@mediatek.inc>
From: Hongzhou Yang <hongzhou.yang@mediatek.com>
Subject: [PATCH 01/10] pinctrl: mediatek: data struct optimize and remove unused member
Date: Wed, 13 May 2015 18:35:37 -0700
Message-ID: <1431567346-33780-2-git-send-email-hongzhou.yang@mediatek.com>
In-Reply-To: <1431567346-33780-1-git-send-email-hongzhou.yang@mediatek.com>
References: <1431567346-33780-1-git-send-email-hongzhou.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Howard Chen <ibanezchen@gmail.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, "Joe.C" <yingjoe.chen@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, dandan.he@mediatek.com
List-ID: <devicetree@vger.kernel.org>

From: Yingjoe Chen <yingjoe.chen@mediatek.com>

struct mtk_desc_pin.chip, mtk_pinctrl_devdata.invser_offset
and mtk_pinctrl_devdata.chip_type are never used in code.
Remove them.

Some per-pin data are using int for pin number and offsets.
Change to short and rearrange to reduce const data size.

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8135.c     |   10 ++++------
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h |   10 ++--------
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8135.c b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
index f1e1e18..8e6abd5 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8135.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
@@ -32,12 +32,12 @@
 #define R1_BASE2				0x250
 
 struct mtk_spec_pull_set {
-	unsigned int pin;
-	unsigned int pupd_offset;
+	unsigned char pin;
 	unsigned char pupd_bit;
-	unsigned int r0_offset;
+	unsigned short pupd_offset;
+	unsigned short r0_offset;
+	unsigned short r1_offset;
 	unsigned char r0_bit;
-	unsigned int r1_offset;
 	unsigned char r1_bit;
 };
 
@@ -305,7 +305,6 @@ static const struct mtk_pinctrl_devdata mt8135_pinctrl_data = {
 	.pullen_offset = 0x0200,
 	.smt_offset = 0x0300,
 	.pullsel_offset = 0x0400,
-	.invser_offset = 0x0600,
 	.dout_offset = 0x0800,
 	.din_offset = 0x0A00,
 	.pinmux_offset = 0x0C00,
@@ -314,7 +313,6 @@ static const struct mtk_pinctrl_devdata mt8135_pinctrl_data = {
 	.port_shf = 4,
 	.port_mask = 0xf,
 	.port_align = 4,
-	.chip_type = MTK_CHIP_TYPE_BASE,
 	.eint_offsets = {
 		.name = "mt8135_eint",
 		.stat      = 0x000,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
index 375771d..1508849 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
@@ -19,8 +19,6 @@
 #include <linux/regmap.h>
 
 #define NO_EINT_SUPPORT    255
-#define MTK_CHIP_TYPE_BASE     0
-#define MTK_CHIP_TYPE_PMIC     1
 #define MT_EDGE_SENSITIVE           0
 #define MT_LEVEL_SENSITIVE          1
 #define EINT_DBNC_SET_DBNC_BITS     4
@@ -39,7 +37,6 @@ struct mtk_desc_eint {
 
 struct mtk_desc_pin {
 	struct pinctrl_pin_desc	pin;
-	const char *chip;
 	const struct mtk_desc_eint eint;
 	const struct mtk_desc_function	*functions;
 };
@@ -47,7 +44,6 @@ struct mtk_desc_pin {
 #define MTK_PIN(_pin, _pad, _chip, _eint, ...)		\
 	{							\
 		.pin = _pin,					\
-		.chip = _chip,					\
 		.eint = _eint,					\
 		.functions = (struct mtk_desc_function[]){	\
 			__VA_ARGS__, { } },			\
@@ -107,8 +103,8 @@ struct mtk_drv_group_desc {
  * @grp: The group for this pin belongs to.
  */
 struct mtk_pin_drv_grp {
-	unsigned int pin;
-	unsigned int offset;
+	unsigned short pin;
+	unsigned short offset;
 	unsigned char bit;
 	unsigned char grp;
 };
@@ -193,7 +189,6 @@ struct mtk_pinctrl_devdata {
 	unsigned int pullen_offset;
 	unsigned int pullsel_offset;
 	unsigned int drv_offset;
-	unsigned int invser_offset;
 	unsigned int dout_offset;
 	unsigned int din_offset;
 	unsigned int pinmux_offset;
@@ -202,7 +197,6 @@ struct mtk_pinctrl_devdata {
 	unsigned char  port_shf;
 	unsigned char  port_mask;
 	unsigned char  port_align;
-	unsigned char	chip_type;
 	struct mtk_eint_offsets eint_offsets;
 	unsigned int	ap_num;
 	unsigned int	db_cnt;
-- 
1.7.9.5
