From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] gpio: document how to order GPIO controllers
Date: Tue, 5 Jul 2016 20:04:47 +0200
Message-ID: <20160705180447.GP16643@pengutronix.de>
References: <1467355333-8813-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20160705140546.GA10601@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160705140546.GA10601@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, kernel@pengutronix.de, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 05, 2016 at 09:05:46AM -0500, Rob Herring wrote:
> On Fri, Jul 01, 2016 at 08:42:13AM +0200, Uwe Kleine-K=F6nig wrote:
> > This uses the same approach that is already used for spi, i2c and
> > several other controllers to ensure a consistent numbering independ=
ent
> > of probe order. This is in use for several gpio drivers that alread=
y now
> > use of_alias_get_id(np, "gpio").
>=20
> Like SPI and I2C, I'm against further abuse of aliases for this purpo=
se=20
> [1].

I considered spi and i2c the good examples here :-|

> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > Hello,
> >=20
> > Linus requested such a patch as part of a change that introduces
> > this mechanism to the gpio-omap driver[1]. IMHO this is better done=
 in a
> > separate patch, so here it comes.
> >=20
> > Best regards
> > Uwe
> >=20
> > [1] http://thread.gmane.org/gmane.linux.kernel.gpio/17399/focus=3D1=
7629
> >=20
> >  Documentation/devicetree/bindings/gpio/gpio.txt | 18 +++++++++++++=
+++++
> >  1 file changed, 18 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Docu=
mentation/devicetree/bindings/gpio/gpio.txt
> > index 68d28f62a6f4..5dbacc8f094a 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> > +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> > @@ -227,6 +227,24 @@ Example of two SOC GPIO banks defined as gpio-=
controller nodes:
> >  		#gpio-cells =3D <2>;
> >  	};
> > =20
> > +Usually the GPIO banks in SoCs are ordered, that is there is a ded=
icated "first
> > +gpio bank". To fix this ordering in the device tree use aliases st=
arting at 0
> > +(even if the first bank is called "GPIO1" in the hardware referenc=
e).
> > +This is necessary/handy to ensure deterministical numbering of GPI=
Os and GPIO
> > +controllers.
>=20
> Why is deterministic numbering needed?

in my case (with a pre 4.8 kernel) it's to control GPIO48 with
/sys/class/gpio/gpio48. But also when using the gpio chardev device
(that will hit 4.8-rc1 AFAIK) there is one device file per gpio chip.

Now consider a user who wants to control/debug direction and value of
GPIO48 (or GPIO2.16 for the chardev case). The strait forward approach
is to use /sys/class/gpio/gpio48 (or /dev/dontknowthename2 with offset
16). I doubt there is a platform where it didn't work like this up to
now and I'd consider it a userspace breakage to force the user to know
that the 2nd gpio bank is located at address 0x53fd0000 and so to looku=
p
the gpio bank below /sys/bus/platform/devices/53fd0000.gpio/.

On an i.MX25 device I currently see:

root@hostname:/sys/bus/gpio/devices ls -l
lrwxrwxrwx    1 root     root             0 Jul  5 20:52 gpiochip0 -> .=
=2E/../../devices/platform/soc/53f00000.aips/53f9c000.gpio/gpiochip0
lrwxrwxrwx    1 root     root             0 Jul  5 20:52 gpiochip1 -> .=
=2E/../../devices/platform/soc/53f00000.aips/53fa4000.gpio/gpiochip1
lrwxrwxrwx    1 root     root             0 Jul  5 20:52 gpiochip2 -> .=
=2E/../../devices/platform/soc/53f00000.aips/53fcc000.gpio/gpiochip2
lrwxrwxrwx    1 root     root             0 Jul  5 20:52 gpiochip3 -> .=
=2E/../../devices/platform/soc/53f00000.aips/53fd0000.gpio/gpiochip3

That is we have:

	Hardware name | software gpiochip
	    GPIO4     |      gpiochip0
	    GPIO3     |      gpiochip1
	    GPIO1     |      gpiochip2
	    GPIO2     |	     gpiochip3

I bet that's the probe order because when sorted by address (and so
by order in the device tree) we have exactly this ordering. (Compare
with $(grep gpio@ arch/arm/boot/dts/imx25.dtsi).)

=46or a new interface this is OK, still I predict users will complain i=
f
the numbers used don't match naturally the hardware names. And IMHO the=
y
are right.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
