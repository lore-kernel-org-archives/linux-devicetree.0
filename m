Return-Path: <SRS0=m7Ph=FU=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <00a01c1b-560a-2ea5-0724-53b8a140ec34@cogentembedded.com>
References: <e32c511f-89cd-254b-8a53-face984abe75@cogentembedded.com> <00a01c1b-560a-2ea5-0724-53b8a140ec34@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2018 13:42:42 +0100
Message-ID: <CAMuHMdV=McUALycmAgdEwxp0sMP1FerrM6n4nGoYdrtJthrK1w@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: add R8A77980 PFC support
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-ID: <devicetree@vger.kernel.org>

Hi Sergei,

On Sun, Feb 25, 2018 at 7:14 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the PFC support for the R8A77980 SoC including pin groups for some
> on-chip devices such as AVB, CAN-FD, GETHER, [H]SCIF, I2C, INTC-EX, MMC,
> MSIOF, PWM, and VIN...
>
> Based on the original (and large) patch by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

To avoid scaring off potential reviewers, it may be better to not include that
many pin groups and functions in future initial submissions.
This also helps if issues are detected during review in some of them (like
below), delaying queuing of basic functionality and other correct parts.

I only looked at CPU_ALL_PORT(), pins, groups, and functions.
Comments below.

> --- /dev/null
> +++ renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77980.c

> +/* - AVB -------------------------------------------------------------------- */
> +static const unsigned int avb_link_pins[] = {
> +       /* AVB_LINK */
> +       RCAR_GP_PIN(1, 18),
> +};
> +static const unsigned int avb_link_mux[] = {
> +       AVB_LINK_MARK,
> +};
> +static const unsigned int avb_magic_pins[] = {
> +       /* AVB_MAGIC */
> +       RCAR_GP_PIN(1, 16),
> +};
> +static const unsigned int avb_magic_mux[] = {
> +       AVB_MAGIC_MARK,
> +};
> +static const unsigned int avb_phy_int_pins[] = {
> +       /* AVB_PHY_INT */
> +       RCAR_GP_PIN(1, 17),
> +};
> +static const unsigned int avb_phy_int_mux[] = {
> +       AVB_PHY_INT_MARK,
> +};
> +static const unsigned int avb_mdio_pins[] = {
> +       /* AVB_MDC, AVB_MDIO */
> +       RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14),
> +};
> +static const unsigned int avb_mdio_mux[] = {
> +       AVB_MDC_MARK, AVB_MDIO_MARK,
> +};

The grouping is different from other R-Car Gen3 SoCs.

> +/* - CANFD0 ----------------------------------------------------------------- */
> +static const unsigned int canfd0_data_a_pins[] = {
> +       /* CANFD0_TX, CANFD0_RX */
> +       RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
> +};
> +static const unsigned int canfd0_data_a_mux[] = {
> +       CANFD0_TX_A_MARK, CANFD0_RX_A_MARK,
> +};
> +static const unsigned int canfd_clk_a_pins[] = {
> +       /* CANFD_CLK */
> +       RCAR_GP_PIN(1, 25),
> +};
> +static const unsigned int canfd_clk_a_mux[] = {
> +       CANFD_CLK_A_MARK,
> +};
> +static const unsigned int canfd0_data_b_pins[] = {
> +       /* CANFD0_TX, CANFD0_RX */
> +       RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
> +};
> +static const unsigned int canfd0_data_b_mux[] = {
> +       CANFD0_TX_B_MARK, CANFD0_RX_B_MARK,
> +};
> +static const unsigned int canfd_clk_b_pins[] = {
> +       /* CANFD_CLK */
> +       RCAR_GP_PIN(3, 8),
> +};
> +static const unsigned int canfd_clk_b_mux[] = {
> +       CANFD_CLK_B_MARK,
> +};

Please move the canfd_clk pins to their own section.

Note that they are called can_clk in the pin function sheet, but the
PFC section uses both can_clk and canfd_clk.
Given V3H (like V3M) has no plain CAN, only CANFD, using canfd_clk
sounds right to me, though.

