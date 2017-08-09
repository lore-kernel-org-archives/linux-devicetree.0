From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 7/8] pinctrl: sh-pfc: r8a77995: Add MMC pins, groups and functions
Date: Wed,  9 Aug 2017 21:19:46 +0900
Message-ID: <1502281187-24068-8-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 50 +++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index 5c0a94f..f8f71b6 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
@@ -1118,6 +1118,44 @@ enum {
 	SCL3_B_MARK, SDA3_B_MARK,
 };
 
+/* - MMC ------------------------------------------------------------------- */
+static const unsigned int mmc_data1_pins[] = {
+	/* D0 */
+	RCAR_GP_PIN(3, 2),
+};
+static const unsigned int mmc_data1_mux[] = {
+	MMC_D0_MARK,
+};
+static const unsigned int mmc_data4_pins[] = {
+	/* D[0:3] */
+	RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3),
+	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
+};
+static const unsigned int mmc_data4_mux[] = {
+	MMC_D0_MARK, MMC_D1_MARK,
+	MMC_D2_MARK, MMC_D3_MARK,
+};
+static const unsigned int mmc_data8_pins[] = {
+	/* D[0:7] */
+	RCAR_GP_PIN(3, 2), RCAR_GP_PIN(3, 3),
+	RCAR_GP_PIN(3, 4), RCAR_GP_PIN(3, 5),
+	RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
+	RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
+};
+static const unsigned int mmc_data8_mux[] = {
+	MMC_D0_MARK, MMC_D1_MARK,
+	MMC_D2_MARK, MMC_D3_MARK,
+	MMC_D4_MARK, MMC_D5_MARK,
+	MMC_D6_MARK, MMC_D7_MARK,
+};
+static const unsigned int mmc_ctrl_pins[] = {
+	/* CLK, CMD */
+	RCAR_GP_PIN(3, 1), RCAR_GP_PIN(3, 0),
+};
+static const unsigned int mmc_ctrl_mux[] = {
+	MMC_CLK_MARK, MMC_CMD_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_a_pins[] = {
 	/* RX, TX */
@@ -1336,6 +1374,10 @@ enum {
 	SH_PFC_PIN_GROUP(i2c2_b),
 	SH_PFC_PIN_GROUP(i2c3_a),
 	SH_PFC_PIN_GROUP(i2c3_b),
+	SH_PFC_PIN_GROUP(mmc_data1),
+	SH_PFC_PIN_GROUP(mmc_data4),
+	SH_PFC_PIN_GROUP(mmc_data8),
+	SH_PFC_PIN_GROUP(mmc_ctrl),
 	SH_PFC_PIN_GROUP(scif0_data_a),
 	SH_PFC_PIN_GROUP(scif0_clk_a),
 	SH_PFC_PIN_GROUP(scif0_data_b),
@@ -1402,6 +1444,13 @@ enum {
 	"i2c3_b",
 };
 
+static const char * const mmc_groups[] = {
+	"mmc_data1",
+	"mmc_data4",
+	"mmc_data8",
+	"mmc_ctrl",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data_a",
 	"scif0_clk_a",
@@ -1458,6 +1507,7 @@ enum {
 	SH_PFC_FUNCTION(i2c1),
 	SH_PFC_FUNCTION(i2c2),
 	SH_PFC_FUNCTION(i2c3),
+	SH_PFC_FUNCTION(mmc),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif2),
-- 
1.9.1
