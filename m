From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: Olimex A64-OLinuXino: enable
 eMMC.
Date: Fri, 5 Oct 2018 17:48:44 +0200
Message-ID: <20181005154844.234g5k3fw5txqxsl@flea>
References: <20180921142811.h5jraemk565alh3i@flea>
 <CAG7TQgE_KU_cK_4E+NG8Qcw-QB2=C6YoqBYR2svmWxywFyySCw@mail.gmail.com>
 <20180925090139.qbu6tqav5oth7zkw@flea>
 <CAG7TQgFTsR4pf4jAcWMFoOmiP7AXYqjts60RP2kuJGU44AcQJQ@mail.gmail.com>
 <20180927081711.llmwnvpu73loe5iv@flea>
 <CAG7TQgGMkvBnNE_WEth8gscKxN3qN8a44mNMWz3QP-2+JKfOzg@mail.gmail.com>
 <20180929154754.abz3byvrufvnf4dq@flea>
 <CAG7TQgGS7DkLpNVYqfCD-9vMZkeY6r+L-5oXKWef3x-OVbqjtw@mail.gmail.com>
 <20181002131312.soqwybsohdifvso3@flea>
 <CAG7TQgHWCJTaM+pFYFq0_8nWg7sA+d0huqu96sjhqZfeHwqbGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wx5hjyt42ng2heyr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAG7TQgHWCJTaM+pFYFq0_8nWg7sA+d0huqu96sjhqZfeHwqbGQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rodrigo =?utf-8?B?RXh0ZXJja8O2dHRlciBUasOkZGVy?= <rodrigo@tjader.xyz>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--wx5hjyt42ng2heyr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 02, 2018 at 01:47:33PM -0300, Rodrigo Exterck=F6tter Tj=E4der w=
rote:
> > > > > About device tree overlays, I read overlay-notes.txt, but I went
> > > > > looking for an example with "git grep /plugin/ arch" and it came
> > > > > empty. Is this approach not used for other boards?
> > > >
> > > > It is, it's simply not stored in the kernel, but through other third
> > > > party repos.
> > >
> > > So that would mean that it's up to every distro to support the boards
> > > instead of relying on mainline support?
> >
> > Distros would have to integrate it either way. One would need to
> > detect and / or ask for the board variant in order to load say the BT
> > stack, or to know if you want to boot from the eMMC or from the SD
> > card.
>=20
> Yeah, but now if a bug is found in the device tree it has to be fixed
> once per distro instead of only on mainline.

Yeah, well, I never said it was perfect.

> > > > > Does the overlay approach make the device available at boot time?=
 That
> > > > > is important for a storage device such as eMMC.
> > > > >
> > > > > I went with the separate dts approach because that's what I saw w=
as
> > > > > done for other similar cases, like Pine64 and Pine64+, OLinuXino-=
LIME2
> > > > > and its variant with eMMC, among others.
> > > >
> > > > Yeah, but in all these cases, it was done from day one, not after t=
he
> > > > facts.
> > >
> > > For the LIME2 the dts for the emmc variant was commited two years
> > > after the base LIME2 dts.
> > >
> > > What if instead of keeping the current dt for the least featureful
> > > model we keep it for the most featureful model and create new dts for
> > > the two less featureful models?
> >
> > This is a different story though. The LIME2 eMMC variant was created
> > way after the original LIME2, with a separate name.
>=20
> What about the idea of keeping the current dt for the most featureful
> variant and creating new dts for the other two?
>
> That would make it so that no one's device stops working and would
> have mailine support for all three devices.

IIRC that has been the first introduced version, so that would make
sense. Chen-Yu, any opinion?

> Also, the current device tree doesn't represent any existing device:
> it has wifi on but no emmc. That variation does not exist.

Most of our device tree are far from complete, so you shouldn't treat
them as such.

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--wx5hjyt42ng2heyr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlu3h9sACgkQ0rTAlCFN
r3R/nw/9HIWSN2L+5QT2QfUGsF8tj7776M78b6WJLV9+fydMqDjlL65hFpVbW3NM
x3sbaBOkZQofDocHuM5IO+g2YcqVzuz42o8rfVG5hUY7Y+yVLdlxgpleiIevsuCm
fD4W6nJjFAlPcCkKHI1780QOvSYpOX/BpqfRp8awacElArwl8G4Zp17LDyWVeC5t
0XxT/FHzFkmyvjerlnNci6V14Ki5OexrRnFRGuTsa2LI3RibT/5X6fvhApjOJpEA
kIb7nhDay69nIRWmxmlx03omagm9B9wvAiX9vqBwDNuV1VWizv+TTpXKwXj24emB
dTeXglZoPqDPHmWPcmLfw98Coeq6zow+/UwUtRoqK20DjHrsdvUyH3y1x+PVtCgV
RJ7BNdkmqzU593q9JNlYwVEvnilvFc+YJepL05697KNBWpjXwxjqt/SHNCPn3Dio
p8OsmHST4drG2osskDMdvQZE3bSEwMPnUHCZJg5vtcxtXETRRx+Eo7FC2/BN4ZGt
5pfWUz1hZ/1f8QD1inX1xZC4e7w2ITk+trIKsHm2CsiHJRNaZQpSazSG+azllLVN
q4llyocEjI9CUDqdu1knq4RJEti1Lb+OgTWnPjq+07EaWKoanWd1+GhT1S3TSSnm
hsjD35uhct7EAf1I4DPahdulLQrJSNU+ZMxYq/0pHCi/pKkS0d0=
=lnF4
-----END PGP SIGNATURE-----

--wx5hjyt42ng2heyr--
