From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: amlogic: add unstable statement
Date: Wed, 5 Jul 2017 21:32:54 +0200
Message-ID: <20170705193254.ulpoduoqlqf4ttkj@flea>
References: <20170628145343.25443-1-khilman@baylibre.com>
 <20170705142015.tmlmes5lobadndsy@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zcs5dtn5gvrmjxi7"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170705142015.tmlmes5lobadndsy@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zcs5dtn5gvrmjxi7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 05, 2017 at 09:20:15AM -0500, Rob Herring wrote:
> On Wed, Jun 28, 2017 at 07:53:43AM -0700, Kevin Hilman wrote:
> > Due to the lack of documentation on this SoC family, discovery of new
> > features, and correcting of previous misunderstandings is expected, so
> > it's unrealistic to expect any form of stable bindings for this SoC
> > family.  Make that clear inthe binding documentation.
>=20
> s/inthe/in the/
>=20
> >=20
> > Signed-off-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/arm/amlogic.txt | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
>=20
> I've yet to see anyone remove an unstable tag and I'd rather see these=20
> for individual bindings than for the platform as a whole. In the end,=20
> it's a platform maintainers decision whether to accept compatibility=20
> breakage regardless of some text that probably no one reads.

So what is the policy exactly to decide whether this statement can be
merged or not?

We have all the issues mentionned above, no backing from the vendor,
and yet, we were forced last year to bow down to one single "user"
without a clear usage into supporting a stable ABI that we never
really anticipated. How does that work exactly?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zcs5dtn5gvrmjxi7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZXT7mAAoJEBx+YmzsjxAgNHoP/iCD66LtzGbLHbvpAiU+AISt
ayHMJnhL/BaE40unvqmW99Sumw/5Uhxg3ypnbTTaBBRBgDCZ3U4YMb7PG/YhqlGF
Jo8/6seHxkBOvKQ5vP3BQWDo8fqba7bCJ6y/3RF0v3trITtt06ZNM+4QAL+LfwWK
BwZwwVjpg9nnltoSeakj9J3lsx0TsHu9BAnFWR1/G0WbCtYdSND4h3/a/buTENz8
Mc1JK3HbUa82S1YpGJleT6gc4rQFjj0s2yEjAhpqBqOQm2nvvmauQI5cVT87/g/l
dd6vEuEj7L5GSC71l5sqrToaQn6YQa632PqmC9BtDuxEx3mJ9SSicLvhD8gX8dg/
F6mukSZVb3i/OMvvRA4RU0vwoqWgCPRf/+4ORohbWUN0u4OWDxPpTJL2WJRcE4Q1
aOsUHzdziGMe6L8pf6amksi9NetfYZ2BJ+g+/GupMvl56u0cSEl8VaOHZyoCvSoh
CwjM05WPO4wCoCGqfRtfpwakwOTvdT0m1pStnra9LHwzV8LOecpKRlWFCl9JcJcu
E7eX6ZT5lRZeicPiSJOJWHUt9Jxm/DYvscL/EVzMVYGT0og45dmjMHAnV4OIxOd5
WKixLeuRd+e9YliQuvN+JKWEIcEieJFLd1snAsTH0dMRL82z/6cjgwYjsyIrOWWX
hdOCKtX3D7NTJzwInIFe
=zsWZ
-----END PGP SIGNATURE-----

--zcs5dtn5gvrmjxi7--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
