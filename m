From: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 7/7] watchdog: coh901327: make use of timeout-secs
 provided in devicetree
Date: Sat, 10 Feb 2018 09:54:06 +0100
Message-ID: <20180210085406.GA744@gmail.com>
References: <marcus.folkesson@gmail.com>
 <20180209192724.1227-1-marcus.folkesson@gmail.com>
 <20180209192724.1227-8-marcus.folkesson@gmail.com>
 <20180209225200.GI19627@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180209225200.GI19627-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 09, 2018 at 02:52:00PM -0800, Guenter Roeck wrote:
> On Fri, Feb 09, 2018 at 08:27:24PM +0100, Marcus Folkesson wrote:
> > watchdog_init_timeout() will allways pick timeout_param since it
> > defaults to a valid timeout.
> >=20
> > Following best practice described in
> > Documentation/watchdog/watchdog-kernel-api.txt to make use of
> > the parameter logic.
> >=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/watchdog/coh901327_wdt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/watchdog/coh901327_wdt.c b/drivers/watchdog/coh901=
327_wdt.c
> > index 4410337f4f7f..437f865e5c6b 100644
> > --- a/drivers/watchdog/coh901327_wdt.c
> > +++ b/drivers/watchdog/coh901327_wdt.c
> > @@ -67,7 +67,7 @@
> >  #define U300_WDOG_IFR_WILL_BARK_IRQ_FORCE_ENABLE			0x0001U
> > =20
> >  /* Default timeout in seconds =3D 1 minute */
> > -static unsigned int margin =3D 60;
> > +static unsigned int margin;
> >  static int irq;
> >  static void __iomem *virtbase;
> >  static struct device *parent;
>=20
> I would suggest to initialize .timeout in 'static struct watchdog_device
> coh901327_wdt', and drop the error check when calling watchdog_init_timeo=
ut().

Will do, thank you.

>=20
> Guenter


Best regards
Marcus Folkesson

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAlp+sykACgkQiIBOb1ld
UjJ+FBAA21rpPiBqvFc1Z82UBlfZjBSHVKaLyn1u3pX/Bbkk5Nkfmll+33Y0Yvwb
AarNoMnan6d2pLBzcS6OtDw1iENGrob63f+uZ6XpTsHXZGkNOirpTJJPI6gnYQw6
qxeOCaegsLN34aKw7tyICEboIxFqjAwBcSsKdBY100K7mkOfI8mggJKttgfl0FIO
lxwv0dzdklyxN5SnFJxefshzIwycqqPseJ7YoeFJX62EWadXZZ0PTbuMXc7d39bM
ji/uU9Y+tAlZOHQ0+aMU9x3WlGjQWkYbMBy5M0hXeEZwhR6sK3CxgpS6MPaoj7Bh
RGjj1/TAs/VHHGwoXUa8u0jV5ZobXwWbfHT5ScB9bwTodBFUTKyTBZ0SdI1wakMd
EvAIlgHp0LwzDKqYhEKGhTIbCfSy2/1GOrA264b2ABit7C6sN/OVN80rdECUKRA/
3qCCLj9N7RqfW0QwHaaMpMhB+kzEm5pY6eGHy+LgO+sTSvroSKvUZ0/8y9LXHuoL
kqb7Vt1MgBjlX1u2oN+/svvgR2jBsf2s/8yZ1IuwhwaO59qFyPxgd31VBEiEUUUN
CdXxYF2Zs2FlqyX7WtedKt0JAv8ELV1dSurTS+4QkeLkUkefUFJyydMFXTWH44KV
2hV+Q6WcaK43LElvAYkHbwgoX5C2E8J3WGR5aV/X59SMWMFsWNw=
=McuB
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
