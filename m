From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V2 2/3] regulator: dt: add policy to have property
 "regulator-compatible"
Date: Tue, 19 Jun 2012 18:53:54 +0100
Message-ID: <20120619175354.GO3974@opensource.wolfsonmicro.com>
References: <1340116099-17629-1-git-send-email-ldewangan@nvidia.com>
 <1340116099-17629-3-git-send-email-ldewangan@nvidia.com>
 <4FE0BA5C.9020405@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9rkt7tfZQigMla7f"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4FE0BA5C.9020405@wwwdotorg.org>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, grant.likely@secretlab.ca, rob.herring@calxeda.com, arnd@arndb.de, linus.walleij@linaro.org, lrg@ti.com, lee.jones@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--9rkt7tfZQigMla7f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 19, 2012 at 11:43:56AM -0600, Stephen Warren wrote:
> On 06/19/2012 08:28 AM, Laxman Dewangan wrote:

> > +  The regulator is matched with the regulator-compatible.

> That last sentence should be true for any chip containing multiple
> regulators and using the standard regulator binding. As such, shouldn't
> that property be part of regulator.txt, rather than each individual
> regulator chip's binding document?

No, there's more than one way to skin this cat.  We can either have
something like this where there's a single DT node for all regulators on
the device or we can have an MFD where the regulators all appear
separately.  This is certainly what the former case should be using but
it's less clear for the latter.

--9rkt7tfZQigMla7f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP4LygAAoJEBus8iNuMP3d/TYP/3cDwZz61eH/awnDggZlfvGw
uk2pUY1Q4gUKor+x01qefN6fAFTqkSvWu4sBGVj89UjbmeZH2cspGk7WzjdNDCuO
pDQOuw+qLhR/tyqa41OJl/HoX7VqHFvX3agFcHTwr8eUvLKMXxNAM8OxmEQiTy2i
KZJwZPDbqQ8KzDgDPy9s58NE++q141wLqECe6MvcX364p4qqUhdylTeeQVLaoNBt
eI0YgsRkuB+lJkaR7pqF7/Pm+qcS/81R/nYe9Ctbke8+RT19VPcsrFmKa2MdjIzu
6zIyEgGptKdPvqxjD04q144g62swh+EJet2mz9BJSROOBoUb7ItcTK8BFcc2eryr
l8D7Z46TgPftGF8W5kzb8OdLR8lxgs5Ef5POXAGS+iGGihhx3jea21cYCkPJhWxd
B7YbLJmzL/Y+G3X2MYTCUwP2gexTu/WIU+Y43FHT9ruDxhTHswaKX+K0kIEhFVzU
/yAhGJgDI4C1KjWe3WycBtDwzOSOuagHH/yal3W2l990g/I4gHXAXoQcscz40dxn
4WrXv4SmBVlLiubc7qskqROtBnLQ7y0sL7LGeXFftloZJB0rHIsJoSmzseCoj/0L
Dtvzz4oUwUKtbCZ/goSYgzZtTe0ypMyP11e2PNaJGtKOvMXK7yuHAYgm7FmpHajQ
NY0OW2BHIJJ6U0QBZGQ3
=xxo4
-----END PGP SIGNATURE-----

--9rkt7tfZQigMla7f--
