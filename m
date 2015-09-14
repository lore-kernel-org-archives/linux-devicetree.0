From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 2/5] Documentation: dt-bindings: add example DT
 binding document
Date: Mon, 14 Sep 2015 18:15:58 +1000
Message-ID: <20150914081558.GM2547@voom.fritz.box>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
 <1440739433-6799-3-git-send-email-mporter@konsulko.com>
 <CAL_Jsq+FE4MCCfZC5hDhQBmM1gHibY82S9a8PC1GwsnWsPNxkg@mail.gmail.com>
 <20150910070850.GA11781@voom>
 <55F25C95.3010104@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dp9QYJgVRVEW2bsm"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55F25C95.3010104-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--dp9QYJgVRVEW2bsm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2015 at 11:46:13PM -0500, Rob Herring wrote:
> On 09/10/2015 02:08 AM, David Gibson wrote:
> > On Fri, Aug 28, 2015 at 09:53:06AM -0500, Rob Herring wrote:
> >> On Fri, Aug 28, 2015 at 12:23 AM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> w=
rote:
> >>> Add a skeleton DT binding document that serves as the canonical
> >>> example for implementing YAML-based DT bindings documentation.
> >>> The skeleton binding illustrates use of all fields and variations
> >>> described in the dt-binding-format.txt documentation.
> >>>
> >>> Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >>> ---
> >>>  Documentation/devicetree/bindings/skeleton.yaml | 98 +++++++++++++++=
++++++++++
> >>>  1 file changed, 98 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/skeleton.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/skeleton.yaml b/Docume=
ntation/devicetree/bindings/skeleton.yaml
> >>> new file mode 100644
> >>> index 0000000..175965f
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/skeleton.yaml
> >>> @@ -0,0 +1,98 @@
> >>> +%YAML 1.2
> >>> +---
> >>> +id: skel-device
> >>> +
> >>> +title: Skeleton Device
> >>> +
> >>> +maintainer:
> >>> +  - name: Skeleton Person <skel-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >>
> >> We'd want to tie this into get_maintainers.pl obviously.
> >>
> >>> +
> >>> +description: >
> >>> +  The Skeleton Device binding represents the SK11 device produced by
> >>> +  the Skeleton Corporation. The binding can also support compatible
> >>> +  clones made by second source vendors.
> >>> +
> >>> +compatible:
> >>> +  - name: "skel,sk11"
> >>> +  - name: "faux,fx11"
> >>
> >> Is this an OR or AND? We need both.
> >=20
> > Hrm.  So, from the example below it's an OR.  But.. I think the
> > considerations here change when you separate out "tag" information as
> > I've suggested elsewhere.
> >=20
> > The command AND case, I can think of is where you want both
> > "foo,new-model-device" and "foo,old-model-device".  I think the first
> > belongs in the "tag", but the second in the body of the requirements.
> >=20
> > The OR case demonstrated here strikes me as very poor binding design -
> > but that doesn't mean we can totally avoid it, since we do have poor
> > bindings we want to convert.
>=20
> I don't think so. Often "old" is a singleton, and "new" is one of
> several newer chips.

Yeah, so the trouble is bindings like that are kind of unclear
(although you can generally figure it out by convention).  Giving AND
and OR conditions gives more detail, but still doesn't really express
what you want here.

Supposeyou have the SK33 device, and its backwards compatible
revisions the SK34 and SK35.  There's also the SK38, which is
compatible with the original SK33, but not the revised versions.

So really, you have a cluster of related bindings:

SK33 binding:
	Applies when compatible contains "skel,sk33"
	Requires compatible contain "skel,sk33"
	Describes all the basic properties of the device
SK34 binding:
	Applies when compatible contains "skel,sk34"
	Requires compatible contain "skel,sk34" AND "skel,sk33"
	Inherits the SK33 binding
	Describes any properties necessary for SK34 extensions
SK35 binding
	Applies when compatible contains "skel,sk35"
	Requires compatible contains "skel,sk35", "skel,sk34" AND "skel,sk33"
	Inherits the SK34 binding
	Describes any properties for SK35 extensions
