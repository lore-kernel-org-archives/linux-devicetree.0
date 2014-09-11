From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/7] clk: sunxi: Fix PLL6 calculation on sun6i
Date: Thu, 11 Sep 2014 22:38:25 +0200
Message-ID: <20140911203825.GL31276@lukather>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
 <1410000448-9999-3-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VB1oQhYtJt8uuzk+"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBHUSZCQAKGQEXTO7X5Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410000448-9999-3-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--VB1oQhYtJt8uuzk+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 06, 2014 at 06:47:23PM +0800, Chen-Yu Tsai wrote:
> The N factor for PLL6 counts from 1 to 32, as specified in the A23
> manual, and shown in Allwinner's original A31 code.
>=20
> Also the PLL6 factors alone calculate the clock rate for PLL6x2, not
> the normal halved output for PLL6. This is what the factors clk
> .recalc_rate callback expects.
>=20
> This patch fixes the N factor in the clock driver, and adds a post
> PLL divider of 2 to calculate the rate for PLL6.
>=20
> A further patch (to the DT) should add a fixed-factor x2 clock as
> the PLL6x2 output.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--VB1oQhYtJt8uuzk+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUEghBAAoJEBx+YmzsjxAgU2QQAJjI893ZI5PdUEngBlkCVH/t
hyHXultcQvBlPZOu8eBK5PM/VIsjpZAeBBsmdo9DmG88Sz0/g/7IoUWExEnf+t5A
8jDSeahtdwYhzyzyEiMnoW1D/EX/L44E0Y57/5vTr35jyNRS6Skpa3opp4JM2UoG
UF3xtf60RM/U8YIdDDvtyQwf6rAc/ogyFrg/AFVWKiAh23ykD8KaMzbXgWCHR8Ci
Yk7tM9KNojyvP4P1JU3rTCXJ5WE2/gYCzDczRC9fUDq3B3eqRI2VDiVA/hQOLIKa
ghEykkh8N2ADK8EQDzQ9i6MZ4Sz3uR5lCzK3+WbGirAeEMFszglH0UEuh881d+WQ
y5A7UAXB66QdHwQeS2hxMK05kmKgP6BO/lllV0e54dodg6aAjNRwAqk7Ik/baGeR
0T+w6Hk38COD5N/y4IpBi2fLmBedwMEynfrbUMrom/aBJXsy5h+28uT47LCEvdPk
qW/Mt+mhBvfPQYN2ZWfCtPIs1Ff6d5pT0NEcHzcruNm9rHECXg91K5NI7CiXbPJH
aFEb4ruxQhsK17N5WS4XqUfTl3iK4Qzg0i5UO/fdjJNLfEtMFKMfnNMLsJsz8CGk
1citGDkqIzXwlWvtRLR1DD2XaBqglsY3WH+Kgte6K0O1FKNkg9hwvoqB2JsRsWYk
i4ROk/nWnkasgyAmNbN0
=p3oP
-----END PGP SIGNATURE-----

--VB1oQhYtJt8uuzk+--
