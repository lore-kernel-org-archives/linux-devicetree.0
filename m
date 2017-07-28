From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Thu, 27 Jul 2017 20:51:40 -0400
Message-ID: <20170728005140.GF26163@bill-the-cat>
References: <1501174151.1055.8.camel@hp800z>
 <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
 <1501181931.1055.18.camel@hp800z>
 <597A4B80.7000106@gmail.com>
 <1501191985.1055.50.camel@hp800z>
 <CAL_Jsq+NBEXyOmRx3Ar0OTpyaLeT0hEKw45R0PrVEdmOcd9czw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4RzVFyjIcZfAa5OY"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+NBEXyOmRx3Ar0OTpyaLeT0hEKw45R0PrVEdmOcd9czw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--4RzVFyjIcZfAa5OY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 06:00:00PM -0500, Rob Herring wrote:
> On Thu, Jul 27, 2017 at 4:46 PM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > Hi Frank,
> >
> > On Thu, 2017-07-27 at 13:22 -0700, Frank Rowand wrote:
> >> Hi Pantelis,
> >>
> >> Keep in mind one of the reasons Linus says he is very direct is to
> >> avoid leading a developer on, so that they don't waste a lot of time
> >> trying to resolve the maintainer's issues instead of realizing that
> >> the maintainer is saying "no". Please read my current answer as being
> >> "no, not likely to ever be accepted", not "no, not in the current form=
".
> >>
> >> My first reaction is: no, this is not a good idea for the Linux kernel.
> >>
> >
> > This has nothing to do with the kernel. It spits out valid DTBs that the
> > kernel (or anything else) may use.
>=20
> Let me rephrase Frank's statement: this is not a good idea for the
> main repository of dts files.
>=20
> But sure, DTS is already not the only source of DTBs. It comes from
> firmware on Power systems.

Yes, but unless they're generated from something other than a (at the
time) normal DTS, that's not a good example, IMHO.


> If you want to create and maintain your own
> source format, then that is perfectly fine. But based on the current
> understanding, I'm not seeing a reason we'd convert DTS files to YAML.

Can I propose one?  To borrow a phrase, Validation, Validation,
Validation.  Let me point to fe496e23b748 in the kernel for a moment.  I
found that as part of helping a new engineer come up to speed on doing
device tree work.  What I found was a case where:
- The binding doc gives one value for compatible as the required value.
- The code accepts only a single, different value.
- A few in-kernel dts files have different still values.

If the common dts source file was in yaml, binding docs would be written
so that we could use them as validation and hey, the above wouldn't ever
have happened.  And I'm sure this is not the only example that's in-tree
right now.  These kind of problems create an artificially high barrier
to entry in a rather important area of the kernel (you can't trust the
docs, you have to check around the code too, and of course the code
might have moved since the docs were written).

> Maybe you're not proposing that now, but if that is not the end goal I
> don't see the point of a new format. If YAML solves a bunch of
> problems, then of course we'd want to convert DTS files at some point.

To borrow that same phrase again, Tooling, Tooling, Tooling.  The
current dts format is a niche format.  That's great, our community
is basically responsible for all tooling, we can do what we want.
That's also awful, we're the only people that care about tooling and we
all have lots of other itches to scratch.  There are so so so many
editors that just know YAML and will work it into the rest of the
development environment someone is using.  None of that exists for our
dts format.  Who cares about that?  Engineers that aren't primarily
writing dts files.  I'm pretty sure every engineer that's written /
extended a dts file has made an "invisible" mistake that would have been
caught with a different source format that had validation already.

And we've been talking about validation for ages now.  We'll probably
still be talking about it for ages more (as it's hard
thanked-at-conferences-and-such work!), until it reaches the point where
anyone can pick up a current binding and re-format it into yaml for
validation.

--=20
Tom

--4RzVFyjIcZfAa5OY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZeoqcAAoJEIf59jXTHXZSfLUP/RDB476d0LpgI2cPhEQDsCNp
yIWgA6uVxj8TSl4T2WiPGCnJrowgdsYqAsx5wBYv/P9YLjXJPzF6bmSY3Y6iJYZO
eQ+C0TW8rLpgB0+gzYv3vZqDqxEdtI8oexg+Rr2VlC9E9x3MG7V4qfOmUaqVzr/A
WNpxVW9UNVnkMDWSQLV0FRNXoI4u5WxuT5QqwCRiFgE4uhRKhxWtv163Vey3SUKL
YEbIHpByqEKEObRq5/32oc30GQ5qW7wXR0h27QS8Dbz6oR5OnqzlfdeJgUoqtRhO
kp99OGJbdVM44X3sr9S42ldoeReOzTyMr/OxEan8kpzhp6iaomEYQHo20eiGbNvb
xeBEpszgqsuarAr36zSctjFLhLEkjNwkpnOpD0Izx9bkokfI4op7ubgBi4vmN5Ah
LlXU3ECYaddUXdmfYb8S7TXBOs6cqE3B+rcsPFWgE3X7WpNPA3UNeJXhsunj9uFd
rnutXERoZp7kMbfzxQMvlVEexEIFien4dAckyRotGKlUflQrsA7nNEsQ+iyebosG
Inr7DBOrFxmlnAsNdhammDM3mJx+eNGhTfyTkZ9S9KS7FAPii4GDq5fNFw33EI4y
AZOnJoNa7bx1qhsJkFwGljHtXW3sexGn3dEu52SWMY+wu5NOh1HPe9y/DAZjLOKZ
a5EwrqkvGByJh6s6R1uW
=Cc8Y
-----END PGP SIGNATURE-----

--4RzVFyjIcZfAa5OY--
