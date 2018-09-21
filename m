Return-Path: <SRS0=c6Dm=MD=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 2/4] pinctrl: sh-pfc: r8a77470: Add SDHI2 voltage switch
Date: Fri, 21 Sep 2018 12:55:09 +0100
Message-Id: <1537530911-443-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1537530911-443-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1537530911-443-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Add SH_PFC_PIN_CFG_IO_VOLTAGE definition for the SDHI2 pins
capable of switching voltage. Please note that with the
RZ/G1C only 1 bit of the POC Control Register is used to
control each interface.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77470.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
index 9d3ed43..a1248e2 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77470.c
@@ -17,7 +17,19 @@
 	PORT_GP_1(3, 27, fn, sfx),					\
 	PORT_GP_1(3, 28, fn, sfx),					\
 	PORT_GP_1(3, 29, fn, sfx),					\
-	PORT_GP_26(4, fn, sfx),						\
+	PORT_GP_14(4, fn, sfx),						\
+	PORT_GP_CFG_1(4, 14, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
+	PORT_GP_CFG_1(4, 15, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
+	PORT_GP_CFG_1(4, 16, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
+	PORT_GP_CFG_1(4, 17, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
+	PORT_GP_CFG_1(4, 18, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
+	PORT_GP_CFG_1(4, 19, fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
+	PORT_GP_1(4, 20, fn, sfx),					\
+	PORT_GP_1(4, 21, fn, sfx),					\
+	PORT_GP_1(4, 22, fn, sfx),					\
+	PORT_GP_1(4, 23, fn, sfx),					\
+	PORT_GP_1(4, 24, fn, sfx),					\
+	PORT_GP_1(4, 25, fn, sfx),					\
 	PORT_GP_32(5, fn, sfx)
 
 enum {
@@ -2321,9 +2333,27 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	{ },
 };
 
+static int r8a77470_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
+				   u32 *pocctrl)
+{
+	unsigned int _bank = pin >> 5;
+	unsigned int _pin = pin & 0x1f;
+	*pocctrl = 0xe60600b0;
+
+	if (_bank == 4 && _pin >= 14 && _pin <= 19)
+		return 1;
+
+	return -EINVAL;
+}
+
+static const struct sh_pfc_soc_operations r8a77470_pinmux_ops = {
+	.pin_to_pocctrl = r8a77470_pin_to_pocctrl,
+};
+
 #ifdef CONFIG_PINCTRL_PFC_R8A77470
 const struct sh_pfc_soc_info r8a77470_pinmux_info = {
 	.name = "r8a77470_pfc",
+	.ops = &r8a77470_pinmux_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
-- 
2.7.4
