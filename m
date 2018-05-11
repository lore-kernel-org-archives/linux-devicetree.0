Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 5/6] pinctrl: sh-pfc: r8a77990: Add I2C{1,2,4,5,6,7} pins, groups and functions
Date: Fri, 11 May 2018 12:22:26 +0900
Message-Id: <1526008947-26667-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1526008947-26667-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526008947-26667-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds I2C{1,2,4,5,6,7} pins, groups and functions to
the R8A77990 SoC.

NOTE: I2C0 and I2C3 are not pin multiplexed.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 190 ++++++++++++++++++++++++++++++++++
 1 file changed, 190 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 96779a0..508dc21 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1299,6 +1299,142 @@ enum {
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 3, PRESETOUT_N, CFG_FLAGS),
 };
 
+/* - I2C -------------------------------------------------------------------- */
+static const unsigned int i2c1_a_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(5, 8), RCAR_GP_PIN(5, 9),
+};
+
+static const unsigned int i2c1_a_mux[] = {
+	SCL1_A_MARK, SDA1_A_MARK,
+};
+
+static const unsigned int i2c1_b_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(5, 17), RCAR_GP_PIN(5, 18),
+};
+
+static const unsigned int i2c1_b_mux[] = {
+	SCL1_B_MARK, SDA1_B_MARK,
+};
+
+static const unsigned int i2c1_c_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(3, 0), RCAR_GP_PIN(3, 5),
+};
+
+static const unsigned int i2c1_c_mux[] = {
+	SCL1_C_MARK, SDA1_C_MARK,
+};
+
+static const unsigned int i2c1_d_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(6, 16), RCAR_GP_PIN(6, 15),
+};
+
+static const unsigned int i2c1_d_mux[] = {
+	SCL1_D_MARK, SDA1_D_MARK,
+};
+
+static const unsigned int i2c2_a_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(5, 4), RCAR_GP_PIN(5, 0),
+};
+
+static const unsigned int i2c2_a_mux[] = {
+	SCL2_A_MARK, SDA2_A_MARK,
+};
+
+static const unsigned int i2c2_b_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(3, 12), RCAR_GP_PIN(3, 13),
+};
+
+static const unsigned int i2c2_b_mux[] = {
+	SCL2_B_MARK, SDA2_B_MARK,
+};
+
+static const unsigned int i2c2_c_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 3),
+};
+
+static const unsigned int i2c2_c_mux[] = {
+	SCL2_C_MARK, SDA2_C_MARK,
+};
+
+static const unsigned int i2c2_d_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(6, 11), RCAR_GP_PIN(6, 12),
+};
+
+static const unsigned int i2c2_d_mux[] = {
+	SCL2_D_MARK, SDA2_D_MARK,
+};
+
+static const unsigned int i2c2_e_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(3, 5), RCAR_GP_PIN(3, 0),
+};
+
+static const unsigned int i2c2_e_mux[] = {
+	SCL2_E_MARK, SDA2_E_MARK,
+};
+
+static const unsigned int i2c4_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 17),
+};
+
+static const unsigned int i2c4_mux[] = {
+	SCL4_MARK, SDA4_MARK,
+};
+
+static const unsigned int i2c5_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
+};
+
+static const unsigned int i2c5_mux[] = {
+	SCL5_MARK, SDA5_MARK,
+};
+
+static const unsigned int i2c6_a_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(1, 11), RCAR_GP_PIN(1, 8),
+};
+
+static const unsigned int i2c6_a_mux[] = {
+	SCL6_A_MARK, SDA6_A_MARK,
+};
+
+static const unsigned int i2c6_b_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 1),
+};
+
+static const unsigned int i2c6_b_mux[] = {
+	SCL6_B_MARK, SDA6_B_MARK,
+};
+
+static const unsigned int i2c7_a_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(2, 24), RCAR_GP_PIN(2, 25),
+};
+
+static const unsigned int i2c7_a_mux[] = {
+	SCL7_A_MARK, SDA7_A_MARK,
+};
+
+static const unsigned int i2c7_b_pins[] = {
+	/* SCL, SDA */
+	RCAR_GP_PIN(0, 13), RCAR_GP_PIN(0, 14),
+};
+
+static const unsigned int i2c7_b_mux[] = {
+	SCL7_B_MARK, SDA7_B_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_a_pins[] = {
 	/* RX, TX */
@@ -1577,6 +1713,21 @@ enum {
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(i2c1_a),
+	SH_PFC_PIN_GROUP(i2c1_b),
+	SH_PFC_PIN_GROUP(i2c1_c),
+	SH_PFC_PIN_GROUP(i2c1_d),
+	SH_PFC_PIN_GROUP(i2c2_a),
+	SH_PFC_PIN_GROUP(i2c2_b),
+	SH_PFC_PIN_GROUP(i2c2_c),
+	SH_PFC_PIN_GROUP(i2c2_d),
+	SH_PFC_PIN_GROUP(i2c2_e),
+	SH_PFC_PIN_GROUP(i2c4),
+	SH_PFC_PIN_GROUP(i2c5),
+	SH_PFC_PIN_GROUP(i2c6_a),
+	SH_PFC_PIN_GROUP(i2c6_b),
+	SH_PFC_PIN_GROUP(i2c7_a),
+	SH_PFC_PIN_GROUP(i2c7_b),
 	SH_PFC_PIN_GROUP(scif0_data_a),
 	SH_PFC_PIN_GROUP(scif0_clk_a),
 	SH_PFC_PIN_GROUP(scif0_ctrl_a),
@@ -1609,6 +1760,39 @@ enum {
 	SH_PFC_PIN_GROUP(scif_clk_b),
 };
 
+static const char * const i2c1_groups[] = {
+	"i2c1_a",
+	"i2c1_b",
+	"i2c1_c",
+	"i2c1_d",
+};
+
+static const char * const i2c2_groups[] = {
+	"i2c2_a",
+	"i2c2_b",
+	"i2c2_c",
+	"i2c2_d",
+	"i2c2_e",
+};
+
+static const char * const i2c4_groups[] = {
+	"i2c4",
+};
+
+static const char * const i2c5_groups[] = {
+	"i2c5",
+};
+
+static const char * const i2c6_groups[] = {
+	"i2c6_a",
+	"i2c6_b",
+};
+
+static const char * const i2c7_groups[] = {
+	"i2c7_a",
+	"i2c7_b",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data_a",
 	"scif0_clk_a",
@@ -1661,6 +1845,12 @@ enum {
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(i2c1),
+	SH_PFC_FUNCTION(i2c2),
+	SH_PFC_FUNCTION(i2c4),
+	SH_PFC_FUNCTION(i2c5),
+	SH_PFC_FUNCTION(i2c6),
+	SH_PFC_FUNCTION(i2c7),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif2),
-- 
1.9.1
