From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a64-oceanic-5205-5inmfd:
 Enable CAN
Date: Tue, 21 May 2019 10:10:01 +0200
Message-ID: <20190521081001.zjq3gnlvyuyexz6m@flea>
References: <20190418141658.10868-1-jagan@amarulasolutions.com>
 <20190418145641.q23tupopz2czjzc5@flea>
 <CAOf5uwn8CtRs8cx0KC-bxNoRP4TiDrHi8F83QfjsZhueLDYFJg@mail.gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xwglcbrmgqk6xsau"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBXPER3TQKGQELU4LF5A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAOf5uwn8CtRs8cx0KC-bxNoRP4TiDrHi8F83QfjsZhueLDYFJg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Michael Nazzareno Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-amarula <linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--xwglcbrmgqk6xsau
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, May 21, 2019 at 08:47:02AM +0200, Michael Nazzareno Trimarchi wrote:
> > > +     };
> > > +
> > >  };
> > >
> > >  &ehci0 {
> > > @@ -77,6 +95,31 @@
> > >       status = "okay";
> > >  };
> > >
> > > +&pio {
> > > +     can_pins: can-pins {
> > > +             pins = "PD6",                   /* RX_BUF1_CAN0 */
> > > +                    "PD7";                   /* RX_BUF0_CAN0 */
> > > +             function = "gpio_in";
> > > +     };
> > > +};
> >
> > That isn't needed. What are they used for, you're not tying them to
> > anything?
>
> Mux of their function is correct. They are connected in the schematics
> but not used right now.

Then describe the whole thing or don't?

And that's kind of missing my point. If that pin group isn't related
to any device, the pin muxing will not be changed. So that group, in
itself, has strictly no effect.

Moreover, you don't need a pin group in the first place to mux pins in
GPIOs, the GPIO API will make sure that is the case when you request
it.

> I can garantee that kernel wlll always configurred in the right way
> and if I want I can export in userspace
> for debug purpose

Yes, because the API does it, not your change

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--xwglcbrmgqk6xsau--