> +/* - DU --------------------------------------------------------------------- */
> +static const unsigned int du_rgb666_pins[] = {
> +       /* DU_R[7:2], DU_G[7:2], DU_B[7:2] */
> +       RCAR_GP_PIN(0, 5), RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 3),
> +       RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 1), RCAR_GP_PIN(0, 0),
> +       RCAR_GP_PIN(0, 11), RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 9),
> +       RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 7), RCAR_GP_PIN(0, 6),
> +       RCAR_GP_PIN(0, 17), RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 15),
> +       RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 13), RCAR_GP_PIN(0, 12),
> +};
> +static const unsigned int du_rgb666_mux[] = {
> +       DU_DR7_MARK, DU_DR6_MARK, DU_DR5_MARK,
> +       DU_DR4_MARK, DU_DR3_MARK, DU_DR2_MARK,
> +       DU_DG7_MARK, DU_DG6_MARK, DU_DG5_MARK,
> +       DU_DG4_MARK, DU_DG3_MARK, DU_DG2_MARK,
> +       DU_DB7_MARK, DU_DB6_MARK, DU_DB5_MARK,
> +       DU_DB4_MARK, DU_DB3_MARK, DU_DB2_MARK,
> +};

du_rgb888 is missing (see GP2_19..GP2_24).

> +/* - HSCIF0 ----------------------------------------------------------------- */

> +static const unsigned int scif_clk_a_pins[] = {
> +       /* SCIF_CLK */
> +       RCAR_GP_PIN(0, 10),
> +};
> +static const unsigned int scif_clk_a_mux[] = {
> +       SCIF_CLK_A_MARK,
> +};


[...]

> +static const unsigned int scif_clk_b_pins[] = {
> +       /* SCIF_CLK */
> +       RCAR_GP_PIN(1, 25),
> +};
> +static const unsigned int scif_clk_b_mux[] = {
> +       SCIF_CLK_B_MARK,
> +};

Please move the scif_clk pins to their own section, as they are shared by
HSCIF and SCIF.

> +/* - VIN0 ------------------------------------------------------------------- */

