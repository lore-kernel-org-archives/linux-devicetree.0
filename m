Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/6] pinctrl: sh-pfc: r8a77990: Add bias pinconf support
Date: Fri, 11 May 2018 12:22:24 +0900
Message-Id: <1526008947-26667-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1526008947-26667-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526008947-26667-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch implements control of pull-up and pull-down. On this SoC there
is no simple mapping of GP pins to bias register bits, so we need a table.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 340 +++++++++++++++++++++++++++++++++-
 1 file changed, 331 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 0af2fef..1fe8aee 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -16,15 +16,17 @@
 #include "core.h"
 #include "sh_pfc.h"
 
-#define CPU_ALL_PORT(fn, sfx)	\
-	PORT_GP_18(0, fn, sfx),	\
-	PORT_GP_23(1, fn, sfx),	\
-	PORT_GP_26(2, fn, sfx),	\
-	PORT_GP_16(3, fn, sfx),	\
-	PORT_GP_11(4, fn, sfx),	\
-	PORT_GP_20(5, fn, sfx),	\
-	PORT_GP_18(6, fn, sfx)
-
+#define CFG_FLAGS (SH_PFC_PIN_CFG_PULL_UP | \
+		   SH_PFC_PIN_CFG_PULL_DOWN)
+
+#define CPU_ALL_PORT(fn, sfx) \
+	PORT_GP_CFG_18(0, fn, sfx, CFG_FLAGS), \
+	PORT_GP_CFG_23(1, fn, sfx, CFG_FLAGS), \
+	PORT_GP_CFG_26(2, fn, sfx, CFG_FLAGS), \
+	PORT_GP_CFG_16(3, fn, sfx, CFG_FLAGS), \
+	PORT_GP_CFG_11(4, fn, sfx, CFG_FLAGS), \
+	PORT_GP_CFG_20(5, fn, sfx, CFG_FLAGS), \
+	PORT_GP_CFG_18(6, fn, sfx, CFG_FLAGS)
 /*
  * F_() : just information
  * FM() : macro for FN_xxx / xxx_MARK
@@ -461,6 +463,17 @@
 MOD_SEL0_2 \
 MOD_SEL0_1_0
 
+/*
+ * These pins are not able to be muxed but have other properties
+ * that can be set, such as pull-up/pull-down enable.
+ */
+#define PINMUX_STATIC \
+	FM(AVB_TX_CTL) FM(AVB_TXC) FM(AVB_TD0) FM(AVB_TD1) FM(AVB_TD2) \
+	FM(AVB_TD3) \
+	FM(PRESETOUT_N) FM(FSCLKST_N) FM(TRST_N) FM(TCK) FM(TMS) FM(TDI) \
+	FM(ASEBRK) \
+	FM(MLB_REF)
+
 enum {
 	PINMUX_RESERVED = 0,
 
@@ -485,6 +498,7 @@ enum {
 	PINMUX_GPSR
 	PINMUX_IPSR
 	PINMUX_MOD_SELS
+	PINMUX_STATIC
 	PINMUX_MARK_END,
 #undef F_
 #undef FM
@@ -493,6 +507,13 @@ enum {
 static const u16 pinmux_data[] = {
 	PINMUX_DATA_GP_ALL(),
 
+	PINMUX_SINGLE(CLKOUT),
+	PINMUX_SINGLE(AVB_PHY_INT),
+	PINMUX_SINGLE(AVB_RD3),
+	PINMUX_SINGLE(AVB_RXC),
+	PINMUX_SINGLE(AVB_RX_CTL),
+	PINMUX_SINGLE(QSPI0_SSL),
+
 	/* IPSR0 */
 	PINMUX_IPSR_GPSR(IP0_3_0,		QSPI0_SPCLK),
 	PINMUX_IPSR_MSEL(IP0_3_0,		HSCK4_A,	SEL_HSCIF4_0),
@@ -1227,10 +1248,55 @@ enum {
 
 	PINMUX_IPSR_GPSR(IP15_31_28,		USB30_OVC),
 	PINMUX_IPSR_MSEL(IP15_31_28,		USB0_OVC_A,	SEL_USB_20_CH0_0),
+
+/*
+ * Static pins can not be muxed between different functions but
+ * still needs a mark entry in the pinmux list. Add each static
+ * pin to the list without an associated function. The sh-pfc
+ * core will do the right thing and skip trying to mux then pin
+ * while still applying configuration to it
+ */
+#define FM(x)   PINMUX_DATA(x##_MARK, 0),
+	PINMUX_STATIC
+#undef FM
 };
 
+/*
+ * R8A77990 has 7 banks with 32 GPIOs in each => 224 GPIOs.
+ * Physical layout rows: A - AE, cols: 1 - 25.
+ */
+#define ROW_GROUP_A(r) ('Z' - 'A' + 1 + (r))
+#define PIN_NUMBER(r, c) (((r) - 'A') * 25 + (c) + 300)
+#define PIN_A_NUMBER(r, c) PIN_NUMBER(ROW_GROUP_A(r), c)
+#define PIN_NONE U16_MAX
+
 static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
+
+	/*
+	 * Pins not associated with a GPIO port.
+	 *
+	 * The pin positions are different between different R8A77990
+	 * packages, all that is needed for the pfc driver is a unique
+	 * number for each pin. To this end use the pin layout from
+	 * R8A77990 to calculate a unique number for each pin.
+	 */
+	SH_PFC_PIN_NAMED_CFG('F',  1, TRST_N,		CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('F',  3, TMS,		CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('F',  4, TCK,		CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('G',  2, TDI,		CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('G',  3, FSCLKST_N,	CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('H',  1, ASEBRK,		CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('N',  1, AVB_TXC,		CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('N',  2, AVB_TD0,		CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('N',  3, AVB_TD1,		CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('N',  5, AVB_TD2,		CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('N',  6, AVB_TD3,		CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('P',  3, AVB_TX_CTL,	CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('P',  4, AVB_MDIO,		CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('P',  5, AVB_MDC,		CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG('T', 21, MLB_REF,		CFG_FLAGS),
+	SH_PFC_PIN_NAMED_CFG(ROW_GROUP_A('D'), 3, PRESETOUT_N, CFG_FLAGS),
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
@@ -1708,8 +1774,263 @@ enum {
 	{ },
 };
 
+static const struct pinmux_bias_reg pinmux_bias_regs[] = {
+	{ PINMUX_BIAS_REG("PUEN0", 0xe6060400, "PUD0", 0xe6060440) {
+		 [0] = RCAR_GP_PIN(2, 23),	/* RD# */
+		 [1] = RCAR_GP_PIN(2, 22),	/* BS# */
+		 [2] = RCAR_GP_PIN(2, 21),	/* AVB_PHY_INT */
+		 [3] = PIN_NUMBER('P', 5),	/* AVB_MDC */
+		 [4] = PIN_NUMBER('P', 4),	/* AVB_MDIO */
+		 [5] = RCAR_GP_PIN(2, 20),	/* AVB_TXCREFCLK */
+		 [6] = PIN_NUMBER('N', 6),	/* AVB_TD3 */
+		 [7] = PIN_NUMBER('N', 5),	/* AVB_TD2 */
+		 [8] = PIN_NUMBER('N', 3),	/* AVB_TD1 */
+		 [9] = PIN_NUMBER('N', 2),	/* AVB_TD0 */
+		[10] = PIN_NUMBER('N', 1),	/* AVB_TXC */
+		[11] = PIN_NUMBER('P', 3),	/* AVB_TX_CTL */
+		[12] = RCAR_GP_PIN(2, 19),	/* AVB_RD3 */
+		[13] = RCAR_GP_PIN(2, 18),	/* AVB_RD2 */
+		[14] = RCAR_GP_PIN(2, 17),	/* AVB_RD1 */
+		[15] = RCAR_GP_PIN(2, 16),	/* AVB_RD0 */
+		[16] = RCAR_GP_PIN(2, 15),	/* AVB_RXC */
+		[17] = RCAR_GP_PIN(2, 14),	/* AVB_RX_CTL */
+		[18] = RCAR_GP_PIN(2, 13),	/* RPC_RESET# */
+		[19] = RCAR_GP_PIN(2, 12),	/* RPC_INT# */
+		[20] = RCAR_GP_PIN(2, 11),	/* QSPI1_SSL */
+		[21] = RCAR_GP_PIN(2, 10),	/* QSPI1_IO3 */
+		[22] = RCAR_GP_PIN(2,  9),	/* QSPI1_IO2 */
+		[23] = RCAR_GP_PIN(2,  8),	/* QSPI1_MISO/IO1 */
+		[24] = RCAR_GP_PIN(2,  7),	/* QSPI1_MOSI/IO0 */
+		[25] = RCAR_GP_PIN(2,  6),	/* QSPI1_SPCLK */
+		[26] = RCAR_GP_PIN(2,  5),	/* QSPI0_SSL */
+		[27] = RCAR_GP_PIN(2,  4),	/* QSPI0_IO3 */
+		[28] = RCAR_GP_PIN(2,  3),	/* QSPI0_IO2 */
+		[29] = RCAR_GP_PIN(2,  2),	/* QSPI0_MISO/IO1 */
+		[30] = RCAR_GP_PIN(2,  1),	/* QSPI0_MOSI/IO0 */
+		[31] = RCAR_GP_PIN(2,  0),	/* QSPI0_SPCLK */
+	} },
+	{ PINMUX_BIAS_REG("PUEN1", 0xe6060404, "PUD1", 0xe6060444) {
+		 [0] = RCAR_GP_PIN(0,  4),	/* D4 */
+		 [1] = RCAR_GP_PIN(0,  3),	/* D3 */
+		 [2] = RCAR_GP_PIN(0,  2),	/* D2 */
+		 [3] = RCAR_GP_PIN(0,  1),	/* D1 */
+		 [4] = RCAR_GP_PIN(0,  0),	/* D0 */
+		 [5] = RCAR_GP_PIN(1, 22),	/* WE0# */
+		 [6] = RCAR_GP_PIN(1, 21),	/* CS0# */
+		 [7] = RCAR_GP_PIN(1, 20),	/* CLKOUT */
+		 [8] = RCAR_GP_PIN(1, 19),	/* A19 */
+		 [9] = RCAR_GP_PIN(1, 18),	/* A18 */
+		[10] = RCAR_GP_PIN(1, 17),	/* A17 */
+		[11] = RCAR_GP_PIN(1, 16),	/* A16 */
+		[12] = RCAR_GP_PIN(1, 15),	/* A15 */
+		[13] = RCAR_GP_PIN(1, 14),	/* A14 */
+		[14] = RCAR_GP_PIN(1, 13),	/* A13 */
+		[15] = RCAR_GP_PIN(1, 12),	/* A12 */
+		[16] = RCAR_GP_PIN(1, 11),	/* A11 */
+		[17] = RCAR_GP_PIN(1, 10),	/* A10 */
+		[18] = RCAR_GP_PIN(1,  9),	/* A9 */
+		[19] = RCAR_GP_PIN(1,  8),	/* A8 */
+		[20] = RCAR_GP_PIN(1,  7),	/* A7 */
+		[21] = RCAR_GP_PIN(1,  6),	/* A6 */
+		[22] = RCAR_GP_PIN(1,  5),	/* A5 */
+		[23] = RCAR_GP_PIN(1,  4),	/* A4 */
+		[24] = RCAR_GP_PIN(1,  3),	/* A3 */
+		[25] = RCAR_GP_PIN(1,  2),	/* A2 */
+		[26] = RCAR_GP_PIN(1,  1),	/* A1 */
+		[27] = RCAR_GP_PIN(1,  0),	/* A0 */
+		[28] = PIN_NONE,
+		[29] = PIN_NONE,
+		[30] = RCAR_GP_PIN(2, 25),	/* PUEN_EX_WAIT0 */
+		[31] = RCAR_GP_PIN(2, 24),	/* PUEN_RD/WR# */
+	} },
+	{ PINMUX_BIAS_REG("PUEN2", 0xe6060408, "PUD2", 0xe6060448) {
+		 [0] = RCAR_GP_PIN(3,  1),	/* SD0_CMD */
+		 [1] = RCAR_GP_PIN(3,  0),	/* SD0_CLK */
+		 [2] = PIN_NUMBER('H', 1),	/* ASEBRK */
+		 [3] = PIN_NONE,
+		 [4] = PIN_NUMBER('G', 2),	/* TDI */
+		 [5] = PIN_NUMBER('F', 3),	/* TMS */
+		 [6] = PIN_NUMBER('F', 4),	/* TCK */
+		 [7] = PIN_NUMBER('F', 1),	/* TRST# */
+		 [8] = PIN_NONE,
+		 [9] = PIN_NONE,
+		[10] = PIN_NONE,
+		[11] = PIN_NONE,
+		[12] = PIN_NONE,
+		[13] = PIN_NONE,
+		[14] = PIN_NONE,
+		[15] = PIN_NUMBER('G', 3),	/* FSCLKST# */
+		[16] = RCAR_GP_PIN(0, 17),	/* SDA4 */
+		[17] = RCAR_GP_PIN(0, 16),	/* SCL4 */
+		[18] = PIN_NONE,
+		[19] = PIN_NONE,
+		[20] = PIN_A_NUMBER('D', 3),	/* PRESETOUT# */
+		[21] = RCAR_GP_PIN(0, 15),	/* D15 */
+		[22] = RCAR_GP_PIN(0, 14),	/* D14 */
+		[23] = RCAR_GP_PIN(0, 13),	/* D13 */
+		[24] = RCAR_GP_PIN(0, 12),	/* D12 */
+		[25] = RCAR_GP_PIN(0, 11),	/* D11 */
+		[26] = RCAR_GP_PIN(0, 10),	/* D10 */
+		[27] = RCAR_GP_PIN(0,  9),	/* D9 */
+		[28] = RCAR_GP_PIN(0,  8),	/* D8 */
+		[29] = RCAR_GP_PIN(0,  7),	/* D7 */
+		[30] = RCAR_GP_PIN(0,  6),	/* D6 */
+		[31] = RCAR_GP_PIN(0,  5),	/* D5 */
+	} },
+	{ PINMUX_BIAS_REG("PUEN3", 0xe606040c, "PUD3", 0xe606044c) {
+		 [0] = RCAR_GP_PIN(5,  0),	/* SCK0_A */
+		 [1] = RCAR_GP_PIN(5,  4),	/* RTS0#/TANS_A */
+		 [2] = RCAR_GP_PIN(5,  3),	/* CTS0#_A */
+		 [3] = RCAR_GP_PIN(5,  2),	/* TX0_A */
+		 [4] = RCAR_GP_PIN(5,  1),	/* RX0_A */
+		 [5] = PIN_NONE,
+		 [6] = PIN_NONE,
+		 [7] = RCAR_GP_PIN(3, 15),	/* SD1_WP */
+		 [8] = RCAR_GP_PIN(3, 14),	/* SD1_CD */
+		 [9] = RCAR_GP_PIN(3, 13),	/* SD0_WP */
+		[10] = RCAR_GP_PIN(3, 12),	/* SD0_CD */
+		[11] = RCAR_GP_PIN(4, 10),	/* SD3_DS */
+		[12] = RCAR_GP_PIN(4,  9),	/* SD3_DAT7 */
+		[13] = RCAR_GP_PIN(4,  8),	/* SD3_DAT6 */
+		[14] = RCAR_GP_PIN(4,  7),	/* SD3_DAT5 */
+		[15] = RCAR_GP_PIN(4,  6),	/* SD3_DAT4 */
+		[16] = RCAR_GP_PIN(4,  5),	/* SD3_DAT3 */
+		[17] = RCAR_GP_PIN(4,  4),	/* SD3_DAT2 */
+		[18] = RCAR_GP_PIN(4,  3),	/* SD3_DAT1 */
+		[19] = RCAR_GP_PIN(4,  2),	/* SD3_DAT0 */
+		[20] = RCAR_GP_PIN(4,  1),	/* SD3_CMD */
+		[21] = RCAR_GP_PIN(4,  0),	/* SD3_CLK */
+		[22] = RCAR_GP_PIN(3, 11),	/* SD1_DAT3 */
+		[23] = RCAR_GP_PIN(3, 10),	/* SD1_DAT2 */
+		[24] = RCAR_GP_PIN(3,  9),	/* SD1_DAT1 */
+		[25] = RCAR_GP_PIN(3,  8),	/* SD1_DAT0 */
+		[26] = RCAR_GP_PIN(3,  7),	/* SD1_CMD */
+		[27] = RCAR_GP_PIN(3,  6),	/* SD1_CLK */
+		[28] = RCAR_GP_PIN(3,  5),	/* SD0_DAT3 */
+		[29] = RCAR_GP_PIN(3,  4),	/* SD0_DAT2 */
+		[30] = RCAR_GP_PIN(3,  3),	/* SD0_DAT1 */
+		[31] = RCAR_GP_PIN(3,  2),	/* SD0_DAT0 */
+	} },
+	{ PINMUX_BIAS_REG("PUEN4", 0xe6060410, "PUD4", 0xe6060450) {
+		 [0] = RCAR_GP_PIN(6,  8),	/* AUDIO_CLKA */
+		 [1] = RCAR_GP_PIN(6, 16),	/* SSI_SDATA6 */
+		 [2] = RCAR_GP_PIN(6, 15),	/* SSI_WS6 */
+		 [3] = RCAR_GP_PIN(6, 14),	/* SSI_SCK6 */
+		 [4] = RCAR_GP_PIN(6, 13),	/* SSI_SDATA5 */
+		 [5] = RCAR_GP_PIN(6, 12),	/* SSI_WS5 */
+		 [6] = RCAR_GP_PIN(6, 11),	/* SSI_SCK5 */
+		 [7] = RCAR_GP_PIN(6, 10),	/* SSI_SDATA4 */
+		 [8] = RCAR_GP_PIN(6,  7),	/* SSI_SDATA3 */
+		 [9] = RCAR_GP_PIN(6,  6),	/* SSI_WS349 */
+		[10] = RCAR_GP_PIN(6,  5),	/* SSI_SCK349 */
+		[11] = RCAR_GP_PIN(6,  4),	/* SSI_SDATA2 */
+		[12] = RCAR_GP_PIN(6,  3),	/* SSI_SDATA1 */
+		[13] = RCAR_GP_PIN(6,  2),	/* SSI_SDATA0 */
+		[14] = RCAR_GP_PIN(6,  1),	/* SSI_WS01239 */
+		[15] = RCAR_GP_PIN(6,  0),	/* SSI_SCK01239 */
+		[16] = PIN_NUMBER('T', 21),	/* MLB_REF */
+		[17] = RCAR_GP_PIN(5, 19),	/* MLB_DAT */
+		[18] = RCAR_GP_PIN(5, 18),	/* MLB_SIG */
+		[19] = RCAR_GP_PIN(5, 17),	/* MLB_CLK */
+		[20] = RCAR_GP_PIN(5, 16),	/* SSI_SDATA9 */
+		[21] = RCAR_GP_PIN(5, 15),	/* MSIOF0_SS2 */
+		[22] = RCAR_GP_PIN(5, 14),	/* MSIOF0_SS1 */
+		[23] = RCAR_GP_PIN(5, 13),	/* MSIOF0_SYNC */
+		[24] = RCAR_GP_PIN(5, 12),	/* MSIOF0_TXD */
+		[25] = RCAR_GP_PIN(5, 11),	/* MSIOF0_RXD */
+		[26] = RCAR_GP_PIN(5, 10),	/* MSIOF0_SCK */
+		[27] = RCAR_GP_PIN(5,  9),	/* RX2_A */
+		[28] = RCAR_GP_PIN(5,  8),	/* TX2_A */
+		[29] = RCAR_GP_PIN(5,  7),	/* SCK2_A */
+		[30] = RCAR_GP_PIN(5,  6),	/* TX1 */
+		[31] = RCAR_GP_PIN(5,  5),	/* RX1 */
+	} },
+	{ PINMUX_BIAS_REG("PUEN5", 0xe6060414, "PUD5", 0xe6060454) {
+		 [0] = PIN_NONE,
+		 [1] = PIN_NONE,
+		 [2] = PIN_NONE,
+		 [3] = PIN_NONE,
+		 [4] = PIN_NONE,
+		 [5] = PIN_NONE,
+		 [6] = PIN_NONE,
+		 [7] = PIN_NONE,
+		 [8] = PIN_NONE,
+		 [9] = PIN_NONE,
+		[10] = PIN_NONE,
+		[11] = PIN_NONE,
+		[12] = PIN_NONE,
+		[13] = PIN_NONE,
+		[14] = PIN_NONE,
+		[15] = PIN_NONE,
+		[16] = PIN_NONE,
+		[17] = PIN_NONE,
+		[18] = PIN_NONE,
+		[19] = PIN_NONE,
+		[20] = PIN_NONE,
+		[21] = PIN_NONE,
+		[22] = PIN_NONE,
+		[23] = PIN_NONE,
+		[24] = PIN_NONE,
+		[25] = PIN_NONE,
+		[26] = PIN_NONE,
+		[27] = PIN_NONE,
+		[28] = PIN_NONE,
+		[29] = PIN_NONE,
+		[30] = RCAR_GP_PIN(6,  9),	/* PUEN_USB30_OVC */
+		[31] = RCAR_GP_PIN(6, 17),	/* PUEN_USB30_PWEN */
+	} },
+	{ /* sentinel */ },
+};
+
+static unsigned int r8a77990_pinmux_get_bias(struct sh_pfc *pfc,
+					     unsigned int pin)
+{
+	const struct pinmux_bias_reg *reg;
+	unsigned int bit;
+
+	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
+	if (!reg)
+		return PIN_CONFIG_BIAS_DISABLE;
+
+	if (!(sh_pfc_read(pfc, reg->puen) & BIT(bit)))
+		return PIN_CONFIG_BIAS_DISABLE;
+	else if (sh_pfc_read(pfc, reg->pud) & BIT(bit))
+		return PIN_CONFIG_BIAS_PULL_UP;
+	else
+		return PIN_CONFIG_BIAS_PULL_DOWN;
+}
+
+static void r8a77990_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
+				     unsigned int bias)
+{
+	const struct pinmux_bias_reg *reg;
+	u32 enable, updown;
+	unsigned int bit;
+
+	reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
+	if (!reg)
+		return;
+
+	enable = sh_pfc_read(pfc, reg->puen) & ~BIT(bit);
+	if (bias != PIN_CONFIG_BIAS_DISABLE)
+		enable |= BIT(bit);
+
+	updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
+	if (bias == PIN_CONFIG_BIAS_PULL_UP)
+		updown |= BIT(bit);
+
+	sh_pfc_write(pfc, reg->pud, updown);
+	sh_pfc_write(pfc, reg->puen, enable);
+}
+
+static const struct sh_pfc_soc_operations r8a77990_pinmux_ops = {
+	.get_bias = r8a77990_pinmux_get_bias,
+	.set_bias = r8a77990_pinmux_set_bias,
+};
+
 const struct sh_pfc_soc_info r8a77990_pinmux_info = {
 	.name = "r8a77990_pfc",
+	.ops = &r8a77990_pinmux_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
@@ -1722,6 +2043,7 @@ enum {
 	.nr_functions = ARRAY_SIZE(pinmux_functions),
 
 	.cfg_regs = pinmux_config_regs,
+	.bias_regs = pinmux_bias_regs,
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
-- 
1.9.1
