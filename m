Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 6/6] pinctrl: sh-pfc: r8a77990: Add EthernetAVB pins, groups and functions
Date: Fri, 11 May 2018 12:22:27 +0900
Message-Id: <1526008947-26667-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1526008947-26667-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526008947-26667-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds group and function of AVB PHY, LINK, MAGIC, MII and PTP
pins for the R8A77990 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 90 +++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 508dc21..6c692fa 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1299,6 +1299,78 @@ enum {
 	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 3, PRESETOUT_N, CFG_FLAGS),
 };
 
+/* - EtherAVB --------------------------------------------------------------- */
+static const unsigned int avb_link_pins[] = {
+	/* AVB_LINK */
+	RCAR_GP_PIN(2, 23),
+};
+
+static const unsigned int avb_link_mux[] = {
+	AVB_LINK_MARK,
+};
+
+static const unsigned int avb_magic_pins[] = {
+	/* AVB_MAGIC */
+	RCAR_GP_PIN(2, 22),
+};
+
+static const unsigned int avb_magic_mux[] = {
+	AVB_MAGIC_MARK,
+};
+
+static const unsigned int avb_phy_int_pins[] = {
+	/* AVB_PHY_INT */
+	RCAR_GP_PIN(2, 21),
+};
+
+static const unsigned int avb_phy_int_mux[] = {
+	AVB_PHY_INT_MARK,
+};
+
+static const unsigned int avb_mii_pins[] = {
+	/*
+	 * AVB_RX_CTL, AVB_RXC, AVB_RD0,
+	 * AVB_RD1, AVB_RD2, AVB_RD3,
+	 * AVB_TXCREFCLK
+	 */
+	RCAR_GP_PIN(2, 14), RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 16),
+	RCAR_GP_PIN(2, 17), RCAR_GP_PIN(2, 18), RCAR_GP_PIN(2, 19),
+	RCAR_GP_PIN(2, 20),
+};
+
+static const unsigned int avb_mii_mux[] = {
+	AVB_RX_CTL_MARK, AVB_RXC_MARK, AVB_RD0_MARK,
+	AVB_RD1_MARK, AVB_RD2_MARK, AVB_RD3_MARK,
+	AVB_TXCREFCLK_MARK,
+};
+
+static const unsigned int avb_avtp_pps_pins[] = {
+	/* AVB_AVTP_PPS */
+	RCAR_GP_PIN(1, 2),
+};
+
+static const unsigned int avb_avtp_pps_mux[] = {
+	AVB_AVTP_PPS_MARK,
+};
+
+static const unsigned int avb_avtp_match_a_pins[] = {
+	/* AVB_AVTP_MATCH_A */
+	RCAR_GP_PIN(2, 24),
+};
+
+static const unsigned int avb_avtp_match_a_mux[] = {
+	AVB_AVTP_MATCH_A_MARK,
+};
+
+static const unsigned int avb_avtp_capture_a_pins[] = {
+	/* AVB_AVTP_CAPTURE_A */
+	RCAR_GP_PIN(2, 25),
+};
+
+static const unsigned int avb_avtp_capture_a_mux[] = {
+	AVB_AVTP_CAPTURE_A_MARK,
+};
+
 /* - I2C -------------------------------------------------------------------- */
 static const unsigned int i2c1_a_pins[] = {
 	/* SCL, SDA */
@@ -1713,6 +1785,13 @@ enum {
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(avb_link),
+	SH_PFC_PIN_GROUP(avb_magic),
+	SH_PFC_PIN_GROUP(avb_phy_int),
+	SH_PFC_PIN_GROUP(avb_mii),
+	SH_PFC_PIN_GROUP(avb_avtp_pps),
+	SH_PFC_PIN_GROUP(avb_avtp_match_a),
+	SH_PFC_PIN_GROUP(avb_avtp_capture_a),
 	SH_PFC_PIN_GROUP(i2c1_a),
 	SH_PFC_PIN_GROUP(i2c1_b),
 	SH_PFC_PIN_GROUP(i2c1_c),
@@ -1760,6 +1839,16 @@ enum {
 	SH_PFC_PIN_GROUP(scif_clk_b),
 };
 
+static const char * const avb_groups[] = {
+	"avb_link",
+	"avb_magic",
+	"avb_phy_int",
+	"avb_mii",
+	"avb_avtp_pps",
+	"avb_avtp_match_a",
+	"avb_avtp_capture_a",
+};
+
 static const char * const i2c1_groups[] = {
 	"i2c1_a",
 	"i2c1_b",
@@ -1845,6 +1934,7 @@ enum {
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(i2c1),
 	SH_PFC_FUNCTION(i2c2),
 	SH_PFC_FUNCTION(i2c4),
-- 
1.9.1
