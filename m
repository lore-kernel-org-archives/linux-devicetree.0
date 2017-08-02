From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Thu, 3 Aug 2017 02:11:13 +1000
Message-ID: <20170802161113.GH394@umbus.fritz.box>
References: <1501174151.1055.8.camel@hp800z>
 <20170731054010.GF2652@umbus.fritz.box>
 <1501533399.3937.24.camel@hp800z>
 <20170802145312.GF394@umbus.fritz.box>
 <1501687075.3937.54.camel@hp800z>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4C6bbPZ6c/S1npyF"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501687075.3937.54.camel@hp800z>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--4C6bbPZ6c/S1npyF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2017 at 06:17:55PM +0300, Pantelis Antoniou wrote:
> Hi David,
>=20
> On Thu, 2017-08-03 at 00:53 +1000, David Gibson wrote:
> > On Mon, Jul 31, 2017 at 11:36:39PM +0300, Pantelis Antoniou wrote:
> > > Hi David,
> > >=20
> > > On Mon, 2017-07-31 at 15:40 +1000, David Gibson wrote:
> > > > On Thu, Jul 27, 2017 at 07:49:11PM +0300, Pantelis Antoniou wrote:
> > > > > Hi all,
> > > > >=20
> > > > > This is a project I've been working on lately and it's finally in=
 a
> > > > > usuable form.
> > > > >=20
> > > > > I'm introducing yamldt.
> > > > >=20
> > > > > A YAML to DT blob generator/compiler, utilizing a YAML schema tha=
t is
> > > > > functionaly equivalent to DTS and supports all DTS features.
> > > > >=20
> > > > > yamldl parses a device tree description (source) file in YAML for=
mat and
> > > > > outputs a (bit-exact if the -C option is used) device tree blob.
> > > > >=20
> > > > > A DT aware YAML schema is a good fit as a DTS syntax alternative.
> > > > >=20
> > > > > YAML is a human-readable data serialization language, and is expr=
essive
> > > > > enough to cover all DTS source features.
> > > > >=20
> > > > > Simple YAML files are just key value pairs that are very easy to =
parse,
> > > > > even without using a formal YAML parser. For instance YAML in res=
tricted
> > > > > environments may simple be appending a few lines of text in a giv=
en YAML
> > > > > file.
> > > > >=20
> > > > > The parsers of YAML are very mature, as it has been released in 2=
001. It
> > > > > is in wide-spread use and schema validation tools are available. =
YAML
> > > > > support is available for every major programming language.
> > > > >=20
> > > > > Data in YAML can easily be converted to/form other format that a
> > > > > particular tool that we may use in the future understands.
> > > > >=20
> > > > > More importantly YAML offers (an optional) type information for e=
ach
> > > > > data, which is IMHO crucial for thorough validation and checking =
against
> > > > > device tree bindings (when they will be converted to a machine re=
adable
> > > > > format, preferably YAML).
> > > > >=20
> > > > > For more take a look here.
> > > > >=20
> > > > > https://github.com/pantoniou/yamldt
> > > > >=20
> > > > > I am eagerly awaiting for your comments.
> > > >=20
> > > > Ok, technical comments here only; I addressthe procedural questions
> > > > brought up in the thread elsewhere.
> > > >=20
> > > > First, there's a lot to like about YAML - if it had been as well kn=
own
> > > > when I wrote dtc, maybe we'd already be using it.  It was also the
> > > > frontrunner for a schema language in the various inconclusive threa=
ds
> > > > there have been on the topic.  It's been a little while since I read
> > > > up on YAML, so I may have forgotten some things about it.
> > > >=20
> > > > I do have some doubts about this approach.
> > > >=20
> > > > (1)
> > > >=20
> > > > dts has its semantic model built closely around what dtb can
> > > > represent.  YAML (and JSON) have a different semantic model - in ma=
ny
> > > > ways a better one than dtb (and IEEE1275), but that's not really the
> > > > point.  I wonder if having a source language which suggests the
> > > > possibility of things that can't actually be done in dtb will be
> > > > confusing.  The most obvious example is that any explicit type tags
> > > > will be stripped, of course, but there are others: nested list
> > > > structure can't be preserved in dtb, nor even what basic scalars are
> > > > in a list.  i.e. dtb couldn't tell the difference between:
> > > > 	foo: [0, "\0\0\0\0"];
> > > > and
> > > > 	foo: ["\0\0\0\0", 0];
> > > > =09
> > >=20
> > > This is a limitation of DTB only. Nothing precludes having YAML input
> > > being restricted to a subset of it's capabilities if targeting a DTB
> > > output target.
> >=20
> > But you don't just want to do that when targetting DTB - you want to
> > do it early, so that the user knows they've put in a construct which
> > can't be represented in DTB.
> >=20
>=20
> All objects are tracked as they are parsed (along with their original
> unparsed content). On the emit phase the dtb generator can issue
> accurate error messages for any errors it encountered.
>=20
> > > But as was mentioned earlier DTB is a very low level format; it's just
> > > keys and values. If people were to agree what to put in there to enco=
de
> > > the types of a sequence it would work, albeit it would look a little =
bit
> > > funky on a dump.
> >=20
> > Well, yes, you can encode the information there - again, you can
> > encode anything in a key-value store.  It's not a natural fit,
> > though.  If you do this you're talking about changing the whole data
> > model of DTB.
> >=20
> > Now, I can see why you'd want to do that - frankly YAML/JSON is just a
> > nicer, more flexible data model than dtb - but that requires changing
> > the whole ecosystem - all the dtb clients, as well as the tools.
> >=20
> > And, if you want to change to a YAML/JSON data model, you might as
> > well use something like UBJSON for a compact encoding, rather than
> > forcing it awkwardly into dtb.
> >=20
>=20
> I can output anything that's a key/value format. Right now outputs
> generated are DTB, DTS, and YAML. The UBJSON format is on my TODO list.

