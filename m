From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: irq: Export of_irq_count()
Date: Mon, 3 Apr 2017 18:29:00 +0200
Message-ID: <20170403162900.GA20719@ulmo.ba.sec>
References: <20170403155547.19917-1-thierry.reding@gmail.com>
 <CAL_JsqLGUuJZ6E3W+DXumtAfxtVPG8myqkZs7YL_KFc+RLgGGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLGUuJZ6E3W+DXumtAfxtVPG8myqkZs7YL_KFc+RLgGGw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2017 at 11:13:43AM -0500, Rob Herring wrote:
> On Mon, Apr 3, 2017 at 10:55 AM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > of_irq_count() is handy for obtaining the number of interrupts assigned
> > to a device tree node. It is reasonable to want to access this function
> > from loadable modules, so export the symbol to allow that.
> >
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > Hi Rob, Frank,
> >
> > This patch is required for the new Tegra186 GPIO driver I'm trying to
> > get merged for v4.12. It'd be great if I could get an Acked-by from you
> > so that the patch can be merged through the GPIO tree along with a few
> > other prerequisites for the new driver.
>=20
> Use platform_irq_count instead.

Nice, that's much better.

Thanks,
Thierry

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljieEwACgkQ3SOs138+
s6GPjQ/+IZhVZ73eUFCZAdv4R/p3tVaWACafhRlwRZQ2bvG2tfjJoHgBN9Mf5m/0
1VEc1NoVxSUJC7lAmCP/oqrqvSkXj221Mta1u/nMeEBmmo0/cfkat+SzdHiTU4r9
lrhLsKEMepT/8MEsFxQeBQSoWqrHeYF/gbA4GTRyPNuITQRRh9xtRaYp7hFHcqD+
lORLXC0JHZ8xdPpRh/8m1rZoi7kWR6rVaHxn8wxnp5qBIV4NZ5/g/40RnF1cRqDk
QwJZ1CK/gAe1p7NLRxkac1fdgZA+VhWy3Ii3rtl6KUt+3b+0fBtetMhK8Tt9G7KZ
ItfmEBynzmrYEjjapmc75/4Q4VEUAHy9Efg3IVreaXEPVVynXibabWWl1LfwDw7R
InbV0xxqDG7Qjr15Gz7r+20MHC9ngppB7lt8FX8imqo265f4n21922Zq8R7QNtoN
9CJzg63BPydMLEUz3bjyFbbH2Hbcn4FSmtIF+eaYSaxSx99KGTfM5TakClyO9VDC
07Us26nKHIdeEjfUptmaCbImSWcuDhgbhRihtt8wvxS5xnlk/OKEnVQatyoG9x+q
509j65RVH9NxZdI6912jg6620tFUknKOXEtYsqq5T+r9FN/rULDiZ1t0i8CIbdfK
NLRfF71Zm8A5UbUvvkRTmFEUGSAUC3tRHy9FdM0/VzWx+He6Rw8=
=W7JT
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
