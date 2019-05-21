From: Michael Nazzareno Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a64-oceanic-5205-5inmfd:
 Enable CAN
Date: Tue, 21 May 2019 13:08:09 +0200
Message-ID: <CAOf5uwnhXjur=2NezCydaCxP5d33S+AwdD9WTDtp2EUJr4UTgg@mail.gmail.com>
References: <20190418141658.10868-1-jagan@amarulasolutions.com>
 <20190418145641.q23tupopz2czjzc5@flea> <CAOf5uwn8CtRs8cx0KC-bxNoRP4TiDrHi8F83QfjsZhueLDYFJg@mail.gmail.com>
 <20190521081001.zjq3gnlvyuyexz6m@flea>
Reply-To: michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCXK73FY3AFRBKFYR7TQKGQELTZX3UQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190521081001.zjq3gnlvyuyexz6m@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-amarula <linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime

On Tue, May 21, 2019 at 10:10 AM Maxime Ripard
<maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
>
> On Tue, May 21, 2019 at 08:47:02AM +0200, Michael Nazzareno Trimarchi wrote:
> > > > +     };
> > > > +
> > > >  };
> > > >
> > > >  &ehci0 {
> > > > @@ -77,6 +95,31 @@
> > > >       status = "okay";
> > > >  };
> > > >
> > > > +&pio {
> > > > +     can_pins: can-pins {
> > > > +             pins = "PD6",                   /* RX_BUF1_CAN0 */
> > > > +                    "PD7";                   /* RX_BUF0_CAN0 */
> > > > +             function = "gpio_in";
> > > > +     };
> > > > +};
> > >
> > > That isn't needed. What are they used for, you're not tying them to
> > > anything?
> >
> > Mux of their function is correct. They are connected in the schematics
> > but not used right now.
>
> Then describe the whole thing or don't?
>

Ok

> And that's kind of missing my point. If that pin group isn't related
> to any device, the pin muxing will not be changed. So that group, in
> itself, has strictly no effect.
>
> Moreover, you don't need a pin group in the first place to mux pins in
> GPIOs, the GPIO API will make sure that is the case when you request
> it.

This is correct on sunxi. Is this valid for sunxi or in general in all the SoC?
Anyway make sense to have pins configured and place in the right
state, just suppose if the
booting stage is wrong or anything that make those pins in the wrong
configuration

>
> > I can garantee that kernel wlll always configurred in the right way
> > and if I want I can export in userspace
> > for debug purpose

Correct if you start to use it but if you want them right configured
the right place
is in the default state e/o initstate if this can be a problem of the hardware

Default state: the state the pinctrl handle shall be put
 *      into as default, usually this means the pins are up and ready to
 *      be used by the device driver. This state is commonly used by
 *      hogs to configure muxing and pins at boot, and also as a state
 *      to go into when returning from sleep and idle in
 *      .pm_runtime_resume() or ordinary .resume() for example.

Now the pins are connected to the canbus as should be and they are
configured and usually
put in the right state.

+               compatible = "microchip,mcp2515";
+               reg = <0>;
+               spi-max-frequency = <10000000>;
+               pinctrl-names = "default";
+               pinctrl-0 = <&can_pins>;

>
> Yes, because the API does it, not your change
>

Do you prefer to drop the pinmux? or update the commit message

> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