Not all key/value formats are equivalent though.  In JSON/YAML the
values are typed objects, in dtb/dts they're bytestrings.

> However, note that even the generated (machine readable) YAML is very
> compact. In fact it's more compact from the generated DTB file.

Sure.  I probably shouldn't have mentioned compactness, it's not
really the property of dtb that's interesting.  The really useful
property of dtb is that it's easy to parse - even in early boot code.
You can do it in asm without going mad, if you really have to.

YAML is much, much harder to parse.  JSON's not too bad in the context
of a normal userspace program.  In the context of a kernel or
bootloader - particularly early on - it'll still be fairly painful.
Not sure about UBJSON or other binary encodings of that data model.
Easier than text JSON, harder than dtb, I suspect.

[snip]
> Observe:
>=20
> > $ ls -l am335x-boneblack.pure.yaml am335x-boneblack.pure.dtb
> > -rw-rw-r-- 1 panto panto 50045 Aug  2 18:03 am335x-boneblack.pure.dtb
> > -rw-rw-r-- 1 panto panto 45560 Aug  2 18:03 am335x-boneblack.pure.yaml
>=20
> Which is quite understandable, DTB files contains lots of small
> integers, encoded as 32 bit values. Text YAML uses just 1-2 bytes for
> most.
>=20
> Compressing is even more interesting:
>=20
> > $ ls -l *.xz
> > -rw-rw-r-- 1 panto panto 8084 Aug  2 18:03 am335x-boneblack.pure.dtb.xz
> > -rw-rw-r-- 1 panto panto 6620 Aug  2 18:03 am335x-boneblack.pure.yaml.xz
>=20
> This is important due to the fact that overlays (i.e. editing) of YAML do=
cuments
> is supported from the start.
>=20
> The bootloader/firmware shall never need to edit the YAML file to modify =
it.
> It might as well be compressed. You only need to append a marker '---' an=
d your
> modified nodes/properties and it will work.

Yeah, but that's a property of *yaml* as opposed to json.  You
*really* don't want a full yaml parser with all these bells and
whistles in a bootloader.

