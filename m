From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/8] ARM: dts: sun8i: reference-design-tablet: Add
 gsl1680 touchscreen node
Date: Mon, 22 Aug 2016 20:31:42 +0200
Message-ID: <20160822183142.GY7104@lukather>
References: <1470685398-14568-1-git-send-email-hdegoede@redhat.com>
 <1470685398-14568-3-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3C3ZMpwu25Mtx3MN"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470685398-14568-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--3C3ZMpwu25Mtx3MN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2016 at 09:43:13PM +0200, Hans de Goede wrote:
> Almost all sun8i tablets use a gsl1680 touchscreen controller, so add
> a node describing it to reference-design-tablet.dtsi.
>=20
> Almost all, but not all, so mark it as disabled by default (dts files
> will also need to supply a firmware-name and resolution info).
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied the first three patches, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3C3ZMpwu25Mtx3MN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXu0UOAAoJEBx+YmzsjxAgHroQAIQxjW96vOyki5fIJuNcMOce
IGzZ71FkqTiwGF2BQxAoXCP4H6PGxJnrU3dXMC13DReyZ0nOdram4IgEbMfMf6ys
uWc4iK+Mn1IY7x6z3HEYA4VAqRueCe5p5tX/C+ORtT7vhPHU0H/0Dr4khRpaBiJm
slDIlBREJPkPvR4+eiDsStkuc4kpY3Qr3L8W87TDA4oaoGVHcpHYinG2FkgGtn9i
dih0jMTKISLqwG4APHhwNcdLxmWu/yWaLzhwZ6oL0cwoEjCZwdGl8bTCVKq47xTH
hRRAh+U9ArHG7zf3uR8UX5dCAy0ucWfNPj9Br0QoVxDDXBnPer57JOMX7tsFrZAB
eSnLZTikSFJH7gXcCP10kLI4mPhJGoISvDOJ3b/Uy/Iw7sXcm9f2eVMdncsMxnrd
7ozNiKk4N0xS9axuDYzB91/KN6rMZ95do4kjCbeUbQUiW73aaD6+woz0mS5gRKI0
tw90tUJpD4pcJeARERs9HSYzudF6Go5Gdgz8qeYoxlVEHtAJqIrV9urABSC4RNhU
cbNZagX4Bg/4JQcuqff8ScufIlvo7bFhhI/mRSZY8QqLnt1HaTIHfNlzjU77PfKC
FOzIfsdRTZsz9voXqKMcbt7FZj7bPBWQIq5rM+5tt+ETn9dD6Kzo3h9kFDJSJ/+e
KCc8DwMA5P4GafXS55ci
=h2R1
-----END PGP SIGNATURE-----

--3C3ZMpwu25Mtx3MN--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
