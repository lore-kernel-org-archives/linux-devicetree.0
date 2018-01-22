From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] [RFC PATCH 2/9] ARM: sunxi: add Allwinner ARMv5
 SoCs
Date: Mon, 22 Jan 2018 13:15:43 +0100
Message-ID: <20180122121543.aqs56ur655w24v7u@flea.lan>
References: <20180119231735.61504-1-icenowy@aosc.io>
 <20180119231735.61504-3-icenowy@aosc.io>
 <CAGRGNgUjvvzseAtUuiy5xCaZrLw2Jq4+A_dPXR9r_Xs-yYL1cw@mail.gmail.com>
 <76DC4CD7-4A07-40C7-80A8-1C2D177E8109@aosc.io>
 <CAGRGNgUj47nyf2dkgdk1bT2kO1p5oP8nk5LQ4EpCya2dfK=uMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pbr6iuiebiqnahw6"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGRGNgUj47nyf2dkgdk1bT2kO1p5oP8nk5LQ4EpCya2dfK=uMg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Julian Calaby <julian.calaby@gmail.com>
Cc: icenowy@aosc.io, "Mailing List, Arm" <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Russell King <linux@armlinux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--pbr6iuiebiqnahw6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 20, 2018 at 02:22:06PM +1100, Julian Calaby wrote:
> Hi Icenowy,
>=20
> On Sat, Jan 20, 2018 at 2:10 PM, Icenowy Zheng <icenowy@aosc.io> wrote:
> >
> >
> > =E4=BA=8E 2018=E5=B9=B41=E6=9C=8820=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=
=8811:06:40, Julian Calaby <julian.calaby@gmail.com> =E5=86=99=E5=88=B0:
> >>Hi Icenowy,
> >>
> >>On Sat, Jan 20, 2018 at 10:17 AM, Icenowy Zheng <icenowy@aosc.io>
> >>wrote:
> >>> Add option for Allwinner ARMv5 SoCs and a SoC suniv (which is a die
> >>used
> >>> for many new F-series products, including F1C100A, F1C100s, F1C200s,
> >>> F1C500, F1C600).
> >>>
> >>> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> >>> ---
> >>>  arch/arm/mach-sunxi/Kconfig    | 13 +++++++++++++
> >>>  arch/arm/mach-sunxi/Makefile   |  1 +
> >>>  arch/arm/mach-sunxi/sunxi_v5.c | 22 ++++++++++++++++++++++
> >>>  3 files changed, 36 insertions(+)
> >>>  create mode 100644 arch/arm/mach-sunxi/sunxi_v5.c
> >>>
> >>> diff --git a/arch/arm/mach-sunxi/Kconfig
> >>b/arch/arm/mach-sunxi/Kconfig
> >>> index 65509a35935f..78ac9ce70641 100644
> >>> --- a/arch/arm/mach-sunxi/Kconfig
> >>> +++ b/arch/arm/mach-sunxi/Kconfig
> >>> @@ -59,3 +59,16 @@ config MACH_SUN9I
> >>>         select ARM_GIC
> >>>
> >>>  endif
> >>> +
> >>> +menuconfig ARCH_SUNXI_V5
> >>> +       bool "Allwinner SoCs"
> >>
> >>That name seems a little too generic. Maybe "Allwinner ARMv5 SoCs"?
> >
> > This is already required by armv5.
> >
> > Allwinner currently has only ARMv5,7,8 SoCs. ARMv8 is under
> > arm64 architecture, and ARMv5 and v7 cannot be selected at the same tim=
e.
>=20
> I'm going to try to back my way out of this hole by saying that they
> should be more descriptive anyway (and it'll give clueless kconfiggers
> a hint as to why they're not seeing their SoC listed)
>=20
> However you're right, if both cannot be visible at the same time, then
> it really doesn't matter if they both have the same name.
>=20
> Sorry for the noise,

This is definitely not noise, and I agree with you, having whether
you're enabling the v5 or v7 SoCs will hopefully allow to end up in a
situation where you search for hours why it won't boot.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--pbr6iuiebiqnahw6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpl1e4ACgkQ0rTAlCFN
r3TEuw//Z/mFfyvXgHpZlXa9yDz4i8A7kx7TZU8zPyc5ZhfcJ8S/pzM1tZXDrEeW
jQL4s50tcFBY2Gph2IY9cmkVDEDwpWZu9D32VyJ6MCp/zItB1Z6s682OhHDSM5pM
JDjqB3ZwiejH1PmbgWpIgIcUxPDqY6QH65nl02aBc/M6F6btPmIWTJQmmrFFuYcM
Cy13Jm8ebzGFlLEY0OXQVZ1ZX5FAD4DTfmZB1ounaLvd0wIWAcGHtxO7QOZcYSfI
X+8KoapSjGGvYzDnRwYeHTAx0CD2EM35r/S1dYo8n1qmq4OaBb3+qW97i7fz3Sr1
wdBmp77N29BAVrUDXHw7Z7W0u5Y6NWsmmdMAe/NQ9AARUgREtxoadVP9T+vvSPhx
iDcFFTE/SKI1OMKn3NJIwkawusjpfk+YZ/wHofNqisoTu1EnqiLhAxWIO4/KUhHH
oQWtBX2dNaMLWeSsbtwH8yOF9YDfdRYRyGKg5T4XDV3buD3v7gX0dEvWevFI8pfc
JEX2eqts71jj1w9vK2SAyuGoTnU6f7POe2q7c411d9JRJf0qQMnL6nZKVUj2GXN4
tAYmq0fFM9U67QM0xBlCs5xcLs1XrvfWrpS9z3DZXyeyEIXKkuDnwhJ3WCJhraMO
D/2Y+kwNSPh1vM3YkxxnrraxiEwtEeIQmlPzmleYN55OHkgD89s=
=2iif
-----END PGP SIGNATURE-----

--pbr6iuiebiqnahw6--
