From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Sun, 22 Oct 2017 20:23:19 +0200
Message-ID: <744E94DE-E4AE-425B-9B02-E0E022017450@konsulko.com>
References: <1506628736.28192.9.camel@hp800z>
 <CACxGe6tJfcnwDB=m7GLnCeDSc4Srxqssv+-p1+zapDo2yLWXXQ@mail.gmail.com>
 <D029AB76-4084-40D4-8095-CFFBEA55DB86@konsulko.com>
 <CACxGe6v702Xc3kyXy-1sN+rBqbarVZGvVbO-XWHm9GRvMr=Z4w@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6v702Xc3kyXy-1sN+rBqbarVZGvVbO-XWHm9GRvMr=Z4w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

> On Oct 22, 2017, at 19:54 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> =
wrote:
>=20
> On Fri, Oct 20, 2017 at 8:16 PM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> Hi Grant,
>>=20
>>> On Oct 20, 2017, at 20:46 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> =
wrote:
>>>=20
>>> On Thu, Sep 28, 2017 at 8:58 PM, Pantelis Antoniou
>>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>>> Hello again,
>>>>=20
>>>> Significant progress has been made on yamldt and is now capable of
>>>> not only generating yaml from DTS source but also compiling DTS =
sources
>>>> and being almost fully compatible with DTC.
>>>>=20
>>>> Compiling the kernel's DTBs using yamldt is as simple as using a
>>>> DTC=3Dyamldt.
>>>>=20
>>>> Error reporting is accurate and validation against a YAML based =
schema
>>>> works as well. In a short while I will begin posting patches with
>>>> fixes on bindings and DTS files in the kernel.
>>>>=20
>>>> Please try it on your platform and report if you encounter any =
problems.
>>>>=20
>>>> https://github.com/pantoniou/yamldt
>>>>=20
>>>> I am eagerly awaiting for your comments.
>>>=20
>>> Hi Pantelis,
>>>=20
>>> This is good work. I've played around with it and I'm looking =
forward
>>> to chatting next week.
>>>=20
>>=20
>> Thanks. I=E2=80=99m looking forward to it too.
>>=20
>>> One thing I've done is tried loading the output YAML files into
>>> another YAML interpreter and the current encoding causes problems.
>>> Specifically, in yamldt anchors/aliases are being used as a
>>> replacement for labels/phandles, but that conflicts with the YAML =
data
>>> model which defines a reference as a way to make a copy of the data
>>> appear in another part of the tree. For example, for the following
>>> snippit:
>>>=20
>>> intc: intc@10000 {
>>>   #interrupt-cells =3D <1>;
>>>   compatible =3D "acme,intc";
>>>   reg =3D <0x10000 0x1000>;
>>>   gpio-controller;
>>> };
>>>=20
>>> serial@20000 {
>>>   compatible =3D "acme,uart";
>>>   reg =3D <0x20000 0x1000>;
>>>   interrupt-parent =3D <&intc>;
>>>   interrupts =3D <5>;
>>> };
>>>=20
>>> yamldt will encode this as:
>>>=20
>>> intc@10000: &intc
>>>   "#interrupt-cells": 1
>>>   compatible: acme,intc
>>>   reg: [0x10000, 0x1000]
>>>   gpio-controller:
>>>=20
>>> serial@20000:
>>>   compatible: acme,uart
>>>   reg: [0x20000, 0x1000]
>>>   interrupt-parent: *intc
>>>   interrupts: 5
>>>=20
>>> But, the expected behaviour for a YAML parser is expand the alias
>>> '*intc' which results in the following structure:
>>>=20
>>> intc@10000: &intc
>>>   "#interrupt-cells": 1
>>>   compatible: acme,intc
>>>   reg: [0x10000, 0x1000]
>>>   gpio-controller:
>>>=20
>>> serial@20000:
>>>   compatible: acme,uart
>>>   reg: [0x20000, 0x1000]
>>>   interrupt-parent:
>>>       "#interrupt-cells": 1
>>>       compatible: acme,intc
>>>       reg: [0x10000, 0x1000]
>>>       gpio-controller:
>>>   interrupts: 5
>>>=20
>>> See? It results in the entire interrupt controller node to appear as
>>> an instance under the interrupt-parent property, when the intention =
is
>>> only to create a phandle. yamldt should not redefine the behaviour =
of
>>> '*' aliases. Instead, it should use a different indicator, either
>>> using an explicit !phandle tag, or by replacing '*' with something
>>> else. I worked around it in my tests by replacing '*' with '$=E2=80=99=
.
>>=20
>> Yes. This is expected. I don=E2=80=99t think pure YAML form is a good =
match for all
>> the crazy things that are possible (and actually used in practice) =
with DTS.
>=20
> I don=E2=80=99t think it is as dire as that. The DTS structure is not =
complex
> and I think can easily be mapped into pure YAML. But, it does require
> treating the DTS structure separately from its semantic meaning. For
> example, the grammar of nodes, properties and labels easily maps to
> pure YAML, but phandles and overlay trees have semantic meaning that
> must be resolved by DT specific code. I=E2=80=99ll respond to you=E2=80=99=
re specific
> examples below=E2=80=A6
>=20

