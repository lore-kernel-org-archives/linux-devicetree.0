From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Mon, 31 Jul 2017 16:52:51 +1000
Message-ID: <20170731065251.GH2652@umbus.fritz.box>
References: <1501174151.1055.8.camel@hp800z>
 <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
 <1501181931.1055.18.camel@hp800z>
 <597A4B80.7000106@gmail.com>
 <1501191985.1055.50.camel@hp800z>
 <CAL_Jsq+NBEXyOmRx3Ar0OTpyaLeT0hEKw45R0PrVEdmOcd9czw@mail.gmail.com>
 <1501241207.1055.92.camel@hp800z>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AGZzQgpsuUlWC1xT"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501241207.1055.92.camel@hp800z>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--AGZzQgpsuUlWC1xT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2017 at 02:26:47PM +0300, Pantelis Antoniou wrote:
> Hi Rob,
>=20
> On Thu, 2017-07-27 at 18:00 -0500, Rob Herring wrote:
> > On Thu, Jul 27, 2017 at 4:46 PM, Pantelis Antoniou
> > <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > > Hi Frank,
> > >
> > > On Thu, 2017-07-27 at 13:22 -0700, Frank Rowand wrote:
> > >> Hi Pantelis,
> > >>
> > >> Keep in mind one of the reasons Linus says he is very direct is to
> > >> avoid leading a developer on, so that they don't waste a lot of time
> > >> trying to resolve the maintainer's issues instead of realizing that
> > >> the maintainer is saying "no". Please read my current answer as being
> > >> "no, not likely to ever be accepted", not "no, not in the current fo=
rm".
> > >>
> > >> My first reaction is: no, this is not a good idea for the Linux kern=
el.
> > >>
> > >
> > > This has nothing to do with the kernel. It spits out valid DTBs that =
the
> > > kernel (or anything else) may use.
> >=20
> > Let me rephrase Frank's statement: this is not a good idea for the
> > main repository of dts files.
> >=20
>=20
> I absolutely agree. It is completely out of the question to convert the
> whole of the repository to a new format for no particular reason.
>=20
> I only ask for considering a source format change for new platforms that
> may find this new format more appealing.
>=20
> The kernel infrastructure will keep supporting the DTB format without
> any changes.
>=20
> > But sure, DTS is already not the only source of DTBs. It comes from
> > firmware on Power systems. If you want to create and maintain your own
> > source format, then that is perfectly fine. But based on the current
> > understanding, I'm not seeing a reason we'd convert DTS files to YAML.
> > Maybe you're not proposing that now, but if that is not the end goal I
> > don't see the point of a new format. If YAML solves a bunch of
> > problems, then of course we'd want to convert DTS files at some point.
> >=20
>=20
> What I take from this statement is that DTBs have been generated since
> for ever using a source format other than DTS, correct?
>=20
> So what is changing now? That the different source format is open source
> and out in the public eye?

Well, one point is that tools which can work at the dtb level have
advantages over tools which work only at the source level, since they
can handle dtbs from all origins.

> > >> On 07/27/17 11:58, Pantelis Antoniou wrote:
> > >> > On Thu, 2017-07-27 at 13:09 -0500, Rob Herring wrote:
> > >> >> On Thu, Jul 27, 2017 at 11:49 AM, Pantelis Antoniou
> > >> >> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > >> >>> Hi all,
> > >> >>>
> > >> >>> This is a project I've been working on lately and it's finally i=
n a
> > >> >>> usuable form.
> > >> >>>
> > >> >>> I'm introducing yamldt.
> > >> >>>
> > >> >>> A YAML to DT blob generator/compiler, utilizing a YAML schema th=
at is
> > >> >>> functionaly equivalent to DTS and supports all DTS features.
> > >> >>
> > >> >> What problem are you trying to solve?
> > >> >>
> > >> >
> > >> > I am demonstrating that the DTS source format is not the only way =
to
> > >> > describe hardware and generate a DTB that is functionally equivale=
nt.
> > >> >
> > >> > I feel that the reliance on DTS has been holding progress back in
> > >> > expressing modern hardware and having a tool that generates DTB as=
 well
