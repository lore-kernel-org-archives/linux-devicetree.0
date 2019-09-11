Return-Path: <SRS0=KABm=XG=pengutronix.de=ukl@kernel.org>
Date: Wed, 11 Sep 2019 19:49:48 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] dt-bindings: clk: Make example a bit clearer
Message-ID: <20190911174948.sblu4qn44sfh3cyy@pengutronix.de>
References: <20190823100315.2148-1-ada@thorsis.com>
 <20190911160648.6F88D2075C@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190911160648.6F88D2075C@mail.kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Alexander Dahl <ada@thorsis.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hello,

On Wed, Sep 11, 2019 at 09:06:47AM -0700, Stephen Boyd wrote:
> > diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > index b646bbcf7f92..1d4942380918 100644
> > --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > @@ -150,16 +150,18 @@ set to 0, or can be omitted if it is not followed by any non-zero entry.
> >          compatible = "fsl,imx-uart";
> >          reg = <0xa000 0x1000>;
> >          ...
> > -        clocks = <&osc 0>, <&pll 1>;
> > -        clock-names = "baud", "register";
> > +        clocks = ...
> > +        clock-names = ...
> 
> I don't see the need for this change.

<&pll 1> is mentioned below. But it is not this instance that is
relevant. So I suggested to get rid of it to not be a source of
confusion. (But I guess you understood that.)

> >          assigned-clocks = <&clkcon 0>, <&pll 2>;
> > -        assigned-clock-parents = <&pll 2>;
> > +        assigned-clock-parents = <&pll 1>;
> >          assigned-clock-rates = <0>, <460800>;
> >      };
> >  
> > -In this example the <&pll 2> clock is set as parent of clock <&clkcon 0> and
> > -the <&pll 2> clock is assigned a frequency value of 460800 Hz.
> > +In this example the <&pll 1> clock is set as parent of clock <&clkcon 0> and
> > +the <&pll 2> clock is assigned a frequency value of 460800 Hz.  A parent
> > +setting for <&pll 2> is omitted (end of list) and rate setting for <&clkcon 0>
> > +is skipped because set to <0>.
> 
> Maybe you can comment that the "clocks" and "clock-names" properties
> don't matter for assigned clk rates and parents.

Sure, a long text can explain this, but a maximal simple example is
very beneficial, too.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
