From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC PATCH 2/5] Documentation: dt-bindings: add example DT
 binding document
Date: Tue, 22 Sep 2015 00:06:20 -0400
Message-ID: <20150922040620.GA14895@beef>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
 <1440739433-6799-3-git-send-email-mporter@konsulko.com>
 <CAL_Jsq+FE4MCCfZC5hDhQBmM1gHibY82S9a8PC1GwsnWsPNxkg@mail.gmail.com>
 <20150910070850.GA11781@voom>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150910070850.GA11781@voom>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2015 at 05:08:50PM +1000, David Gibson wrote:
> On Fri, Aug 28, 2015 at 09:53:06AM -0500, Rob Herring wrote:
> > On Fri, Aug 28, 2015 at 12:23 AM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wr=
ote:
> > > Add a skeleton DT binding document that serves as the canonical
> > > example for implementing YAML-based DT bindings documentation.
> > > The skeleton binding illustrates use of all fields and variations
> > > described in the dt-binding-format.txt documentation.
> > >
> > > Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/skeleton.yaml | 98 +++++++++++++++=
++++++++++
> > >  1 file changed, 98 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/skeleton.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/skeleton.yaml b/Docume=
ntation/devicetree/bindings/skeleton.yaml
> > > new file mode 100644
> > > index 0000000..175965f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/skeleton.yaml
> > > @@ -0,0 +1,98 @@
> > > +%YAML 1.2
> > > +---
> > > +id: skel-device
> > > +
> > > +title: Skeleton Device
> > > +
> > > +maintainer:
> > > +  - name: Skeleton Person <skel-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >=20
> > We'd want to tie this into get_maintainers.pl obviously.
> >=20
> > > +
> > > +description: >
> > > +  The Skeleton Device binding represents the SK11 device produced by
> > > +  the Skeleton Corporation. The binding can also support compatible
> > > +  clones made by second source vendors.
> > > +
> > > +compatible:
> > > +  - name: "skel,sk11"
> > > +  - name: "faux,fx11"
> >=20
> > Is this an OR or AND? We need both.
>=20
> Hrm.  So, from the example below it's an OR.  But.. I think the
> considerations here change when you separate out "tag" information as
> I've suggested elsewhere.
>=20
> The command AND case, I can think of is where you want both
> "foo,new-model-device" and "foo,old-model-device".  I think the first
> belongs in the "tag", but the second in the body of the requirements.
>=20
> The OR case demonstrated here strikes me as very poor binding design -
> but that doesn't mean we can totally avoid it, since we do have poor
> bindings we want to convert.
>=20
> Fwiw, I think the right way to encode "OR" at least in the "tag" is to
> pick just the preferred form, then have additional bindings tagged on
> the alternative forms and inheriting the main binding.  I don't know
> if that's practical in the short term though.

I reworked this as a constraint key with C-like syntax to express
allowable compatible strings. It's got some warts but let's take
a look at v2 and see if good constraint syntax can handle all these
cases. I use some macro like constructs to denote a generic compatible
string that must be included in addition to the part-specific string.

>=20
> > The complicated case is "one of {specific names} followed by {generic n=
ame}."
> >=20
> > > +    description: A clone of the original sk11 device
> > > +
> > > +required:
> > > +  - name: "reg"
> >=20
> > We definitely need type info from the start.
>=20
> It's interesting you should mention that here, because 'reg' is
> actually a hard case for describint the type: because it's format is
> determined as much by the parent bus binding as this node's binding.
>=20
> I suspect it will be worth special-casing "reg" in order to make
> common bindings more compact, but again, probably not in the first
> pass.

I've added type in v2 and in comments note the "reg" is indeed a
special case and derived not so much from the inherited binding but
=66rom the actual parent node as used in an implementation.

>=20
> > > +    description: chip select address of skeleton device
> > > +    reference: spi-slave
> >=20
> > I would like to not have to list properties if the inherited binding
> > lists it. The problem is we need to say how many cells and the order
> > (not a problem here, but for mmio devices).
> >=20
> > Perhaps we can list the reference at the top level for the node
> > instead of for every property.
>=20
> Yeah, I think it would be worth having a top-level "inherits" field.
=20
Added in v2

> > > +  - name: "spi-max-frequency"
> > > +    description: >
> > > +      Maximum SPI clocking speed of skeleton device in Hz, must be
> > > +      1000000
> > > +    reference: spi-slave
> >=20
> > Rather than listing the property and having constraint in description,
> > perhaps we could add constraints like this:
> >=20
> > - spi-max-frequency-range: 1000000 1000000
> >=20
> > Or groups of constraints:
> >=20
> > - spi-max-frequency-constraints:
> >   range: 1000000 1000000
> >   some-other-constraint: <value>
>=20
> Not for the first pass I think.  What I would suggest is having
> "description" for pure informational stuff, and "constraint" or maybe
> just "extra" for normative constraints expressed in English.
>=20
> The idea here is that over time we can add new ways of expressing
> constraints.  In the meantime tools can use the "extra" field to
> preseve any difficult text in the current versions and at least let
> tools know that they won't be able to check everything.

I added the definitions of these and an example of use. This by no
means indicates that we plan to add constraints for every converted
binding. However, in some cases it's very easy to add with a C-like
constraint syntax. I'm sure there's cases where this will fall over
and needs to be extended but let's review that in the context of the
v2 posting.

-Matt

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWANO8AAoJEOfTILNwq7R4DH0P/Rlcty06yMiIq28HgzBOiJPd
T52kweTvGGTs2632j7xVRU6TvW42q30S5vxbwRZpcRT8nrXy0/VHIQz0hR/frFli
fRwhQpj/K5+YgqBpy7h9fsQbYE5ZMMgqhJUXya48mts9c/qpql2NOAm0jsfBFHkm
6dbm6uVMTRgl4QPjeqgjJbRQQj6AX8zy2YqijnVUGY14G6JHsaWkWBRFCnpojDv0
0yL0cY0YYIzbfu7TUyiMMukojiDGM77sfFA0QbH86S9gwQcgSf125e3ehrZifXxz
/+3yTssfI/ebc/rBCgh+wf92+FKlHBaYG7IcKd2tkhbeVKpUW3UAfbrqE8zbiyYO
cmlKMOlmmD3XvJQNWTdE2IGFA0DfDKnYNGUDIfrlCVgUtpCqGSZt1xluWTGm3S5P
/8ZWC9dIjQkAeZarcX8wJ/121lyKq1id4OVFE+0Uwx1WZdoa9FbzVKvQOgOo0XLv
KPQKYeG12uxjik1PFQnFj/5qk7QqNn9EmxzL0oQvLn+FEsyRl0ophcBCoYFDQLjg
LT1Tn0fzrjEub7MZZtuiEilswwGceLc7tBgqTSBYb8qh2jdV6IC+yWQERv67BSC7
IiAXRQ1zsmtTSbzG+uI9KcZXBNQXBDdepouEwIipOhSlBOT3oBK5dkamNVVqLMnz
/gOQ0KYjmvkIWg1GOAFy
=lgxb
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
