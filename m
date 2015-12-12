From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format
 binding
Date: Sat, 12 Dec 2015 16:51:05 +1100
Message-ID: <20151212055105.GA17011@voom.fritz.box>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
 <1449292763-129421-4-git-send-email-computersforpeace@gmail.com>
 <CAOiHx=nz2bdA_R610ozsQHhccdcrHVVCamTtne5ReHrA-FcaaQ@mail.gmail.com>
 <CAOMqctTbUNd0GtY07YJuxem9HkU1WZ-NtO556=Yg2QrsF49Xjw@mail.gmail.com>
 <20151207013628.GC20139@voom.fritz.box>
 <20151210204324.GK144338@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151210204324.GK144338@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>
Cc: Michal Suchanek <hramrach@gmail.com>, Jonas Gorski <jogo@openwrt.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, devicetree-spec@vger.kernel.org, Simon Arlott <simon@fire.lp0.eu>, Linus Walleij <linus.walleij@linaro.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Rob Herring <robh+dt@kernel.org>, MTD Maling List <linux-mtd@lists.infradead.org>, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2015 at 12:43:24PM -0800, Brian Norris wrote:
> On Mon, Dec 07, 2015 at 12:36:28PM +1100, David Gibson wrote:
> > On Sat, Dec 05, 2015 at 10:33:30PM +0100, Michal Suchanek wrote:
> > > On 5 December 2015 at 12:39, Jonas Gorski <jogo@openwrt.org> wrote:
> > > > On Sat, Dec 5, 2015 at 6:19 AM, Brian Norris
> > > > <computersforpeace@gmail.com> wrote:
> > >=20
> > > >> +
> > > >> +Examples:
> > > >> +
> > > >> +flash@0 {
> > > >> +       partitions {
> > > >> +               compatible =3D "google,fmap";
> > > >> +       };
> > > >> +};
> > > >
> > > > I wonder if this wouldn't be better served in a separate binding doc
> > > > with its compatible name as the filename, like we do with
> > > > driver^Whardware blocks, especially if we want to add more parsers.
> > >=20
> > >=20
> > > I find that *very* counter productive for bindings that go to the same
> > > node. You have a description of a node, and then suddenly there you
> > > have another file with another description of the same node. Totally
> > > awesome.
> >=20
> > I can't actually work out from that if you're agreeing with the
> > original post or the first reply.
>=20
> Perhaps I'm biased, but I think he was agreeing with the first reply.
> (Particularly, "I find that *very* counter productive" uses the word
> "that" to refer to "separate binding doc[s]".)
>=20
> > > Also how do you plan to write partitioning schemes with parameters
> > > like with non-zero offset of the partition table.
>=20
> If you are directing this question at me: I don't have a specific plan
> for it. MTD parsers don't currently take external input for this; many
> scan the whole device, but some might also have conventions built into
> the parser itself too, so this just gets hooked based on "compatible".
> But if the need arose, I would hope we could work out a common binding.
>=20
> > Presumably with properties in the patitions node.  Not seeing the
> > problem here.
>=20
> I believe Michal is bringing up the (important, IMO) point that if
> distinct partition types are being described in the same node, then any
> use of additional properties *must* be closely coordinated. We can't
> have two parsers "foo" and "bar" defining conflicting uses of the same
> property in the same node, like this:
>=20
> 	partitions {
> 		compatible =3D "foo", "bar";
> 		property-baz =3D ...; // e.g., reg =3D <...>;
> 	};
>=20
> where if "foo" is not found, we fall back to "bar". But what if "foo"
> and "bar" use "property-baz" differently?

Ah.. that is an excellent point, and leads me to realise that using
compatible in this way is wrong.  The whole point of compatible is
that the node is, well, compatible with *all* the things in the list,
and therefore the things in the list are compatible with each other.

Using it for a list of entirely different things to attempt in order
is not correct.


> Having everything in one doc would help ensure that the entire
> "partitions" binding is considered as a whole when extending it, in my
> (and an in my interpretation of Michal's) opinion.
>=20
> Brian

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWa7XJAAoJEGw4ysog2bOSBWoQALjYls+DpoYTVxJCSeQxE1Fk
OKGQir1DdPa+/sufisuieOvw3vn5tPV96s13n82I+86G0V83Qi3PoYMpU+I8wOx7
zR6UNI0VmyRWEDOrGKP62K+iCEqYEDTcyaf/lvGLP9XcDYLfar20DDTOmIrWt+7T
5NcLx5EG93VxES99iyaYqKTODB85R4X0z9O9AewaE+qHQDjvrgL2yn74dmPMlE79
CyUcEGEErPFOA5EgQOK69YDfUxdrPbL2uVFuyzuQSDapSgwxPSiVCdApxBZEp9wY
Rvxn/7TIDAaua2tMKQvvhDk6Tt4figSFTV0199vKrPUqfy29w9JY0XdPR5mdM8zg
bNjMuazbeTMzpIr7tdJWh+ipA/rTsdXTVmSbGnQIzkRlDFiRBg4M+T8ZbcWbDujz
MNO91QoRYnzICNH+dN6+npPZJkoI52cxfUMi8qd/Lf3t6HmxS7cYe/ZOru49VS5c
uWWFqJCGMaNMZ+xvrIYvlD/HGTFxus9SHaKgE804QaxSPc+W15+1x0sp1v95XW9o
Y3oqUclqIX7i58iN2cYavbA4XwoLdENhLtvErMXNTjZ69UkBGU/ZNjT2NDZpanfv
x27guz5PeF8tjHUJJuyD3+eIkhPEVIJOq/P8ShjmjM0nN714BnEH8auZGyF/O7D7
RwlTJDiIb+g1cbekXl0D
=YGRz
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--
