From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 1/3] gpio: Use __gpiod_request directly
Date: Thu, 24 Sep 2015 09:02:57 +0200
Message-ID: <20150924070257.GU32203@pengutronix.de>
References: <1440920686-6892-1-git-send-email-mpa@pengutronix.de>
 <1440920686-6892-2-git-send-email-mpa@pengutronix.de>
 <CAAVeFuJPzjJ6td9UZ993sbfOyEOo=7WVu-Y2KnFgXewyt_8knA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Wlbg71WMOPzcvmIn"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAVeFuJPzjJ6td9UZ993sbfOyEOo=7WVu-Y2KnFgXewyt_8knA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arun Bharadwaj <arun-EiDWdcs9+yZBDgjK7y7TUQ@public.gmane.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris R <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--Wlbg71WMOPzcvmIn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 23, 2015 at 01:25:28PM +0900, Alexandre Courbot wrote:
> On Sun, Aug 30, 2015 at 4:44 PM, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wro=
te:
> > There is no reason to find out chip and hwnum to use to request a gpio
> > and get another gpio descriptor. We already have the descriptor we want
> > to use so we can directly use it.
> >
> > Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >  drivers/gpio/gpiolib.c | 17 ++++++-----------
> >  1 file changed, 6 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 79a0b41ce57b..872fdd3617c1 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -2189,25 +2189,20 @@ EXPORT_SYMBOL_GPL(__gpiod_get_index_optional);
> >  int gpiod_hog(struct gpio_desc *desc, const char *name,
> >               unsigned long lflags, enum gpiod_flags dflags)
> >  {
> > -       struct gpio_chip *chip;
> > -       struct gpio_desc *local_desc;
> > -       int hwnum;
> >         int status;
> >
> > -       chip =3D gpiod_to_chip(desc);
> > -       hwnum =3D gpio_chip_hwgpio(desc);
> > -
> > -       local_desc =3D gpiochip_request_own_desc(chip, hwnum, name);
> > -       if (IS_ERR(local_desc)) {
> > +       status =3D __gpiod_request(desc, name);
> > +       if (status) {
> >                 pr_err("requesting hog GPIO %s (chip %s, offset %d) fai=
led\n",
> > -                      name, chip->label, hwnum);
> > -               return PTR_ERR(local_desc);
> > +                      name, gpiod_to_chip(desc)->label,
> > +                      gpio_chip_hwgpio(desc));
> > +               return status;
> >         }
> >
> >         status =3D gpiod_configure_flags(desc, name, lflags, dflags);
> >         if (status < 0) {
> >                 pr_err("setup of hog GPIO %s (chip %s, offset %d) faile=
d\n",
> > -                      name, chip->label, hwnum);
> > +                      name, gpiod_to_chip(desc)->label, gpio_chip_hwgp=
io(desc));
> >                 gpiochip_free_own_desc(desc);
>=20
> Mmm I should have reviewed this patch earlier, but what bothers me a
> bit is that it breaks the symetry that we had by calling
> request_own_desc() and free_own_desc() in the failing case (as well as
> in gpiochip_free_hogs). And in the end you still need to call
> gpiod_to_chip() so I am not sure what the benefit is.

gpiod_to_chip() is only called for errors after this patch. It just
seemed to me as random reader of the code that using
gpiochip_request_own_desc() could be simplified by using __gpiod_request().

>=20
> Sure, the code is less verbose, but at the same time it has become
> slightly harder to understand. Semantically speaking
> "request_own_desc()" is exactly the action we want to convey.
> __gpiod_request() is more ambiguous.

At least for me this is slightly better to read as it removes some
unnecessary lines. But that is probably subjective and depends on the way
someone reads code.

Best Regards,

Markus

>=20
> Note that this is not a reject, I just wanted to stress that "less
> code" is not necessarily the same as "easier to read".

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--Wlbg71WMOPzcvmIn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWA6AhAAoJEEpcgKtcEGQQ+40QAIPjls6NdNKCYqLn2Bb+7UWX
RYKcVET6FyPBkN3lI1JLWDAx1hQvssxeHaB7FAm80Z36cAsnfnxRFSCCCsqZie2S
H9BUVqigXGUdkxrd2MSdjNjjTZKxI3t+xUxZ2QdCI4N1Uc7K2H5tyn6uzp/59IU6
zQ4FFOoq8C+j56Y5KqcFREgSYEn8D5gO3C8j04yj459O3etCjy1gkNHVxAS5O4QE
2+eVRue/Dhb332uuHeMXaOcsl4L0Ou6ainRPtUBgmRXda2mZNviXwcO1zv5klvYU
d36YlBxC1muvW/o/zePA8duH7KT990yXy+RY2pnTGgtC1YrAtW51/rgO1vmadzf6
8qg1VDSz6rsdLWPyhI0gsgQZ0mTfsGI/wVJTW+xg6wHamtJIXcaAXEiljSRaswm6
zE/KZPZFHEvepGmD6UchgwAmbK3aa+K05gCgXG94bdaYZEre7gl3b+s1ZedBkek8
gewQPFW+8FUMqHpHnlGnXjtaTJtBUnPVK4DDdG2C6/SSmPzWm3ymMDNCTNpTI2Gc
zkSUFaoZlx+2ziPJ6Up4bIjk3BQGzAU4K2ympY34Y/UVEF/qTPk4+51F576hTGWc
QVQeHKKg35i+ObCpvkIae/vSto8TPp63OmFgFp+H0hg+78/6sUF4BMeUXG5ctLqr
9qib7rjAqBw3azAoQsA6
=mdd7
-----END PGP SIGNATURE-----

--Wlbg71WMOPzcvmIn--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
