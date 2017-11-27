From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] pinctrl: sunxi: Disable strict mode for H5 driver
Date: Mon, 27 Nov 2017 09:22:52 +0100
Message-ID: <20171127082252.wpf6vhe6f2zxshpn@flea.home>
References: <20171125120200.23294-1-andre.przywara@arm.com>
 <20171125120200.23294-3-andre.przywara@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rzl4exswmwlrfgb6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171125120200.23294-3-andre.przywara-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris Obbard <obbardc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--rzl4exswmwlrfgb6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 25, 2017 at 12:02:00PM +0000, Andre Przywara wrote:
> All of the H5 boards in the kernel reference the MMC0 CD pin twice in
> their DT, so strict mode will make the MMC driver fail to load.
> To keep existing DTs working, disable strict mode in the H5 driver.
>=20
> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
> Reported-by: Chris Obbard <obbardc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Sorry for missing that one...

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--rzl4exswmwlrfgb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAloby1gACgkQ0rTAlCFN
r3RCexAAk3xmg933RVPYOc9ENMMFKpYc6ojykkYIqC5tnFHWVmdoPPX3DdrVLGsR
4bCtZCT/MLHDrE2Z/e4Hi5sADXuFZUpxAJnBZ0Kqf8sEpK4gy6tM8ZIU790sjQaK
UQw/tr3Ht8YkGjzjFnQdGG4yV2T2qCBDt2kcIg+YzuMy/E+8EqBWygfu+RiGzC71
AgkVp7SZaD9iD0G49/H23cJMOw7Y143sweECSOc/PrIHtZSv1zHzGu058FpStVRq
ls5G6YTO9zEQ6gocbzA6tfI0j5nonXIsO51y4hqKbB+QBe0P1HJnZ4/rs4JKGDLm
9sdZPRex2F0A7klLus3844rqkom0xB93/k7zeJ+y0fRwvjYQGumzPVckDji+tgnB
9b/MBxKWrej/M8l/+BbOqONfQUuYGdPvE8kChmv2OMWapgHjfGuAylEchf49KaAT
1KkJNZ89gHzUWHVCtQQNKJXw5Nr+/SJRQtHkaEViVNh+G0QBJaW4QIULcR6RtfTL
oSjQgwata/MCy8Ka2WOoUHFCqkX/INk7YlUp7+ziYNQWXDSexeXaKOrYF8nKBJ6U
Z9OWsHefVQq61WHImdt7s2K172tmTpdYo6Vf0TqWyEw3NzBfa9r4B4FMG9tHCuiw
/fFcoar7HNgrN693MtNNF1aO5BvDJw7e0WB/44i/SvEKmaGMiQk=
=pHU3
-----END PGP SIGNATURE-----

--rzl4exswmwlrfgb6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
