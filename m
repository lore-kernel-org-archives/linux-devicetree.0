From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/7] clk: sunxi: Add post clk divider for factor clocks
Date: Thu, 11 Sep 2014 22:36:49 +0200
Message-ID: <20140911203649.GK31276@lukather>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
 <1410000448-9999-2-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GU3/x65mZ6MFE8p3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410000448-9999-2-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--GU3/x65mZ6MFE8p3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 06, 2014 at 06:47:22PM +0800, Chen-Yu Tsai wrote:
> Some factor clocks, mostly PLLs, have an extra fixed divider just before
> the clock output. Add an option to the factor clk driver config data to
> specify this divider.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--GU3/x65mZ6MFE8p3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUEgfhAAoJEBx+YmzsjxAgfJwQAKNS0GyNyfdxQxXzG7HQvHmj
S4vCCHaGrKqZOmuYcruiYj7YtdYFYcZWgj6/mmXPZvHpnYQ7WK1UQaoELOsMccXf
bazxeKhM6XI+xG7rP9+1gKuV62mLJXr0lJYYZJgw5Qc+DQnMqE9jBUw+wYhF4VYR
2b6h3ocWsDwI0ZT8sQFa1/QP2qNFmR+ElolgdxRZ0e7dKZGgsOP8lC8wldokjLmu
CysiwpPaoo7JTlEHKDMNPmheZNtRG84pTSiAqj39HobOT2j9wThw+gkqxPG4CkkU
vF5MKqtsjj93631Ibxzzg8grV5HlEBvd4Cd7VdXzbjE08gf8op0ibe13IgoIYLqN
lTPy2rUPCzbsDNqf0oEbLF03f++B0ok1+kyXdzwS23yEPuEyLPOYxDQRayNe/j3u
9Ur3cA+jTfNC8Me4qT3tsJD2hGB2g7NLd1fguhlH5jdSs3ymIdrtevAC87wrzE9N
zXZC8sLrUjpJNO8wcgZK1SA0PGy+lhhXl4uEvCGZwCqvQ/GpKsxNF1jZHl+Ertvj
SZ/zC2EtQ5yWEqysEMQXXCz/Uvyfdd5NxEhC7CpRxAz49P8K1nn7CIm6B9wYcYV1
8p+ks0r2cbJm/dNF2FMkMPLtuNPriZMoV150MzDBGbiLwj9hz7i4+4CxQco0svmv
K5iy2Kk6E4/R+sxeBZTK
=7iW8
-----END PGP SIGNATURE-----

--GU3/x65mZ6MFE8p3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
