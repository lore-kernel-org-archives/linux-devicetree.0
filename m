From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 01/10] pinctrl: sh-pfc: r8a7795: Add USB2.0 host support
Date: Tue, 2 Feb 2016 19:18:49 +0900
Message-ID: <1454408338-4612-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1454408338-4612-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1454408338-4612-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds USB[0-2] (USB2.0 host) pinmux support to r8a7795 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 43 ++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index ce4f5cd..19819ca 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -3090,6 +3090,31 @@ static const unsigned int ssi9_ctrl_b_mux[] = {
 	SSI_SCK9_B_MARK, SSI_WS9_B_MARK,
 };
 
+/* - USB0 ------------------------------------------------------------------- */
+static const unsigned int usb0_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(6, 24), RCAR_GP_PIN(6, 25),
+};
+static const unsigned int usb0_mux[] = {
+	USB0_PWEN_MARK, USB0_OVC_MARK,
+};
+/* - USB1 ------------------------------------------------------------------- */
+static const unsigned int usb1_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(6, 26), RCAR_GP_PIN(6, 27),
+};
+static const unsigned int usb1_mux[] = {
+	USB1_PWEN_MARK, USB1_OVC_MARK,
+};
+/* - USB2 ------------------------------------------------------------------- */
+static const unsigned int usb2_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(6, 14), RCAR_GP_PIN(6, 15),
+};
+static const unsigned int usb2_mux[] = {
+	USB2_PWEN_MARK, USB2_OVC_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(audio_clk_a_a),
 	SH_PFC_PIN_GROUP(audio_clk_a_b),
@@ -3322,6 +3347,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(ssi9_data_b),
 	SH_PFC_PIN_GROUP(ssi9_ctrl_a),
 	SH_PFC_PIN_GROUP(ssi9_ctrl_b),
+	SH_PFC_PIN_GROUP(usb0),
+	SH_PFC_PIN_GROUP(usb1),
+	SH_PFC_PIN_GROUP(usb2),
 };
 
 static const char * const audio_clk_groups[] = {
@@ -3636,6 +3664,18 @@ static const char * const ssi_groups[] = {
 	"ssi9_ctrl_b",
 };
 
+static const char * const usb0_groups[] = {
+	"usb0",
+};
+
+static const char * const usb1_groups[] = {
+	"usb1",
+};
+
+static const char * const usb2_groups[] = {
+	"usb2",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(audio_clk),
 	SH_PFC_FUNCTION(avb),
@@ -3664,6 +3704,9 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(sdhi2),
 	SH_PFC_FUNCTION(sdhi3),
 	SH_PFC_FUNCTION(ssi),
+	SH_PFC_FUNCTION(usb0),
+	SH_PFC_FUNCTION(usb1),
+	SH_PFC_FUNCTION(usb2),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
1.9.1
