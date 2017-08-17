From: Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH] ARM: dts: TI: Enable __symbols__ in dtb files for some
 platforms
Date: Wed, 16 Aug 2017 20:33:55 -0400
Message-ID: <20170817003355.GR20467@bill-the-cat>
References: <1502920751-11121-1-git-send-email-trini@konsulko.com>
 <5994C81C.609@gmail.com>
 <5994CDD1.9050708@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="xW8yAg6m/0S7qvWU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5994CDD1.9050708@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>, Jason Kridner <jkridner@beagleboard.org>, Drew Fustini <drew@beagleboard.org>, Robert Nelson <robertcnelson@gmail.com>, Lokesh Vutla <lokeshvutla@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--xW8yAg6m/0S7qvWU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2017 at 03:57:21PM -0700, Frank Rowand wrote:
> On 08/16/17 15:33, Frank Rowand wrote:
> > On 08/16/17 14:59, Tom Rini wrote:
> >> Build the dtb file for these platfroms with __symbol__ information
> >> included.  This will reduce the size of the dtb (and resident memory
> >=20
> > typo: reduce the size should be increase the size
> >=20
> >=20
> >> usage) in exchange for allowing more types of overlays to be applied to
> >> the dtb file prior to passing it to Linux and additional functionality
> >> within the kernel when OF_OVERLAY is enabled.
> >>
> >> Cc: Jason Kridner <jkridner@beagleboard.org>
> >> Cc: Drew Fustini <drew@beagleboard.org>
> >> Cc: Robert Nelson <robertcnelson@gmail.com>
> >> Cc: Lokesh Vutla <lokeshvutla@ti.com>
> >> Cc: Frank Rowand <frowand.list@gmail.com>
> >> Cc: Rob Herring <robh+dt@kernel.org>
> >> Cc: Mark Rutland <mark.rutland@arm.com>
> >> Cc: Russell King <linux@armlinux.org.uk>
> >> Cc: devicetree@vger.kernel.org
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Signed-off-by: Tom Rini <trini@konsulko.com>
> >> ---
> >> This patch takes the path that Rob encouraged in my previous patch of
> >> enabling __symbols__ in some platforms now (that can use it) and see if
> >> a critical mass evolves that pushes towards -@ being default for all
> >> dtbs.  I would suggest that the dra76 series be respun to include a hu=
nk
> >> like this at least as well, and if there's another Beagle X15 patch,
> >> that too.  Russell, per some of our conversations, something like would
> >> also be needed as part of using overlays to solve some of the problems
> >> with Hummingboard, etc.
> >> ---
> >>  arch/arm/boot/dts/Makefile | 14 ++++++++++++++
> >>  1 file changed, 14 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> >> index 4b17f35dc9a7..6f98422ca00e 100644
> >> --- a/arch/arm/boot/dts/Makefile
> >> +++ b/arch/arm/boot/dts/Makefile
> >> @@ -1063,3 +1063,17 @@ dtb-$(CONFIG_OF_ALL_DTBS) :=3D $(patsubst $(dts=
tree)/%.dts,%.dtb, $(wildcard $(dts
> >> =20
> >>  always		:=3D $(dtb-y)
> >>  clean-files	:=3D *.dtb
> >> +
> >> +# enable creation of __symbols__ node
> >> +DTC_FLAGS_am335x-bone +=3D -@
> >> +DTC_FLAGS_am335x-boneblack +=3D -@
> >> +DTC_FLAGS_am335x-boneblack-wireless +=3D -@
> >> +DTC_FLAGS_am335x-boneblue +=3D -@
> >> +DTC_FLAGS_am335x-bonegreen +=3D -@
> >> +DTC_FLAGS_am335x-bonegreen-wireless +=3D -@
> >> +DTC_FLAGS_am57xx-beagle-x15 +=3D -@
> >> +DTC_FLAGS_am57xx-beagle-x15-revb1 +=3D -@
> >> +DTC_FLAGS_dra7-evm +=3D -@
> >> +DTC_FLAGS_dra72-evm +=3D -@
> >> +DTC_FLAGS_dra72-evm-revc +=3D -@
> >> +DTC_FLAGS_dra71-evm +=3D -@
> >>
> >=20
> > I would prefer that instead of "-@", a configurable value be used.
>=20
> I stated that poorly.  It was intended conceptually, not literally.
>=20
> One possible concrete implementation would be to use something other
> than DTC_FLAGS, for example DTC_FLAGS_EXTRA, then have the build
> system choose whether to fold DTC_FLAGS_EXTRA into DTC_FLAGS, based
> on some sort of configurable value.

So you would have to pass in a flag, and then set a CONFIG option for
"please use this flag I just explicitly set" ?

--=20
Tom

--xW8yAg6m/0S7qvWU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZlORyAAoJEIf59jXTHXZSE90QAISNK4LrIrOC1LzHMBPBpoz8
4Q14QFid3lEKJXMqF5+OxFAB0Q3vj6B+LLKp9bh/P4yU9tdH3LIMW8RBKJl67WCO
VxvPQdGG8eWiN8thGQhWT/fct/3LZx8HpW4KPUrnWDKOanNEhVDZa6au+hmHgBYA
8HkyBOMaxj8UZ9UnE3DMsWDz7Gtcj2jEXdpQtnxMdmpWWqPicKGFNffDFHKOfhzP
6brFmTonL0H5JDMABKpo32EpLQUFit8ZtfmvJhDt6WKvmyZTcwLqbJ2WhucpjpiU
AP4Mamr4xzHgK2XtQf9hFuG/cE3+ZyByReLFOTOP6PaiAkkgtSSiWgaoDH0iHHl/
GAcBM0GT15dD8+MUIAI6mFa8MWUWaBJkSZkBs2T0tXm3Jcqrdf1oUnNeArvLqHF4
VD3LgMvSE4JfBOfhqVuecN/knOnB1ChyqQ/iFhvJ+39QSLwVI0dqL2sCCd6iiXUa
6kGg+shxj44YWZMKh4UgFwaQ+NZ8RsM+Wvs5w9yBynu5YfdCxpElr3uNUoXgjgEj
3N0qtu/sg/Tl1JLCo36s68EifTT7x0anNiFj4G/gqp/wRk7+bRfA2luqHluCkS7X
KqilwTsxus8DvJhMwLKONyr0boIzpUMsq0kRQh5BvEsqPHjSk5Th8485bYsyxcle
KCXzWZlWPUs4MTHUoBGj
=P/3D
-----END PGP SIGNATURE-----

--xW8yAg6m/0S7qvWU--
