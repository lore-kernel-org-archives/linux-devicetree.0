From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Fri, 20 Oct 2017 22:16:39 +0300
Message-ID: <D029AB76-4084-40D4-8095-CFFBEA55DB86@konsulko.com>
References: <1506628736.28192.9.camel@hp800z>
 <CACxGe6tJfcnwDB=m7GLnCeDSc4Srxqssv+-p1+zapDo2yLWXXQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACxGe6tJfcnwDB=m7GLnCeDSc4Srxqssv+-p1+zapDo2yLWXXQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Frank Rowand <frowand.list@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, Tom Rini <trini@konsulko.com>, Rob Herring <robherring2@gmail.com>, Franklin S Cooper Jr <fcooper@ti.com>, Matt Porter <mporter@konsulko.com>, Simon Glass <sjg@chromium.org>, Phil Elwell <philip.j.elwell@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Marek Vasut <marex@denx.de>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

> On Oct 20, 2017, at 20:46 , Grant Likely <grant.likely@secretlab.ca> =
wrote:
>=20
> On Thu, Sep 28, 2017 at 8:58 PM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
>> Hello again,
>>=20
>> Significant progress has been made on yamldt and is now capable of
>> not only generating yaml from DTS source but also compiling DTS =
sources
>> and being almost fully compatible with DTC.
>>=20
>> Compiling the kernel's DTBs using yamldt is as simple as using a
>> DTC=3Dyamldt.
>>=20
>> Error reporting is accurate and validation against a YAML based =
schema
>> works as well. In a short while I will begin posting patches with
>> fixes on bindings and DTS files in the kernel.
>>=20
>> Please try it on your platform and report if you encounter any =
problems.
>>=20
>> https://github.com/pantoniou/yamldt
>>=20
>> I am eagerly awaiting for your comments.
>=20
> Hi Pantelis,
>=20
> This is good work. I've played around with it and I'm looking forward
> to chatting next week.
>=20

Thanks. I=E2=80=99m looking forward to it too.

> One thing I've done is tried loading the output YAML files into
> another YAML interpreter and the current encoding causes problems.
> Specifically, in yamldt anchors/aliases are being used as a
> replacement for labels/phandles, but that conflicts with the YAML data
> model which defines a reference as a way to make a copy of the data
> appear in another part of the tree. For example, for the following
> snippit:
>=20
> intc: intc@10000 {
>    #interrupt-cells =3D <1>;
>    compatible =3D "acme,intc";
>    reg =3D <0x10000 0x1000>;
>    gpio-controller;
> };
>=20
> serial@20000 {
>    compatible =3D "acme,uart";
>    reg =3D <0x20000 0x1000>;
>    interrupt-parent =3D <&intc>;
>    interrupts =3D <5>;
> };
>=20
> yamldt will encode this as:
>=20
> intc@10000: &intc
>    "#interrupt-cells": 1
>    compatible: acme,intc
>    reg: [0x10000, 0x1000]
>    gpio-controller:
>=20
> serial@20000:
>    compatible: acme,uart
>    reg: [0x20000, 0x1000]
>    interrupt-parent: *intc
>    interrupts: 5
>=20
> But, the expected behaviour for a YAML parser is expand the alias
> '*intc' which results in the following structure:
>=20
> intc@10000: &intc
>    "#interrupt-cells": 1
>    compatible: acme,intc
>    reg: [0x10000, 0x1000]
>    gpio-controller:
>=20
> serial@20000:
>    compatible: acme,uart
>    reg: [0x20000, 0x1000]
>    interrupt-parent:
>        "#interrupt-cells": 1
>        compatible: acme,intc
>        reg: [0x10000, 0x1000]
>        gpio-controller:
>    interrupts: 5
>=20
> See? It results in the entire interrupt controller node to appear as
> an instance under the interrupt-parent property, when the intention is
> only to create a phandle. yamldt should not redefine the behaviour of
> '*' aliases. Instead, it should use a different indicator, either
> using an explicit !phandle tag, or by replacing '*' with something
> else. I worked around it in my tests by replacing '*' with '$=E2=80=99.

Yes. This is expected. I don=E2=80=99t think pure YAML form is a good =
match for all
the crazy things that are possible (and actually used in practice) with =
DTS.

