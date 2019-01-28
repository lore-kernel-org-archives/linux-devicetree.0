From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64-amarula-relic: Add STLM75
 sensor
Date: Mon, 28 Jan 2019 13:33:53 +0100
Message-ID: <20190128123353.zgvrepgqvvselwzb@flea>
References: <20190124175254.27650-1-jagan@amarulasolutions.com>
 <20190125084004.fsbxtpcesb5yaiod@flea>
 <CAMty3ZBmHpsTRXARnT5nf1VcnCmz0QpZ5B8caHONLV0UZdXS9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMty3ZBmHpsTRXARnT5nf1VcnCmz0QpZ5B8caHONLV0UZdXS9Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 28, 2019 at 12:46:48PM +0530, Jagan Teki wrote:
> On Fri, Jan 25, 2019 at 2:10 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > On Thu, Jan 24, 2019 at 11:22:54PM +0530, Jagan Teki wrote:
> > > Amarula A64 Relic has STLM75 sensor for digital temperature
> > > and thermal watchdog.
> > >
> > > Add support for it.
> > >
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> > > Note: the respective driver change is already in mainline
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2e9a41bbc1079776dabe42ed8113b086b99ae56c
> > >
> > >  .../dts/allwinner/sun50i-a64-amarula-relic.dts    | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> > > index 6cb2b7f0c817..5d942543d978 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> > > @@ -34,6 +34,21 @@
> > >       status = "okay";
> > >  };
> > >
> > > +&i2c0 {
> > > +     pinctrl-names = "default";
> > > +     pinctrl-0 = <&i2c0_pins>;
> > > +     status = "okay";
> > > +
> > > +     temp@48 {
> >
> > That would be sensor@48
> >
> > > +             compatible = "st,stlm75";
> >
> > That compatible isn't documented.
> 
> True, but none of the compatible strings used on the driver doesn't
> documented in binding instead there are documented in
> Documentation/hwmon/lm75.

It doesn't look like a DT binding documentation.

> Don't know the exact reason, do we need to document this in binding
> as well?

Yep

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
