From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v6 0/8] mfd: Add OF device table to I2C drivers that are
 missing it
Date: Thu, 4 May 2017 10:09:31 +0200
Message-ID: <20170504080931.GA1487@katana>
References: <20170504052107.18995-1-javier@dowhile0.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170504052107.18995-1-javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Javier,

thanks for the series.

> Most patches can be applied independently, with the exception of patches
> 2 to 4 that should be applied in the same tree to keep bisect-ability. I
> suggest these to go through the MFD subsystem tree.

=46rom my POV, patches 2-5 should be applied to the same tree. Since all
I2C related patches have my tag, I assume they will be picked up by MFD.
Lee, let me know if you prefer differently.


--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlkK4bMACgkQFA3kzBSg
Kba+QBAAk4/jzvqgCIfQ5OvlBiG6ldw8CUehJaW/+eeC0XuA/v6CX6Vbijd0RF1q
fA0zQhHRkInsabkQ7QFDwdrCDWsG4qqr2zjLWEONkIfL3vBW/oEf0L6i3g0U5ApG
FV6J8A4auTi57EIC8x2H1bej30n230pp+ykaLbDfD/wXsJsyIiuWk38D9oZ/mL8H
Ba7aNEhqKP7uVwh6oc4NADxQ6+/VHOV9AU2b0n+tZlF4IkRnRRi55hotTBe0pPuU
j8bcRL1pwwnB/rfAW2b73qwJDhk5JfBv6rnPtQMNhe9JHAbTR0M/iT3B+GX3aT/s
UzSm7xFiV/+jUiBp1N6DsWhrp8UVwXbel1ZpcfxFSF3qxjazQI30cxNaxh+/V7gD
VFAlt+O4ce8aOuiXInbmeHzyCAPeKwuAMf0IaK1KDu9DRtV6uTi6YhWvba1qUnbr
jNFmh58WoRxkl7yTuNqbPTeWV+4VcwlqzAcQr9KQK/ZAYiGAIPjvJRqz6NIiSNWv
JO3Da1rUe6qg9vkAI0iQ1vzhs4u/ilt8jssqFfLK1e/vMhF0sA9W5SRvdwP5RXk1
TAFovMfUYOidk2wiZiLGpwLqe2zXfp9oWWxALyajy3WxPAyX7JeceYvDfA/XoGtN
bVnv7BODwN4CrOZHv6ymnFoPK27KDcbBvbvf9XRbvxj+68lwCrU=
=/hCE
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
