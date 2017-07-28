From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Fri, 28 Jul 2017 07:23:14 -0400
Message-ID: <20170728112314.GJ26163@bill-the-cat>
References: <1501174151.1055.8.camel@hp800z>
 <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
 <1501181931.1055.18.camel@hp800z>
 <597A4B80.7000106@gmail.com>
 <1501191985.1055.50.camel@hp800z>
 <CAL_Jsq+NBEXyOmRx3Ar0OTpyaLeT0hEKw45R0PrVEdmOcd9czw@mail.gmail.com>
 <20170728005140.GF26163@bill-the-cat>
 <CAL_Jsq+eJNG66D22bNButg6=jj9WQ7Nw4PpxLsPBmGxN9KBnaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="LfkXUpJB8bp103ra"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+eJNG66D22bNButg6=jj9WQ7Nw4PpxLsPBmGxN9KBnaw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--LfkXUpJB8bp103ra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 09:12:40PM -0500, Rob Herring wrote:
> On Thu, Jul 27, 2017 at 7:51 PM, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > On Thu, Jul 27, 2017 at 06:00:00PM -0500, Rob Herring wrote:
> >> On Thu, Jul 27, 2017 at 4:46 PM, Pantelis Antoniou
> >> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >> > Hi Frank,
> >> >
> >> > On Thu, 2017-07-27 at 13:22 -0700, Frank Rowand wrote:
> >> >> Hi Pantelis,
> >> >>
> >> >> Keep in mind one of the reasons Linus says he is very direct is to
> >> >> avoid leading a developer on, so that they don't waste a lot of time
> >> >> trying to resolve the maintainer's issues instead of realizing that
> >> >> the maintainer is saying "no". Please read my current answer as bei=
ng
> >> >> "no, not likely to ever be accepted", not "no, not in the current f=
orm".
> >> >>
> >> >> My first reaction is: no, this is not a good idea for the Linux ker=
nel.
> >> >>
> >> >
> >> > This has nothing to do with the kernel. It spits out valid DTBs that=
 the
> >> > kernel (or anything else) may use.
> >>
> >> Let me rephrase Frank's statement: this is not a good idea for the
> >> main repository of dts files.
> >>
> >> But sure, DTS is already not the only source of DTBs. It comes from
> >> firmware on Power systems.
> >
> > Yes, but unless they're generated from something other than a (at the
> > time) normal DTS, that's not a good example, IMHO.
>=20
> They aren't. I'm talking about IBM systems. The firmware has its own
> representation and flattens that to a DTB is how I understand it.

Oh, cool!

> >> If you want to create and maintain your own
> >> source format, then that is perfectly fine. But based on the current
> >> understanding, I'm not seeing a reason we'd convert DTS files to YAML.
> >
> > Can I propose one?  To borrow a phrase, Validation, Validation,
> > Validation.  Let me point to fe496e23b748 in the kernel for a moment.  I
> > found that as part of helping a new engineer come up to speed on doing
> > device tree work.  What I found was a case where:
> > - The binding doc gives one value for compatible as the required value.
> > - The code accepts only a single, different value.
> > - A few in-kernel dts files have different still values.
> >
> > If the common dts source file was in yaml, binding docs would be written
> > so that we could use them as validation and hey, the above wouldn't ever
> > have happened.  And I'm sure this is not the only example that's in-tree
> > right now.  These kind of problems create an artificially high barrier
> > to entry in a rather important area of the kernel (you can't trust the
> > docs, you have to check around the code too, and of course the code
> > might have moved since the docs were written).
>=20
> I'm all for validation, but the binding doc or schema and files that
> describe platforms (aka DTS files) are not the same thing. The schema
> is what are the constraints for a binding. Maybe some bindings are
> fixed where there's only one valid binding implementation, but that's
> the easy case (we could use DTS for that). I'll take YAML for binding
> docs yesterday. Believe me, I'm tired of reviewing free form binding
> docs. If that's where you want to go, reply to my reply that went
> unanswered on Matt Porter's YAML proposal from 2 years ago (or maybe 3
> now). I had the whole binding doc tree converted over to an initial
> YAML schema. We just need to agree on the schema. Or we can keep
> waiting for Grant to publish what he started on...

