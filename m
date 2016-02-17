From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] spi/rockchip: Add dt-binding for Rockchip rk3399 spi
Date: Wed, 17 Feb 2016 10:53:40 +0000
Message-ID: <20160217105340.GI7544@sirena.org.uk>
References: <1455614538-4415-1-git-send-email-jay.xu@rock-chips.com>
 <1730751.NYv1NxJVuB@phil>
 <56C3BD26.3030704@rock-chips.com>
 <4579617.rz6Yi2sU5M@phil>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MFZs98Tklfu0WsCO"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4579617.rz6Yi2sU5M@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--MFZs98Tklfu0WsCO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 17, 2016 at 07:45:09AM +0100, Heiko Stuebner wrote:

> That was meant as a reply to Mark's comment, explaining why the double=20
> compatible and the driver only binding to the rk3066-one right now.

It's still better to have the compatible explicitly listed in the
driver even if it doesn't change the configuration at all at this time.
That way we've at least got a record that the handling is currently
identical to whatever other devices it is the same as.

--MFZs98Tklfu0WsCO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWxFEzAAoJECTWi3JdVIfQpSMH/iIQEMaBTr073bYABr7CUWTB
vSenoz4L/R5tay4B4iUErwGFCE25MCyQ+8oOexnKfBdFmaXtH7TFDp4KmGVRwsc7
EneDEvTNs5vC7kdxbJ2fPpR6uiH1CI53pzFk7KnagrZEztQMJkvNTWn/nW8FNJed
xMcbJSwTWUKGqx8lEL+KKOxSKPE6Q34WhcOsXClisEDmay9OQCMNrqyGBS5UL8Et
DXp7pYmOh3TsPIUF1FKPQHFoE7mlwwI4k0FcjuVY6qevvUmU16xYzaSPfyQjpHRw
Gb48Qzg/lnoIRmIzQttjbAa2NCV96C9GpKtM+eQP/TeOhRFn57g/xLRVM/Czy2s=
=SYQ8
-----END PGP SIGNATURE-----

--MFZs98Tklfu0WsCO--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
