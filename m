From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 1/5] Documentation: dt-bindings: add documentation on
 new DT binding format
Date: Tue, 8 Sep 2015 17:55:05 +1000
Message-ID: <20150908075505.GF24774@voom.redhat.com>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
 <1440739433-6799-2-git-send-email-mporter@konsulko.com>
 <CA+bK7J76Z6H4gh-UXxMWqUYrdRx1GYKFkAAtDUszpT_8k=RCQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="juZjCTNxrMaZdGZC"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CA+bK7J76Z6H4gh-UXxMWqUYrdRx1GYKFkAAtDUszpT_8k=RCQw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--juZjCTNxrMaZdGZC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2015 at 09:59:14AM -0700, Tim Bird wrote:
> On Thu, Aug 27, 2015 at 10:23 PM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrot=
e:
> > Documentation explaining the syntax and format of the YAML-based DT bin=
ding
> > documentation.
> >
> > Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > ---
> >  .../devicetree/bindings/dt-binding-format.txt      | 106 +++++++++++++=
++++++++
> >  1 file changed, 106 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dt-binding-format=
=2Etxt
> >
> > diff --git a/Documentation/devicetree/bindings/dt-binding-format.txt b/=
Documentation/devicetree/bindings/dt-binding-format.txt
> > new file mode 100644
> > index 0000000..f9acc22
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dt-binding-format.txt
> > @@ -0,0 +1,106 @@
> > +--------------------------
> > +Device Tree Binding Format
> > +--------------------------
> > +
> > +Background
> > +----------
> > +
> > +DT bindings historically were written as text in prose format which
> > +led to issues in usability of that source documentation. Some of
> > +these issues include the need to programmatically process binding
> > +source documentation to do DTS validation, perform mass updates to
> > +format/style, and to generate publishable documentation in HTML or
> > +PDF form.
> > +
> > +Overview
> > +--------
> > +
> > +The DT binding format is based on the YAML text markup language.
> > +Although there are many text markup options available, YAML
> > +fulfills all requirements considered for a DT binding source format
> > +which include:
> > +
> > +1) Must be human readable
> > +2) Must be easily translated to other data formats (XML, JSON, etc).
> > +3) Must have sufficient tools and libraries to enable developers to
> > +   build new tools for DT binding processing
> > +4) Must have a complete spec to refer to syntax
> > +
> > +YAML is documentated in the specification found at
> > +http://www.yaml.org/spec/1.2/spec.html
> > +
> > +The required YAML DT binding tag format and syntax are defined in
> > +the following sections.
> > +
> > +YAML DT Binding Syntax
> > +----------------------
> > +
> > +* Lines starting with "#" are comments and not part of the binding its=
elf
> > +* "%YAML 1.2" starts a file, indicating the version of YAML in use
>=20
> I think it would be good to specify a DT Binding Format version as well.
> I would expect we may expand the syntax, or we may alter it, so it
> would be good to have a number for our specific syntax.  This would
> help in some circumstances, if we make multiple passes over the
> documents to achieve our conversion.  Maybe this should be added
> below.

Good point.  In fact, I think it's absolutely essential that we
include that.  This is a complicated business and we're bound to make
mistakes in the binding definition format - a version number gives us
a way to fix them without requiring changing all the existing bindings
at once.

[snip]
> > +* [O] compatible: sequence of valid compatible descriptors
> > +      [R] name: the compatible string surrounded in double quotes
> > +      [O] deprecated: a deprecated compatible string surrounded in
> > +                      double quotes
> > +      [O] description: description of the compatible string
>=20
> compatible is a property like all the others, and I think it's confusing
> to have it in a separate section.  For example, when listing other
> properties, the "name:" field specifies the property name, but for
> the compatible section the "name:" field specifies the possible values
> for the compatible property.  This is (at least to me) quite confusing.
>=20
> Can we make this a regular property, with an option 'deprecated' attribut=
e.
> I guess we may need to distinguish between deprecated properties and
> deprecated vales of properties.
> The above 'deprecated' specifies deprecated values for the compatible
> property, while
> the section below specifies deprecated properties.  I don't see a way
> to indicate a deprecated
> value for a still-existing property, but that may be too much detail for =
now.

So, I think folding compatible in with the rest is a mistake.  There
are two important distinctions between compatible and the other
property descriptions:

1) (See my other post for context) The most important is that
compatible is the "key" for the binding.  It's what lets you know the
binding is in play, rather than just saying what the requirements are
once you know it's a relevant binding.

2) The condition we're typically listing for compatible is that it
must contain the given compatible string - it's valid and common to
also have additional compatible strings (e.g. for the future,
backwards-compatible revision of this device).  For most other
properties we're describing the *whole* value it should have.

Eventually I think we'll want a general way of expressing such
"equals" versus "contains" conditions, but that's a pretty hard
problem, so for the first cut I think it's reasonable to special case
'compatible'.


Incidentally, note that it would also be quite common for 'compatible'
to appear in *both* the "key" and the requirements.  e.g. the binding
for "foo,bardev-revision-b" could require that compatible also list
"foo,bardev-revision-a" if it's backwards compatible.

