From: jacopo <jacopo@jmondi.org>
Subject: Re: [PATCH v2 4/7] arm: dts: r7s72100: Add pin controller node
Date: Thu, 23 Mar 2017 17:13:19 +0100
Message-ID: <20170323161319.GM30223@w540>
References: <1490026491-21742-1-git-send-email-jacopo+renesas@jmondi.org>
 <1490026491-21742-5-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdXZ4qoFrqQjxhD328XW_TPcEpo82mQSKyj6HKvaouot2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXZ4qoFrqQjxhD328XW_TPcEpo82mQSKyj6HKvaouot2w@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On Wed, Mar 22, 2017 at 02:12:04PM +0100, Geert Uytterhoeven wrote:
> Hi Jacopo,
> 
> On Mon, Mar 20, 2017 at 5:14 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> > Add pin controller node with 12 gpio controller sub-nodes to
> > r7s72100 dtsi.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > --- a/arch/arm/boot/dts/r7s72100.dtsi
> > +++ b/arch/arm/boot/dts/r7s72100.dtsi
> > @@ -183,6 +183,86 @@
> >                 };
> >         };
> >
> > +       pinctrl: pinctrl@fcfe3000 {
> > +               compatible = "renesas,r7s72100-ports";
> > +
> > +               #pinctrl-cells = <1>;
> > +
> > +               reg = <0xfcfe3000 0x4248>;
> 
> How did you get to 0x4248? I had expected 0x4230.
> Not that it matters much, Linux rounds it up to a multiple of PAGE_SIZE anyway.
> 

I guess I probably confused hex and dec values, as the correct
calculation here would have been (4200 + C * 4)
That 4248 value is what you get with (4200 + 12 * 4) so I probably
typed 12 in the calculator instead of C :)
I'll change this even if it does not make any difference..

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
