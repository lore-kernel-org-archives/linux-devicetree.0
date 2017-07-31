From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Mon, 31 Jul 2017 23:11:18 +1000
Message-ID: <20170731131118.GJ2652@umbus.fritz.box>
References: <1501174151.1055.8.camel@hp800z>
 <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
 <1501181931.1055.18.camel@hp800z>
 <597A4B80.7000106@gmail.com>
 <1501191985.1055.50.camel@hp800z>
 <CAL_Jsq+NBEXyOmRx3Ar0OTpyaLeT0hEKw45R0PrVEdmOcd9czw@mail.gmail.com>
 <20170728005140.GF26163@bill-the-cat>
 <CAL_Jsq+eJNG66D22bNButg6=jj9WQ7Nw4PpxLsPBmGxN9KBnaw@mail.gmail.com>
 <1501244631.1055.103.camel@hp800z>
 <CAL_JsqLRDy_uG1eeNsjbhs29L5DF-4z2Oa_npGrYVgoMiR=YpQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tctmm6wHVGT/P6vA"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLRDy_uG1eeNsjbhs29L5DF-4z2Oa_npGrYVgoMiR=YpQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--tctmm6wHVGT/P6vA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2017 at 10:07:10AM -0500, Rob Herring wrote:
> On Fri, Jul 28, 2017 at 7:23 AM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > Hi Rob,
> >
> > On Thu, 2017-07-27 at 21:12 -0500, Rob Herring wrote:
> >> On Thu, Jul 27, 2017 at 7:51 PM, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >> > On Thu, Jul 27, 2017 at 06:00:00PM -0500, Rob Herring wrote:
> >> >> On Thu, Jul 27, 2017 at 4:46 PM, Pantelis Antoniou
> >> >> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >> >> > Hi Frank,
> >> >> >
> >> >> > On Thu, 2017-07-27 at 13:22 -0700, Frank Rowand wrote:
> >> >> >> Hi Pantelis,
> >> >> >>
> >> >> >> Keep in mind one of the reasons Linus says he is very direct is =
to
> >> >> >> avoid leading a developer on, so that they don't waste a lot of =
time
> >> >> >> trying to resolve the maintainer's issues instead of realizing t=
hat
> >> >> >> the maintainer is saying "no". Please read my current answer as =
being
> >> >> >> "no, not likely to ever be accepted", not "no, not in the curren=
t form".
> >> >> >>
> >> >> >> My first reaction is: no, this is not a good idea for the Linux =
kernel.
> >> >> >>
> >> >> >
> >> >> > This has nothing to do with the kernel. It spits out valid DTBs t=
hat the
> >> >> > kernel (or anything else) may use.
> >> >>
> >> >> Let me rephrase Frank's statement: this is not a good idea for the
> >> >> main repository of dts files.
> >> >>
> >> >> But sure, DTS is already not the only source of DTBs. It comes from
> >> >> firmware on Power systems.
> >> >
> >> > Yes, but unless they're generated from something other than a (at the
> >> > time) normal DTS, that's not a good example, IMHO.
> >>
> >> They aren't. I'm talking about IBM systems. The firmware has its own
> >> representation and flattens that to a DTB is how I understand it.
> >>
> >> >> If you want to create and maintain your own
> >> >> source format, then that is perfectly fine. But based on the current
> >> >> understanding, I'm not seeing a reason we'd convert DTS files to YA=
ML.
> >> >
> >> > Can I propose one?  To borrow a phrase, Validation, Validation,
> >> > Validation.  Let me point to fe496e23b748 in the kernel for a moment=
=2E  I
> >> > found that as part of helping a new engineer come up to speed on doi=
ng
> >> > device tree work.  What I found was a case where:
> >> > - The binding doc gives one value for compatible as the required val=
ue.
> >> > - The code accepts only a single, different value.
> >> > - A few in-kernel dts files have different still values.
> >> >
> >> > If the common dts source file was in yaml, binding docs would be wri=
tten
> >> > so that we could use them as validation and hey, the above wouldn't =
ever
> >> > have happened.  And I'm sure this is not the only example that's in-=
tree
> >> > right now.  These kind of problems create an artificially high barri=
er
> >> > to entry in a rather important area of the kernel (you can't trust t=
he
> >> > docs, you have to check around the code too, and of course the code
> >> > might have moved since the docs were written).
> >>
> >> I'm all for validation, but the binding doc or schema and files that
> >> describe platforms (aka DTS files) are not the same thing. The schema
> >> is what are the constraints for a binding. Maybe some bindings are
> >> fixed where there's only one valid binding implementation, but that's
> >> the easy case (we could use DTS for that). I'll take YAML for binding
> >> docs yesterday. Believe me, I'm tired of reviewing free form binding
> >> docs. If that's where you want to go, reply to my reply that went
> >> unanswered on Matt Porter's YAML proposal from 2 years ago (or maybe 3
> >> now). I had the whole binding doc tree converted over to an initial
> >> YAML schema. We just need to agree on the schema. Or we can keep
> >> waiting for Grant to publish what he started on...
> >>
> >
> > The way I see it there's a validation hierarchy.
> >
> > There are the bindings that describe the schema of the resulting source
> > files. The bindings must be validated against a binding schema.
> >
> > For the source files, at first they must be valid against the core
> > language (i.e. DTS or DT YAML variant) schema.
> >
> > Next for each node that a binding exists in a valid format, it must be
> > validated against it. I.e. if an interrupt property exist it must point
> > to valid interrupt node etc.
> >
> > Up next a number of per-platform/configuration validation passes.
> > I.e. for a complete source file which is using a specific SoC family
> > i.e. "ti,am33xx" the pass may verify that for the given peripherals
> > their configuration is correct, i.e. that the interrupt numbers for a
> > given peripheral are the correct ones for the target board etc.
> > This may be possible by having a golden master configuration when those
> > number can be retrieved and compared against.
> >
> > Finally you could have a per-application/vendor/end-user final rule
> > check, i.e. the regulators may be configured in a manner that the power
> > consumption is under some specified threshold, etc. This is something
> > that is completely out of the kernel scope, but may have have to
> > vendors.
> >
> > Why don't you share what you've been working on and see what we can do
> > using it as a base?
>=20
> I did. 2 years ago:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/log/?h=3Dd=
t-yaml-v2
>=20
> It's very rough, but I was at the point of wanting feedback on the
> schema format. Only the crickets gave me any.
>=20
> It doesn't validate anything, but is purely binding docs mass
> converted to YAML using DTS files as input.