We are in complete agreement here. Single nodes and properties map to =
YAML perfectly.
It=E2=80=99s the complex way that we build the complete DTB that stress =
the YAML structures.

>>=20
>> For instance there=E2=80=99s no way a normal YAML parser won=E2=80=99t =
choke with something like
>>=20
>> / {
>>  foo;
>> };
>>=20
>> / {
>>  bar;
>> };
>>=20
>> Which is a common idiom in DTS files.
>=20
> That=E2=80=99s only true when the top level of nodes is encoded as a =
map, but
> it shouldn=E2=80=99t be. It should be a list instead, for two reasons. =
First,
> order matters for the top level. Subsequent top level trees have to be
> applied in order to fully resolve the tree, but a map doesn=E2=80=99t =
preserve
> the ordering. Second, as you rightly point out, the same name can be
> used for multiple top level trees. So, the encoding should be a list
> with each list entry containing the node path {/path,&ref}, and the
> node data. One possible way to do this is with a tuple:
>=20
> treedata:
> - - /
>  - foo:
> - - /
>  - bar:
>=20
> Another option is to add a special property in the node to contain the =
name:
>=20
> treedata:
> - $path: /
>  foo:
> - $path: /
>  bar:
>=20
> Personally, I prefer the special property approach. That would also be
> a good way to encode labels
>=20

The YAML bare sequence is problematic; I=E2=80=99ll explain below.
=20
>> The decision to use the YAML anchors and references was more borne =
out of a desire
>> to sort of match conceptually the labels and references of DTS. =
It=E2=80=99s not a big
>> issue to switch to something different.
>=20
> I think it would be a good idea. One reason for defining a YAML
> encoding is to be able to use existing tools to work with the data.
> Changing the meaning of anchors and aliases breaks those tools
> immediately.
>=20

Hmm, I see what you mean. Semantically this mapping is more correct but =
it does
present problems to non-aware tools.

>> If we were to force YAML/DT file to be regular YAML files parseable =
by everything
>> we=E2=80=99d have to rethink a lot of conventions that DT files =
currently use and I=E2=80=99m afraid
>> a machine translation from DTS to YAML might not be feasible then.
>>=20
>> OTOH moving to that model might make it possible to use YAML =
constructs that are not
>> mapped at all to DTS. For instance
>>=20
>> - foo: true
>>  bar: =E2=80=9Cstring=E2=80=9D
>>=20
>> - foo: false
>>  bar: =E2=80=9Canother-string=E2=80=9D
>>=20
>> is not possible to be mapped to a DT node/property structure right =
now.
>=20
> I=E2=80=99m not following. Are you saying DT has no way to encode a =
list of
> nodes? What use case are you imagining?
>=20

This threw me off too at first.

The problem is when you try to convert this into a live tree structure.

The YAML encoding is

+SEQ
 +MAP
  =3DVAL :foo
  =3DVAL :true
  =3DVAL :bar
  =3DVAL "string
 -MAP
 +MAP
  =3DVAL :foo
  =3DVAL :false
  =3DVAL :bar
  =3DVAL "another-string
 -MAP
-SEQ

So it=E2=80=99s a sequence of MAPs.

In a live tree DTS form would be

noname-property =3D { foo=3Dtrue; bar =3D =E2=80=9Cstring=E2=80=9D; }, { =
foo =3D false; bar=3D=E2=80=9Canother-string=E2=80=9D; };

We don=E2=80=99t have the capability as right now to express something =
like this.

Namely properties containing nodes, and the root of the live tree not =
being a node.

