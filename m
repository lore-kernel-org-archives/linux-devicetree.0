Return-Path: <SRS0=iQoF=F4=cogentembedded.com=sergei.shtylyov@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: add R8A77980 PFC support
References: <e32c511f-89cd-254b-8a53-face984abe75@cogentembedded.com>
 <00a01c1b-560a-2ea5-0724-53b8a140ec34@cogentembedded.com>
 <CAMuHMdV=McUALycmAgdEwxp0sMP1FerrM6n4nGoYdrtJthrK1w@mail.gmail.com>
 <df503f34-f333-0312-f5c7-15339ce4984c@cogentembedded.com>
 <CAMuHMdXUrm3cHjMEcG8uz+bFVP2KL2dLPL=x9_URwhCaF5T=Wg@mail.gmail.com>
 <009f603f-5027-23d5-3dee-c04cde0ef862@cogentembedded.com>
 <CAMuHMdXPsNGGsQfWKknKicdCW8Q7CRFa6aiwHL3f_9g3TbDbRQ@mail.gmail.com>
Message-ID: <4ca9b39f-f4d2-2587-f9bd-45cb82456c44@cogentembedded.com>
Date: Tue, 6 Mar 2018 20:15:59 +0300
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXPsNGGsQfWKknKicdCW8Q7CRFa6aiwHL3f_9g3TbDbRQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-ID: <devicetree@vger.kernel.org>

On 03/06/2018 01:59 PM, Geert Uytterhoeven wrote:

>>>>>> Add the PFC support for the R8A77980 SoC including pin groups for some
>>>>>> on-chip devices such as AVB, CAN-FD, GETHER, [H]SCIF, I2C, INTC-EX, MMC,
>>>>>> MSIOF, PWM, and VIN...
>>>>>>
>>>>>> Based on the original (and large) patch by Vladimir Barinov.
>>>>>>
>>>>>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>>>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>>>
>>>>> Thanks for your patch!
>>>>>
>>>>> To avoid scaring off potential reviewers, it may be better to not include that
>>>>> many pin groups and functions in future initial submissions.
>>>>> This also helps if issues are detected during review in some of them (like
>>>>> below), delaying queuing of basic functionality and other correct parts.
>>>>>
>>>>> I only looked at CPU_ALL_PORT(), pins, groups, and functions.
>>>>> Comments below.
>>>>>
>>>>>> --- /dev/null
>>>>>> +++ renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
>>>>>
>>>>>> +/* - AVB -------------------------------------------------------------------- */
>>>>>> +static const unsigned int avb_link_pins[] = {
>>>>>> +       /* AVB_LINK */
>>>>>> +       RCAR_GP_PIN(1, 18),
>>>>>> +};
>>>>>> +static const unsigned int avb_link_mux[] = {
>>>>>> +       AVB_LINK_MARK,
>>>>>> +};
>>>>>> +static const unsigned int avb_magic_pins[] = {
>>>>>> +       /* AVB_MAGIC */
>>>>>> +       RCAR_GP_PIN(1, 16),
>>>>>> +};
>>>>>> +static const unsigned int avb_magic_mux[] = {
>>>>>> +       AVB_MAGIC_MARK,
>>>>>> +};
>>>>>> +static const unsigned int avb_phy_int_pins[] = {
>>>>>> +       /* AVB_PHY_INT */
>>>>>> +       RCAR_GP_PIN(1, 17),
>>>>>> +};
>>>>>> +static const unsigned int avb_phy_int_mux[] = {
>>>>>> +       AVB_PHY_INT_MARK,
>>>>>> +};
>>>>>> +static const unsigned int avb_mdio_pins[] = {
>>>>>> +       /* AVB_MDC, AVB_MDIO */
>>>>>> +       RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14),
>>>>>> +};
>>>>>> +static const unsigned int avb_mdio_mux[] = {
>>>>>> +       AVB_MDC_MARK, AVB_MDIO_MARK,
>>>>>> +};
>>>>>
>>>>> The grouping is different from other R-Car Gen3 SoCs.
>>>>
>>>>    Not true AFAICS -- only the group naming is different.
>>>
>>> Oh, so we can have both groups names, and be compatible?
>>
>>    Probably. Just not sure if there's any worth to have the same groups for the not
>> pin compatible SoCs. Care to elaborate?
> 
> So I have compared all AVB/(G)ETHER pin groups on supported SoCs,
> to solve the issue for good, hopefully.
> 
> EtherAVB:
> --------
> 
> R-Car Gen2:
> 
>   Common (r8a7790/r8a7791/r8a7792/r8a7793/r8a7794) AVB:
> 
>     link = { LINK }
>     magic = { MAGIC }
>     phy_int = { PHY_INT }
>     mdio = { MDC, MDIO }
>     mii = { COL, CRS, RX_CLK, RXD[0-3], RX_DV, RX_ER, TX_CLK, TXD[0-3],
>             TX_EN, TX_ER }
>     gmii = { COL, CRS, GTX_CLK, GTXREFCLK, RX_CLK, RXD[0-7], RX_DV, RX_ER,

   Oops! GTXREFCLK is not a part of GMII (at least according to Wikipedia) ...

>              TX_CLK, TXD[0-7], TX_EN, TX_ER }
> 
>   AVB exceptions:
>     - r8a7790 "mii" lacks TX_ER (should it?)

   This signal is optional.

