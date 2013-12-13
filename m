From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx53: add support for Ka-Ro TX53 modules
Date: Fri, 13 Dec 2013 14:23:45 +0100
Message-ID: <20131213142345.414344a6@ipc1.ka-ro>
References: <1386852128-32220-1-git-send-email-LW@KARO-electronics.de>
	<20131213081744.GR18380@S2101-09.ap.freescale.net>
	<20131213105417.71a42133@ipc1.ka-ro>
	<20131213121646.GU18380@S2101-09.ap.freescale.net>
	<20131213134240.595d27ae@ipc1.ka-ro>
	<20131213125719.GM24559@pengutronix.de>
	<20131213141001.389a178e@ipc1.ka-ro>
	<20131213131507.GN24559@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131213131507.GN24559-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Sascha Hauer wrote:
> On Fri, Dec 13, 2013 at 02:10:01PM +0100, Lothar Wa=C3=9Fmann wrote:
> > Hi,
> >=20
> > Sascha Hauer wrote:
> > >=20
> > > Actually the i.MX supports inversion in hardware. It's bit 18 in =
the
> > > PWMCR register.
> > >=20
> > I totally missed this up to now. :(
> > Is it true for all i.MX SoCs? Or do we need to distinguish between =
SoCs
> > that can do the inversion and those that cannot?
>=20
> It should work for >=3D i.MX27.
>=20
OK, thanks.

> > I could provide a patch to utilize this feature, but probably not
> > before the new year. There is something called 'vacation' in the wa=
y. ;)
>=20
> What's the problem? That's the time your boss can't tell you to do
> soemthing else ;)
>=20
Somewhere in the world are still places where there is no internet and
no computers. ;)


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
