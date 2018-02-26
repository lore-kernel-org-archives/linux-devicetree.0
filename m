Return-Path: <SRS0=Ej0v=FU=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: add R8A77980 PFC support
References: <e32c511f-89cd-254b-8a53-face984abe75@cogentembedded.com>
 <00a01c1b-560a-2ea5-0724-53b8a140ec34@cogentembedded.com>
 <CAMuHMdV=McUALycmAgdEwxp0sMP1FerrM6n4nGoYdrtJthrK1w@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <df503f34-f333-0312-f5c7-15339ce4984c@cogentembedded.com>
Date: Mon, 26 Feb 2018 19:53:39 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV=McUALycmAgdEwxp0sMP1FerrM6n4nGoYdrtJthrK1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-ID: <devicetree@vger.kernel.org>

Hello!

On 02/26/2018 03:42 PM, Geert Uytterhoeven wrote:

>> Add the PFC support for the R8A77980 SoC including pin groups for some
>> on-chip devices such as AVB, CAN-FD, GETHER, [H]SCIF, I2C, INTC-EX, MMC,
>> MSIOF, PWM, and VIN...
>>
>> Based on the original (and large) patch by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Thanks for your patch!
> 
> To avoid scaring off potential reviewers, it may be better to not include that
> many pin groups and functions in future initial submissions.
> This also helps if issues are detected during review in some of them (like
> below), delaying queuing of basic functionality and other correct parts.
> 
> I only looked at CPU_ALL_PORT(), pins, groups, and functions.
> Comments below.
> 
>> --- /dev/null
>> +++ renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
> 
>> +/* - AVB -------------------------------------------------------------------- */
>> +static const unsigned int avb_link_pins[] = {
>> +       /* AVB_LINK */
>> +       RCAR_GP_PIN(1, 18),
>> +};
>> +static const unsigned int avb_link_mux[] = {
>> +       AVB_LINK_MARK,
>> +};
>> +static const unsigned int avb_magic_pins[] = {
>> +       /* AVB_MAGIC */
>> +       RCAR_GP_PIN(1, 16),
>> +};
>> +static const unsigned int avb_magic_mux[] = {
>> +       AVB_MAGIC_MARK,
>> +};
>> +static const unsigned int avb_phy_int_pins[] = {
>> +       /* AVB_PHY_INT */
>> +       RCAR_GP_PIN(1, 17),
>> +};
>> +static const unsigned int avb_phy_int_mux[] = {
>> +       AVB_PHY_INT_MARK,
>> +};
>> +static const unsigned int avb_mdio_pins[] = {
>> +       /* AVB_MDC, AVB_MDIO */
>> +       RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14),
>> +};
>> +static const unsigned int avb_mdio_mux[] = {
>> +       AVB_MDC_MARK, AVB_MDIO_MARK,
>> +};
> 
> The grouping is different from other R-Car Gen3 SoCs.

   Not true AFAICS -- only the group naming is different.

>> +/* - CANFD0 ----------------------------------------------------------------- */
>> +static const unsigned int canfd0_data_a_pins[] = {
>> +       /* CANFD0_TX, CANFD0_RX */
>> +       RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
>> +};
>> +static const unsigned int canfd0_data_a_mux[] = {
>> +       CANFD0_TX_A_MARK, CANFD0_RX_A_MARK,
>> +};
>> +static const unsigned int canfd_clk_a_pins[] = {
>> +       /* CANFD_CLK */
>> +       RCAR_GP_PIN(1, 25),
>> +};
>> +static const unsigned int canfd_clk_a_mux[] = {
>> +       CANFD_CLK_A_MARK,
>> +};
>> +static const unsigned int canfd0_data_b_pins[] = {
>> +       /* CANFD0_TX, CANFD0_RX */
>> +       RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
>> +};
>> +static const unsigned int canfd0_data_b_mux[] = {
>> +       CANFD0_TX_B_MARK, CANFD0_RX_B_MARK,
>> +};
>> +static const unsigned int canfd_clk_b_pins[] = {
>> +       /* CANFD_CLK */
>> +       RCAR_GP_PIN(3, 8),
>> +};
>> +static const unsigned int canfd_clk_b_mux[] = {
>> +       CANFD_CLK_B_MARK,
>> +};
> 
> Please move the canfd_clk pins to their own section.

   Are you aware the CANFD_CLK is controlled by MOD_SEL0.SEL_CANFD0? If it's allowed