>     - r8a7792 has match = { AVTP_MATCH }
> 
> 
> R-Car Gen3:
> 
>   r8a7795/r8a7795-es1/r8a7796/r8a77965/r8a77995 AVB:
> 
>     link = { LINK }
>     magic = { MAGIC }
>     phy_int = { PHY_INT }
>     mdc = { MDC, MDIO }
>     mii = { RD[0-3], RXC, RX_CTL, TD[0-3], TXC, TXCREFCLK, TX_CTL }

   Oops again! TXREFCLK doen't belong in MII...

>     avtp_pps = { AVTP_PPS }
>     avtp_match = { AVTP_MATCH }
>     avtp_capture = { AVTP_CAPTURE }
> 
>     Notes:
>       - { MDC, MDIO } groups is named "mdc" instead of "mdio"
>       - Supports RGMII, but group is named "mii"

   Oops... I blame Renesas! :-)

>   Sergei's r8a77970 AVB proposal:
> 
>     link = { LINK }
>     magic = { MAGIC }
>     phy_int = { PHY_INT }
>   * mdio = { MDC, MDIO }
>     mii = { RD[0-3], RXC, RX_CTL, TD[0-3], TXC, TXCREFCLK, TX_CTL }
>     avtp_pps = { AVTP_PPS }
>     avtp_match = { AVTP_MATCH }
>     avtp_capture = { AVTP_CAPTURE }
> 
>     Notes:
>       * indicates difference with H3/M3/D3
>       - Supports RGMII, but group is named "mii"

   Oops, needs fixing...

>   Sergei's r8a77980 AVB proposal:
> 
>     link = { LINK }
>     magic = { MAGIC }
>     phy_int = { PHY_INT }
>   * mdio = { MDC, MDIO }
>   * rgmii = { RD[0-3], RXC, RX_CTL, TD[0-3], TXC, TX_CTL }
>   * txcrefclk = { TXCREFCLK }
>     avtp_pps = { AVTP_PPS }
>     avtp_match = { AVTP_MATCH }
>     avtp_capture = { AVTP_CAPTURE }
> 
>     Notes:
>       * indicates difference with H3/M3/D3
>       - Supports RGMII, and group is called "rgmii"
>       - TXCREFCLK has its own group. Why? Similarity with GETHER on V3H?

   Because that signal doesn't belong to RGMII (according to Wikipedia).

> (G)Ether:
> --------
> 
> R-Mobile A1 (r8a7740) ETHER:
> 
>     rmii = { CRS_DV, MDC, MDIO, REF50CK, RXD[01], RX_ER, TXD[01], TX_EN }
>     mii = { COL, CRS, MDC, MDIO, RX_CLK, RXD[0-3], RX_DV, RX_ER, TX_CLK,
>             TXD[0-3], TX_EN, TX_ER }
>     gmii = { COL, CRS, GTX_CLK, MDC, MDIO, REF125CK, RXD[0-7], RX_CLK,

   Oops, REF125CK doesn't belong to GMII...

>              RX_DV, RX_ER, TX_CLK, TXD[0-7], TX_EN, TX_ER }
>     int = { PHY_INT }
>     link = { LINK }
>     wol = { WOL }
> 
>     Notes:
>       - "rmii", "mii", and "gmii" include MDC and MDIO

   That sucketh! :-)

