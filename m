From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/6] ASoC: rockchip: add bindings for rk3399 i2s
Date: Thu, 18 Feb 2016 14:59:54 +0000
Message-ID: <20160218145954.GI7129@sirena.org.uk>
References: <1455673992-16469-1-git-send-email-jay.xu@rock-chips.com>
 <1455673992-16469-4-git-send-email-jay.xu@rock-chips.com>
 <20160217110306.GJ7544@sirena.org.uk>
 <20160218143702.GN9654@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fmvA4kSBHQVZhkR6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160218143702.GN9654@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "jianqun.xu" <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--fmvA4kSBHQVZhkR6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2016 at 08:37:02AM -0600, Rob Herring wrote:
> On Wed, Feb 17, 2016 at 11:03:06AM +0000, Mark Brown wrote:

> > As with the other patch I'd expect to see a matching driver update if
> > only for documentation purposes.

> Why? They match on the prior chip's compatible until there is some=20
> difference the driver needs to handle.

That then requires anyone using a compatible string to also know the
full set of other compatible strings that can be used for this device
and that they have to list the others too in the correct order which
isn't something the binding document tells them.  It also feels better
to record in the code how we think we should support the device when we
know it, seems more helpful.

--fmvA4kSBHQVZhkR6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWxdxpAAoJECTWi3JdVIfQTZ8H/Rjp3ZsLuV8tscbYsfZBaxZ9
w8ejqlpglE0pAj7mJnkk72Ks2xztRicIrXc7vN836RbmPE0WN9chmUJaKQu6gXPU
n6aOqmHrHO3o8UXjEmAnDdLOZsK0wJAg2UL5rvqHuRUs/lAqHU6UCovzlEyi2pYf
679B3oouwjQLcvyF7ylxSt5DHFM2h9TBDc5wqXQmzXg6sLeaLypDl2MnZHgAdlDy
A3UHuvL4vK9lBL8BjP7vzA0DFJX+zIIfUYGk+P7AQdYl4BPEtar5uyNwgRnS0wOm
3QPf48sig4Ige892dVzxswEzfwXB/+JaxkONE93S4kr0Jbob+7Jl6FipwU0Di5Q=
=3r2U
-----END PGP SIGNATURE-----

--fmvA4kSBHQVZhkR6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