> +static const unsigned int vin0_sync_pins[] = {
> +       /* VI0_VSYNC#, VI0_HSYNC# */
> +       RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 2),
> +};
> +static const unsigned int vin0_sync_mux[] = {
> +       VI0_HSYNC_N_MARK, VI0_VSYNC_N_MARK,

Reversed order compared to the pins above.

> +/* - VIN1 ------------------------------------------------------------------- */

> +static const unsigned int vin1_sync_pins[] = {
> +       /* VI1_VSYNC#, VI1_HSYNC# */
> +        RCAR_GP_PIN(3, 3), RCAR_GP_PIN(3, 2),
> +};
> +static const unsigned int vin1_sync_mux[] = {
> +       VI1_HSYNC_N_MARK, VI1_VSYNC_N_MARK,

Reversed order compared to the pins above.

> +static const struct sh_pfc_pin_group pinmux_groups[] = {
> +       SH_PFC_PIN_GROUP(avb_link),
> +       SH_PFC_PIN_GROUP(avb_magic),
> +       SH_PFC_PIN_GROUP(avb_phy_int),
> +       SH_PFC_PIN_GROUP(avb_mdio),
> +       SH_PFC_PIN_GROUP(avb_rgmii),
> +       SH_PFC_PIN_GROUP(avb_txcrefclk),
> +       SH_PFC_PIN_GROUP(avb_avtp_pps),
> +       SH_PFC_PIN_GROUP(avb_avtp_capture),
> +       SH_PFC_PIN_GROUP(avb_avtp_match),
> +       SH_PFC_PIN_GROUP(canfd0_data_a),
> +       SH_PFC_PIN_GROUP(canfd_clk_a),
> +       SH_PFC_PIN_GROUP(canfd0_data_b),
> +       SH_PFC_PIN_GROUP(canfd_clk_b),
> +       SH_PFC_PIN_GROUP(canfd1_data),

Please split off canfd_clk.

> +       SH_PFC_PIN_GROUP(du_rgb666),
> +       SH_PFC_PIN_GROUP(du_clk_out),
> +       SH_PFC_PIN_GROUP(du_sync),
> +       SH_PFC_PIN_GROUP(du_oddf),
> +       SH_PFC_PIN_GROUP(du_cde),
> +       SH_PFC_PIN_GROUP(du_disp),
> +       SH_PFC_PIN_GROUP(gether_link_a),
> +       SH_PFC_PIN_GROUP(gether_phy_int_a),
> +       SH_PFC_PIN_GROUP(gether_mdio_a),
> +       SH_PFC_PIN_GROUP(gether_link_b),
> +       SH_PFC_PIN_GROUP(gether_phy_int_b),
> +       SH_PFC_PIN_GROUP(gether_mdio_b),
> +       SH_PFC_PIN_GROUP(gether_magic),
> +       SH_PFC_PIN_GROUP(gether_rgmii),
> +       SH_PFC_PIN_GROUP(gether_txcrefclk),
> +       SH_PFC_PIN_GROUP(gether_txcrefclk_mega),
> +       SH_PFC_PIN_GROUP(gether_rmii),
> +       SH_PFC_PIN_GROUP(hscif0_data_a),
> +       SH_PFC_PIN_GROUP(hscif0_clk_a),
> +       SH_PFC_PIN_GROUP(hscif0_ctrl_a),
> +       SH_PFC_PIN_GROUP(scif_clk_a),
> +       SH_PFC_PIN_GROUP(hscif0_data_b),
> +       SH_PFC_PIN_GROUP(hscif0_clk_b),
> +       SH_PFC_PIN_GROUP(hscif0_ctrl_b),
> +       SH_PFC_PIN_GROUP(scif_clk_b),

Please move scif_clk down.

> +       SH_PFC_PIN_GROUP(hscif1_data),
> +       SH_PFC_PIN_GROUP(hscif1_clk),
> +       SH_PFC_PIN_GROUP(hscif1_ctrl),
> +       SH_PFC_PIN_GROUP(hscif2_data),
> +       SH_PFC_PIN_GROUP(hscif2_clk),
> +       SH_PFC_PIN_GROUP(hscif2_ctrl),
> +       SH_PFC_PIN_GROUP(hscif3_data),
> +       SH_PFC_PIN_GROUP(hscif3_clk),
> +       SH_PFC_PIN_GROUP(hscif3_ctrl),
> +       SH_PFC_PIN_GROUP(i2c0),
> +       SH_PFC_PIN_GROUP(i2c1),
> +       SH_PFC_PIN_GROUP(i2c2),
> +       SH_PFC_PIN_GROUP(i2c3),
> +       SH_PFC_PIN_GROUP(i2c4),
> +       SH_PFC_PIN_GROUP(i2c5),
> +       SH_PFC_PIN_GROUP(intc_ex_irq0),
> +       SH_PFC_PIN_GROUP(intc_ex_irq1),
> +       SH_PFC_PIN_GROUP(intc_ex_irq2),
> +       SH_PFC_PIN_GROUP(intc_ex_irq3),
> +       SH_PFC_PIN_GROUP(intc_ex_irq4),
> +       SH_PFC_PIN_GROUP(intc_ex_irq5),
> +       SH_PFC_PIN_GROUP(mmc_data1),
> +       SH_PFC_PIN_GROUP(mmc_data4),
> +       SH_PFC_PIN_GROUP(mmc_data8),
> +       SH_PFC_PIN_GROUP(mmc_ctrl),
> +       SH_PFC_PIN_GROUP(mmc_cd),
> +       SH_PFC_PIN_GROUP(mmc_wp),
> +       SH_PFC_PIN_GROUP(mmc_ds),
> +       SH_PFC_PIN_GROUP(msiof0_clk),
> +       SH_PFC_PIN_GROUP(msiof0_sync),
> +       SH_PFC_PIN_GROUP(msiof0_ss1),
> +       SH_PFC_PIN_GROUP(msiof0_ss2),
> +       SH_PFC_PIN_GROUP(msiof0_txd),
> +       SH_PFC_PIN_GROUP(msiof0_rxd),
> +       SH_PFC_PIN_GROUP(msiof1_clk),
> +       SH_PFC_PIN_GROUP(msiof1_sync),
> +       SH_PFC_PIN_GROUP(msiof1_ss1),
> +       SH_PFC_PIN_GROUP(msiof1_ss2),
> +       SH_PFC_PIN_GROUP(msiof1_txd),
> +       SH_PFC_PIN_GROUP(msiof1_rxd),
> +       SH_PFC_PIN_GROUP(msiof2_clk),
> +       SH_PFC_PIN_GROUP(msiof2_sync),
> +       SH_PFC_PIN_GROUP(msiof2_ss1),
> +       SH_PFC_PIN_GROUP(msiof2_ss2),
> +       SH_PFC_PIN_GROUP(msiof2_txd),
> +       SH_PFC_PIN_GROUP(msiof2_rxd),
> +       SH_PFC_PIN_GROUP(msiof3_clk),
> +       SH_PFC_PIN_GROUP(msiof3_sync),
> +       SH_PFC_PIN_GROUP(msiof3_ss1),
> +       SH_PFC_PIN_GROUP(msiof3_ss2),
> +       SH_PFC_PIN_GROUP(msiof3_txd),
> +       SH_PFC_PIN_GROUP(msiof3_rxd),
> +       SH_PFC_PIN_GROUP(pwm0_a),
> +       SH_PFC_PIN_GROUP(pwm0_b),
> +       SH_PFC_PIN_GROUP(pwm1_a),
> +       SH_PFC_PIN_GROUP(pwm1_b),
> +       SH_PFC_PIN_GROUP(pwm2_a),
> +       SH_PFC_PIN_GROUP(pwm2_b),
> +       SH_PFC_PIN_GROUP(pwm3_a),
> +       SH_PFC_PIN_GROUP(pwm3_b),
> +       SH_PFC_PIN_GROUP(pwm4_a),
> +       SH_PFC_PIN_GROUP(pwm4_b),
> +       SH_PFC_PIN_GROUP(scif0_data),
> +       SH_PFC_PIN_GROUP(scif0_clk),
> +       SH_PFC_PIN_GROUP(scif0_ctrl),
> +       SH_PFC_PIN_GROUP(scif1_data_a),
> +       SH_PFC_PIN_GROUP(scif1_clk),
> +       SH_PFC_PIN_GROUP(scif1_ctrl),
> +       SH_PFC_PIN_GROUP(scif1_data_b),
> +       SH_PFC_PIN_GROUP(scif3_data),
> +       SH_PFC_PIN_GROUP(scif3_clk),
> +       SH_PFC_PIN_GROUP(scif3_ctrl),
> +       SH_PFC_PIN_GROUP(scif4_data),
> +       SH_PFC_PIN_GROUP(scif4_clk),
> +       SH_PFC_PIN_GROUP(scif4_ctrl),
> +       SH_PFC_PIN_GROUP(tmu_tclk1_a),
> +       SH_PFC_PIN_GROUP(tmu_tclk1_b),
> +       SH_PFC_PIN_GROUP(tmu_tclk2_a),
> +       SH_PFC_PIN_GROUP(tmu_tclk2_b),
> +       SH_PFC_PIN_GROUP(tpu_to0),
> +       SH_PFC_PIN_GROUP(tpu_to1),
> +       SH_PFC_PIN_GROUP(tpu_to2),
> +       SH_PFC_PIN_GROUP(tpu_to3),
> +       VIN_DATA_PIN_GROUP(vin0_data, 8),
> +       VIN_DATA_PIN_GROUP(vin0_data, 10),
> +       VIN_DATA_PIN_GROUP(vin0_data, 12),
> +       VIN_DATA_PIN_GROUP(vin0_data, 16),
> +       VIN_DATA_PIN_GROUP(vin0_data, 20),
> +       VIN_DATA_PIN_GROUP(vin0_data, 24),

Missing case for vin0_data_18 (RGB-666)

> +       SH_PFC_PIN_GROUP(vin0_sync),
> +       SH_PFC_PIN_GROUP(vin0_field),
> +       SH_PFC_PIN_GROUP(vin0_clkenb),
> +       SH_PFC_PIN_GROUP(vin0_clk),
> +       SH_PFC_PIN_GROUP(vin1_data8),
> +       SH_PFC_PIN_GROUP(vin1_data10),
> +       SH_PFC_PIN_GROUP(vin1_data12),
> +       SH_PFC_PIN_GROUP(vin1_sync),
> +       SH_PFC_PIN_GROUP(vin1_field),
> +       SH_PFC_PIN_GROUP(vin1_clkenb),
> +       SH_PFC_PIN_GROUP(vin1_clk),
> +};

> +static const char * const canfd0_groups[] = {
> +       "canfd0_data_a",
> +       "canfd_clk_a",
> +       "canfd0_data_b",
> +       "canfd_clk_b",

canfd_clk needs its own groups, and its own function.

> +static const char * const hscif0_groups[] = {
> +       "hscif0_data_a",
> +       "hscif0_clk_a",
> +       "hscif0_ctrl_a",
> +       "scif_clk_a",
> +       "hscif0_data_b",
> +       "hscif0_clk_b",
> +       "hscif0_ctrl_b",
> +       "scif_clk_b",

scif_clk needs its own groups, and its own function.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