> R-Car Gen1:
> 
>   r8a7778/r8a7779 ETHER:
> 
>     link = { LINK }
>     magic = { MAGIC }
>     rmii = { CRS_DV, MDC, MDIO, REF_CLK, RXD[01], RX_ER, TXD[01], TX_EN }
> 
>     Notes:
>       - "rmii" includes MDC and MDIO (there's only one choice of interface)

   That too...

> R-Car Gen2:
> 
>   r8a7790/r8a7791/r8a7793/r8a7794 ETHER:
> 
>     link = { LINK }
>     magic = { MAGIC }
>     mdio = { MDC, MDIO }
>     rmii = { CRS_DV, REF_CLK, RXD[01], RX_ER, TXD[01], TX_EN }
> 
> 
> R-Car Gen3:
> 
>   Sergei's r8a77980 GETHER proposal:
> 
>     link = { LINK }
>     magic = { MAGIC }
>     phy_int = { PHY_INT }
>     mdio = { MDC, MDIO }
>     rgmii = { RD[0-3], RXC, RX_CTL, TD[0-3], TXC, TX_CTL }
>     rmii = { CRS_DV, REFCLK, RXD[01], RX_ER, TXD[01], TXD_EN }
>     txcrefclk = { TXCREFCLK }
>     txcrefclk_mega = { TXCREFCLK_MEGA }
> 
>     Notes:
>       - TXCREFCLK has its own group. I assume because one has to choose
>         between TXCREFCLK and TXCREFCLK_MEGA?

   No, because they're not a part of either RGMII or RMII interfaces.

> Actions:
> --------
> 
>   - Add missing TX_ER to "mii" group on r8a7790,

   Remembering it's optional...

>   - Rename "mdc" to "mdio" on H3/M3/D3, as the bus is called "Management
>     Data Input/Output (MDIO)", add alias for backwords compatibility,
>     https://en.wikipedia.org/wiki/Management_Data_Input/Output

   Agreed.

>   - Should we rename "mii" to "rgmii" on H3/M3/D3?
>     The group does not contain all RGMII pins anyway.

   It does!

> Thanks for your comments!
> 
>>>>>> +/* - HSCIF0 ----------------------------------------------------------------- */
>>>>>
>>>>>> +static const unsigned int scif_clk_a_pins[] = {
>>>>>> +       /* SCIF_CLK */
>>>>>> +       RCAR_GP_PIN(0, 10),
>>>>>> +};
>>>>>> +static const unsigned int scif_clk_a_mux[] = {
>>>>>> +       SCIF_CLK_A_MARK,
>>>>>> +};
>>>>>
>>>>>
>>>>> [...]
>>>>>
>>>>>> +static const unsigned int scif_clk_b_pins[] = {
>>>>>> +       /* SCIF_CLK */
>>>>>> +       RCAR_GP_PIN(1, 25),
>>>>>> +};
>>>>>> +static const unsigned int scif_clk_b_mux[] = {
>>>>>> +       SCIF_CLK_B_MARK,
>>>>>> +};
>>>>>
>>>>> Please move the scif_clk pins to their own section, as they are shared by
>>>>> HSCIF and SCIF.
>>>>
>>>>    Again, the same bit in MOD_SEL0...
>>>
>>> Same story: SCIF_CLK is shared by the HSCIFx and SCIFx modules.
>>> Still puts the responsability in the hands of the board designer: he must
>>
>>   Responsibility. :-)
> 
> As long as it doesn't end up in a commit message...
> 
>>> know not to select SCIF_CLK_A and HSCIF0_B, or SCIF_CLK_B and HSCIF0_A.
>>>
>>> On this SoC, the limitations seem to be worse than on other members of
>>> the same family.
>>>
>>> However, on other SoCs you have similar limitations. E.g. on H3/M3-W/M3-N
>>> you cannot select scif5_data_a and scif5_clk_b, as they are both controlled
>>> through sel_scif5,
>>
>>> although the driver has them in separate groups.
>>> But that is done to allow using only RX/TX functionality, and using the
>>> CTS/RTS pins for something else (a completely different function, or GPIO).
>>
>>    That's OK as they both are the part of the same function. My case is different,
>> sorry for not making this clear...
> 
> So, do you agree having a separate SCIF_CLK function, like on all other
> R-Car SoCs?

   I agree as long as that works...

> Gr{oetje,eeting}s,
> 
>                         Geert

MBR, Sergei