> > +* [O] required: sequence of required properties:
> > +      [R] name: name of the property surrounded in double quotes
> > +      [R] description: description of the property
> > +      [O] reference: optional reference to a binding id
>=20
> I would recommend we add types and value constraints to the
> binding schema:
>=20
> [O] type: type of value for this property, and if specified must be
> one of the following (without quotes):
> "string", "number", "array", "phandle"

It might be worth re-using the type names used in old OF documents
here.  Although "prop-encoded-array" tends to cover an awful lot there.

> [O] value constraint: specifies a limit on the value for a property.
> This can be specified as English text, or be a range or choice constraint.
> The latter two should be expressed with the following exact english
> phrases (without quotes):
> "must be in the range x to y, inclusive"
> where x and y are numbers
> "must be one of <choice 1>, <choice 2>, ..."
> where <choice x> is a string, which should be quoted
> if it includes a comma.
>=20
> Any other constraint is expressed in free-form English text

Requiring exact english phrases when we're already have a flexible
encoding scheme with YAML is pretty horrid.

I'd suggest instead that English constraints just go in the
description.  We can add new fields for specific types of machine
verifiable constraints as we implement them (e.g. "max", "min",
"allowed-values").

> I would recommend adding these to this binding schema doc, but
> not requiring them on the first conversion pass of the docs.
>=20
> Basically my idea is that you want the each pass over the binding
> documents to be as painless as possible.  Every time a user encounters
> something they're not sure about, it will slow them down.  There will
> be lots of ambiguous situations, and we want the process to be as
> lossless as possible, so I would recommend a strategy of doing as
> much as people can, and if in doubt just put any outstanding text
> in the descriptions.  The descriptions will always be free-form text,
> and we can come along later and convert these to types, constraints,
> as we see fit.
>=20
> > +* [O] optional: sequence of optional properties:
> > +      [R] name: name of the property surrounded in double quotes
> > +      [R] description: description of the property
> > +      [O] reference: optional reference to a binding id
> > +
> > +* [O] deprecated: sequence of deprecated properties:
> > +      [R] name: name of the property surrounded in double quotes
> > +      [R] description: description of the property
> > +      [O] reference: optional reference to a binding id
> > +
> > +* [R] example: sequence of examples:
> > +      [R] dts: DT source of example usage. The example text must use
> > +               literal style ("|") so that it retains indentation and
> > +               newlines.
> > +      [O] description: description of the example
> > +
>=20
> I'd recommend having a top-level notes section:
> * [O] note: any other notes about this node that are not covered by
> preceding property descriptions.

Good call.  Although I'd suggest "description" to match the name used
elsewhere.

> > +Note: [R] and [O] denote required and optional fields, respectively.
>=20
> I'd put this note before the format description.
>=20
>  -- Tim
>=20
> > +
> > +Skeleton Binding
> > +----------------
> > +
> > +The skeleton.yaml binding found in the top of the DT binding tree
> > +is the canonical example of syntax and format to use when writing
> > +a DT binding document. It is maintained with the latest formatting
> > +conventions, making it the best starting point when writing a new DT
> > +binding.
> > --

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--juZjCTNxrMaZdGZC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV7pRZAAoJEGw4ysog2bOSzZoQAIOyylaKSeveOQshDcWZ/BgI
wBpGozCwVZ9KWan1bM+Hiz1DBQDbxE5U4H608hQN+a8vMNpG93DrJ4OzPjMgvNjv
PzBf51XFGeg6KRQExvmWMXvpTblWRLoRe6VeJrc20egHrZT5RuvbUjF9TLPXk2Cq
rdt2KgUlJHwwUphi23j21N7iWBsRh2DlMQnpwOJt3et8ht2zhrmAwt2PDUWhZAW2
9zB116Tw/vmewOFKyUQFzTRni7UJK9AX7fqBdZ04kgFYHUkfol69PcwI10Senypf
y9UvgcyUrqPD9ulk3eHf3mnkeFVQYnGbFQsiyS24aROB7hSS9O1ai4l0OmX+KOge
q3wEKZIAYvWVWSHVGmg4IMYR/TOF62NQmLOKPSIk4nbi07BsQBwBYCmfoiJNcm55
SqCcfJGzVRhFUtx2OjuRukYcp0iMpsn3TkzrOZh5rkq+eRCunoW4CTavTyltu2rh
Rkei2BXUXWm8pCwl2FDx4URxk7ZbDWoV55UtpLdIN0BPH0Uiuy1NG7PXN7Ga5hCw
e936J++baru39+vQQfxWxKR+Y4i9bBWl3OGXZ/RgEqCIOS1ihyuLx4G6gxrDIQFF
G+8CPiF6PWgn8P/GDdlVM+5Yb3BXz2CkWddhBGBABZ5R27eea5BSVLdn+2T+85x4
B8l+f8DUgH4DrH2f06oX
=3DlH
-----END PGP SIGNATURE-----

--juZjCTNxrMaZdGZC--
