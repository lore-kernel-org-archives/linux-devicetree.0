From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 2/2] Warn on node name unit-addresses with '0x' or
 leading 0s
Date: Thu, 25 Feb 2016 11:49:01 +1100
Message-ID: <20160225004901.GA22216@voom.redhat.com>
References: <1455223619-16052-1-git-send-email-robh@kernel.org>
 <1455223619-16052-3-git-send-email-robh@kernel.org>
 <20160219050709.GB15224@voom.fritz.box>
 <CAL_JsqLDdyLd4z_Pmsr7+vtnMZsusEpJYZ4tdZmjQFt0PD_Fbw@mail.gmail.com>
 <20160223054746.GT2808@voom.fritz.box>
 <CAL_Jsq+Nr6uzA0xzc=zKG4diZwDrgsbLAKDb80m6ZSq2NXcGgA@mail.gmail.com>
 <20160224004456.GB2808@voom.fritz.box>
 <20160224150130.GA13624@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160224150130.GA13624@rob-hp-laptop>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2016 at 09:01:30AM -0600, Rob Herring wrote:
> On Wed, Feb 24, 2016 at 11:44:56AM +1100, David Gibson wrote:
> > On Tue, Feb 23, 2016 at 08:35:46AM -0600, Rob Herring wrote:
> > > On Mon, Feb 22, 2016 at 11:47 PM, David Gibson
> > > <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > > On Mon, Feb 22, 2016 at 10:51:46AM -0600, Rob Herring wrote:
> > > >> On Thu, Feb 18, 2016 at 11:07 PM, David Gibson
> > > >> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > > >> > On Thu, Feb 11, 2016 at 02:46:59PM -0600, Rob Herring wrote:
> > > >> >> Node name unit-addresses should never begin with 0x or leading =
0s
> > > >> >> regardless of whether they have a bus specific address (i.e. on=
e with
> > > >> >> commas) or not. Add warnings to check for these cases.
> > > >> >
> > > >> > Hmm.. I'm pretty sure that's true in practice, but it's not true=
 in
> > > >> > theory.  A bus could define it's unit address format just about
> > > >> > however it wants, including with leading 0s.
> > > >>
> > > >> Only if it is not reviewed... This whole check is about what best
> > > >> practices are, not what is possible.
> > > >
> > > > Hmm.  dtc checks are really about checking for best practice at the
> > > > level of individual dts files, though, not bindings.
> > >=20
> > > Checking simple-bus specifically would be checking a binding.
> >=20
> > Sorry, I wasn't clear.  dtc checking the dts against a binding is
> > fine, but checking the sanity of the binding itself is beyond its
> > scope.
> >=20
> > > >> > I think a better approach would be to add a test specific to
> > > >> > simple-bus devices (by looking at compatible on the parent) that=
 fully
> > > >> > checks the unit address.
> > > >> >
> > > >> > From there we can start adding tests for other bus types.
> > > >>
> > > >> simple-bus is easy enough,
> > > >
> > > > So, start with that, then tackle the next problem.
> > > >
> > > >> but then next up would be I2C and SPI. We
> > > >> can't generically tell if a node is on I2C or SPI bus.
> > > >
> > > > Why not?  Or perhaps.. how generically do you need?  I think having=
 a
> > > > big list of i2c / spi controllers would be acceptable here, if not
> > > > ideal.
> > >=20
> > > So someone adds a new controller, puts crap in for unit addresses, and
> > > then no warnings until that compatible string is added to dtc. And I'm
> > > still left spending my time in reviews telling them to fix this
> > > trivial crap.
> > >=20
> > > That's roughly 60 I2C controllers (families, so multiple compatible
> > > strings each) plus similar number of SPI controllers, OF-graph
> > > binding, and random other things where reg gets used.
> >=20
> > Ah, I see.
> >=20
> > Ok, I guess we do need to have an option for a "fallback" scheme for
> > unit addresses (i.e. hex) for bus types we don't specifically
> > recognize.  But I'd still like the logic to be:
> >       if (known bus type)
> >            check against format for this bus type
> >       else
> >            check against fallback format
> >=20
> > Rather than putting the second test in with a hacked up set of
> > exclusions.
>=20
> Okay, makes sense.
>=20
> Do you think we still need simple-bus as an explicit type given the=20
> check is the same as the default? Might be useful to have if we want to=
=20
> add some checks that address translations work.

So they should be able to have common code to actually do the check /
formatting, but yes, I'd like an explicit check for simple-bus as
well.

