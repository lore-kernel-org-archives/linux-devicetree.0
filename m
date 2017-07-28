From: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Thu, 27 Jul 2017 21:00:42 -0400
Message-ID: <20170728010042.GG26163@bill-the-cat>
References: <1501174151.1055.8.camel@hp800z>
 <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
 <1501181931.1055.18.camel@hp800z>
 <597A4B80.7000106@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nOzxAaGBfJwFK2kS"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <597A4B80.7000106-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nOzxAaGBfJwFK2kS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 01:22:24PM -0700, Frank Rowand wrote:

> Hi Pantelis,
>=20
> Keep in mind one of the reasons Linus says he is very direct is to
> avoid leading a developer on, so that they don't waste a lot of time
> trying to resolve the maintainer's issues instead of realizing that
> the maintainer is saying "no". Please read my current answer as being
> "no, not likely to ever be accepted", not "no, not in the current form".
>=20
> My first reaction is: no, this is not a good idea for the Linux kernel.
[snip]
> >>> For more take a look here.
> >>>
> >>> https://github.com/pantoniou/yamldt
> >>
> >> Looking at the example, I find the syntax harder to follow. Parsing
> >> what are node names vs labels is one. Relying on indentation for tree
> >> hierarchy is another.
>=20
> I agree with Rob.
>=20
> And I don't like the YAML feature that the same information can be
> expressed in very different syntax (as shown in the example immediately
> below in the email I am replying to), which can result in two functionally
> equivalent YAML source files looking very different - that is a big usabi=
lity
> issue to me.  But now I'm getting to a much lower level of detail than I
> want to - I want to stay mostly at the architectural level for my issues.

I'd like to argue this from the opposing view point for a moment.
/*
 * This is a valid comment.
 */
// And so is this.

But you're only going to find one in the kernel, and that's fine.  We
can easily say that 'foo: { bar: true }' is what an upstream repository
of dtb source files will accept.  And without googling, I'm going to say
I'm pretty sure since they're equivalent, $FANCYEDITORS already have a
way to spit out a file in whatever format is preferred.

And just like your engineer that picks up the kernel and
// comments something like this, because that's what they know
they can write
it:
  like: this

for their product that they never intend to submit upstream, just like
they don't intend to submit the kernel changes they made upstream
either.  But the problem that needed solving was solved.
>=20
>=20
> > This is really debatable. You can use curly braces if you don't like the
> > indentation.
> >=20
> > I.e.
> >=20
> > foo:
> >   bar: true
> >=20
> > Can be written as
> > foo: { bar: true }
> >=20
> > YAML is a JSON superset which uses the curly braces as a map separator.
> >=20
> > And frankly there are about x1000 more people aware of YAML syntax than
> > DTS syntax.
> >=20
> >> Does C preprocessing of the YAML files work? I'm surprised if it does.
> >>
> >=20
> > I think you should check the code out and see for yourself.
> >=20
> > The complete set of C preprocessing of DTS is available, and works
> > perfectly AFAIKT.
> >=20
> >>>
> >>> I am eagerly awaiting for your comments.
> >>
> >> I could see some uses here to extract data from dts files more easily.
> >> For example, to extract all compatible strings for some set of dts
> >> files. I did this by hacking dtc to dump them. Or as a starting point
> >> to create YAML based DT binding schema. I wonder how Grant is coming
> >> along with that.
>=20
> But the proposal is not to process DTS format files with this new tool.
> The proposal is to convert device tree source files to a YAML format
> and have the new tool compile only YAML format source files.
>=20
> Having a tool to convert DTS format to a YAML format within a validation
> toll is something that has been proposed several times.  If I recall
> correctly, Grant had a prototype that did that step in a handful of
> lines.  (I'm not sure how complete that conversion process was in
> his prototype form.)

To emphasize what I said in another email, but wouldn't it be nice if
instead of "convert DTS to YAML, run validation" it was always just
"validate your DTS as part of creating your DTB, every time" ?

--=20
Tom

--nOzxAaGBfJwFK2kS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZeoy6AAoJEIf59jXTHXZSWOEP/iQVLcOAv73DIORENeCrXQg3
rhM6kNaU/e/5we2fK4HU3ZH4PWyiYTMd3BXCRLWAHkfOjL2P8ver/UBIcbYUk5wU
L2hBpRHuCexdjT/QfSZwFFldwmBWFsEEtFI5Xh54+LH1zDdiNk+m0RbOgpPdewx6
HRN8XMgUiiWSDNUQLJTyIBEG9QNck1ryHGo/HTBBZorrWf3sSRbMNVOEL607T6hP
zPBZREgzMWZppO6/aP3RfCFxLR8dbOw5kAPWzr+Vk2tfmoeR/jBH6pWXQqaClkSO
2HCl8q1D3peYKelmNb41LKRNAxrE6zfFuowTzZO9FRAYs3XyP9QCag8VwuMVEVkV
02Q513/pWeyOb2z9l+G5ey0e8V5G4HlzlG9EY7T2zt9d4Y5nT20OTbUHdxbid7uI
tux06CHYaP9HxqIPXrUivd6N2LmdzaarjE0PMR6YcnDY7j9TiI37nYDdlgErJMH7
CFO4kzxZ54CURAvVIcIj2YHxkCWbZmD+vprZU91DsWHkpl/tJmUyhfy9Bw3Q+0D3
VY7otMuiQWzH2auGA9HBtjQvTvNeJclLE4OObddNb3eRrMgqitJOiIEuIlo+v3iF
p3umcFN6epJkicGIynyvkpGHkHXaawh6RN9OShZ3F5lHVP61Jf+ms+SpaTh8eTN4
vP2R6EeFkgy94nO+CK7u
=GwlV
-----END PGP SIGNATURE-----

--nOzxAaGBfJwFK2kS--
