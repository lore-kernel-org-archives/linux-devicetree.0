From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH v4 6/9] dt-bindings: display:
 hdmi-connector: Add DDC power supply
Date: Sat, 27 Apr 2019 21:01:23 +0200
Message-ID: <20190427190123.6aik7by3fgkyjmq7@core.my.home>
References: <20190413165418.27880-1-megous@megous.com>
 <20190413165418.27880-7-megous@megous.com>
 <20190426182337.GA22245@bogus>
 <20190426192031.wtoaxctjo2qxxquq@core.my.home>
 <CAL_Jsq+o1j6AGL9UnhN1tV150DsFug6pg+UPEJ9EKqBc6rgq_w@mail.gmail.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDXLF6FR5INBBCOOSLTAKGQENWXGBYQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+o1j6AGL9UnhN1tV150DsFug6pg+UPEJ9EKqBc6rgq_w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Jose Abreu <joabreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, netdev <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 26, 2019 at 03:02:50PM -0500, Rob Herring wrote:
> On Fri, Apr 26, 2019 at 2:20 PM Ond=C5=99ej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wr=
ote:
> >
> > On Fri, Apr 26, 2019 at 01:23:37PM -0500, Rob Herring wrote:
> > > On Sat, Apr 13, 2019 at 06:54:15PM +0200, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org wrote:
> > > > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > > >
> > > > Some Allwinner SoC using boards (Orange Pi 3 for example) need to e=
nable
> > > > on-board voltage shifting logic for the DDC bus to be usable. Use
> > > > ddc-supply on the hdmi-connector to model this.
> > > >
> > > > Add binding documentation for optional ddc-supply property.
> > > >
> > > > Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > > > ---
> > > >  .../devicetree/bindings/display/connector/hdmi-connector.txt     |=
 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/connector/hd=
mi-connector.txt b/Documentation/devicetree/bindings/display/connector/hdmi=
-connector.txt
> > > > index 508aee461e0d..33085aeb0bb9 100644
> > > > --- a/Documentation/devicetree/bindings/display/connector/hdmi-conn=
ector.txt
> > > > +++ b/Documentation/devicetree/bindings/display/connector/hdmi-conn=
ector.txt
> > > > @@ -9,6 +9,7 @@ Optional properties:
> > > >  - label: a symbolic name for the connector
> > > >  - hpd-gpios: HPD GPIO number
> > > >  - ddc-i2c-bus: phandle link to the I2C controller used for DDC EDI=
D probing
> > > > +- ddc-supply: the power supply for the DDC bus
> > >
> > > It's not just for DDC. It powers the chips in bridge dongles for
> > > example. Pretty much every diagram I find just calls it 5V or +5V.
> > >
> > > So how about '5V-supply' or 'v5V-supply'?
> >
> > Just to be sure, the schematic that inspired this change looks like thi=
s:
> >
> > https://megous.com/dl/tmp/33b2971de6943e9d.png
> >
> > HDMI-5V is always on, and what is really being enabled here are mosfets
> > connected to DDC_CEC_EN and not the HDMI-5V power supply. So in this ca=
se it
> > really is just for DDC. It is conceivable that some boards may need bot=
h to
> > enable 5V for HDMI circuitry and some separate power shifting logic for
> > DDC bus.
>=20
> Okay, not what I thought you were defining. DDC_CEC_EN is a GPIO line?
> I wouldn't characterize this as a voltage rail, so I don't think it
> should be a supply. Perhaps 'ddc-en-gpios'?

Yes it's GPIO. I'll implement it as GPIO.

> We certainly want to make it clear this is not the 5V supply.

Right. Thank you for review.

regards,
	Ondrej

> Rob
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