> > To do this nicely, I think the best way will be to add a bus_type
> > field to the node structure in dtc, and have it populated (with an
> > option for "unknown") in an early check pass, that later unit address
> > tests can references as a prereq.
> >=20
> > Pointer to a struct with unit address formatting functions, with NULL
> > for unknown is the obvious choice to me for bus_type.
>=20
> So, something like this for the first stage:
>=20
> static bool pci_bus_check_is_type(struct node *node)
> {
> 	struct property *prop;
> =09
> 	if (!node || !node->parent)
> 		return false;
>=20
> 	prop =3D get_property(node->parent, "device_type");
> 	if (!prop)
> 		return false;
> 	=09
> 	if (strcmp(prop->val, "pci") =3D=3D 0)
> 		return true;
> 	=09
> 	return false;
> }
>=20
> static void pci_bus_check_unit_address()
> {
>=20
> }
>=20
> struct bus_type_fns {
> 	.check_is_type =3D pci_bus_check_is_type,
> 	.check_unit_address =3D pci_bus_check_unit_address,
> } pci_bus_fns;
>=20
> struct bus_type_fns * {
> 	&pci_bus_fns,
> 	NULL
> } bus_types;
>=20
> static void fixup_bus_type(struct check *c, struct node *root,
> 				  struct node *node)
> {
> 	struct bus_type_fns **bus;
> =09
> 	for (bus =3D bus_types; *bus !=3D NULL; bus++) {
> 		if (!(*bus)->check_is_type(node))
> 			continue;
>=20
> 		node->bus_type =3D *bus;
> 		break;
> 	}
> }
> ERROR(bus_type, NULL, NULL, fixup_bus_type, NULL, NULL);

Uh.. close-ish, but I think we can a bit better.  This approach means
the checks won't happen if someone forgets the device_type.  So, I
think it's preferable to determine bus types (where we can) for the
bus parent node, rather than the child nodes; then make the checks on
the child nodes based on the bus_type of the parent.  So maybe
something like

struct bus_type {
	.expected_addr_cells =3D 3,
	.expected_size_cells =3D 2,
	.is_type =3D is_pci_bridge,
	.check_unit_addr =3D pci_unit_addr,
} pci_bus_type;

struct bus_type {
	.expected_addr_cells =3D -1, /* For don't care */
	.expected_size_cells =3D -1,
	.is_type =3D is_simple_bridge,
	.check_unit_addr =3D default_unit_addr,
} simple_bus_type;

Checking the addr and size cells here means you can make the unit
address checker have the "reg" format checker as a prereq, so you
don't have to worry about badly constructed "reg" properties in the
unit address format function.

static void check_unit_address_format(struct check *c,
				      struct node *dt,
				      struct node *node)
{
	struct bus_type *bt;
	char expected
=09
	if (!node->parent)
		return;
	bt =3D node->parent->bus_type;
	if (!bt)
		bt =3D default_bus_type;

	bt->check_unit_addr(c, dt, node);
}
			    =20


--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWzk99AAoJEGw4ysog2bOSUzAP/3cj7QIowUC0datj+ZGERZFp
UBqTeheD6PE0+ciCjnzqtqYrXOhFfjEQCPmF63lzPak3ZMJgEHWl+WkYAfs/BCPY
iGa591H6MmI6tgtSJEjx05NvdqI0VLRknFlVhnoejQ3IBdgPgUuTURvPryXOvAZG
LYWIS1a6qucmUNZ7lAaBBNxyjOW4NPIIwqU3GG/+praLiWJWUL1gU2C0fqs4GPyO
F+VZECNXcxCO52vjAzpDvPT92gxU9EizLjTCLZAh8CgNeWKfJx9v9LkPWQ/GLJ2t
F0SFMdRIqmAMxPtTFivkW4EyWvCgptf1ACVHBKlpL/gP5Ob/KUdogRjWhQ1RMoMN
gcKJMYoyMpC+TYJ5ORWjB5CXEZPqMgI8VprVPnpkk0pZpZ/9/F/VprAbEBkR3uv4
klsAAx1fZJHCq6X6FJjHyvY50MqfFgwE+viAgmj4Nnbi4MZ6xxUVRwI0cPmiY0sC
AkExQE4uDqca6mPM2+olqTB9WOtUso9ch8ynlxofSWrj4OlWnJFCxOPkZvFb/FJq
SfBpfOrhek9AvRR76RoBt/qMLQgmTngKbiv/7sqHKJa59xuoEWfBv4+Xk0n3PyKr
1j35GPAvYdouJDbcUlkKPMM4PMIuyH7y85qVNFTyILZ2FQSCyJSTDChH3V8rCDc7
CFeU82rCVIObLKt2s6R5
=PL+z
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
