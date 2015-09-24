From: Adrian Alonso <aalonso@freescale.com>
Subject: [PATCH v5 4/7] pinctrl: freescale: imx: allow mux_reg offset zero
Date: Thu, 24 Sep 2015 15:54:00 -0500
Message-ID: <1443128043-21063-4-git-send-email-aalonso@freescale.com>
References: <1443128043-21063-1-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1443128043-21063-1-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, shawnguo@kernel.org, linus.walleij@linaro.org, lznuaa@gmail.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, Anson.Huang@freescale.com, Frank.Li@freescale.com, yibin.gong@freescale.com, nitin.garg@freescale.com
List-Id: devicetree@vger.kernel.org

Allow mux_reg offset zero to be a valid pin_id, on imx7d
mux_conf reg offset is zero for iomuxc-lspr controller

Signed-off-by: Adrian Alonso <aalonso@freescale.com>
---
Changes for V2: Resend
Changes for V3: Resend
Changes for V4: Simplify pin_id assigment when ZERO_OFFSET_VALID is set
Changes for V5:
- Drop patch pinctrl: freescale: imx: add ZERO_OFFSET_VALID flag
- Allow mux_reg ZERO OFFSET as pin_id

 drivers/pinctrl/freescale/pinctrl-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index b9c6deb..23348d8 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -550,7 +550,7 @@ static int imx_pinctrl_parse_groups(struct device_node *np,
 				conf_reg = -1;
 		}
 
-		pin_id = mux_reg ? mux_reg / 4 : conf_reg / 4;
+		pin_id = (mux_reg != -1) ? mux_reg / 4 : conf_reg / 4;
 		pin_reg = &info->pin_regs[pin_id];
 		pin->pin = pin_id;
 		grp->pin_ids[i] = pin_id;
-- 
2.1.4

