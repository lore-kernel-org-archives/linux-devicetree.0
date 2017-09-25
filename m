From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [linux-sunxi] Re: [PATCH 0/3] Simple DVFS support for Allwinner
 A64 SoC
Date: Mon, 25 Sep 2017 12:43:28 +0200
Message-ID: <20170925104328.jttvrdbptor5zhsr@flea.home>
References: <20170923001531.14285-1-icenowy@aosc.io>
 <20170925101027.lghnnll4h6inreqm@flea.home>
 <27EF78BD-6285-4D8D-AA65-8294D797E2FB@aosc.io>
 <20170925102744.qixfwlheeimemhcf@flea.home>
 <1C624335-37C2-4F22-BE78-A94F26D1D248@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ennmauk36dyn7l5y"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1C624335-37C2-4F22-BE78-A94F26D1D248@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--ennmauk36dyn7l5y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2017 at 10:29:38AM +0000, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B49=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=88=
6:27:44, Maxime Ripard <maxime.ripard@free-electrons.com> =E5=86=99=E5=88=
=B0:
> >On Mon, Sep 25, 2017 at 10:12:09AM +0000, Icenowy Zheng wrote:
> >> =E4=BA=8E 2017=E5=B9=B49=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=886:10:27, Maxime Ripard
> ><maxime.ripard@free-electrons.com> =E5=86=99=E5=88=B0:
> >> >Hi,
> >> >
> >> >On Sat, Sep 23, 2017 at 12:15:28AM +0000, Icenowy Zheng wrote:
> >> >> This patchset imports simple DVFS support for Allwinner A64 SoC.
> >> >>=20
> >> >> As the thermal sensor driver is not yet implemented and some
> >boards
> >> >> have still no AXP PMIC support, now only two OPPs are present --
> >> >> 648MHz@1.04V and 816MHz@1.1V to prevent overheat or undervoltage.
> >> >>=20
> >> >> PATCH 1 is a fix to the CCU driver of A64, and the remaining
> >patches
> >> >> set up the device tree bits of the DVFS on Pine64.
> >> >
> >> >How has this been tested?
> >> >
> >> >What tasks did you run, with what governor, etc...
> >>=20
> >> I only tested manual frequency switching between 648MHz and
> >> 816MHz, and tested the PLL stuck issue by change the OPPs to
> >> some random value.
> >
> >Ideally, we should test that it's actually reliable. Poorly chosen
> >OPPs might lead to corrupt data that you might not get before a while.
>=20
> These are OPPs from the official sys_config.fex .

And the rest of the code isn't, such as the clock or regulator code
that is critical as well here.

I'm not asking this out of nowhere, we've had to debug this more than
once already.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ennmauk36dyn7l5y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZyN3QAAoJEBx+YmzsjxAgLwQQAK6OrtMSsYuq8CK1hKFuv6Gi
AsNM5qfefMLGmBf8tWv8rsw9e+ThKGgLQpkfLQVLgIkNzkjSqqIRBy+ZQihx2XX1
pXvEgxOfhLSXoPUu4LrhhdwU5pZgEbmigs98dXgOTPDMgOMiN6r3VWRtdQQ5JNiG
wmj1FBteLfp4sw4r9myPsGYvQBlD7EBO4k+LpzBHEEQDyuSrcZNXyC3W7iIZau15
woi80r+lmDGNsDeux+lbT9NKHh/2ir8EaquTCcGkHr0h3Tb/rannzRPQ6MxlWFQj
MddHjpCC/aGrVtMKGBvhfOkgYCpe1/GTYUac/Bf6/VMSzP70lRLtCLW0BPpWxWvh
crLkF8IepJyCbfgmDX1NVgUrQw9FJdKtdPbz/ZQzNZZBE1Bs1rpn08zgujTmjX8E
fjLXDvpI98Kk3R0wUsWsI2fNTChrfO5Rack+oHy9GvJDApafrWo3zdu1WBZOixsX
n6FXryWuVh6pLWmTPvQeREEqTZQvdv4H369L1b6kO89d7B0EaEacWTNtnoEHQuNw
j0diNdnX8+8V2O8e1J7zLGIRmRm+ClCm8jOW3cSlbJh0l2/7BBvOHu6wkwDjHKm6
MMTGFytbdej2NokMoQ6A5IQ5+CFRZrl0u4PaNQpIcYweUFSUdR1n3oLM1mbTMZ5d
IQEcYq/moRp/Qrhdx+/n
=+4O2
-----END PGP SIGNATURE-----

--ennmauk36dyn7l5y--