SK38 binding
	Applies when compatible contains "skel,sk38"
	Requires compatible contains "skel,sk38" AND "skel,sk33"
	Requires compatible DOES NOT contain "skel,sk34" or
	  "skel,sk35" (arguably you don't need to specify that, though)
	Inherits the SK33 binding
	Describes any properties for SK38 extensions

Plus, for backwards compatibility you might have to have the:

SK3x binding
	Deprecated
	Applies when compatible contains "skel,sk3x"
	Inherits the SK33 binding

> It is also very common for licensed IP blocks. All
> the vendors have different quirks and possibly different versions of the
> IP. In the better cases, we can have a vendor compat for each vendor and
> then a generic compat.

So, similar considerations here.  You really have a bunch of at least
potentially different bindings for each licensed variant, but all
based on the core common binding.

> > Fwiw, I think the right way to encode "OR" at least in the "tag" is to
> > pick just the preferred form, then have additional bindings tagged on
> > the alternative forms and inheriting the main binding.  I don't know
> > if that's practical in the short term though.

But, yeah, these are common cases so we need a less verbose way of
describing it than the full version above.  At least when the
differences between the devices don't require any new properties at
all.

I think we want to special case this for the compatible property
though.  I thinkAND and OR conditions will be complex, while still not
really expressing what we need for compatible.


> >=20
> >> The complicated case is "one of {specific names} followed by {generic =
name}."
> >>
> >>> +    description: A clone of the original sk11 device
> >>> +
> >>> +required:
> >>> +  - name: "reg"
> >>
> >> We definitely need type info from the start.
> >=20
> > It's interesting you should mention that here, because 'reg' is
> > actually a hard case for describint the type: because it's format is
> > determined as much by the parent bus binding as this node's binding.
>=20
> And reg is well defined, so that's one I'm least worried about.

True/

> > I suspect it will be worth special-casing "reg" in order to make
> > common bindings more compact, but again, probably not in the first
> > pass.
>=20
> Yes, I would fully expect reg to just be flagged as used and how many
> addresses.
>=20
> >=20
> >>> +    description: chip select address of skeleton device
> >>> +    reference: spi-slave
> >>
> >> I would like to not have to list properties if the inherited binding
> >> lists it. The problem is we need to say how many cells and the order
> >> (not a problem here, but for mmio devices).
> >>
> >> Perhaps we can list the reference at the top level for the node
> >> instead of for every property.
> >=20
> > Yeah, I think it would be worth having a top-level "inherits" field.
> >=20
> >>> +  - name: "spi-max-frequency"
> >>> +    description: >
> >>> +      Maximum SPI clocking speed of skeleton device in Hz, must be
> >>> +      1000000
> >>> +    reference: spi-slave
> >>
> >> Rather than listing the property and having constraint in description,
> >> perhaps we could add constraints like this:
> >>
> >> - spi-max-frequency-range: 1000000 1000000
> >>
> >> Or groups of constraints:
> >>
> >> - spi-max-frequency-constraints:
> >>   range: 1000000 1000000
> >>   some-other-constraint: <value>
> >=20
> > Not for the first pass I think.  What I would suggest is having
> > "description" for pure informational stuff, and "constraint" or maybe
> > just "extra" for normative constraints expressed in English.
>=20
> At least for simple constraints, I don't see the point of manually
> converting to something still not machine parse-able. We should be able
> to figure out a syntax. Sure, there may be complex examples we just punt
> on, but we can address most common cases. But if we can't define a
> syntax, then lets do nothing until we do.

Sure.

> > The idea here is that over time we can add new ways of expressing
> > constraints.  In the meantime tools can use the "extra" field to
> > preseve any difficult text in the current versions and at least let
> > tools know that they won't be able to check everything.
>=20
> Just keeping the existing doc text will preserve things.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dp9QYJgVRVEW2bsm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV9oI+AAoJEGw4ysog2bOSej8P/2aALkfBq+ecAyOpZ7ao2wnV
h2gyYhNZG6Wb/u0kZAb38sdyOlmtCK4OiUzSvEBeZ9G/qvLfbB2s9d3Fiw7shY+L
WUsMYEYfKx+s8xyfEFaU4zrFyNWlf4U70LHBuiviMBg5NavJzICcbcpkZoXm3EaA
4PjDbGr5cdIS9+5FRK3FLSqgu0fgUiZncMsHRfEvS5URQ7J7OJgArkKOwAIRKvf/
Bdsb3w/6QiDHy4aWTP2PVd46SVYqvQ+4sfqmDzpstwoy8Fj/Q67AT/UO/ruasyJN
hFsTZP7irsD4yji0MiJEEpiF1iEiGzgelwVgHBwC4Vl3W8Olt7hRYdiGbgf7vd1+
jCXqfYDjjYHsnlqR3fy6hhwAYAbus3hXNa7PMnpjJ5NDiCA/r0OtLOm3kdbdf2nA
/lEQQK4qyb2+X55ydrRvcwTt3TOu84IrnnF5x0OBhlCDjyQgFnfdwWcHmbyGSuIX
XUzw+UaIMmrpqlmthvxmY7S53B62M0tkJKcAcCOgX7N3pOvWcl36RL4eQMgtKt2H
mGYdXw9oqoDbF/45CED42+LiJ/Y+ihgGcivIGUmdBnC1HgqBgPRHW49DYqtlB982
vl47MVDEzTn5mMCBor6+X3CBj+IdztdqdFDIaObqUZVxlL9gXxrzdA7z+GCIcFkg
xj4v8WUXOksNdVqqxZvK
=wJ92
-----END PGP SIGNATURE-----

--dp9QYJgVRVEW2bsm--