> > > But object files and executables look funny on a dump
> > > but no-one ever complained much about it.
> > >=20
> > > > There's also the fact that using YAML implicitly puts nodes and
> > > > properties into the namespace, which isn't the case in the dtb mode=
l.
> > > > Obviously you can simply ban having a property and subnode with the
> > > > same name (since that's good practice anyway), but it could be an
> > > > issue for decompiling or manipulating existing trees. I know there
> > > > have been device trees in the wild which had a property and subnode
> > > > with the same name in the same place (some old PowerPC based
> > > > Macintoshes, I think).
> > > >=20
> > >=20
> > > In my test-suite I compile and verify all currently present DTS board
> > > files in the kernel. I haven't came across to such a problem, which
> > > frankly seems like a big bug
> >=20
> > The static examples in the kernel are not the whole world of dtb.
> > Yes, it's both rare and a bad idea, but robustness against people
> > doing strange things is a good thing to have in a tool.
> >=20
>=20
> Pathological cases that are not in the open can never be addressed.
> But they don't need to really; I don't intend for this to apply for all
> platforms that are fine with DTB as it is.
>=20
> > > > (2)
> > > >=20
> > > > In the other direction there are several features of the dts format
> > > > I don't think you'll get for free with YAML - and it's not clear how
> > > > you would represent them there.  Obviously you *can* represent them=
 -
> > > > it's a key value tree, so it can represent anything; whether it's
> > > > natural and readable is a different question.
> > > >=20
> > > > YAML might have an equivalent of /incbin/, I'm not sure.  I'm pretty
> > > > sure it doesn't have integer expression evaluation, which is quite
> > > > useful in dts when combined with includes.  Likewise, how would you
> > > > tell a YAML based compiler what size to use when encoding a list of
> > > > integers - the equivalent of dtc's /bits/ directive.
> > > >=20
> > >=20
> > > YAML already has support for encoding binary data (base64). The
> > > preprocessor already works, so it is trivial to include any kind of
> > > binary data using a preprocessor include directive of base64 data.
> >=20
> > Uh.. I don't see what base64 has to do with anything.  I'm talking
> > about taking a binary blob in a file and putting it straight into the
> > dtb.
>=20
> YAML is a textual format. The canonical way to embed binary data is with
> base64 encoding; it is inefficient for large blobs though.

Mucky, but ok.

> > That said, now that I've looked at your code a bit more, I see how
> > you're overriding the integer parsing to add the expression handling.
> > You could do a similar extension to scalar parsing to add an /incbin/
> > equivalent.
>=20
> Yes, it's quite simple to add it if need be.
>=20
> > > The whole point of this YAML thing is not to re-invent things that we=
re
> > > invented earlier and work.
> > >=20
> > > > (3)
> > > >=20
> > > > It's not clear to me that preserving type information helps all that
> > > > much with validation.  You still have to validate against something,
> > > > so you need a schema.  And if you have a schema, you can get type a=
nd
> > > > structure information from there which will let you interpret the
> > > > untyped dt information.  That has the additional advantage that you
> > > > can also validate dtbs, which is a nice debugging feature when work=
ing
> > > > with some dtb that you've got from firmware or somewhere without any
> > > > dts/yaml/whatever.
> > > >=20
> > >=20
> > > YAML schemas and schemas in general they way they are defined for oth=
er
> > > uses are going to work poorly for our case. I can't see a case where =
the
> > > complicated bindings like gpio etc will work with a canned schema.
> >=20
> > To be clear, I'm not talking about a YAML schema here (as described in
> > the YAML spec).  You want one of those too, but that should be
> > relatively straightforward.
> >=20
> > I'm talking about a schema at the semantic level - i.e. a machine
> > readable description of bindings.  Once you have that, it lets you
> > interpret dtb bytestring without type information in the dtb itself.
>=20
> It's a matter of resources; a type system can help on systems with
> reduced resources. I.e. you can forbid the kernel from accessing a
> string property as an int etc.

Oh, wow.  You really are talking carrying the type info all the way
into the kernel.  This is basically no longer DT in the
IEEE1275-dervied sense, but a completely new model for describing
hardware information.  In which case.

