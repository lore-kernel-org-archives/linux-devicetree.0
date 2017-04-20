From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a7794: add R8A7745 support
Date: Thu, 20 Apr 2017 14:20:57 +0200
Message-ID: <CAMuHMdWSTHhLHdJt3+oASrYwpnzDserWjb5RRxYqhVxe=DNe8g@mail.gmail.com>
References: <20170413201932.890107963@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170413201932.890107963-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Thu, Apr 13, 2017 at 10:19 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> Renesas  RZ/G1E (R8A7745) is pin compatible with R-Car E2 (R8A7794),
> however  it doesn't have several automotive specific peripherals.
> Annotate all the items that only exist on the R-Car SoCs and only
> supply the pin groups/functions existing on a given SoC (that required
> splitting  of the AVB function)...
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>
> ---
> This patch is  against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
> repo plus  R8A7794 PFC fix and R8A7743 PFC support patch...
>
> Changes in version 2:
> - fixed indentation to use tabs instead of spaces;
> - updated the PFC bindings.

Thanks for the update!

> --- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
> +++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7794.c

> @@ -110,10 +110,12 @@ enum {
>         FN_I2C1_SDA_B, FN_D10, FN_HSCIF2_HSCK, FN_SCIF1_SCK_C, FN_IRQ6,
>         FN_PWM5_C, FN_D11, FN_HSCIF2_HCTS_N, FN_SCIF1_RXD_C, FN_I2C1_SCL_D,
>         FN_D12, FN_HSCIF2_HRTS_N, FN_SCIF1_TXD_C, FN_I2C1_SDA_D, FN_D13,
> -       FN_SCIFA1_SCK, FN_TANS1, FN_PWM2_C, FN_TCLK2_B, FN_D14, FN_SCIFA1_RXD,
> -       FN_IIC0_SCL_B, FN_D15, FN_SCIFA1_TXD, FN_IIC0_SDA_B, FN_A0,
> -       FN_SCIFB1_SCK, FN_PWM3_B, FN_A1, FN_SCIFB1_TXD, FN_A3, FN_SCIFB0_SCK,
> -       FN_A4, FN_SCIFB0_TXD, FN_A5, FN_SCIFB0_RXD, FN_PWM4_B, FN_TPUTO3_C,
> +       FN_SCIFA1_SCK, FN_TANS1 /* R8A7794 only */, FN_PWM2_C, FN_TCLK2_B,
> +       FN_D14, FN_SCIFA1_RXD, FN_IIC0_SCL_B,
> +       FN_D15, FN_SCIFA1_TXD, FN_IIC0_SDA_B,
> +       FN_A0, FN_SCIFB1_SCK, FN_PWM3_B, FN_A1, FN_SCIFB1_TXD,
> +       FN_A3, FN_SCIFB0_SCK, FN_A4, FN_SCIFB0_TXD,
> +       FN_A5, FN_SCIFB0_RXD, FN_PWM4_B, FN_TPUTO3_C,

I still have mixed feelings about adding all these annotations.
IMHO the groups and functions provide sufficient documentation, and not adding
the annotations means less code has to be changed now, and perhaps in the
future.

> @@ -123,77 +125,139 @@ enum {
>         FN_A12, FN_MSIOF1_SS1, FN_SCIFA5_RXD_B, FN_A13, FN_MSIOF1_SS2,
>         FN_SCIFA5_TXD_B, FN_A14, FN_MSIOF2_RXD, FN_HSCIF0_HRX_B, FN_DREQ1_N,
>         FN_A15, FN_MSIOF2_TXD, FN_HSCIF0_HTX_B, FN_DACK1, FN_A16,
> -       FN_MSIOF2_SCK, FN_HSCIF0_HSCK_B, FN_SPEEDIN, FN_VSP, FN_CAN_CLK_C,
> -       FN_TPUTO2_B, FN_A17, FN_MSIOF2_SYNC, FN_SCIF4_RXD_E, FN_CAN1_RX_B,
> -       FN_AVB_AVTP_CAPTURE_B, FN_A18, FN_MSIOF2_SS1, FN_SCIF4_TXD_E,
> -       FN_CAN1_TX_B, FN_AVB_AVTP_MATCH_B, FN_A19, FN_MSIOF2_SS2, FN_PWM4,
> -       FN_TPUTO2, FN_MOUT0, FN_A20, FN_SPCLK, FN_MOUT1,
> +       FN_MSIOF2_SCK, FN_HSCIF0_HSCK_B, FN_SPEEDIN /* R8A7794 only */,
> +       FN_VSP /* R8A7794 only */, FN_CAN_CLK_C, FN_TPUTO2_B,
> +       FN_A17, FN_MSIOF2_SYNC, FN_SCIF4_RXD_E, FN_CAN1_RX_B,
> +       FN_AVB_AVTP_CAPTURE_B /* R8A7794 only */,
> +       FN_A18, FN_MSIOF2_SS1, FN_SCIF4_TXD_E, FN_CAN1_TX_B,
> +       FN_AVB_AVTP_MATCH_B /* R8A7794 only */,
> +       FN_A19, FN_MSIOF2_SS2, FN_PWM4, FN_TPUTO2, FN_MOUT0 /* R8A7794 only */,
> +       FN_A20, FN_SPCLK, FN_MOUT1 /* R8A7794 only */,

Interestingly, the AVB_AVTP bits are marked "reserved" in revision 1.10
of the R-Car E2 user manual as well.
The only remnants are in Table 5.2, for GP5[11] and GP5[12].

>  static const struct sh_pfc_pin pinmux_pins[] = {
> @@ -1660,6 +1898,7 @@ static const unsigned int avb_gmii_mux[]
>         AVB_TX_EN_MARK, AVB_TX_ER_MARK, AVB_TX_CLK_MARK,
>         AVB_COL_MARK,
>  };
> +/* - AVB AVTP (R8A7794 only) ------------------------------------------------ */
>  static const unsigned int avb_avtp_capture_pins[] = {
>         RCAR_GP_PIN(5, 11),
>  };

> @@ -3809,6 +4055,9 @@ static const char * const avb_groups[] =
>         "avb_mdio",
>         "avb_mii",
>         "avb_gmii",
> +};
> +
> +static const char * const avb_avtp_groups[] = {
>         "avb_avtp_capture",
>         "avb_avtp_match",
>         "avb_avtp_capture_b",
> @@ -4183,50 +4432,58 @@ static const char * const vin1_groups[]
>         "vin1_clk",
>  };
>
> -static const struct sh_pfc_function pinmux_functions[] = {

[...]

> +static const struct {
> +       struct sh_pfc_function common[43];
> +       struct sh_pfc_function r8a7794[1];
> +} pinmux_functions = {

[...]

> +       .r8a7794 = {
> +               SH_PFC_FUNCTION(avb_avtp),
> +       }

This changes the user-visible name of the pinctrl function from "avb" to
"avb_avtp", which is part of the DT ABI.

Combined with the above, I'm inclined to not touch AVB_AVTP for now.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
