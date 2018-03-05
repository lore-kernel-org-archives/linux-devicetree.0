Return-Path: <SRS0=N9IQ=F3=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: add R8A77980 PFC support
References: <e32c511f-89cd-254b-8a53-face984abe75@cogentembedded.com>
 <00a01c1b-560a-2ea5-0724-53b8a140ec34@cogentembedded.com>
 <CAMuHMdV=McUALycmAgdEwxp0sMP1FerrM6n4nGoYdrtJthrK1w@mail.gmail.com>
 <df503f34-f333-0312-f5c7-15339ce4984c@cogentembedded.com>
 <CAMuHMdXUrm3cHjMEcG8uz+bFVP2KL2dLPL=x9_URwhCaF5T=Wg@mail.gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <009f603f-5027-23d5-3dee-c04cde0ef862@cogentembedded.com>
Date: Mon, 5 Mar 2018 22:12:13 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXUrm3cHjMEcG8uz+bFVP2KL2dLPL=x9_URwhCaF5T=Wg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-ID: <devicetree@vger.kernel.org>

On 03/02/2018 09:47 PM, Geert Uytterhoeven wrote:

>>>> Add the PFC support for the R8A77980 SoC including pin groups for some
>>>> on-chip devices such as AVB, CAN-FD, GETHER, [H]SCIF, I2C, INTC-EX, MMC,
>>>> MSIOF, PWM, and VIN...
>>>>
>>>> Based on the original (and large) patch by Vladimir Barinov.
>>>>
>>>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>
>>> Thanks for your patch!
>>>
>>> To avoid scaring off potential reviewers, it may be better to not include that
>>> many pin groups and functions in future initial submissions.
>>> This also helps if issues are detected during review in some of them (like
>>> below), delaying queuing of basic functionality and other correct parts.
>>>
>>> I only looked at CPU_ALL_PORT(), pins, groups, and functions.
>>> Comments below.
>>>
>>>> --- /dev/null
>>>> +++ renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
>>>
>>>> +/* - AVB -------------------------------------------------------------------- */
>>>> +static const unsigned int avb_link_pins[] = {
>>>> +       /* AVB_LINK */
>>>> +       RCAR_GP_PIN(1, 18),
>>>> +};
>>>> +static const unsigned int avb_link_mux[] = {
>>>> +       AVB_LINK_MARK,
>>>> +};
>>>> +static const unsigned int avb_magic_pins[] = {
>>>> +       /* AVB_MAGIC */
>>>> +       RCAR_GP_PIN(1, 16),
>>>> +};
>>>> +static const unsigned int avb_magic_mux[] = {
>>>> +       AVB_MAGIC_MARK,
>>>> +};
>>>> +static const unsigned int avb_phy_int_pins[] = {
>>>> +       /* AVB_PHY_INT */
>>>> +       RCAR_GP_PIN(1, 17),
>>>> +};
>>>> +static const unsigned int avb_phy_int_mux[] = {
>>>> +       AVB_PHY_INT_MARK,
>>>> +};
>>>> +static const unsigned int avb_mdio_pins[] = {
>>>> +       /* AVB_MDC, AVB_MDIO */
>>>> +       RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14),
>>>> +};
>>>> +static const unsigned int avb_mdio_mux[] = {
>>>> +       AVB_MDC_MARK, AVB_MDIO_MARK,
>>>> +};
>>>
>>> The grouping is different from other R-Car Gen3 SoCs.
>>
>>    Not true AFAICS -- only the group naming is different.
> 
> Oh, so we can have both groups names, and be compatible?

   Probably. Just not sure if there's any worth to have the same groups for the not
pin compatible SoCs. Care to elaborate?

