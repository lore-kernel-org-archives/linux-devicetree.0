From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [RFC PATCH 0/9] initial support for "suniv" Allwinner new ARM9
 SoC
Date: Fri, 26 Jan 2018 15:43:34 +0100
Message-ID: <20180126144334.27hengoucfipdsdj@flea.lan>
References: <20180119231735.61504-1-icenowy@aosc.io>
 <20180122121435.bpayxk4uzfqbhqse@flea.lan>
 <14593819.uISRktVE4V@ice-x220i>
 <20180125153520.lxcfvh3yvi36uiux@flea.lan>
 <2A78FC75-61C0-4317-A7A1-6E1E42098C07@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dmxe64kbyzacmbba"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2A78FC75-61C0-4317-A7A1-6E1E42098C07@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
To: Icenowy Zheng <icenowy@aosc.io>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--dmxe64kbyzacmbba
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2018 at 11:38:04PM +0800, Icenowy Zheng wrote:
> >On Wed, Jan 24, 2018 at 09:10:34PM +0800, Icenowy Zheng wrote:
> >> =E5=9C=A8 2018=E5=B9=B41=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=
=80 CST =E4=B8=8B=E5=8D=888:14:35=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=
=EF=BC=9A
> >> > On Sat, Jan 20, 2018 at 07:17:26AM +0800, Icenowy Zheng wrote:
> >> > > This is the RFC initial patchset for the "new" Allwinner SUNIV
> >ARM9 SoC.
> >> > >=20
> >> > > The same die is packaged differently, come with different
> >co-packaged
> >> > > DRAM or shipped with different SDK; and then made many model
> >names: F23,
> >> > > F25, F1C100A, F1C100S, F1C200S, F1C500, F1C600, R6, etc. These
> >SoCs all
> >> > > share a common feature set and are packaged similarly (eLQFP128
> >for SoCs
> >> > > without co-packaged DRAM, QFN88 for with DRAM). As their's no
> >> > > functionality hidden on the QFN88 models (except DRAM interface
> >not
> >> > > exported), it's not clever to differentiate them. So I will use
> >suniv as
> >> > > common name of all these SoCs.
> >> >=20
> >> > Where is that suniv prefix coming from?
> >>=20
> >> The BSP (Melis and Linux). (e.g. "libs/suniv" directory of the Melis
> >SDK and=20
> >> "arch/arm/boot/dts/sunivw1p1.dtsi" in the Linux SDK)
> >
> >Do you have a link to that BSP?
>=20
> I have it on the Baidu Pan. Is it acceptable?

Yep, it's not crazy fast but it works :)

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--dmxe64kbyzacmbba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlprPpUACgkQ0rTAlCFN
r3Te3A//by+3RTruCSPLFpcPSZkk8x6w/M/34Ao5l4Nrk/WB8TSMVXBxpcbAe8FT
kDPVHkyiP1wWQ+sFVGC9DRoa68WuydIBtY1qeK64Ym1nrNPS0spXsCIiDzapPqPi
OG+TG7KfeUXHbKS5AYzfRywY9b8m5lUj0ns9eTIyqa358C7jkcsBBZUJ3LKDtPib
yMP27S6S9qvbu3KI8AsYpvcrCaPVVn99QY1IADVzqAn+dd45yoeM8kZwNI+hhI8n
J5/TaVM6g+WMOjarbehNKDHORMYZkYA+/T0qEnIojAjHEqyWvQtuvNlZrTyBd3kr
Migky2LZJ6q+YRcU8lWag/kMDFakp9xw+zu9yJe/zKpI6W47EF/NCn9aMFo81TPC
Zhb7EwRhWqbjXHaevcFzkgGTjO7fkUpkSJDQzCROHwjl/hFgP1uel5AaNNQ5zPkg
hJaSsV1jdgJp8JCZHvbpkDGlKdx6JjZPzTKnqQw/EvfM06w5JkZgAE3UdeXkklJu
sPX5wi27s2PBjquzobC1Mt86v65cX+uWNzkZ1AaIc+C3Dk6776AcK/1suW7yBV+v
bCdcH219g//ol6pVkfpNacDxahYFYHER+QyJyuJqtpZrixiNUWt/XvDgy2+eynjO
7sr6KGJoall4nDPsMuGxDCe4VpcMhotNqln3ckh+KTSZ9DN46tg=
=qWiE
-----END PGP SIGNATURE-----

--dmxe64kbyzacmbba--
