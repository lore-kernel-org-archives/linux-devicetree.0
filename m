From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: allwinner: a64-amarula-relic: Add
 GT5663 CTP node
Date: Thu, 18 Apr 2019 19:39:28 +0530
Message-ID: <CAMty3ZAGWOtkGRXLLZ14XgNYDX7-XtEbt+y53eqCJJKgfxwNuQ@mail.gmail.com>
References: <20190418134838.8806-1-jagan@amarulasolutions.com> <20190418140423.ch43fz2xuk5teqyl@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418140423.ch43fz2xuk5teqyl@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org

On Thu, Apr 18, 2019 at 7:34 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Thu, Apr 18, 2019 at 07:18:37PM +0530, Jagan Teki wrote:
> > Add Goodix GT5663 capacitive touch controller node on
> > Amarula A64-Relic board.
> >
> > The CTP connected to board with,
> > - SDA, SCK from i2c1
> > - GPIO-LD0 as AVDD28 supply
> > - PH4 gpio as interrupt pin
> > - PH8 gpio as reset pin
> > - X axis is inverted
> > - Y axis is inverted
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v3:
> > - Use 2.8v for reg_ldo_io0
> > Changes for v2:
> > - drop i2c1, bias-pull-up
> >
> >  .../allwinner/sun50i-a64-amarula-relic.dts    | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> > index 3575db216016..bd31a4385bc1 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> > @@ -49,6 +49,24 @@
> >       bias-pull-up;
> >  };
> >
> > +&i2c1 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&i2c1_pins>;
>
> You haven't fixed this, and you didn't either in the second patch.

Sorry, I interpreted previous comment to keep this pinctrl.

Since i2c1 node in sun50i-a64.dtsi doesn't have pinctrl attached to
it, added here like i2c0 is it something wrong?