My point here is that if the main tooling was expecting a YAML input
anything else that we could do on top of that source base becomes a lot
easier to add in and get people to try since they'll have the tools and
it's just apply a patch.

> >> Maybe you're not proposing that now, but if that is not the end goal I
> >> don't see the point of a new format. If YAML solves a bunch of
> >> problems, then of course we'd want to convert DTS files at some point.
> >
> > To borrow that same phrase again, Tooling, Tooling, Tooling.  The
> > current dts format is a niche format.  That's great, our community
> > is basically responsible for all tooling, we can do what we want.
> > That's also awful, we're the only people that care about tooling and we
> > all have lots of other itches to scratch.  There are so so so many
> > editors that just know YAML and will work it into the rest of the
> > development environment someone is using.  None of that exists for our
> > dts format.  Who cares about that?  Engineers that aren't primarily
> > writing dts files.  I'm pretty sure every engineer that's written /
> > extended a dts file has made an "invisible" mistake that would have been
> > caught with a different source format that had validation already.
>=20
> The same can be said about DTB format as well.

I don't follow, sorry.  You don't expect most engineers to be poking the
object files, you expect the to be able to edit the sources.

> > And we've been talking about validation for ages now.  We'll probably
> > still be talking about it for ages more (as it's hard
> > thanked-at-conferences-and-such work!), until it reaches the point where
> > anyone can pick up a current binding and re-format it into yaml for
> > validation.
>=20
> I did state earlier that I think this tool has uses, but on it's own
> and only to change from dts to yaml source files, I don't see it.
> Let's start with validation and define the schema for that and tools
> for that. If that involves dts to yaml in the flow, I don't really
> care.
>=20
> Or if it is type checking that Pantelis keeps mentioning, then let's
> discuss that. Those are different problems.

I'll let Pantelis chime in more if he cares to.

--=20
Tom

--LfkXUpJB8bp103ra
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZex6iAAoJEIf59jXTHXZSZlIP/iHEpIkkh5mMqdpQaONMGF6/
cqGlRkv0rv9ZUBMIKvcy916zcNu83+QKfqYcQNJW+C9GCLc743xY0eu05xBKH5PG
YxLW0oFb73vrqLjoNFkKyfFflDvJmEAX57dQnB3JMevVKtxlQQPsYejc0yAqoE7c
M6Y1cbdW9DX18PrgPxkrRnFNghg2Kb4WRtzRVs6ksHaFDkNdZ7oSi9FCgejHN8ok
dWWODbiKomzRQQxc9FiyPftOS2lnUymu/CsDKXUy0zKxRZ1Xm7P7TYjdiabtskl6
6hAC/h47L1uJQKprGcsfK67Q8BkDyMP4oSPxFIVGRQZMlMXSEqpSOdDgntPodywx
hdjVtcQZnPE06LQiWIiV4EASKp6WDNnQbCJ+SjQoKrVC39kEI9XKR48F34k7BSN6
t7J8An8mmauPLzU7jTwoBmJ8jd1L/N2+eHmCC136j23PU2toeFmSmI6HDiNwP5Um
jo7tz3Vx4Q9HV/3BjV6fvfEauV4vdiuOERdDWHbvO0dqNQBE5wFjVjmUji9IVjQ2
2QZ7u4aV2Golgzlgw5mn3sEfcUEeUNqx6PW0k5dMpjzw/r3fAtIKULSayHtSEvvV
Nrq1OgWCm67TK9P7OoXDcBpuZgYpXAXNds+ShV6GPJQYV2Utq5mthHdZ8IvcP4H3
gXvE8fAP5CN8xX8XgChx
=Tk8/
-----END PGP SIGNATURE-----

--LfkXUpJB8bp103ra--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