For instance there=E2=80=99s no way a normal YAML parser won=E2=80=99t =
choke with something like

/ {
  foo;
};

/ {
  bar;
};

Which is a common idiom in DTS files.

The decision to use the YAML anchors and references was more borne out =
of a desire
to sort of match conceptually the labels and references of DTS. It=E2=80=99=
s not a big
issue to switch to something different. =20

If we were to force YAML/DT file to be regular YAML files parseable by =
everything
we=E2=80=99d have to rethink a lot of conventions that DT files =
currently use and I=E2=80=99m afraid
a machine translation from DTS to YAML might not be feasible then.

OTOH moving to that model might make it possible to use YAML constructs =
that are not
mapped at all to DTS. For instance

- foo: true
  bar: =E2=80=9Cstring=E2=80=9D

- foo: false
  bar: =E2=80=9Canother-string=E2=80=9D

is not possible to be mapped to a DT node/property structure right now.

>=20

> Plus, it would be useful to use normal YAML anchors/aliases for
> creating node templates. For example:
>=20
> serial-template: &acme-uart . # The anchor for the template
>    compatible: acme,uart
>    interrupt-parent: *intc
>=20
> root:
>    serial@20000:
>        <<: *acme-uart   # Alias node merged into serial@20000
>        interrupts: 5
>        reg: [0x20000, 0x1000]
>    serial@30000:
>        <<: *acme-uart   # Alias node merged into serial@30000
>        interrupts: 5
>        reg: [0x30000, 0x1000]
>=20

Yes, I=E2=80=99m aware of this and I planned to talk to you about it :)
It can be a very powerful way to cut down the churn of DT right now.

It=E2=80=99s not going to be a problem for yamldt to support it (perhaps
adding a new editing tags to allow more fine grained control of the
substitions).
=20
> Another problem with anchors/references is YAML seems to require the
> anchor to be defined before the reference, or at least that's what
> pyyaml and ruamel both expect. Regardless, The chosen YAML encoding
> should be readily consumable by existing yaml implementations without
> having to do a lot of customization.
>=20

I think this is only true for streamable YAML implementations; yamldt
can leave references unresolved until the emit phase (or even leave them
be as object files).

> I'm slightly concerned about using & anchors for labels because it
> seems only one anchor can be defined per node, but DTC allows multiple
> labels for a single node. This might not be an issue in practice
> though. Another implementation issue related to using & anchors is the
> YAML spec defines them as an encoding artifact, and parsers can
> discard the anchor names after parsing the YAML structure, which is a
> problem if we use something like $name to reference an anchor. The
> solution might just be that labels need to go into a special property
> so they don't disappear from the data stream.
>=20

I do support multiple labels to the same node in yamldt with the
following trick, that uses an empty tree.

foo: bar: baz { frob; };

bar: &foo
  frob: true

bar: &bar
  ~: ~

Special properties should work, albeit being a little bit cludgy.

> There appears to be no place to put metadata. The root of the tree is
> the top level of the YAML structure. There isn't any provision for
> having a top level object to hold things like the memreserve map. We
> may need a namespace to use for special properties that aren't nodes
> or properties.
>=20

I don=E2=80=99t think that=E2=80=99s going to be necessary. Metadata are =
artifacts that
only have meaning when emitting a serialized form like dtb.

yamldt fully supports /memreserve/ by simply treating a top level
/memreserve/ property as special and constructing the memreserve
entries at the emit phase.

so=20

/memreserve/ 1000 10;

is simply:

/memreserve/: [ 1000 10 ]

It=E2=80=99s a matter of definition what properties are encoded as =
metadata for the
serialized form.

> The encoding differentiates between nodes and properties implicitly
> base on whether the contents are a map, or a scalar/list. This does
> mean any parser needs to do a bit more work and it may impact what can
> be done with validation (I'm not going to talk about validation in
> this email though. We'll talk next week.)

Hmm, I=E2=80=99m not sure I follow this. Is that related to the metadata =
problem.

BTW, a blog post explaining the rationale behind yamldt is going to come
up soon at our website, I=E2=80=99ll post the link when it does.

>=20
> Cheers,
> g.

Regards

=E2=80=94 Pantelis
