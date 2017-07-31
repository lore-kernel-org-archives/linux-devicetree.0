From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Mon, 31 Jul 2017 15:40:10 +1000
Message-ID: <20170731054010.GF2652@umbus.fritz.box>
References: <1501174151.1055.8.camel@hp800z>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9l24NVCWtSuIVIod"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501174151.1055.8.camel@hp800z>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--9l24NVCWtSuIVIod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 07:49:11PM +0300, Pantelis Antoniou wrote:
> Hi all,
>=20
> This is a project I've been working on lately and it's finally in a
> usuable form.
>=20
> I'm introducing yamldt.
>=20
> A YAML to DT blob generator/compiler, utilizing a YAML schema that is
> functionaly equivalent to DTS and supports all DTS features.
>=20
> yamldl parses a device tree description (source) file in YAML format and
> outputs a (bit-exact if the -C option is used) device tree blob.
>=20
> A DT aware YAML schema is a good fit as a DTS syntax alternative.
>=20
> YAML is a human-readable data serialization language, and is expressive
> enough to cover all DTS source features.
>=20
> Simple YAML files are just key value pairs that are very easy to parse,
> even without using a formal YAML parser. For instance YAML in restricted
> environments may simple be appending a few lines of text in a given YAML
> file.
>=20
> The parsers of YAML are very mature, as it has been released in 2001. It
> is in wide-spread use and schema validation tools are available. YAML
> support is available for every major programming language.
>=20
> Data in YAML can easily be converted to/form other format that a
> particular tool that we may use in the future understands.
>=20
> More importantly YAML offers (an optional) type information for each
> data, which is IMHO crucial for thorough validation and checking against
> device tree bindings (when they will be converted to a machine readable
> format, preferably YAML).
>=20
> For more take a look here.
>=20
> https://github.com/pantoniou/yamldt
>=20
> I am eagerly awaiting for your comments.

Ok, technical comments here only; I addressthe procedural questions
brought up in the thread elsewhere.

First, there's a lot to like about YAML - if it had been as well known
when I wrote dtc, maybe we'd already be using it.  It was also the
frontrunner for a schema language in the various inconclusive threads
there have been on the topic.  It's been a little while since I read
up on YAML, so I may have forgotten some things about it.

I do have some doubts about this approach.

(1)

dts has its semantic model built closely around what dtb can
represent.  YAML (and JSON) have a different semantic model - in many
ways a better one than dtb (and IEEE1275), but that's not really the
point.  I wonder if having a source language which suggests the
possibility of things that can't actually be done in dtb will be
confusing.  The most obvious example is that any explicit type tags
will be stripped, of course, but there are others: nested list
structure can't be preserved in dtb, nor even what basic scalars are
in a list.  i.e. dtb couldn't tell the difference between:
	foo: [0, "\0\0\0\0"];
and
	foo: ["\0\0\0\0", 0];
=09
There's also the fact that using YAML implicitly puts nodes and
properties into the namespace, which isn't the case in the dtb model.
Obviously you can simply ban having a property and subnode with the
same name (since that's good practice anyway), but it could be an
issue for decompiling or manipulating existing trees. I know there
have been device trees in the wild which had a property and subnode
with the same name in the same place (some old PowerPC based
Macintoshes, I think).

(2)

In the other direction there are several features of the dts format
I don't think you'll get for free with YAML - and it's not clear how
you would represent them there.  Obviously you *can* represent them -
it's a key value tree, so it can represent anything; whether it's
natural and readable is a different question.

YAML might have an equivalent of /incbin/, I'm not sure.  I'm pretty
sure it doesn't have integer expression evaluation, which is quite
useful in dts when combined with includes.  Likewise, how would you
tell a YAML based compiler what size to use when encoding a list of
integers - the equivalent of dtc's /bits/ directive.

(3)

It's not clear to me that preserving type information helps all that
much with validation.  You still have to validate against something,
so you need a schema.  And if you have a schema, you can get type and
structure information from there which will let you interpret the
untyped dt information.  That has the additional advantage that you
can also validate dtbs, which is a nice debugging feature when working
with some dtb that you've got from firmware or somewhere without any
dts/yaml/whatever.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--9l24NVCWtSuIVIod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAll+wrgACgkQbDjKyiDZ
s5JKZw/3Tlp65W3an9qp0xe+eLLT2Zl1v/u9mEmJobzr9d1E7SmR5QQTLeZ6cqDS
TgwiE6JL60iVo43bq2Hs6VM+gANNeSTsctkxE8lI5ahuOu3330I3IvB4MKTQJU7O
aHAhZVgooSfPdb6Fjwm6R80W+Bc9u4PgLIvhUh/fXPMhc1WicaDE/Zj1ixsSWqtm
oMwK9PzP+WPOfmYstVj/HCNZMJmHarbxMvUdxdnjBR3fnLCmt2HhhO4jIHjMtH/N
MAQoReiZkn/KeXcbTd4kS4a7S2E9gnbYu7B2JaKFZL1Dwb9HzlRodEP7SNzpkVmJ
gJYmugk7xuuDxYlRSZXuIMoGVFm6KD32tCp6Mis9NmgEvhvOEjob7fIMaUBUSrPo
Et0fmzS21K7//PVeWAJLVa1Kjhu29Nz6p3WFqg8+yqBQXDl5rcEtzRVX1PluxNui
xLIhBSB6ScTPhInnD6YPfxSxHT2qFqi6pHhb819WK+0RQofoqKXx8tVZIW5lDLXC
EyovjqjeMAVDCyUyU3VFdTdA4r4maEzmE7W2607R6WehyMfKaQ100O6aEjzkRjMs
6sUZOD+FSEgQsTyLBuctK9N+Vu5BUvuobVK2T1YaE7gyh1zHFhxxpJ/U4tFX5Q2X
2weXhDex48w76Z0uC2xa7kH5pZPfSYpgMM5kcRwMrUamPVIeiQ==
=64np
-----END PGP SIGNATURE-----

--9l24NVCWtSuIVIod--