to have the pins controlled by a single MOD_SEL field in the diff groups, I'll place
CANFD_CLK into a separate group...

> Note that they are called can_clk in the pin function sheet, but the
> PFC section uses both can_clk and canfd_clk.
> Given V3H (like V3M) has no plain CAN, only CANFD, using canfd_clk
> sounds right to me, though.
> 
>> +/* - DU --------------------------------------------------------------------- */
>> +static const unsigned int du_rgb666_pins[] = {
>> +       /* DU_R[7:2], DU_G[7:2], DU_B[7:2] */
>> +       RCAR_GP_PIN(0, 5), RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 3),
>> +       RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 1), RCAR_GP_PIN(0, 0),
>> +       RCAR_GP_PIN(0, 11), RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 9),
>> +       RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 7), RCAR_GP_PIN(0, 6),
>> +       RCAR_GP_PIN(0, 17), RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 15),
>> +       RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 13), RCAR_GP_PIN(0, 12),
>> +};
>> +static const unsigned int du_rgb666_mux[] = {
>> +       DU_DR7_MARK, DU_DR6_MARK, DU_DR5_MARK,
>> +       DU_DR4_MARK, DU_DR3_MARK, DU_DR2_MARK,
>> +       DU_DG7_MARK, DU_DG6_MARK, DU_DG5_MARK,
>> +       DU_DG4_MARK, DU_DG3_MARK, DU_DG2_MARK,
>> +       DU_DB7_MARK, DU_DB6_MARK, DU_DB5_MARK,
>> +       DU_DB4_MARK, DU_DB3_MARK, DU_DB2_MARK,
>> +};
> 
> du_rgb888 is missing (see GP2_19..GP2_24).

   OK, seeing...

>> +/* - HSCIF0 ----------------------------------------------------------------- */
> 
>> +static const unsigned int scif_clk_a_pins[] = {
>> +       /* SCIF_CLK */
>> +       RCAR_GP_PIN(0, 10),
>> +};
>> +static const unsigned int scif_clk_a_mux[] = {
>> +       SCIF_CLK_A_MARK,
>> +};
> 
> 
> [...]
> 
>> +static const unsigned int scif_clk_b_pins[] = {
>> +       /* SCIF_CLK */
>> +       RCAR_GP_PIN(1, 25),
>> +};
>> +static const unsigned int scif_clk_b_mux[] = {
>> +       SCIF_CLK_B_MARK,
>> +};
> 
> Please move the scif_clk pins to their own section, as they are shared by
> HSCIF and SCIF.

   Again, the same bit in MOD_SEL0...

>> +/* - VIN0 ------------------------------------------------------------------- */
> 
>> +static const unsigned int vin0_sync_pins[] = {
>> +       /* VI0_VSYNC#, VI0_HSYNC# */
>> +       RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 2),
>> +};
>> +static const unsigned int vin0_sync_mux[] = {
>> +       VI0_HSYNC_N_MARK, VI0_VSYNC_N_MARK,
> 
> Reversed order compared to the pins above.

   Right.

>> +/* - VIN1 ------------------------------------------------------------------- */
> 
>> +static const unsigned int vin1_sync_pins[] = {
>> +       /* VI1_VSYNC#, VI1_HSYNC# */
>> +        RCAR_GP_PIN(3, 3), RCAR_GP_PIN(3, 2),
>> +};
>> +static const unsigned int vin1_sync_mux[] = {
>> +       VI1_HSYNC_N_MARK, VI1_VSYNC_N_MARK,
> 
> Reversed order compared to the pins above.

   Right.

[...]
>> +       VIN_DATA_PIN_GROUP(vin0_data, 8),
>> +       VIN_DATA_PIN_GROUP(vin0_data, 10),
>> +       VIN_DATA_PIN_GROUP(vin0_data, 12),
>> +       VIN_DATA_PIN_GROUP(vin0_data, 16),
>> +       VIN_DATA_PIN_GROUP(vin0_data, 20),
>> +       VIN_DATA_PIN_GROUP(vin0_data, 24),
> 
> Missing case for vin0_data_18 (RGB-666)

   We probably need the vin pin union extended...

[...]

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