>>=20
>>>=20
>>=20
>>> Plus, it would be useful to use normal YAML anchors/aliases for
>>> creating node templates. For example:
>>>=20
>>> serial-template: &acme-uart . # The anchor for the template
>>>   compatible: acme,uart
>>>   interrupt-parent: *intc
>>>=20
>>> root:
>>>   serial@20000:
>>>       <<: *acme-uart   # Alias node merged into serial@20000
>>>       interrupts: 5
>>>       reg: [0x20000, 0x1000]
>>>   serial@30000:
>>>       <<: *acme-uart   # Alias node merged into serial@30000
>>>       interrupts: 5
>>>       reg: [0x30000, 0x1000]
>>>=20
>>=20
>> Yes, I=E2=80=99m aware of this and I planned to talk to you about it =
:)
>> It can be a very powerful way to cut down the churn of DT right now.
>>=20
>> It=E2=80=99s not going to be a problem for yamldt to support it =
(perhaps
>> adding a new editing tags to allow more fine grained control of the
>> substitions).
>>=20
>>> Another problem with anchors/references is YAML seems to require the
>>> anchor to be defined before the reference, or at least that's what
>>> pyyaml and ruamel both expect. Regardless, The chosen YAML encoding
>>> should be readily consumable by existing yaml implementations =
without
>>> having to do a lot of customization.
>>>=20
>>=20
>> I think this is only true for streamable YAML implementations; yamldt
>> can leave references unresolved until the emit phase (or even leave =
them
>> be as object files).
>=20
> it is possible (probable) that I=E2=80=99m just not familiar with how =
to
> change that behaviour in pyyaml and ruamel. However, the point is moot
> if we can agree to preserve pure YAML semantics.
>=20

Agreed.

>>> I'm slightly concerned about using & anchors for labels because it
>>> seems only one anchor can be defined per node, but DTC allows =
multiple
>>> labels for a single node. This might not be an issue in practice
>>> though. Another implementation issue related to using & anchors is =
the
>>> YAML spec defines them as an encoding artifact, and parsers can
>>> discard the anchor names after parsing the YAML structure, which is =
a
>>> problem if we use something like $name to reference an anchor. The
>>> solution might just be that labels need to go into a special =
property
>>> so they don't disappear from the data stream.
>>>=20
>>=20
>> I do support multiple labels to the same node in yamldt with the
>> following trick, that uses an empty tree.
>>=20
>> foo: bar: baz { frob; };
>>=20
>> bar: &foo
>>  frob: true
>>=20
>> bar: &bar
>>  ~: ~
>>=20
>> Special properties should work, albeit being a little bit cludgy.
>=20
> With special properties, it might look like this:
>=20
> baz:
>  $labels: [foo, bar]
>  frob:
>=20

Yeah, that would work.

>>=20
>>> There appears to be no place to put metadata. The root of the tree =
is
>>> the top level of the YAML structure. There isn't any provision for
>>> having a top level object to hold things like the memreserve map. We
>>> may need a namespace to use for special properties that aren't nodes
>>> or properties.
>>>=20
>>=20
>> I don=E2=80=99t think that=E2=80=99s going to be necessary. Metadata =
are artifacts that
>> only have meaning when emitting a serialized form like dtb.
>>=20
>> yamldt fully supports /memreserve/ by simply treating a top level
>> /memreserve/ property as special and constructing the memreserve
>> entries at the emit phase.
>>=20
>> so
>>=20
>> /memreserve/ 1000 10;
>>=20
>> is simply:
>>=20
>> /memreserve/: [ 1000 10 ]
>>=20
>> It=E2=80=99s a matter of definition what properties are encoded as =
metadata for the
>> serialized form.
>>=20
>>> The encoding differentiates between nodes and properties implicitly
>>> base on whether the contents are a map, or a scalar/list. This does
>>> mean any parser needs to do a bit more work and it may impact what =
can
>>> be done with validation (I'm not going to talk about validation in
>>> this email though. We'll talk next week.)
>>=20
>> Hmm, I=E2=80=99m not sure I follow this. Is that related to the =
metadata problem.
>=20
> It has to do with iterating over properties or nodes. Nodes and props
> are mixed together, and any code processing them has to explicitly
> check the type to differentiate between the two. The alternative would
> be to collect all properties under a single key:
>=20
> parent:
>  $props:
>    foo: hello
>    bar: world
>  child1: {}
>  child2: {}
>=20

That=E2=80=99s no problem. It does look weird though. I am using the =
same parser
for parsing bindings and this might make the files a little bit weird.

Keep in mind that we have two YAML formats to parse; the hardware =
description
and the bindings describing them.

>>=20
>> BTW, a blog post explaining the rationale behind yamldt is going to =
come
>> up soon at our website, I=E2=80=99ll post the link when it does.
>=20
> Cool. I see it got posted, but didn=E2=80=99t get a chance to read it =
before I
> got on this airplane. Will try to read this evening.
>=20
> (BTW, I=E2=80=99m arriving at about 11:00 tonight)
>=20

Have a safe flight, you=E2=80=99ll get to beat me up tomorrow :)

> Cheers,
> g.

Regards

=E2=80=94 Pantelis
