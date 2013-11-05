From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: pci-mvebu driver on km_kirkwood
Date: Tue, 5 Nov 2013 09:13:45 +0100
Message-ID: <20131105081344.GA1088@ulmo.nvidia.com>
References: <20130731100359.3e789236@skate>
 <51F8CA44.4080802@keymile.com>
 <20130731110045.2dc84981@skate>
 <20130731205034.GA17615@obsidianresearch.com>
 <20130809140140.GA14990@ulmo>
 <521B1F6A.1090304@keymile.com>
 <20130826120200.GA15842@ulmo>
 <521B6AF3.9070909@keymile.com>
 <20130826191615.GA20192@obsidianresearch.com>
 <5277B417.2030506@keymile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5277B417.2030506-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerlando Falauto <gerlando.falauto-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "Longchamp, Valentin" <Valentin.Longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2013 at 03:49:59PM +0100, Gerlando Falauto wrote:
> Hi folks,
>=20
> thank you for your patience...
>=20
> So, thanks to Thierry's example:
>=20
> > https://gitorious.org/thierryreding/linux/commit/b85c03d73288f6e376fc15=
8ceac30f29680b4192
>=20
> and Jason's explanation:
>=20
> > The reg must encode the bus number according to the OF format:
> >
> >                 33222222 22221111 11111100 00000000
> >                 10987654 32109876 54321098 76543210
> >   phys.hi cell: npt000ss bbbbbbbb dddddfff rrrrrrrr
> > phys.mid cell: hhhhhhhh hhhhhhhh hhhhhhhh hhhhhhhh
> >   phys.lo cell: llllllll llllllll llllllll llllllll
> >
> > bbbbbbbb is the 8-bit Bus Number
> > ddddd is the 5-bit Device Number
> > fff is the 3-bit Function Number
> >
> > Others are 0.
>=20
> I'm finally starting to make some sense out of this, and I checked
> that Jason's statement is indeed true, at least on 3.10:
>=20
> > Device tree can include the discovered PCI devices, you have to use
> > the special reg encoding and all that weirdness, but it does work. The
> > of_node will be attached to the struct pci device automatically.
>=20
> [Hi latency was also due to other activities, not just the low
> throughput of my brain cells] ;-)
>=20
> I have one last question for Thierry though: what's the point of
> things such as
>=20
> +					pci@0,0 {
> +						compatible =3D "opencores,spi";
>=20
> (apart from clarity, of course)?
> I mean, wouldn't the driver be bound to the device through its PCI
> vendor ID / device ID?
> Are we also supposed to register a platform driver based on a
> compatible string instead?

I think that compatible property is completely bogus. Or at least the
value is. The primary reason why I included them was for descriptive
purposes.

According to section 2.5 of the PCI Bus Binding to Open Firmware[0] this
should be something like:

	compatible =3D "pciVVVV,DDDD";

where VVVV is the vendor ID and DDDD is the device ID, both in
hexadecimal. Section 2.5 lists a few more, but I'm not sure exactly
which would really be required.

I'm not even sure that they really are required at all. The drivers will
certainly be able to bind to them via the standard vendor and device ID
matching as you say. And no, no platform driver required.

Thierry

[0]: http://www.openfirmware.org/1275/bindings/pci/pci2_1.pdf

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSeKi4AAoJEN0jrNd/PrOhcOkP+gLuwgCoUZCNwj6Ser++Miy8
21SUwI+ndqXmelNkbrKMljMS/c8pVMFoHGumm9sZxS6heHuXh0Zd/xbB7KgoLmXX
d2jEh7BOtQ5LmwStzQ95cMLqFB70QbeKLdw22pe4F4UmE7QWCJwlsstxuMipIwF5
36kdOBV9C2f8i63IuzfrK2n3Rrxu3ORyrkPbVNaQ2aJXj2Vz+ILnAavyZNw+kXmV
TteaEedzftptMPJTCy9cftCxpJw9E2Ct23wIlJLfaGhXEwrul/lfSTuL7AgFSjv+
l5QMgxXJEsEeQm7cELPXQoQEIKxzdF8M4LauKKIWn09I3JQumugrUiRHEA/uwVa1
QODKZ4c0/Yp9U5LeQAcCJI0Gc2ElWj+luEMopXgOtacOabHLIMXsOL/orttXLxZd
trDMlcagZ6d9vbACi20TyPTDKBM5oVNxbXFsZl8EeF5Nrh8qaMYyvlWBGDZqN9TO
0lXT4z/Sa2JltPJoejlWvOt5wjqyM0D8gK1X9D2jjsaNByd6bAvEzowZVoJ0BywY
oaIil5kLSVEmWhW55w0SwEMqtksNJk6DgZGq1oGxxBVOAL+9d1VK6JJgq/un82ZW
M1ZpGnI+dI97Y/Y2AzEPvMZlCYlfLylue4ItRpmBfhg3bc2dLsTqT2JY5W7XtaCI
rN0lH1Bm6mLD+8V2DFUC
=BZkm
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