Efforts on schemas have started and petered out several times :(.

I think the fundamental problem is that there just isn't critical mass
of people with the time to work on it.  Lots of people want better
validation, but not enough to put significant time and effort into
it.  I hope someone proves me wrong about that.

Can I suggest (again) that one approach might be to add more pieces to
dtc's "checks" system to at least look for the more common errors.
It's not nearly a complete solution, but it gets you something with
much less difficulty than defining a whole schema system.  Some
rudimentary checking of unit addresses has been added relatively
recently, but not a lot else in the way of semantic checks.

[snip]
> >> > And we've been talking about validation for ages now.  We'll probably
> >> > still be talking about it for ages more (as it's hard
> >> > thanked-at-conferences-and-such work!), until it reaches the point w=
here
> >> > anyone can pick up a current binding and re-format it into yaml for
> >> > validation.
> >>
> >> I did state earlier that I think this tool has uses, but on it's own
> >> and only to change from dts to yaml source files, I don't see it.
> >> Let's start with validation and define the schema for that and tools
> >> for that. If that involves dts to yaml in the flow, I don't really
> >> care.
> >>
> >> Or if it is type checking that Pantelis keeps mentioning, then let's
> >> discuss that. Those are different problems.
> >>
> >
> > Let's discuss it then.
> > I've laid out my plans to add type-checking in the compiler pass using
> > YAML. What is the plan for DTC?
>=20
> But you haven't. You've said YAML can do type checking, but no
> concrete example. Say I have:
>=20
> int-prop =3D <1234>;
> string-prop =3D "some string";
>=20
> How do I go from that whether in DTS or YAML to type information as
> input to the compiler and/or in the dtb?
>=20
> For dtc, there's only suggestion of how to tag phandles reusing the
> the overlay infrastructure. That only solves phandles though. I think
> a solution involving adding the information via new nodes and
> properties is hacky. I think we're going to have to modify the dtb
> format.

Right.  A generalization of this is part of why I've never been that
fond of the current overlay format.  In the base dtb, the encoding of
the "structure" of the tree is at a clearly different level than the
tree's contents.  With overlays, that gets blurrier, the targets and
symbols info is really structural information for the overlay but it's
coded at the same level as the semantic content.

Obviously you _can_ encode that information there - you can encode
anything at all in a key value tree - but it may not be the nicest
way.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tctmm6wHVGT/P6vA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll/LHEACgkQbDjKyiDZ
s5LBcg/+KgD/cp4MzpH653yBFR1we38qIJVSdPwjpmC4WvtgbST9CVCPnoa55j+E
Ygaps7hboWnnycLGwvzeYXVEDgtvi8UPzSm4KLxgK9H35sRbrSte4e8zKRTnEAS2
1XJQHjJMEe0g5L6t0iFue9iqpMyavXLfiAi4/NhfDi3qbteeAfbJ4g5apseCjZPl
oY6cgXyfMUVS6QxAZWy4hvXHbUGboCMPgM+tmYr4+HHPhLvDLz8dLD2Qeb+JQz3/
c4A9Lf7f9OhJ3JNBqWHlrt8w+ZtOFLznjvLZAB4r61im5lZwIZVNf4IoVS+ujDZh
pcUHs7QcSXIdftdXHskEj2fXXLvynC4vZ9gQQAh9Av0IjLDmTYvkHX2//c1KE7ye
IH92V946E2sQUlGUOqjk2/LZmUG0Osk9TbrQDYBYP36m2/DnX52mw8c2CFgqVhLD
P5Ctf8rXZcbQrd1zNr3W+vj3jsVXtaUvP0/eoo3QP/l+qjQYscMGt1kNf7URqyQt
4RKChp1X/Lb/jndaK4o42oNnyn+J52Dy0oud47HKN3N8SEpvXToCTsunJJ1Hgk1x
2R0eFO6InSpWfO1SCj3buo7G9eYblcPmk2s29GTMD9StU45Zciy2ZTyhr/seyuPY
OtbxxOpSGS0T4TUTiXH3EgjhoxCzERd5C2qvFk5VtPjxD8/OaBA=
=jGSh
-----END PGP SIGNATURE-----

--tctmm6wHVGT/P6vA--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
