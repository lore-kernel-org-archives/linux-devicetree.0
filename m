From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpio: document how to order GPIO controllers
Date: Wed, 6 Jul 2016 12:27:50 +0200
Message-ID: <20160706102750.GH23470@localhost>
References: <1467355333-8813-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20160705140546.GA10601@rob-hp-laptop>
 <20160705180447.GP16643@pengutronix.de>
 <CACRpkdbH+KRXbxFdfyAE44fBNctK4cWV+KRLwQBTzSGLvLMEDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbH+KRXbxFdfyAE44fBNctK4cWV+KRLwQBTzSGLvLMEDg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <kernel@pengutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 06, 2016 at 11:34:37AM +0200, Linus Walleij wrote:
> On Tue, Jul 5, 2016 at 8:04 PM, Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:

> > root@hostname:/sys/bus/gpio/devices ls -l
> > lrwxrwxrwx    1 root     root             0 Jul  5 20:52 gpiochip0 =
-> ../../../devices/platform/soc/53f00000.aips/53f9c000.gpio/gpiochip0
> > lrwxrwxrwx    1 root     root             0 Jul  5 20:52 gpiochip1 =
-> ../../../devices/platform/soc/53f00000.aips/53fa4000.gpio/gpiochip1
> > lrwxrwxrwx    1 root     root             0 Jul  5 20:52 gpiochip2 =
-> ../../../devices/platform/soc/53f00000.aips/53fcc000.gpio/gpiochip2
> > lrwxrwxrwx    1 root     root             0 Jul  5 20:52 gpiochip3 =
-> ../../../devices/platform/soc/53f00000.aips/53fd0000.gpio/gpiochip3
> >
> > That is we have:
> >
> >         Hardware name | software gpiochip
> >             GPIO4     |      gpiochip0
> >             GPIO3     |      gpiochip1
> >             GPIO1     |      gpiochip2
> >             GPIO2     |      gpiochip3
> >
> > I bet that's the probe order because when sorted by address (and so
> > by order in the device tree) we have exactly this ordering. (Compar=
e
> > with $(grep gpio@ arch/arm/boot/dts/imx25.dtsi).)
>=20
> That is super-unintuitive for a human user, I agree 100%.
>=20
> > For a new interface this is OK, still I predict users will complain=
 if
> > the numbers used don't match naturally the hardware names. And IMHO=
 they
> > are right.
>=20
> I agree, and I think that if aliases can alleviate the situation we s=
hould
> allow them and encourage them. They are the best duct-tape we can
> find for the DT systems.
>=20
> Unfortunately it is not my call, because DT bindings and alias use
> is not under my jurisdiction.
>=20
> I *THINK* the view of the device core maintainers is that udev
> and sysfs hierarchies should be used to uniquely identify a certain
> device, and that relying on device numbering is too fragile.

I thought the whole idea (or at least a large part of) the new
user-space interface was to allow lookups by line names precisely in
order not to have to rely on gpio numbers, which may not only change
between boots, but also between hardware revisions, etc.

What's wrong with naming the pins in DT and use that for lookups?

I've been too busy with other stuff this spring to follow the new
user-space interface development, but I assume that this had been taken
into account in the design?

Thanks,
Johan
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
