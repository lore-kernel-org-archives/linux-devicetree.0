Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 4/6] pinctrl: sh-pfc: r8a77990: Add SCIF pins, groups and functions
Date: Fri, 11 May 2018 12:22:25 +0900
Message-Id: <1526008947-26667-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1526008947-26667-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526008947-26667-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds SCIF{0,1,2,3,4,5} pins, groups and functions to R8A77990
SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 365 ++++++++++++++++++++++++++++++++++
 1 file changed, 365 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 1fe8aee..96779a0 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1299,10 +1299,375 @@ enum {
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 3, PRESETOUT_N, CFG_FLAGS),
 };
 
+/* - SCIF0 ------------------------------------------------------------------ */
+static const unsigned int scif0_data_a_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(5, 1), RCAR_GP_PIN(5, 2),
+};
+
+static const unsigned int scif0_data_a_mux[] = {
+	RX0_A_MARK, TX0_A_MARK,
+};
+
+static const unsigned int scif0_clk_a_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(5, 0),
+};
+
+static const unsigned int scif0_clk_a_mux[] = {
+	SCK0_A_MARK,
+};
+
+static const unsigned int scif0_ctrl_a_pins[] = {
+	/* RTS, CTS */
+	RCAR_GP_PIN(5, 4), RCAR_GP_PIN(5, 3),
+};
+
+static const unsigned int scif0_ctrl_a_mux[] = {
+	RTS0_N_TANS_A_MARK, CTS0_N_A_MARK,
+};
+
+static const unsigned int scif0_data_b_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(5, 17), RCAR_GP_PIN(5, 19),
+};
+
+static const unsigned int scif0_data_b_mux[] = {
+	RX0_B_MARK, TX0_B_MARK,
+};
+
+static const unsigned int scif0_clk_b_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(5, 18),
+};
+
+static const unsigned int scif0_clk_b_mux[] = {
+	SCK0_B_MARK,
+};
+
+/* - SCIF1 ------------------------------------------------------------------ */
+static const unsigned int scif1_data_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(5, 5), RCAR_GP_PIN(5, 6),
+};
+
+static const unsigned int scif1_data_mux[] = {
+	RX1_MARK, TX1_MARK,
+};
+
+static const unsigned int scif1_clk_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(5, 16),
+};
+
+static const unsigned int scif1_clk_mux[] = {
+	SCK1_MARK,
+};
+
+static const unsigned int scif1_ctrl_pins[] = {
+	/* RTS, CTS */
+	RCAR_GP_PIN(5, 0), RCAR_GP_PIN(5, 7),
+};
+
+static const unsigned int scif1_ctrl_mux[] = {
+	RTS1_N_TANS_MARK, CTS1_N_MARK,
+};
+
+/* - SCIF2 ------------------------------------------------------------------ */
+static const unsigned int scif2_data_a_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(5, 9), RCAR_GP_PIN(5, 8),
+};
+
+static const unsigned int scif2_data_a_mux[] = {
+	RX2_A_MARK, TX2_A_MARK,
+};
+
+static const unsigned int scif2_clk_a_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(5, 7),
+};
+
+static const unsigned int scif2_clk_a_mux[] = {
+	SCK2_A_MARK,
+};
+
+static const unsigned int scif2_data_b_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(5, 12), RCAR_GP_PIN(5, 11),
+};
+
+static const unsigned int scif2_data_b_mux[] = {
+	RX2_B_MARK, TX2_B_MARK,
+};
+
+/* - SCIF3 ------------------------------------------------------------------ */
+static const unsigned int scif3_data_a_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(0, 5), RCAR_GP_PIN(0, 6),
+};
+
+static const unsigned int scif3_data_a_mux[] = {
+	RX3_A_MARK, TX3_A_MARK,
+};
+
+static const unsigned int scif3_clk_a_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(0, 1),
+};
+
+static const unsigned int scif3_clk_a_mux[] = {
+	SCK3_A_MARK,
+};
+
+static const unsigned int scif3_ctrl_a_pins[] = {
+	/* RTS, CTS */
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 7),
+};
+
+static const unsigned int scif3_ctrl_a_mux[] = {
+	RTS3_N_TANS_A_MARK, CTS3_N_A_MARK,
+};
+
+static const unsigned int scif3_data_b_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 11),
+};
+
+static const unsigned int scif3_data_b_mux[] = {
+	RX3_B_MARK, TX3_B_MARK,
+};
+
+static const unsigned int scif3_data_c_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(2, 23), RCAR_GP_PIN(2, 22),
+};
+
+static const unsigned int scif3_data_c_mux[] = {
+	RX3_C_MARK, TX3_C_MARK,
+};
+
+static const unsigned int scif3_clk_c_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(2, 24),
+};
+
+static const unsigned int scif3_clk_c_mux[] = {
+	SCK3_C_MARK,
+};
+
+/* - SCIF4 ------------------------------------------------------------------ */
+static const unsigned int scif4_data_a_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+};
+
+static const unsigned int scif4_data_a_mux[] = {
+	RX4_A_MARK, TX4_A_MARK,
+};
+
+static const unsigned int scif4_clk_a_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(1, 5),
+};
+
+static const unsigned int scif4_clk_a_mux[] = {
+	SCK4_A_MARK,
+};
+
+static const unsigned int scif4_ctrl_a_pins[] = {
+	/* RTS, CTS */
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 3),
+};
+
+static const unsigned int scif4_ctrl_a_mux[] = {
+	RTS4_N_TANS_A_MARK, CTS4_N_A_MARK,
+};
+
+static const unsigned int scif4_data_b_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(0, 13), RCAR_GP_PIN(0, 12),
+};
+
+static const unsigned int scif4_data_b_mux[] = {
+	RX4_B_MARK, TX4_B_MARK,
+};
+
+static const unsigned int scif4_clk_b_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(0, 8),
+};
+
+static const unsigned int scif4_clk_b_mux[] = {
+	SCK4_B_MARK,
+};
+
+static const unsigned int scif4_data_c_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+};
+
+static const unsigned int scif4_data_c_mux[] = {
+	RX4_C_MARK, TX4_C_MARK,
+};
+
+static const unsigned int scif4_ctrl_c_pins[] = {
+	/* RTS, CTS */
+	RCAR_GP_PIN(0, 1), RCAR_GP_PIN(0, 0),
+};
+
+static const unsigned int scif4_ctrl_c_mux[] = {
+	RTS4_N_TANS_C_MARK, CTS4_N_C_MARK,
+};
+
+/* - SCIF5 ------------------------------------------------------------------ */
+static const unsigned int scif5_data_a_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 9),
+};
+
+static const unsigned int scif5_data_a_mux[] = {
+	RX5_A_MARK, TX5_A_MARK,
+};
+
+static const unsigned int scif5_clk_a_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(1, 13),
+};
+
+static const unsigned int scif5_clk_a_mux[] = {
+	SCK5_A_MARK,
+};
+
+static const unsigned int scif5_data_b_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(2, 25), RCAR_GP_PIN(2, 24),
+};
+
+static const unsigned int scif5_data_b_mux[] = {
+	RX5_B_MARK, TX5_B_MARK,
+};
+
+static const unsigned int scif5_data_c_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+};
+
+static const unsigned int scif5_data_c_mux[] = {
+	RX5_C_MARK, TX5_C_MARK,
+};
+
+/* - SCIF Clock ------------------------------------------------------------- */
+static const unsigned int scif_clk_a_pins[] = {
+	/* SCIF_CLK */
+	RCAR_GP_PIN(5, 3),
+};
+
+static const unsigned int scif_clk_a_mux[] = {
+	SCIF_CLK_A_MARK,
+};
+
+static const unsigned int scif_clk_b_pins[] = {
+	/* SCIF_CLK */
+	RCAR_GP_PIN(5, 7),
+};
+
+static const unsigned int scif_clk_b_mux[] = {
+	SCIF_CLK_B_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(scif0_data_a),
+	SH_PFC_PIN_GROUP(scif0_clk_a),
+	SH_PFC_PIN_GROUP(scif0_ctrl_a),
+	SH_PFC_PIN_GROUP(scif0_data_b),
+	SH_PFC_PIN_GROUP(scif0_clk_b),
+	SH_PFC_PIN_GROUP(scif1_data),
+	SH_PFC_PIN_GROUP(scif1_clk),
+	SH_PFC_PIN_GROUP(scif1_ctrl),
+	SH_PFC_PIN_GROUP(scif2_data_a),
+	SH_PFC_PIN_GROUP(scif2_clk_a),
+	SH_PFC_PIN_GROUP(scif2_data_b),
+	SH_PFC_PIN_GROUP(scif3_data_a),
+	SH_PFC_PIN_GROUP(scif3_clk_a),
+	SH_PFC_PIN_GROUP(scif3_ctrl_a),
+	SH_PFC_PIN_GROUP(scif3_data_b),
+	SH_PFC_PIN_GROUP(scif3_data_c),
+	SH_PFC_PIN_GROUP(scif3_clk_c),
+	SH_PFC_PIN_GROUP(scif4_data_a),
+	SH_PFC_PIN_GROUP(scif4_clk_a),
+	SH_PFC_PIN_GROUP(scif4_ctrl_a),
+	SH_PFC_PIN_GROUP(scif4_data_b),
+	SH_PFC_PIN_GROUP(scif4_clk_b),
+	SH_PFC_PIN_GROUP(scif4_data_c),
+	SH_PFC_PIN_GROUP(scif4_ctrl_c),
+	SH_PFC_PIN_GROUP(scif5_data_a),
+	SH_PFC_PIN_GROUP(scif5_clk_a),
+	SH_PFC_PIN_GROUP(scif5_data_b),
+	SH_PFC_PIN_GROUP(scif5_data_c),
+	SH_PFC_PIN_GROUP(scif_clk_a),
+	SH_PFC_PIN_GROUP(scif_clk_b),
+};
+
+static const char * const scif0_groups[] = {
+	"scif0_data_a",
+	"scif0_clk_a",
+	"scif0_ctrl_a",
+	"scif0_data_b",
+	"scif0_clk_b",
+};
+
+static const char * const scif1_groups[] = {
+	"scif1_data",
+	"scif1_clk",
+	"scif1_ctrl",
+};
+
+static const char * const scif2_groups[] = {
+	"scif2_data_a",
+	"scif2_clk_a",
+	"scif2_data_b",
+};
+
+static const char * const scif3_groups[] = {
+	"scif3_data_a",
+	"scif3_clk_a",
+	"scif3_ctrl_a",
+	"scif3_data_b",
+	"scif3_data_c",
+	"scif3_clk_c",
+};
+
+static const char * const scif4_groups[] = {
+	"scif4_data_a",
+	"scif4_clk_a",
+	"scif4_ctrl_a",
+	"scif4_data_b",
+	"scif4_clk_b",
+	"scif4_data_c",
+	"scif4_ctrl_c",
+};
+
+static const char * const scif5_groups[] = {
+	"scif5_data_a",
+	"scif5_clk_a",
+	"scif5_data_b",
+	"scif5_data_c",
+};
+
+static const char * const scif_clk_groups[] = {
+	"scif_clk_a",
+	"scif_clk_b",
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(scif0),
+	SH_PFC_FUNCTION(scif1),
+	SH_PFC_FUNCTION(scif2),
+	SH_PFC_FUNCTION(scif3),
+	SH_PFC_FUNCTION(scif4),
+	SH_PFC_FUNCTION(scif5),
+	SH_PFC_FUNCTION(scif_clk),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
1.9.1
