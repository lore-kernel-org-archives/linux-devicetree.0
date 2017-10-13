From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun5i: reference-design-tablet: Enable AXP209
 AC and battery
Date: Fri, 13 Oct 2017 09:24:02 +0200
Message-ID: <20171013072402.36wib362gwhfgi7o@flea.lan>
References: <20171012080542.21862-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="h5acdbpkve4y2oaf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171012080542.21862-1-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--h5acdbpkve4y2oaf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2017 at 08:05:42AM +0000, Chen-Yu Tsai wrote:
> The reference design tablet has the DC jack wired to AXP209's ACIN.
> As a tablet, it also has an internal LiPo battery, wired to the PMIC's
> battery charger.
>=20
> Enable both.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--h5acdbpkve4y2oaf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ4GoSAAoJEBx+YmzsjxAg21oP/09qpTOfCeGZ9ChhF5Q3hOWY
Z12Jt4P113hOUoNJe+bTHkyxSo04YGUKlMGoX/5cof3mXBSHv46Hu3sELBeyvJns
U6t6MoKmaUU1pIQEsg73iqIjQtJW0k1YMZN8idwamQuqy/IexWy955T+Ly6S2PNM
3Mqw+QU/II49o+hbIlN4oD19pm3NZRrSmQeinLrdMizwrkPf/jCSYzDJNYtU1986
B7M0bVCa3I9UMkwl9cGlGN45OM9McB3W0XynodSBUjbWGIqE7J8fZ29g9LTjovtS
jWtudOtez9mp5qOnhGrp2Da0XpL6gfemSul2kYNgTf3Izz0a8c1mGAbXbSaHHe3h
pDw9+0h4aBpnH8wos6Iy1lsbF+22XVdYu1ffjmsFosP/0QUbE+cj4LPG254wFVSz
IanwQBz/egMWzQeZAdk6EfLDREhgSIn+vfbB4CwBBaGZg7uucpZOrCWbZMrokSaw
MwCbQqKxdTunSrHEv/jnCAPOWO1YtSozZmhDvaZ7JJizzjL53NeYrNEIbH7aD9OZ
XZr5H/LyY2vU8M92/BRZOW4qaR+m1EkDQQ82EmVCxq7BR5pSUEN8cryWSSNReNnX
2oVyZXQk7MfjYQiaOsLl5RSSBEtP+3WZ3gj6NSaHV8ww9M9LGavnEppEo94Tb2m5
ocwpUgcu7ZH6C4VYcd/6
=ihq5
-----END PGP SIGNATURE-----

--h5acdbpkve4y2oaf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
