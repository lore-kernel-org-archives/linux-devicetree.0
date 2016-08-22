From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: sun6i: Add
 sun6i-a31-reference-design-tablet.dtsi
Date: Mon, 22 Aug 2016 20:39:15 +0200
Message-ID: <20160822183915.GA7104@lukather>
References: <1471533095-13432-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6TME3aayZmn2Ikqb"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1471533095-13432-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--6TME3aayZmn2Ikqb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 18, 2016 at 05:11:34PM +0200, Hans de Goede wrote:
> Just like with a13/a23/a33 most a31 tablets are derived from the same
> reference design. Add a .dtsi file with all the common bits to avoid
> endless copy and pasting of these.
>=20
> The sun6i-a31-reference-design-tablet.dtsi this commit adds is a copy
> of sun6i-a31s-colorfly-e708-q1.dts with a few tablet specific bits
> removed / left in sun6i-a31s-colorfly-e708-q1.dts.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

The patch looks ok, but doesn't apply.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6TME3aayZmn2Ikqb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXu0bTAAoJEBx+YmzsjxAgu6MQAJUkz1f37yabUgR5MglbrQ58
5NkCvB3ctxk05Fy1+vm21J/ZxtaiR6x5yjr2NMmxKr20Ubs+fpJ5eIZq6goEF+6c
1isLLEm1ylUxC2/nOTUgszoNZlljvsT7x+Qph8M0Fkn8iojNvQeQAUyG0IG4tbgZ
0pSSzDeGLRxKe6RiTwBzhq8LIEvULDtLZHH11z6rR05ho9yE7I+LdPLanyix93mG
qwahkwxAsNm/6cY5Ug2q15JeoZmBt06L3MWpl9i1BD1LDNAF+oyPjhOWb6+PXuFG
yOJWOHQtUwnjVanoek+2Y5EotyTlnPsCM58b31LqInlhQ7epCVY70RlXAp+ZtI3K
/iZX5FF8N5o9KolP6qWhYo2Agz8RB8CXa2HOjCsIL2Fn/6Jb7PjFFUVaLnxKz0Zg
OdTiCgIq3X6BkVg4nYBSqvJuhNzudSDq2y2zb2uOQtOfpEZs/1gR87mdDYJJTlL3
qFVuOttlu4Ca90XpgWwJB8+csQBprPsLcTqUSpAXt5hr+t0tM1nG4v5iSJ3xtpMh
d5Q/KyewXmqwBNC5FqpKBgnyVSS4T89Am02UWPT1Vnu88/tEd7NtFmzROkPR4Xzp
wDfr9ZeqHbSKNyzW9sUIa/8HYTdEEXIG4eTNk65ZWwHCaddNOvXgbXe9LAUf1Kbb
o3NzNVWi8aVEJYWhiGkx
=OLps
-----END PGP SIGNATURE-----

--6TME3aayZmn2Ikqb--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
