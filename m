From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format
 binding
Date: Thu, 17 Dec 2015 12:05:03 +1100
Message-ID: <20151217010503.GD3011@voom.redhat.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-4-git-send-email-computersforpeace@gmail.com>
 <CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ@mail.gmail.com>
 <CAOMqctTbUNd0GtY07YJuxem9HkU1WZ-NtO556=Yg2QrsF49Xjw@mail.gmail.com>
 <20151207013628.GC20139@voom.fritz.box>
 <20151210204324.GK144338@google.com>
 <20151212055105.GA17011@voom.fritz.box>
 <CAMuHMdXA4-BZpvtCM8_9fYWLzoVsuCXDqvF3G4cVd50Cqsfv0g@mail.gmail.com>
 <20151215060056.GB3011@voom.redhat.com>
 <CAMuHMdVUMHEAGSwF=nvbncHEj6Co9f6CofeVqZbrWzhaprBvGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVUMHEAGSwF=nvbncHEj6Co9f6CofeVqZbrWzhaprBvGQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Michal Suchanek <hramrach@gmail.com>, Jonas Gorski <jogo@openwrt.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, devicetree-spec@vger.kernel.org, Simon Arlott <simon@fire.lp0.eu>, Linus Walleij <linus.walleij@linaro.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Rob Herring <robh+dt@kernel.org>, MTD Maling List <linux-mtd@lists.infradead.org>, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org


--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2015 at 11:03:48AM +0100, Geert Uytterhoeven wrote:
> Hi David,
>=20
> On Tue, Dec 15, 2015 at 7:00 AM, David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >> If the only property needed is the partition table offset, it can be e=
ncoded
> >> in the unit-address, and the "reg" property:
> >>
> >>         partitions {
> >>
> >>                 partition-table@xxxx {
> >>                         reg =3D <0xxxx ...>;
> >>                         ...
> >>                 };
> >>
> >>                 ...
> >>         };
> >
> > Urgh.. and that's abusing the unit address.
>=20
> Why? The partition is part of the FLASH. In this respect, it doesn't diff=
er
> from other hardcoded partitions using the same DT syntax.
> It would just have a compatible value indicating it's a partition
> table.

Ah.. yes, fair enough.  I'd forgotten that the encoding of explicit
partitions in the device tree already established the address space
here as being the flash blocks.  So, no, it's not an abuse of unit
address.

Doesn't help for partition table types which require scanning the
device, of course.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWcgo/AAoJEGw4ysog2bOSatIQAKZqCg3MvfxT/vSzUw6SBeKx
a4QKXJlmxFtsGzBfFBHog+/YkJx4ewLRE7fPn2JDhHBWYqG4V5/QxKKIgqZVVIl4
yGvN4M3AEw4SHoKesRiL8rfR49/FHJZkTwV7eF4h2RfaT7/aDyqlrlMf5LOvGgN2
GqInKWZqCSQafELz3BY0r2jjxWwxoo34A6hEqVkxUgQ1oC1oy34JsePeThMzYj7V
nMsxelmtN0+q2xkXLQ/A8kjRMnn9A3wvbW4ysbtqU37BEZ65IOgOux2FMdE/+vqb
FFaWDsyXxUOULEtpXRrLNYdwqtFD6lcH7s1KSYKNlz9gZ8A6xWgnKeFOlkWhNdiT
Nk8HmkCkcn01v9Y+IovxJk1KqQzOfREYVVI+4okN3xUmSDvOkUpz2aWBVdl+hSao
Tq6vYRlgK4+ZmEQzID0+DbeWN+hnjuY8J1syaBphWWUMeCfN/9OQ6XroDiR666Fg
3SijBSJfRGQddV4eM97Y4QoQHrqV+gl5G0QKmySZBQFYrI03GcZydr4Zh/yDIHzT
lsbyl46G5rByKIH2X0e7H9XnGZGIcqgdijYQ3Nr8yUgUr5rXntasV2UX7L1vpZ2W
O1x33Lfb1PcVJ1GeXpd9hYXpB9af2Q3nQ8LPYY8chbjOg4pIGf8eIM4zv15dmGhv
5CTFqkcI6XNO/vCo3c5I
=wYqu
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--
