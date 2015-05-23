From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v8 14/16] ARM: dts: Introduce STM32F429 MCU
Date: Sat, 23 May 2015 10:28:20 +0200
Message-ID: <20150523082820.GK8557@lukather>
References: <1431158038-3813-1-git-send-email-mcoquelin.stm32@gmail.com>
 <2282066.NWoIT9ZyLc@wuerfel>
 <CALszF6CaO_yuNiSDuDV+4d2NRe_+32j=zcSE1HPhB1UH59cW9w@mail.gmail.com>
 <13641152.Yt4ZI3oT6L@wuerfel>
 <CALszF6CK5ezrO6D=4zr6zEPC7VanzbQjnZJwKOZekEZ5L4D-Dg@mail.gmail.com>
 <20150521185122.GD8557@lukather>
 <CALszF6BuvTf86k6S5UEYZs-DJSTehy=+Csb3c6jxMU90MN05zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vTfKKTivj/mQoluA"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALszF6BuvTf86k6S5UEYZs-DJSTehy=+Csb3c6jxMU90MN05zw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Arnd Bergmann <arnd@arndb.de>, Philipp Zabel <p.zabel@pengutronix.de>, Daniel Thompson <daniel.thompson@linaro.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>, Peter Meerwald <pmeerw@pmeerw.net>, Paul Bolle <pebolle@tiscali.nl>, Peter Hurley <peter@hurleysoftware.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Russell King <linux@arm.linux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Joe Perches <joe@perches.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar
List-Id: devicetree@vger.kernel.org


--vTfKKTivj/mQoluA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On Thu, May 21, 2015 at 10:10:35PM +0200, Maxime Coquelin wrote:
> > The only thing we did that stands out a bit is that we actually need
> > the reset driver much earlier than the default probe, since some of
> > our timers are maintained in reset. We have some code to do just that
> > already, we just need have something similar to be on board.
>=20
> We have the same problem on stm32, as just discussed with Andreas [0].
> I decided to patch the bootloader to deassert timers reset, after
> discussions with Rob Herring and Arnd.

That seems like the best solution, but we don't have control over the
bootloader in most cases. We have an alternative implementation (ie
mainline u-boot) that is required for a few things already, but I'd
really like to still be able to at least boot the kernel on a "legacy"
bootloader (that is the one flashed on the device).

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--vTfKKTivj/mQoluA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVYDokAAoJEBx+YmzsjxAgEGEQAJs6k5ZHhGXToxmDcmeAcETQ
0rKh8OUJE5ZVP4ta18lDqPDIvJMDVvW8RTTH/usC/wI+plEJEwEux0K+kMeKGciA
ZCPsXrNnfuc3rj1LeqqXTYRvWOf2q/9wXpFUzL4c7P18i+YnpJXPEJNrWi1zqvoo
TUJtEN3lKhg6/xZsKunpRsaQHlHgPuXTJCSISaSBbMfoWcXGUuGEMphi5N1R7cck
oWK5Vsfzk/tPmOym+U4I0Bkv8UkpCMtv5/jCDj2Z7Cz0Le50/+qpuTZlu1UUGYav
K+C80ndIKBZXvICgxNUh3Ev9NEKiBTSf4HDKxlYX2stMxmkDFMK7uyp8i3defGFP
pxHKjTh4imaEBM5/maa0p9b8KUmy97D2hnmZ+AjytkYEgZcNGEz1IkKq+f52Gs6t
Y/FPuRVZc2OUjaViu7YXeHOIibklrgSwh9UgDf/OAtzDSa0FyKaCRT6DxW7IyoXe
gJ/DY2k0RSSIfk8mjhzCTd9YczTr89JbgXABTbiXbh4cZPQMSyP7hqCyyKJOkktL
CzjOCIZJvEiPVmyXeUwtE3yApUDvXLYFlN3DQ+nyeV8rE34gMiNyyn4NufhMasJv
C/XoNCOgcH6+gKmEY17Gqxs8cJruf00HJSV5M5yCYYzo+vCZd7THE0JCqR0x4rWJ
19tvvVkOVER/CxaZsPC2
=fdOQ
-----END PGP SIGNATURE-----

--vTfKKTivj/mQoluA--
