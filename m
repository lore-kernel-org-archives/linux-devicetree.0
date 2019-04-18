From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: allwinner: a64-amarula-relic: Add
 GT5663 CTP node
Date: Thu, 18 Apr 2019 18:00:27 +0530
Message-ID: <CAMty3ZDwhB+63i_Cy90n0Y_Ra6XdTXbsX+z5q6swnj=FLH976g@mail.gmail.com>
References: <20190418083543.11695-1-jagan@amarulasolutions.com> <20190418112357.qic227rdwordmzyh@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190418112357.qic227rdwordmzyh@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org

On Thu, Apr 18, 2019 at 4:54 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Thu, Apr 18, 2019 at 02:05:42PM +0530, Jagan Teki wrote:
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
> > Changes for v2:
> > - drop i2c1, bias-pull-up
> >
> >  .../allwinner/sun50i-a64-amarula-relic.dts    | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
> > index 3575db216016..3819ce396073 100644
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
> That's the default already

Yes, and i2c1 node in sun50i-a64.dtsi is not attaching pinctrl. So I
attached here.