> > >> > will allow me to experiment in ways that things like overlays and
> > >> > portable overlays can be defined.
> > >>
> > >> That seems to be multiple things, that should be expressed as indivi=
dual
> > >> issues and not lumped into a simple statement (and thus can be addre=
ssed
> > >> separately):
> > >>
> > >>   1) DTS format is holding progress back in expressing modern hardwa=
re
> > >>
> > >> What are the issues you have encountered?
> > >
> > > DTS syntax is archaic and makes expressing things like overlays (and
> > > portable connectors) extremely hard.
> >=20
> > That's a very vague statement. Can we have some examples of what you
> > can express with YAML that you can't with DTS? In the end, you are
> > still limited by the DTB format. If you're adding automagically
> > generated type information like what's been discussed recently for
> > phandles, that syntax in the DTB still has to be agreed on whether the
> > source is DTS or YAML.
> >=20
>=20
> Actually I can.
>=20
> Let me tackle two very common problems in reviewing DTS patches; the
> problem is a by product of using the DTS format as it is right now.
>=20
> The first is requirement that each node (and property) in the source
> format needs to have a unique name. While this maybe a requirement for
> the target system that will have to grok the DTB file it seeps in the
> source format by the means of the node names having unit address in
> them.=20
>=20
> So you have something like this peppered all over the sources:
>=20
>=20
> >                gpio0: gpio@44e07000 {
> >                         compatible =3D "ti,omap4-gpio";
> >                         ti,hwmods =3D "gpio1";
> >                         gpio-controller;
> >                         #gpio-cells =3D <2>;
> >                         interrupt-controller;
> >                         #interrupt-cells =3D <2>;
> >                         reg =3D <0x44e07000 0x1000>;
> >                         interrupts =3D <96>;
> >                 };
> >=20
> >                 gpio1: gpio@4804c000 {
> >                         compatible =3D "ti,omap4-gpio";
> >                         ti,hwmods =3D "gpio2";
> >                         gpio-controller;
> >                         #gpio-cells =3D <2>;
> >                         interrupt-controller;
> >                         #interrupt-cells =3D <2>;
> >                         reg =3D <0x4804c000 0x1000>;
> >                         interrupts =3D <98>;
> >                 };
>=20
> The node names in general are not useful to the kernel. References to nod=
es are
> made using the labels and phandle references. But it is very easy for the
> node names to miss the unit address, or even worse having a wrong unit ad=
dress.
>=20
> IMO this is an artificial problem. Having identical names in children of =
the nodes
> should not be a problem for the compiler; it's the DTB emit phase that ca=
n handle
> appending unit address names (whether in the case of a name clash or by d=
efault when
> having a ref property present).

Well, you have to know how to generate that unit name.  That's
dependent on the parent bus, so you have to know a bunch about the
property semantics to do this correctly - that's why we don't do this
in dtc as yet.  Note that in traditional OF, the unit name isn't
really a thing, it's generated on the fly from the "name" and "reg"
properties - but the assumption is that OF *does* know the semantics
of every property in every node, which isn't usually the case for
tools working with modern DTs.

> The second problem is the proliferation of almost identical device descri=
ptions with minor
> changes that make the DTS sources so bulky. Macros help a bit but can't s=
olve the underlying
> problem of not having a method of reusing parts of the source with a way =
to modify the changing
> bits.
>=20
> However YAML has method for handling just that, a merge operator.
>=20
> http://yaml.org/type/merge.html
>=20
> We could write the above DT part in YAML as follows:
>=20
> >  gpio: &gpio0
> >     compatible: "ti,omap4-gpio"
> >     ti,hwmods: "gpio1"
> >     gpio-controller: true
> >     "#gpio-cells": 2
> >     interrupt-controller: true
> >     "#interrupt-cells": 2
> >     reg: [ 0x44e07000, 0x1000 ]
> >     interrupts: 96
> >=20
> >   gpio: &gpio1
> >     << : *gpio0
> >     ti,hwmods: "gpio2"
> >     reg: [ 0x4804c000, 0x1000 ]
> >     interrupts: 98

