From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] pinctrl: sh-pfc: r8a77995: Add USB2.0 host support
Date: Thu, 14 Sep 2017 19:29:21 +0900
Message-ID: <1505384961-1445-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v1:
  - Rebase this patch on renesas-drivers' 2017-09-05 tag +
    https://patchwork.kernel.org/patch/9952291/ patch.

 drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index 0e803e9..dbe6b1c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
@@ -1295,6 +1295,15 @@ enum {
 	SCIF_CLK_MARK,
 };
 
+/* - USB0 ------------------------------------------------------------------- */
+static const unsigned int usb0_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+};
+static const unsigned int usb0_mux[] = {
+	USB0_PWEN_MARK, USB0_OVC_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb0_link),
 	SH_PFC_PIN_GROUP(avb0_magic),
@@ -1342,6 +1351,7 @@ enum {
 	SH_PFC_PIN_GROUP(scif5_data_b),
 	SH_PFC_PIN_GROUP(scif5_clk_b),
 	SH_PFC_PIN_GROUP(scif_clk),
+	SH_PFC_PIN_GROUP(usb0),
 };
 
 static const char * const avb0_groups[] = {
@@ -1428,6 +1438,10 @@ enum {
 	"scif_clk",
 };
 
+static const char * const usb0_groups[] = {
+	"usb0",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb0),
 	SH_PFC_FUNCTION(i2c0),
@@ -1442,6 +1456,7 @@ enum {
 	SH_PFC_FUNCTION(scif4),
 	SH_PFC_FUNCTION(scif5),
 	SH_PFC_FUNCTION(scif_clk),
+	SH_PFC_FUNCTION(usb0),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
1.9.1