1) Interesting idea, but, wow, what a huge job you're looking at to
convert the kernel (and other clients).  Doing it bit by bit doesn't
work well, because a key advantage of the DT from the client side, is
you can have your hardware information in a common format across all
platforms (regardless of whether the DT comes directly from firmware,
is converted from firmware info in another format or is built
statically)

2) For the love of god, don't use dtb, it's a terrible fit for this
new data model.

> The machine readable bindings is the complete solution, but it requires
> a level of perfection which might not be easily attainable.
>=20
> > > DT
> > > files need a type system like a programming language because they are
> > > written interactively. In theory you could do away without type
> > > information in any general purpose language, but that's not very
> > > user-friendly and pretty bad for interactive DT file editing.
> > >=20
> > > Not to mention that when you modify the tree at runtime you need the
> > > type system there to catch illegal tree changes.
> >=20
> > Uh.. but if you're working at runtime you're talking dtb, which
> > doesn't have type information.  For all you're saying that you like
> > dtb and just want to change the source format, it really seems like
> > you're trying to change the whole data model to include types.
> >=20
> > That's not necessarily a bad idea, but it's a very different
> > proposition from just a new source format.
>=20
> A type system may be possible even on DTB. Whether we can incur the
> costs that's another matter.

A type system on dtb is just not sensible, it's entirely built on the
premise that properties are bytestrings.  If you want a type system
use a format that has it.

> A new output format ofcourse can support everything we come up with.
>=20
> > > So yes, in theory you could have grand schema that would cover
> > > everything. But no, in practice you need the extra help that a type
> > > system provides.
> >=20
> > Still not seeing how it helps.  So you know your DT has an int in this
> > property say.  How do you know if that property is supposed to contain
> > an int?  By looking at the binding/schema, whether or not that's
> > complete.  If it does tell you it should be an int, you can read an
> > int from the DT without further type information.  If it doesn't you
> > don't know what it's supposed to be, so knowing the type in the DT
> > doesn't help.
>=20
> It does help, not the compiler, but the kernel driver writer which would
> prefer for a call to read an int property to fail when reading a string
> property instead of returning a semi-random garbage value.

Only if you push the type awareness all the way into the client.  That
makes the format much harder to parse.  dtb is the way it is, with
clunky bytestring properties precisely because it's easy to process in
restricted environments - like early kernel boot, bootloaders and
firmware.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4C6bbPZ6c/S1npyF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlmB+Z4ACgkQbDjKyiDZ
s5I+VA/+J/M6+ruNz3d8qoqQr2PPEsVBXiu581NdK0QBWJgK20APVj5iS42cigAG
R3GCf/G2ewVOVxht0GU3OGLT/5jiYUhA0oyQFeHwivTUA34pUjc3Bwv8S37bdU4D
hHEREoMqcW+5FmA8FwzhQpljirSZkxva4aLkfvtJAxK1vyQNM4QEMiXLKhi6/0Pf
5plfEXNef3z980NeyW0+fAFS55KaqHVSjyrVCw/z0qJE9lNXEgTRv08uQNHZ+kGS
bxDgr8IrlcqsYA2HKUZdOG9ZefG6wRI9gMt1YzrIlhsbDQbHvRPpto2WH/efw1oP
p39x3WGg63F6IVn5RQF3xtRlo6InoWI2PjZav9n2CHaezF1K4mZf4RYK1it3Ptgo
hNfaIvDZynQNXBKWZITo4uIcBxkFPUoCBa4U77AK0buehii6GKI69e+hJm0HmrdV
qoFPzrphaSzpL81dfUNz/0WTnd/mXGrkfXF8BDU4pZ3Zxd9NZYJJZTswZWk+7k6P
YZf+0qm51VSBdNSAMAfJilhblk12Z5qwXoKYkH4JUOBVAi4fpdKcONCMjBPeZ/UG
BIeaQWd102BEq19GPVxpXMEA1bLpWZjA6MGRwwnXUQlxMjsJFVBCZD4E+t2up8mn
5T7eVBu/rkfTr7pXaQAUT7k7v1to9T7D4pUVsqBU556FWXyfwxU=
=pfkG
-----END PGP SIGNATURE-----

--4C6bbPZ6c/S1npyF--
