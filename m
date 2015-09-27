From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 1/3] gpio: Use __gpiod_request directly
Date: Sun, 27 Sep 2015 16:32:09 +0200
Message-ID: <20150927143209.GE19121@pengutronix.de>
References: <1440920686-6892-1-git-send-email-mpa@pengutronix.de>
 <1440920686-6892-2-git-send-email-mpa@pengutronix.de>
 <CAAVeFuJPzjJ6td9UZ993sbfOyEOo=7WVu-Y2KnFgXewyt_8knA@mail.gmail.com>
 <CACRpkdaBxAhWKnJ3vsd+K6xMgaym7D9M0zTEMu_=fmiUNpxTEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="84ND8YJRMFlzkrP4"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaBxAhWKnJ3vsd+K6xMgaym7D9M0zTEMu_=fmiUNpxTEA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arun Bharadwaj <arun-EiDWdcs9+yZBDgjK7y7TUQ@public.gmane.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris R <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--84ND8YJRMFlzkrP4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 24, 2015 at 10:49:57AM -0700, Linus Walleij wrote:
> On Tue, Sep 22, 2015 at 9:25 PM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wro=
te:
> > On Sun, Aug 30, 2015 at 4:44 PM, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> w=
rote:
> >> There is no reason to find out chip and hwnum to use to request a gpio
> >> and get another gpio descriptor. We already have the descriptor we want
> >> to use so we can directly use it.
> >>
> >> Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >> ---
> >>  drivers/gpio/gpiolib.c | 17 ++++++-----------
> >>  1 file changed, 6 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> >> index 79a0b41ce57b..872fdd3617c1 100644
> >> --- a/drivers/gpio/gpiolib.c
> >> +++ b/drivers/gpio/gpiolib.c
> >> @@ -2189,25 +2189,20 @@ EXPORT_SYMBOL_GPL(__gpiod_get_index_optional);
> >>  int gpiod_hog(struct gpio_desc *desc, const char *name,
> >>               unsigned long lflags, enum gpiod_flags dflags)
> >>  {
> >> -       struct gpio_chip *chip;
> >> -       struct gpio_desc *local_desc;
> >> -       int hwnum;
> >>         int status;
> >>
> >> -       chip =3D gpiod_to_chip(desc);
> >> -       hwnum =3D gpio_chip_hwgpio(desc);
> >> -
> >> -       local_desc =3D gpiochip_request_own_desc(chip, hwnum, name);
> >> -       if (IS_ERR(local_desc)) {
> >> +       status =3D __gpiod_request(desc, name);
> >> +       if (status) {
> >>                 pr_err("requesting hog GPIO %s (chip %s, offset %d) fa=
iled\n",
> >> -                      name, chip->label, hwnum);
> >> -               return PTR_ERR(local_desc);
> >> +                      name, gpiod_to_chip(desc)->label,
> >> +                      gpio_chip_hwgpio(desc));
> >> +               return status;
> >>         }
> >>
> >>         status =3D gpiod_configure_flags(desc, name, lflags, dflags);
> >>         if (status < 0) {
> >>                 pr_err("setup of hog GPIO %s (chip %s, offset %d) fail=
ed\n",
> >> -                      name, chip->label, hwnum);
> >> +                      name, gpiod_to_chip(desc)->label, gpio_chip_hwg=
pio(desc));
> >>                 gpiochip_free_own_desc(desc);
> >
> > Mmm I should have reviewed this patch earlier, but what bothers me a
> > bit is that it breaks the symetry that we had by calling
> > request_own_desc() and free_own_desc() in the failing case (as well as
> > in gpiochip_free_hogs). And in the end you still need to call
> > gpiod_to_chip() so I am not sure what the benefit is.
> >
> > Sure, the code is less verbose, but at the same time it has become
> > slightly harder to understand. Semantically speaking
> > "request_own_desc()" is exactly the action we want to convey.
> > __gpiod_request() is more ambiguous.
> >
> > Note that this is not a reject, I just wanted to stress that "less
> > code" is not necessarily the same as "easier to read".
>=20
> OK I dropped this patch for now.
>=20
> Markus can you live without this patch for 2/3 and 3/3?

Yes, that's fine. I will remove it and rebase the others.

Best Regards,

Markus

>=20
> Yours,
> Linus Walleij
>=20

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--84ND8YJRMFlzkrP4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWB/3pAAoJEEpcgKtcEGQQnzUP/1Zp4x3/HjQ0YaAJaDPWaiYf
DIBHBQVjZ6tHe8aXOIkCY0HgAwZ32C8Av7EA5AEW4RZY4y1N81n7tIeLCd2c6e3H
D6Is/omqBztEx3dJGL0lU1n+8brWxHA9fTyMxW9rJZ4DlfaiN3KN4y3hkP1RC+Hm
R03yWiUts3ztzxN/jG7XIoCVyCDrvUP6l1ruItGgQ/Nt5R5fTuhb0Uj623fKtvMN
JT190ZcUQlJrykT2IAahNWsuBWeas5d1YTA38viPF5X9hUhd/eX2IYQ0h0QnSWRx
z6DC1+IO+O6XBu3Mp6kIIVLr3uv8xWljq5l6I3IUMbsDBchMfd3FSU10AuP4fH/d
cR/V91Idu8bKBdFzvwfx0EqaRaTCm/LskJG5c/VnIgIZ0ni3r6iTvqCTp41YG/1F
3IibY+KYLlx7bjgeobWre75yuS6mEdLd5R5RRaz8Oev5sVP+dY7EsQ21pD1gu+gu
+g7bO4VVfm0037HS2D7MZilHGoWMQm6LS4yElNJGgbCs1DWa5qH/l0jGprcwAjZP
yxuI+X8ZgY9PiM+WvnuAyL+KAf1UL44bbmPIaDeMezPYasEgkJ0U7jN3bG4Qqd5V
t2IUrrwXxDqkBACA79mlbLBPLhyUuh7S0QAN+SrB1ZPAgTh6diJGk4L2k0Acg/as
b9xqyZrGlexec8NEyyP1
=8ZHp
-----END PGP SIGNATURE-----

--84ND8YJRMFlzkrP4--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
