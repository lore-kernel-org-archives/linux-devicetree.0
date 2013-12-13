From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx53: add support for Ka-Ro TX53 modules
Date: Fri, 13 Dec 2013 13:42:40 +0100
Message-ID: <20131213134240.595d27ae@ipc1.ka-ro>
References: <1386852128-32220-1-git-send-email-LW@KARO-electronics.de>
	<20131213081744.GR18380@S2101-09.ap.freescale.net>
	<20131213105417.71a42133@ipc1.ka-ro>
	<20131213121646.GU18380@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131213121646.GU18380-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Shawn Guo wrote:
> On Fri, Dec 13, 2013 at 10:54:17AM +0100, Lothar Wa=C3=9Fmann wrote:
> > > > +		compatible =3D "pwm-backlight";
> > > > +		pwms =3D <&pwm2 0 500000>;
> > > > +		power-supply =3D <&reg_3v3>;
> > > > +		brightness-levels =3D <
> > > > +			100 99 98 97 96 95 94 93 92 91
> > > > +			 90 89 88 87 86 85 84 83 82 81
> > > > +			 80 79 78 77 76 75 74 73 72 71
> > > > +			 70 69 68 67 66 65 64 63 62 61
> > > > +			 60 59 58 57 56 55 54 53 52 51
> > > > +			 50 49 48 47 46 45 44 43 42 41
> > > > +			 40 39 38 37 36 35 34 33 32 31
> > > > +			 30 29 28 27 26 25 24 23 22 21
> > > > +			 20 19 18 17 16 15 14 13 12 11
> > > > +			 10  9  8  7  6  5  4  3  2  1
> > > > +			  0
> > >=20
> > > Why is it so unique to start with 100 and end with 0?  Does it ev=
en
> > > work?  Here is what I read from bindings doc.
> > >=20
> > Yes, it works. The backlight control of the displays we typically u=
se
> > is active low. This is a poor man's way to get an inverted PWM outp=
ut!
> > (And one in which the number written to the sysfs file corresponds =
to
> > the actual duty cycle of the PWM output)
>=20
> I think Linux pwm driver should be improved for this case rather than
> manipulate device tree in a way that violate the defined bindings.
>
I admit I would be happier with a 'polarity' flag like other PWM
drivers provide it. I tried to add polarity support in the generic PWM
layer, so that all HW drivers that do not support inversion in HW can
make use of it, but this gives problems with client drivers that don't
know about the inversion and disable the PWM when the duty cycle is set
to 0.
Maybe I'll find some time to find a proper solution for this issue.


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org
___________________________________________________________
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
