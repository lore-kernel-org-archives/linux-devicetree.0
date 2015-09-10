From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH 2/5] Documentation: dt-bindings: add example DT
 binding document
Date: Thu, 10 Sep 2015 17:08:50 +1000
Message-ID: <20150910070850.GA11781@voom>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
 <1440739433-6799-3-git-send-email-mporter@konsulko.com>
 <CAL_Jsq+FE4MCCfZC5hDhQBmM1gHibY82S9a8PC1GwsnWsPNxkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+FE4MCCfZC5hDhQBmM1gHibY82S9a8PC1GwsnWsPNxkg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2015 at 09:53:06AM -0500, Rob Herring wrote:
> On Fri, Aug 28, 2015 at 12:23 AM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrot=
e:
> > Add a skeleton DT binding document that serves as the canonical
> > example for implementing YAML-based DT bindings documentation.
> > The skeleton binding illustrates use of all fields and variations
> > described in the dt-binding-format.txt documentation.
> >
> > Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/skeleton.yaml | 98 +++++++++++++++++=
++++++++
> >  1 file changed, 98 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/skeleton.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/skeleton.yaml b/Document=
ation/devicetree/bindings/skeleton.yaml
> > new file mode 100644
> > index 0000000..175965f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/skeleton.yaml
> > @@ -0,0 +1,98 @@
> > +%YAML 1.2
> > +---
> > +id: skel-device
> > +
> > +title: Skeleton Device
> > +
> > +maintainer:
> > +  - name: Skeleton Person <skel-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>=20
> We'd want to tie this into get_maintainers.pl obviously.
>=20
> > +
> > +description: >
> > +  The Skeleton Device binding represents the SK11 device produced by
> > +  the Skeleton Corporation. The binding can also support compatible
> > +  clones made by second source vendors.
> > +
> > +compatible:
> > +  - name: "skel,sk11"
> > +  - name: "faux,fx11"
>=20
> Is this an OR or AND? We need both.

Hrm.  So, from the example below it's an OR.  But.. I think the
considerations here change when you separate out "tag" information as
I've suggested elsewhere.

The command AND case, I can think of is where you want both
"foo,new-model-device" and "foo,old-model-device".  I think the first
belongs in the "tag", but the second in the body of the requirements.

The OR case demonstrated here strikes me as very poor binding design -
but that doesn't mean we can totally avoid it, since we do have poor
bindings we want to convert.

Fwiw, I think the right way to encode "OR" at least in the "tag" is to
pick just the preferred form, then have additional bindings tagged on
the alternative forms and inheriting the main binding.  I don't know
if that's practical in the short term though.

> The complicated case is "one of {specific names} followed by {generic nam=
e}."
>=20
> > +    description: A clone of the original sk11 device
> > +
> > +required:
> > +  - name: "reg"
>=20
> We definitely need type info from the start.

It's interesting you should mention that here, because 'reg' is
actually a hard case for describint the type: because it's format is
determined as much by the parent bus binding as this node's binding.

I suspect it will be worth special-casing "reg" in order to make
common bindings more compact, but again, probably not in the first
pass.

> > +    description: chip select address of skeleton device
> > +    reference: spi-slave
>=20
> I would like to not have to list properties if the inherited binding
> lists it. The problem is we need to say how many cells and the order
> (not a problem here, but for mmio devices).
>=20
> Perhaps we can list the reference at the top level for the node
> instead of for every property.

Yeah, I think it would be worth having a top-level "inherits" field.

> > +  - name: "spi-max-frequency"
> > +    description: >
> > +      Maximum SPI clocking speed of skeleton device in Hz, must be
> > +      1000000
> > +    reference: spi-slave
>=20
> Rather than listing the property and having constraint in description,
> perhaps we could add constraints like this:
>=20
> - spi-max-frequency-range: 1000000 1000000
>=20
> Or groups of constraints:
>=20
> - spi-max-frequency-constraints:
>   range: 1000000 1000000
>   some-other-constraint: <value>

Not for the first pass I think.  What I would suggest is having
"description" for pure informational stuff, and "constraint" or maybe
just "extra" for normative constraints expressed in English.

The idea here is that over time we can add new ways of expressing
constraints.  In the meantime tools can use the "extra" field to
preseve any difficult text in the current versions and at least let
tools know that they won't be able to check everything.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV8SyBAAoJEGw4ysog2bOSupsQAOC4cfiU/eVdsme4oAHfHRtd
n4ruQjUpMvJDmsX1PM8csi5kjmHAphthNhOaOBsPcOl1seoAwoXksiCwMxNlyOgy
LUciPZaREYkkD482QeJL5PPv73JeTr0N4djK5m89rl4CZLrRYut+N+00RM6fmMl9
x8fzzcZoY+NCwxqachusR3mupRYamrOOnPfjXheU2JF4oEL7PKYFvqvMqfAQckOQ
SmO/Rab/ck3YTxO2nyRPxFovTKB5LZ93/p/vEVdhw8nqYmxbcvDFNdE+FuIuu9qB
dJDd3wS0t4DmN6CSphE+rhKCMs95/RhJcKD3zZ0S6bO2jUlp1RawneXEmlvlbe33
p0x7HB78JwsDv7v6eHVy6KHaQz7arAe9h0/po41TDhSzGH1uVWsLInxjB3OX2CBR
eyNrBzStjqV8i+CZ52wlizf0kwuwyp0gDSoEz+Nz/dLVYqhy+aigvqgjG26diJ2i
DfXmWnKu3yACsDfZO9QFRXzWVwBuAuoLlIX2nviWpf88JxX1Jd6esbgeJpthmg2T
Y8f+IeXuN0pmJqSQvKXMcEp32ps7QizasS2mlSUk1FEpFwuPdQwBCdEtPu02equa
edCRNWoRje7dBr2rZHAU9AP8QASCQuixEeS+LBZw2Ba6oCCu9Js+KFL49gD64sD+
Qsrqqgb4Pou1kETlJ1sk
=dLsV
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