>>>> +/* - CANFD0 ----------------------------------------------------------------- */
>>>> +static const unsigned int canfd0_data_a_pins[] = {
>>>> +       /* CANFD0_TX, CANFD0_RX */
>>>> +       RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
>>>> +};
>>>> +static const unsigned int canfd0_data_a_mux[] = {
>>>> +       CANFD0_TX_A_MARK, CANFD0_RX_A_MARK,
>>>> +};
>>>> +static const unsigned int canfd_clk_a_pins[] = {
>>>> +       /* CANFD_CLK */
>>>> +       RCAR_GP_PIN(1, 25),
>>>> +};
>>>> +static const unsigned int canfd_clk_a_mux[] = {
>>>> +       CANFD_CLK_A_MARK,
>>>> +};
>>>> +static const unsigned int canfd0_data_b_pins[] = {
>>>> +       /* CANFD0_TX, CANFD0_RX */
>>>> +       RCAR_GP_PIN(3, 6), RCAR_GP_PIN(3, 7),
>>>> +};
>>>> +static const unsigned int canfd0_data_b_mux[] = {
>>>> +       CANFD0_TX_B_MARK, CANFD0_RX_B_MARK,
>>>> +};
>>>> +static const unsigned int canfd_clk_b_pins[] = {
>>>> +       /* CANFD_CLK */
>>>> +       RCAR_GP_PIN(3, 8),
>>>> +};
>>>> +static const unsigned int canfd_clk_b_mux[] = {
>>>> +       CANFD_CLK_B_MARK,
>>>> +};
>>>
>>> Please move the canfd_clk pins to their own section.
>>
>>    Are you aware the CANFD_CLK is controlled by MOD_SEL0.SEL_CANFD0? If it's allowed
>> to have the pins controlled by a single MOD_SEL field in the diff groups, I'll place
>> CANFD_CLK into a separate group...
> 
> SEL_CANFD0 switches between the A and B groups for CANFD0_TX, CANFD0_RX,
> and CANFD0_CLK together.

   CANFD_CLK. :-)

> So all three pins must use either group A, or group B. That's something the
> user must do correctly anyway.
> 
> However, the CANFD_CLK pin is shared between the CANFD0 and CANFD1
> modules.  So a user who uses CANFD1, and not CANFD0, still has to configure
> pinmuxing for CANFD_CLK.

>>>> +/* - HSCIF0 ----------------------------------------------------------------- */
>>>
>>>> +static const unsigned int scif_clk_a_pins[] = {
>>>> +       /* SCIF_CLK */
>>>> +       RCAR_GP_PIN(0, 10),
>>>> +};
>>>> +static const unsigned int scif_clk_a_mux[] = {
>>>> +       SCIF_CLK_A_MARK,
>>>> +};
>>>
>>>
>>> [...]
>>>
>>>> +static const unsigned int scif_clk_b_pins[] = {
>>>> +       /* SCIF_CLK */
>>>> +       RCAR_GP_PIN(1, 25),
>>>> +};
>>>> +static const unsigned int scif_clk_b_mux[] = {
>>>> +       SCIF_CLK_B_MARK,
>>>> +};
>>>
>>> Please move the scif_clk pins to their own section, as they are shared by
>>> HSCIF and SCIF.
>>
>>    Again, the same bit in MOD_SEL0...
> 
> Same story: SCIF_CLK is shared by the HSCIFx and SCIFx modules.
> Still puts the responsability in the hands of the board designer: he must

  Responsibility. :-)

> know not to select SCIF_CLK_A and HSCIF0_B, or SCIF_CLK_B and HSCIF0_A.
> 
> On this SoC, the limitations seem to be worse than on other members of
> the same family.
> 
> However, on other SoCs you have similar limitations. E.g. on H3/M3-W/M3-N
> you cannot select scif5_data_a and scif5_clk_b, as they are both controlled
> through sel_scif5,

> although the driver has them in separate groups.
> But that is done to allow using only RX/TX functionality, and using the
> CTS/RTS pins for something else (a completely different function, or GPIO).

   That's OK as they both are the part of the same function. My case is different,
sorry for not making this clear...
  

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
