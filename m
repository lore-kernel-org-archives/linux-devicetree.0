From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: renesas,r9a06g032-sysctrl:
 Document power Domains
Date: Mon, 3 Jun 2019 10:39:08 +0200
Message-ID: <CAMuHMdXiBz6L83sBHXOg=zc0zo4ff37SbLOZc5NwgiTLVG-nTw@mail.gmail.com>
References: <1558711904-27278-1-git-send-email-gareth.williams.jx@renesas.com>
 <1558711904-27278-2-git-send-email-gareth.williams.jx@renesas.com>
 <CAMuHMdV2jmY2u1-Z6cRR1OQcfW8U0HM_ac-xn1gO9nPf41iD+A@mail.gmail.com> <TY1PR01MB1769FB150E0258A8AC76CDB5F5140@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <TY1PR01MB1769FB150E0258A8AC76CDB5F5140@TY1PR01MB1769.jpnprd01.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Gareth Williams <gareth.williams.jx@renesas.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Phil,

On Mon, Jun 3, 2019 at 10:29 AM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> On 28 May 2019 08:29 Geert Uytterhoeven wrote:
> > On Fri, May 24, 2019 at 5:32 PM Gareth Williams wrote:
> > > The driver is gaining power domain support, so add the new property to
> > > the DT binding and update the examples.
> > >
> > > Signed-off-by: Gareth Williams <gareth.williams.jx@renesas.com>

> > > ---
> > > a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
> > > +++ b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
> > @@ -40,4 +42,5 @@ Examples
> > >                 reg-io-width = <4>;
> > >                 clocks = <&sysctrl R9A06G032_CLK_UART0>;
> > >                 clock-names = "baudclk";
> > > +               power-domains = <&sysctrl>;
> >
> > This is an interesting example: according to the driver,
> > R9A06G032_CLK_UART0, is not clock used for power management?
> >
> > Oh, the real uart0 node in arch/arm/boot/dts/r9a06g032.dtsi uses
> >
> >     clocks = <&sysctrl R9A06G032_CLK_UART0>, <&sysctrl
> > R9A06G032_HCLK_UART0>;
> >     clock-names = "baudclk", "apb_pclk";
> >
> > That does make sense...
> Note that the Synopsys DW uart driver already gets the "apb_pclk" clock, so
> we don’t actually need to use clock domains to enable this clock.

That is not necessarily a problem:
  1) DT describes hardware, not software policy,
  2) It doesn't hurt to enable a clock twice.

There are still some R-Car drivers that manage clocks themselves, but
we're slowly migrating away from that, where possible. If the driver
is e.g. shared with a platform without clock domains, we obviously cannot
do that.

So you can take out that code again, that's up to you.

> This is also true for many of the peripheral drivers used on rzn1 (Synopsys
> gpio controller, i2c controller, gmac, dmac, Arasan sdio controller). The
> commit to add this clock to the i2c controller driver is my fault, as I was
> following the pattern of the others.
>
> Of the few drivers that don't already get the hclk/pclk used to access the
> peripherals is the Synopsys spi controller (though that currently doesn’t
> support runtime PM) and the USB Host controller.

Good, so the latter will start working magically, I assume? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
