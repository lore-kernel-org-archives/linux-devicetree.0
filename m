From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] clocksource: sunxi: Add new compatibles
Date: Tue, 4 Feb 2014 09:41:17 +0100
Message-ID: <20140204084117.GG25625@lukather>
References: <1391348280-9484-1-git-send-email-maxime.ripard@free-electrons.com>
 <52EFC573.2050302@linaro.org>
 <20140203194505.GF25625@lukather>
 <CAL_JsqJuSS1Hh8Fb26PMKBB_uKmLuiqnZJjz0zvt1Ux7P8cCzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ulDeV4rPMk/y39in"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJuSS1Hh8Fb26PMKBB_uKmLuiqnZJjz0zvt1Ux7P8cCzw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ulDeV4rPMk/y39in
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Mon, Feb 03, 2014 at 02:11:28PM -0600, Rob Herring wrote:
> On Mon, Feb 3, 2014 at 1:45 PM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > Hi Daniel,
> >
> > (Adding DT mailing-list in CC)
> >
> > On Mon, Feb 03, 2014 at 05:36:03PM +0100, Daniel Lezcano wrote:
> >> On 02/02/2014 02:37 PM, Maxime Ripard wrote:
> >> >The Allwinner A10 compatibles were following a slightly different com=
patible
> >> >patterns than the rest of the SoCs for historical reasons. Add compat=
ibles
> >> >matching the other pattern to the timer driver for consistency, and k=
eep the
> >> >older one for backward compatibility.
> >>
> >> Hi Maxime,
> >>
> >> is it really needed to keep the old pattern ?
> >
> > We agreed during the ARM Kernel Summit to consider the DT as a stable
> > ABI.
> >
> > While I'd be ok with removing the older ones, that also means that we
> > would break the boot of newer kernels with older DT, so yes, we
> > actually need to keep the old compatibles.
>=20
> It all depends if that would really cause problems for a given
> platform. So if Allwinner DT support is a moving target, then changing
> is probably okay. For example, if anyone using the platform is going
> to need to update their DTB to add more nodes to get various features
> anyway, then breaking it is not all that important.

We keep adding new stuff to the DT, yes, so I guess we can be
considered a moving target. Thanks for your input!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ulDeV4rPMk/y39in
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJS8KesAAoJEBx+YmzsjxAgjh0P/j78tYmvA41FFxtbIGKxwjbE
NH5hSewvZAbt3c0rUqHABvGgQEG+1DwflsRr+eT48UcSHd/t8wmf4f2uFumJpnuQ
VrK155mDSCbiIZhbRQwoLLrF5g2gVWLyna83BsxKghY/O3/HJhn0l2N7XXODYKmG
HsKR3vHdZhewAA1xfrIOqfdQZ6OCc7lC6k8S/CWlPSlfE/zF3YG6Q9Q6MTEUzL4z
vYG/vvaxO7FPzj7m1gCqQVjJRiXAyqLQRATeCoKmoVnOaXeVH2qrTNlCzVjhhcQY
S8Fssdvs9OxFkMTK80l9xgNS7ykp4waJgho+Ycjq7/44CHKzeV+egsdsUAG0TU5z
1g+U8aWr6wOoDbzhm84NMGf+YvpZrbs0QgGlXa+dm8gFjlGzQRDT6JynpleB1dp2
rWtdTWG5VZ1z/+YEz46KKC8FKpskTCYCGI7NVrmLCVFdI/pZMWWePG4nvzoOP6HA
FDzuoU0bljiqAnENwEBxMvufICDY9BH4cmUB341m1g2tzOJk3tj0EED2CHNhYE7S
J/bwaO8ZhFpKP1XCobz+DpRw2tSlSzJdIhuu8vmxB+2I7NmgjEcZP54GoXoneIjt
waNi66lZGpYQbuYhZonelOlTmEwPje2YZM8sGUIDOMJN3C4YwCmWcyQz7MsSZEq7
Myt97wyM9W643sqH5ZE2
=4DWE
-----END PGP SIGNATURE-----

--ulDeV4rPMk/y39in--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
