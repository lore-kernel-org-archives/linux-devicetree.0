From: jmondi <jacopo@jmondi.org>
Subject: Re: [PATCH 3/4] arm: dts: gr-peach: Add ETHER pin group
Date: Thu, 24 Aug 2017 13:46:56 +0200
Message-ID: <20170824114656.GA3905@w540>
References: <1503564523-31899-1-git-send-email-jacopo+renesas@jmondi.org>
 <1503564523-31899-4-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdUoMU=qN3Qjoqmf6uxcS3j5hqthhuBDMPZzA+wSD_BH5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdUoMU=qN3Qjoqmf6uxcS3j5hqthhuBDMPZzA+wSD_BH5A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Thu, Aug 24, 2017 at 11:48:14AM +0200, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Thu, Aug 24, 2017 at 10:48 AM, Jacopo Mondi
> <jacopo+renesas@jmondi.org> wrote:
> > Add pin configuration subnode for ETHER pin group.
> > The interface can be configured and probed, but no traffic can be
> > transmitted or received.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >
> > ---
> > When in u-boot console I can ping a connected host, after the
> > system has booted I can configure an ip address on the interface but
> > cannot exchange any traffic.
> > I have compared the pin configuration procedure with the u-boot
> > implemented one and some sketches from mbed operating system libraries,
> > the configured pins are correct and registers values seems to match.
> > Not sure if this patch should be sent for inclusion but sending it out
> > anyway for you to judge this.
> >
> > Thanks
> >    j
> > ---
> >  arch/arm/boot/dts/r7s72100-gr-peach.dts | 35 +++++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r7s72100-gr-peach.dts b/arch/arm/boot/dts/r7s72100-gr-peach.dts
> > index bcfa644..5ce558f 100644
> > --- a/arch/arm/boot/dts/r7s72100-gr-peach.dts
> > +++ b/arch/arm/boot/dts/r7s72100-gr-peach.dts
> > @@ -58,6 +58,28 @@
> >                 /* P6_2 as RxD2; P6_3 as TxD2 */
> >                 pinmux = <RZA1_PINMUX(6, 2, 7)>, <RZA1_PINMUX(6, 3, 7)>;
> >         };
> > +
> > +       ether_pins: ether {
> > +               /* Ethernet on Ports 1,3,5,10 */
> > +               pinmux = <RZA1_PINMUX(1, 14, 4)>, /* P1_14 = ET_COL   */
> > +                        <RZA1_PINMUX(3, 0, 2)>,  /* P3_0 = ET_TXCLK  */
> > +                        <RZA1_PINMUX(3, 3, 2)>,  /* P3_3 = ET_MDIO   */
> > +                        <RZA1_PINMUX(3, 4, 2)>,  /* P3_4 = ET_RXCLK  */
> > +                        <RZA1_PINMUX(3, 5, 2)>,  /* P3_5 = ET_RXER   */
> > +                        <RZA1_PINMUX(3, 6, 2)>,  /* P3_6 = ET_RXDV   */
> > +                        <RZA1_PINMUX(5, 9, 2)>,  /* P5_9 = ET_MDC    */
> > +                        <RZA1_PINMUX(10, 1, 4)>, /* P10_1 = ET_TXER  */
> > +                        <RZA1_PINMUX(10, 2, 4)>, /* P10_2 = ET_TXEN  */
> > +                        <RZA1_PINMUX(10, 3, 4)>, /* P10_3 = ET_CRS   */
> > +                        <RZA1_PINMUX(10, 4, 4)>, /* P10_4 = ET_TXD0  */
> > +                        <RZA1_PINMUX(10, 5, 4)>, /* P10_5 = ET_TXD1  */
> > +                        <RZA1_PINMUX(10, 6, 4)>, /* P10_6 = ET_TXD2  */
> > +                        <RZA1_PINMUX(10, 7, 4)>, /* P10_7 = ET_TXD3  */
> > +                        <RZA1_PINMUX(10, 8, 4)>, /* P10_8 = ET_RXD0  */
> > +                        <RZA1_PINMUX(10, 9, 4)>, /* P10_9 = ET_RXD1  */
> > +                        <RZA1_PINMUX(10, 10, 4)>,/* P10_10 = ET_RXD2 */
> > +                        <RZA1_PINMUX(10, 11, 4)>;/* P10_11 = ET_RXD3 */
>
> All OK, but do you need P4_2, which is used for ET_nRST?

I tried requesting the GPIO in the "ether" subnode and define it as
"active low", so that it is kept high during regular operations.
I have verified through register writes dump it is cycled just after
the gpio is requested, and this should reset the interface before the
actual sh_eth driver kicks in.

I haven't find any mention in device tree bindings documentation of a
"reset-gpio" property for sh_eth, in the code examples I've seen in
u-boot and mbed, the interface is reset before any actual
configuration is performed. I feel like that should be the place where
that gpio is requested and cycled...

Thanks
   j
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
