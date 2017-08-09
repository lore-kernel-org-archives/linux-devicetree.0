From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 8/8] pinctrl: sh-pfc: r8a77995: Add voltage switch operations for MMC
Date: Wed,  9 Aug 2017 21:19:47 +0900
Message-ID: <1502281187-24068-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1502281187-24068-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1502281187-24068-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index f8f71b6..f806560 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
@@ -23,7 +23,7 @@
 		PORT_GP_9(0,  fn, sfx),		\
 		PORT_GP_32(1, fn, sfx),		\
 		PORT_GP_32(2, fn, sfx),		\
-		PORT_GP_10(3,  fn, sfx),	\
+		PORT_GP_CFG_10(3,  fn, sfx, SH_PFC_PIN_CFG_IO_VOLTAGE),	\
 		PORT_GP_32(4, fn, sfx),		\
 		PORT_GP_21(5, fn, sfx),		\
 		PORT_GP_14(6, fn, sfx)
@@ -1968,8 +1968,25 @@ enum {
 	{ },
 };
 
+static int r8a77995_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
+{
+	int bit = -EINVAL;
+
+	*pocctrl = 0xe6060380;
+
+	if (pin >= RCAR_GP_PIN(3, 0) && pin <= RCAR_GP_PIN(3, 9))
+		bit = 29 - (pin - RCAR_GP_PIN(3, 0));
+
+	return bit;
+}
+
+static const struct sh_pfc_soc_operations r8a77995_pinmux_ops = {
+	.pin_to_pocctrl = r8a77995_pin_to_pocctrl,
+};
+
 const struct sh_pfc_soc_info r8a77995_pinmux_info = {
 	.name = "r8a77995_pfc",
+	.ops = &r8a77995_pinmux_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
-- 
1.9.1
