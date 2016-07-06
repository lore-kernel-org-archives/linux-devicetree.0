From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH] gpio: document how to order GPIO controllers
Date: Wed, 6 Jul 2016 09:24:33 +0200
Message-ID: <20160706092433.49e62c44@ipc1.ka-ro>
References: <1467355333-8813-1-git-send-email-u.kleine-koenig@pengutronix.de>
	<20160705140546.GA10601@rob-hp-laptop>
	<20160705180447.GP16643@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160705180447.GP16643@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, 5 Jul 2016 20:04:47 +0200 Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Jul 05, 2016 at 09:05:46AM -0500, Rob Herring wrote:
> > On Fri, Jul 01, 2016 at 08:42:13AM +0200, Uwe Kleine-K=C3=B6nig wro=
te:
> > > This uses the same approach that is already used for spi, i2c and
> > > several other controllers to ensure a consistent numbering indepe=
ndent
> > > of probe order. This is in use for several gpio drivers that alre=
ady now
> > > use of_alias_get_id(np, "gpio").
> >=20
> > Like SPI and I2C, I'm against further abuse of aliases for this pur=
pose=20
> > [1].
>=20
> I considered spi and i2c the good examples here :-|
>=20
+1

> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix=
=2Ede>
> > > ---
> > > Hello,
> > >=20
> > > Linus requested such a patch as part of a change that introduces
> > > this mechanism to the gpio-omap driver[1]. IMHO this is better do=
ne in a
> > > separate patch, so here it comes.
> > >=20
> > > Best regards
> > > Uwe
> > >=20
> > > [1] http://thread.gmane.org/gmane.linux.kernel.gpio/17399/focus=3D=
17629
> > >=20
> > >  Documentation/devicetree/bindings/gpio/gpio.txt | 18 +++++++++++=
+++++++
> > >  1 file changed, 18 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Do=
cumentation/devicetree/bindings/gpio/gpio.txt
> > > index 68d28f62a6f4..5dbacc8f094a 100644
> > > --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> > > +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> > > @@ -227,6 +227,24 @@ Example of two SOC GPIO banks defined as gpi=
o-controller nodes:
> > >  		#gpio-cells =3D <2>;
> > >  	};
> > > =20
> > > +Usually the GPIO banks in SoCs are ordered, that is there is a d=
edicated "first
> > > +gpio bank". To fix this ordering in the device tree use aliases =
starting at 0
> > > +(even if the first bank is called "GPIO1" in the hardware refere=
nce).
> > > +This is necessary/handy to ensure deterministical numbering of G=
PIOs and GPIO
> > > +controllers.
> >=20
> > Why is deterministic numbering needed?
>=20
> in my case (with a pre 4.8 kernel) it's to control GPIO48 with
> /sys/class/gpio/gpio48. But also when using the gpio chardev device
> (that will hit 4.8-rc1 AFAIK) there is one device file per gpio chip.
>=20
> Now consider a user who wants to control/debug direction and value of
> GPIO48 (or GPIO2.16 for the chardev case). The strait forward approac=
h
> is to use /sys/class/gpio/gpio48 (or /dev/dontknowthename2 with offse=
t
> 16). I doubt there is a platform where it didn't work like this up to
> now and I'd consider it a userspace breakage to force the user to kno=
w
> that the 2nd gpio bank is located at address 0x53fd0000 and so to loo=
kup
> the gpio bank below /sys/bus/platform/devices/53fd0000.gpio/.
>=20
> On an i.MX25 device I currently see:
>=20
> root@hostname:/sys/bus/gpio/devices ls -l
> lrwxrwxrwx    1 root     root             0 Jul  5 20:52 gpiochip0 ->=
 ../../../devices/platform/soc/53f00000.aips/53f9c000.gpio/gpiochip0
> lrwxrwxrwx    1 root     root             0 Jul  5 20:52 gpiochip1 ->=
 ../../../devices/platform/soc/53f00000.aips/53fa4000.gpio/gpiochip1
> lrwxrwxrwx    1 root     root             0 Jul  5 20:52 gpiochip2 ->=
 ../../../devices/platform/soc/53f00000.aips/53fcc000.gpio/gpiochip2
> lrwxrwxrwx    1 root     root             0 Jul  5 20:52 gpiochip3 ->=
 ../../../devices/platform/soc/53f00000.aips/53fd0000.gpio/gpiochip3
>=20
> That is we have:
>=20
> 	Hardware name | software gpiochip
> 	    GPIO4     |      gpiochip0
> 	    GPIO3     |      gpiochip1
> 	    GPIO1     |      gpiochip2
> 	    GPIO2     |	     gpiochip3
>=20
> I bet that's the probe order because when sorted by address (and so
> by order in the device tree) we have exactly this ordering. (Compare
> with $(grep gpio@ arch/arm/boot/dts/imx25.dtsi).)
>=20
> For a new interface this is OK, still I predict users will complain i=
f
> the numbers used don't match naturally the hardware names. And IMHO t=
hey
> are right.
>=20
IMO the burden of doing such lookups should be put on the computer, not
the human who is using it. That's what computers are good at.
If aliases in DT are the wrong way to a straightforward numbering
scheme for use by humans, we should introduce a different way to achiev=
e
this.


Lothar Wa=C3=9Fmann
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
