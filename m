From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] MIPS: mt7620: Rename uartlite to serial
Date: Wed, 6 Sep 2017 11:45:54 +0200
Message-ID: <CAMuHMdULSM2SfMYxS_xBn=GaHe+u2UfhHtXvwpvBo+rM3akjYw@mail.gmail.com>
References: <1504277584-37794-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504277584-37794-1-git-send-email-harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>, Matt Redfearn <matt.redfearn-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 1, 2017 at 4:53 PM, Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> Previously, mt7620.c defined the clocks for uarts with the names
> uartlite, uart1 and uart2. Rename them to serial{0,1,2} and update
> the devicetree node names.
>
> Signed-off-by: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  arch/mips/boot/dts/ralink/mt7620a.dtsi |  2 +-
>  arch/mips/boot/dts/ralink/mt7628a.dtsi |  6 +++---
>  arch/mips/ralink/mt7620.c              | 14 +++++++-------
>  3 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/arch/mips/boot/dts/ralink/mt7620a.dtsi b/arch/mips/boot/dts/ralink/mt7620a.dtsi
> index 793c0c7..58bd002 100644
> --- a/arch/mips/boot/dts/ralink/mt7620a.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7620a.dtsi
> @@ -45,7 +45,7 @@
>                         reg = <0x300 0x100>;
>                 };
>
> -               uartlite@c00 {
> +               serial0@c00 {

Device node names should use generic names and no numerical suffix
=> "serial@c00"

>                         compatible = "ralink,mt7620a-uart", "ralink,rt2880-uart", "ns16550a";
>                         reg = <0xc00 0x100>;
>
> diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> index 9ff7e8f..fe3fe9a 100644
> --- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> @@ -62,7 +62,7 @@
>                         reg = <0x300 0x100>;
>                 };
>
> -               uart0: uartlite@c00 {
> +               uart0: serial0@c00 {

uart0: serial@c00

>                         compatible = "ns16550a";
>                         reg = <0xc00 0x100>;
>
> @@ -75,7 +75,7 @@
>                         reg-shift = <2>;
>                 };
>
> -               uart1: uart1@d00 {
> +               uart1: serial1@d00 {

uart1: serial@d00

>                         compatible = "ns16550a";
>                         reg = <0xd00 0x100>;
>
> @@ -88,7 +88,7 @@
>                         reg-shift = <2>;
>                 };
>
> -               uart2: uart2@e00 {
> +               uart2: serial2@e00 {

uart2: serial@e00

>                         compatible = "ns16550a";
>                         reg = <0xe00 0x100>;
>
> diff --git a/arch/mips/ralink/mt7620.c b/arch/mips/ralink/mt7620.c
> index 9be8b08..f623ceb 100644
> --- a/arch/mips/ralink/mt7620.c
> +++ b/arch/mips/ralink/mt7620.c
> @@ -54,7 +54,7 @@ static int dram_type;
>
>  static struct rt2880_pmx_func i2c_grp[] =  { FUNC("i2c", 0, 1, 2) };
>  static struct rt2880_pmx_func spi_grp[] = { FUNC("spi", 0, 3, 4) };
> -static struct rt2880_pmx_func uartlite_grp[] = { FUNC("uartlite", 0, 15, 2) };
> +static struct rt2880_pmx_func serial_grp[] = { FUNC("serial", 0, 15, 2) };
>  static struct rt2880_pmx_func mdio_grp[] = {
>         FUNC("mdio", MT7620_GPIO_MODE_MDIO, 22, 2),
>         FUNC("refclk", MT7620_GPIO_MODE_MDIO_REFCLK, 22, 2),
> @@ -92,7 +92,7 @@ static struct rt2880_pmx_group mt7620a_pinmux_data[] = {
>         GRP("uartf", uartf_grp, MT7620_GPIO_MODE_UART0_MASK,
>                 MT7620_GPIO_MODE_UART0_SHIFT),
>         GRP("spi", spi_grp, 1, MT7620_GPIO_MODE_SPI),
> -       GRP("uartlite", uartlite_grp, 1, MT7620_GPIO_MODE_UART1),
> +       GRP("serial", serial_grp, 1, MT7620_GPIO_MODE_UART1),
>         GRP_G("wdt", wdt_grp, MT7620_GPIO_MODE_WDT_MASK,
>                 MT7620_GPIO_MODE_WDT_GPIO, MT7620_GPIO_MODE_WDT_SHIFT),
>         GRP_G("mdio", mdio_grp, MT7620_GPIO_MODE_MDIO_MASK,
> @@ -530,8 +530,8 @@ void __init ralink_clk_init(void)
>                 periph_rate = MHZ(40);
>                 pcmi2s_rate = MHZ(480);
>
> -               ralink_clk_add("10000d00.uartlite", periph_rate);
> -               ralink_clk_add("10000e00.uartlite", periph_rate);
> +               ralink_clk_add("10000d00.serial0", periph_rate);
> +               ralink_clk_add("10000e00.serial0", periph_rate);

Ugh, you're relying on the actual node names in DT?

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