That's pretty nice, I'll grant you.  Does at least some of the stuff
that I wanted to achieve with node valued expressions in dtc, but
no-one ever had time to implement.

> This is good but we can do even better
>=20
> >  gpio: &gpio0
> >     compatible: "ti,omap4-gpio"
> >     ti,hwmods: 'gpio', "1" # single quoted strings do not get the termi=
nating \0
> >     gpio-controller: true
> >     "#gpio-cells": 2
> >     interrupt-controller: true
> >     "#interrupt-cells": 2
> >     reg: [ 0x44e07000, 0x1000 ]
> >     interrupts: 96
> >=20
> >   gpio: &gpio1
> >     << : *gpio0
> >     ti,hwmods: ~. "2"     # ~ is the null value, we interpret it as 'ke=
ep' when using the merge operator
> >     reg: [ 0x4804c000, ~ ]
> >     interrupts: 98
>=20
> These are problems that the YAML schema I'm proposing doesn't have. In
> fact I've taken an hour or so and implemented the automatic unit
> renaming for DTB output already:
>=20
>=20
> > am33xx.yaml:223:3: warning: renamed /ocp/gpio@44e07000 to include unit =
address
> >    gpio: &gpio0
> >    ^~~~~~~~~~~~
> > am33xx.yaml:233:3: warning: renamed /ocp/gpio@4804c000 to include unit =
address
> >    gpio: &gpio1
> >    ^~~~~~~~~~~~
>=20
> So things are mostly there already.

Well, for sufficiently simple buses.  Looking at the code it won't get
it right for PCI.  Or anything else with idiosyncratic unit naming,
but PCI is by far the most common.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--AGZzQgpsuUlWC1xT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll+08EACgkQbDjKyiDZ
s5JrpxAArigipQ1RfWxfr63E4cRo/9IiVq/8FF8YQ9/fCcmuEUsIZYFTfklF8qd6
hkxaDerruWWXJ4Ox9bOjGUC1/IhGZcmGHsMhoFM+kZqZFXF8sORqVvgk05up3KzY
Dn26unV1/2xPQMLAo5Ggttfu1xNROPxaVlv2r4R3qrcLvZsQQs7aOoEFHsIW+S+J
a4P/uEw2fBelMriBf6gQ+JhdV5PIw4xs7GPY5wfLPY0z2hoA0RvSzUjboHGXOJZL
yeLMM7e1wUor9stpWHj6HeqYQEEpEfxPxbv6PtSMGIY/iOpoBnJhYIVA6oJXddQK
DkHW9+FKycSFBE4uaG0+FGKOVEK6dMqVXdzNn67coIO9i8HeeZ6SCMyFOzoS96ma
QkisioHhHM4JKgyeJZeXQlEr/0PV6jbVuw/XnJeFl5BlCc4jy2LVcV77RaSKpxaH
sUbTUxjZUNOocjiXwgZt5wG2iIRX3qj4n8QtiwcSGOsc/MXniXdpXk52DvBKr2h1
WK+r1R1OlncxvYqX/xjxDaM/BsVIWpUF6MN+jCHSxsbEbMhwjILMI+EIrQTCfWrX
HR7wWLC0n1C7advGSR4C351MGlQBlX4JGw+GKQpw88+G9vYG504lpD4lJo/6pli+
fne7CGXcTrh8gMT9BVGAHAxSKLwXw5+qNX6v/iG8SOZFysT5UT4=
=3AKp
-----END PGP SIGNATURE-----

--AGZzQgpsuUlWC1xT--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
