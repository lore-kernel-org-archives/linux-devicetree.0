From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 3/5] iio: adc: sun4i-gpadc-iio: add support for H3
 thermal sensor
Date: Mon, 24 Jul 2017 10:29:38 +0200
Message-ID: <20170724082938.vsq3zd22vb6lqvu3@flea>
References: <20170723141354.42646-1-icenowy@aosc.io>
 <20170723141354.42646-4-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="w7qg7zijr6l4yjzz"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170723141354.42646-4-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--w7qg7zijr6l4yjzz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 23, 2017 at 10:13:52PM +0800, Icenowy Zheng wrote:
> This adds support for the Allwinner H3 thermal sensor.
>=20
> Allwinner H3 has a thermal sensor like the one in A33, but have its
> registers nearly all re-arranged, sample clock moved to CCU and a pair
> of bus clock and reset added. It's also the base of newer SoCs' thermal
> sensors.
>=20
> Some new options is added to gpadc_data struct, to mark the difference
> between the old GPADCs and THS's and the new THS's.
>=20
> Thermal sampling via interrupts are still not supported, and polling
> is used instead.
>=20
> The thermal sensors on A64 and H5 is like the one on H3, but with of
> course different formula factors.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

Could you split it in half? One patch that would rework the existing
code, the other one adding the H3 support?

That's going to be much easier to review, bisect and revert if need be
that way.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--w7qg7zijr6l4yjzz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZda/yAAoJEBx+YmzsjxAg/6QP/ApIELNPFnrdWqaedOyTJ0/e
vvyBpxgyPaEzlrd4vzS9GAuGBfoKCwgfyn+in/MTVwygTPb2vZJqXywSKMJGkJAY
g85iIT4Oz6cARBMU+p8ZF6Xxu1rkxvTtP030fLIfR8cJfYVxvhuh1Yh6v6XvRZGd
KSsZ3pWAoPtMyrA7al2aSpA9zkfCJ1wnb5G7FQPEacyqqbyhXEK3ig2Ch7fXP1YN
hqIQ8fACmgr6v+JCjTNSRKV70WYqt7T0APsTTen5JkdttREMlGtO2eDY11Ur8ePP
DQ5jU+AM/9kiiVVCPxCHGBaaTuqprrMoh+AX3gl9VQi9QFoA5guGFgj6t4eJcMJv
lqHEJSiTRZgtQI7QCX7PcpAoDC+HPcVHoQB7yvg+00HKtEyYS2W7jVzJTMwZs9T6
XSNFoNOrrggqc+FpOHBDPD21iQPyC7UihKf2uOZXIcDVzwzCqqzPvafg5YSUDwW6
XgitrYQB3nwAMjAuGUYoUqD5679YREv/7LalMs65xQ2m52fkhPnfbbX50asJVbdf
nC2etuhMj5j9CJgLBR3koGnJFkDy1POvxWkEOc+FUorQBhHeX6/ORlI5249VnTi7
JNew4dDMBJwBlJlAo7HhFtl6vYxMkPFl6COdP9yFzoai2myvEc/MOeIA+k5VXoD5
YdlDck/VK6y1T7Oaw0Z9
=Oj44
-----END PGP SIGNATURE-----

--w7qg7zijr6l4yjzz--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
