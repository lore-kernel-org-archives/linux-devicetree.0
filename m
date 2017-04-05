From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] [PATCH 02/11] arm64: allwinner: a64: add NMI
 controller on A64
Date: Wed, 5 Apr 2017 08:11:37 +0200
Message-ID: <20170405061137.n66ectbkl7a2fv5f@lukather>
References: <20170404180145.12897-1-icenowy@aosc.io>
 <20170404180145.12897-3-icenowy@aosc.io>
 <CAGb2v67BucT8=FTgem3AmSU9XJA7OHoTCq3t3wBzDWyuwzZqaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vytf3jzmikcaxavo"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v67BucT8=FTgem3AmSU9XJA7OHoTCq3t3wBzDWyuwzZqaA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Icenowy Zheng <icenowy@aosc.io>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree <devicetree@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--vytf3jzmikcaxavo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 05, 2017 at 11:51:45AM +0800, Chen-Yu Tsai wrote:
> On Wed, Apr 5, 2017 at 2:01 AM, Icenowy Zheng <icenowy@aosc.io> wrote:
> > Allwinner A64 SoC features a NMI controller, which is usually connected
> > to the AXP PMIC.
> >
> > Add support for it.
> >
> > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>=20
> This might not be the best representation of the R_INTC block. Though
> we'd need to change it for all SoCs if we want to be accurate. For now,

What do you think would be a good representation?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vytf3jzmikcaxavo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY5IqVAAoJEBx+YmzsjxAgXJsQAIvHF81mAQSStS69+fdpql+L
zJp44qw+pjRSvaG6VdrLNo5Vbkavk+r9Ffd0VOrgqnltObyEIFMxUjVVqozUaiSV
Aib9s1wIOxK/InzZICS3fvDHZGOmQK1qJmgSBB8V4VmgBhyr9+yj4nW9YdFeadWK
dLHoKWx0iHJYADsliPHsRZpBKb/EuVeput8GN0ojXH4soDwbqAE1RTkzNQjoa7Fv
v28sB5/J0uaJih28hYEQpQC+J6vkdiYI3L1ByC2obxpc90oMDFa0kPY6LJVGUcOE
luTb/KpUjEcKYrANeomztnCvH4S0cMtpZNGkhwkuGK2jiJIMO37MaPPrP4+0eGl4
8sfGWzuYpY3fzUCT7C9iFT8tAdZ/b801iE/75VFpIuxD6EAr2tGctrF/j/R8xfqX
gTi6yYibqE96lgLv5aJxuP7nOMifttT4Huo6FjrSxfF80mWBkT+Bzp3T25IesxIC
/gHviHIxWAXnDSsX4s0kNHB5QQ5aMtU67vmAS6z6KFPt84T293jde3nhgul0614t
hcg+jwDjc80E+Eg6iw8jC62rBajCxN9Ty0NsxcCzKOw5myAQ3INbv/TkotDAvIAK
2ngsOvUPs/gxZMqZOc07nw3PpK34+6V0xmtTNu1jxuyESdNN4DMptcI94eguCbp9
ALVttTihG483PUDtHlnE
=0FdN
-----END PGP SIGNATURE-----

--vytf3jzmikcaxavo--
