From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH 08/12] arm64: dts: allwinner: h6: Add MMC1 pins
Date: Tue, 9 Apr 2019 00:41:05 +0200
Message-ID: <20190408224104.qwhk33qgem7bq5y7@core.my.home>
References: <20190405234514.6183-1-megous@megous.com>
 <20190405234514.6183-9-megous@megous.com>
 <20190408074327.vvubj2sbkvfkwscv@flea>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBAU4V7SQKGQEHZEHXBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190408074327.vvubj2sbkvfkwscv@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arend van Spriel <arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Franky Lin <franky.lin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Hante Meuleman <hante.meuleman-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Chi-Hsien Lin <chi-hsien.lin-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Wright Feng <wright.feng-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Naveen Gupta <naveen.gupta-+wT8y+m8/X5BDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev@v
List-Id: devicetree@vger.kernel.org

On Mon, Apr 08, 2019 at 09:43:27AM +0200, Maxime Ripard wrote:
> On Sat, Apr 06, 2019 at 01:45:10AM +0200, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org wrote:
> > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> >
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > index 91fecab58836..dccad79da90c 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > @@ -238,6 +238,15 @@
> >  				bias-pull-up;
> >  			};
> >
> > +
> 
> Extra line
> 
> > +			mmc1_pins: mmc1-pins {
> > +				pins = "PG0", "PG1", "PG2", "PG3",
> > +				       "PG4", "PG5";
> > +				function = "mmc1";
> > +				drive-strength = <30>;
> > +				bias-pull-up;
> > +			};
> > +
> 
> Is that the only muxing option?

I don't think so. I believe someone can use a 1-bit interface (bus-width = <1>),
and then some data pins will be free. This pinconfig is for 4-bit bus width
setup.

Though other SoCs (ex. H3, A83T) don't consider this possibility and make the
4-bit config the default pinctrl for mmc1. To add to the confusion, on these
SoCs 4-bit pinconf is the default, but 1bit bus-width is the (implicit) default.
This led to some confusion in the past.

So we can either:
- keep consistency with what is done elsewhere, and make this default, despite
  not being the only option,
- or perhaps I can rename this to mmc1_bus_width4_pins, or somesuch, to make it
  more explicit, and keep it non-default.

What do you think is better?

thank you and regards,
	o.

> If so, then it should be assigned by default to mmc1
> 
> Thanks!
> Maxime
> 
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
