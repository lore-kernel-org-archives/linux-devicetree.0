From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/1] add mali r6p2 dt node
Date: Tue, 7 Nov 2017 14:02:13 +0100
Message-ID: <20171107130213.g73f6oemzdkulgek@flea>
References: <1510059543-7064-1-git-send-email-giulio.benetti@micronovasrl.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vm27euidift2x77f"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1510059543-7064-1-git-send-email-giulio.benetti@micronovasrl.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Giulio Benetti <giulio.benetti@micronovasrl.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--vm27euidift2x77f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2017 at 01:59:03PM +0100, Giulio Benetti wrote:
> It seems there is not mali node in sun7i-a20.dtsi
>=20
> Add mali node to sun7i-a20.dtsi
>=20
> This patch adds device tree mali node compatible with r6p2 utgard kernel =
driver=20
> provided by ARM and patched by maxime ripard on his github.
>=20
> It can be easily used in target.dts with:
>=20
> &mali {
> 	status =3D "okay";
> }
>=20
> then loading mali.ko in user space.

Can you please stop sending the same patch over and over again without
making any changes?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vm27euidift2x77f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJaAa7VAAoJEBx+YmzsjxAgQEsP+QH5IlejAv6HpfcsU9lYgS9L
N6Cu8ajWtIaJkj1xQlCo9m23uaj4h/gkpgW3ZlGZrvamnrt3bm3xQRw/OvaMfi5/
lb7YoJ3xVaZZJjddBMIe5ZFvaMV1BwFZuzZ89s3r06v6DbrYPT8/BzBRTresoODd
CfvpdyjvkkI65TNwdh0TR6YrQnWFR8bMqPCRO96ixzz1LpGgCMFIGl0fVWb418gs
+j8OUr6sTtP9PFUlg4rZ12ABcSgrlWuX0NCuSCeSyObB3tP+rT9S0eXZ/QAutvnT
7WdTz9OrRZLUWzD1qKhsXEEOQ1jHBULd9g0Etsp66yogZdC6C3pOV/uvuQNytppI
LxWK5Yj+W2hZ+904nXY8+8SC7XLZZhvurj2kXF46YnG5+OV2rIFWdFHLhBEnzaiM
m8VJQi+S6ABHythbFezz64iHxdz9rw8cZXvHiuR6J8MrUPK6JMK23KTBdhMyNn/J
9NkiHM0RzcC1Hjwjgji+uvsn6aMSkiXpwlPY0Fh0WFnOg3uSWJfaupvo3oxa35By
pjIAuRMeSmNFy/bCCAu/Jb1d3ogQ4MYTggo5IPIKAUmXia+LiiyLBK2VDOFRV2Md
Le2ceRuckj/3KUx1TKqDTQY0l0g3Qu0K1aBJYpL0S8L3LATlKkhhVXAiRlGYUlkW
4dJiYrAiQk61Yt1Qc9f6
=M//k
-----END PGP SIGNATURE-----

--vm27euidift2x77f--
