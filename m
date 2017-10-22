From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Sun, 22 Oct 2017 18:54:33 +0100
Message-ID: <CACxGe6v702Xc3kyXy-1sN+rBqbarVZGvVbO-XWHm9GRvMr=Z4w@mail.gmail.com>
References: <1506628736.28192.9.camel@hp800z> <CACxGe6tJfcnwDB=m7GLnCeDSc4Srxqssv+-p1+zapDo2yLWXXQ@mail.gmail.com>
 <D029AB76-4084-40D4-8095-CFFBEA55DB86@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D029AB76-4084-40D4-8095-CFFBEA55DB86-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 20, 2017 at 8:16 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Hi Grant,
>
>> On Oct 20, 2017, at 20:46 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wro=
te:
>>
>> On Thu, Sep 28, 2017 at 8:58 PM, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>> Hello again,
>>>
>>> Significant progress has been made on yamldt and is now capable of
>>> not only generating yaml from DTS source but also compiling DTS sources
>>> and being almost fully compatible with DTC.
>>>
>>> Compiling the kernel's DTBs using yamldt is as simple as using a
>>> DTC=3Dyamldt.
>>>
>>> Error reporting is accurate and validation against a YAML based schema
>>> works as well. In a short while I will begin posting patches with
>>> fixes on bindings and DTS files in the kernel.
>>>
>>> Please try it on your platform and report if you encounter any problems=
.
>>>
>>> https://github.com/pantoniou/yamldt
>>>
>>> I am eagerly awaiting for your comments.
>>
>> Hi Pantelis,
>>
>> This is good work. I've played around with it and I'm looking forward
>> to chatting next week.
>>
>
> Thanks. I=E2=80=99m looking forward to it too.
>
>> One thing I've done is tried loading the output YAML files into
>> another YAML interpreter and the current encoding causes problems.
>> Specifically, in yamldt anchors/aliases are being used as a
>> replacement for labels/phandles, but that conflicts with the YAML data
>> model which defines a reference as a way to make a copy of the data
>> appear in another part of the tree. For example, for the following
>> snippit:
>>
>> intc: intc@10000 {
>>    #interrupt-cells =3D <1>;
>>    compatible =3D "acme,intc";
>>    reg =3D <0x10000 0x1000>;
>>    gpio-controller;
>> };
>>
>> serial@20000 {
>>    compatible =3D "acme,uart";
>>    reg =3D <0x20000 0x1000>;
>>    interrupt-parent =3D <&intc>;
>>    interrupts =3D <5>;
>> };
>>
>> yamldt will encode this as:
>>
>> intc@10000: &intc
>>    "#interrupt-cells": 1
>>    compatible: acme,intc
>>    reg: [0x10000, 0x1000]
>>    gpio-controller:
>>
>> serial@20000:
>>    compatible: acme,uart
>>    reg: [0x20000, 0x1000]
>>    interrupt-parent: *intc
>>    interrupts: 5
>>
>> But, the expected behaviour for a YAML parser is expand the alias
>> '*intc' which results in the following structure:
>>
>> intc@10000: &intc
>>    "#interrupt-cells": 1
>>    compatible: acme,intc
>>    reg: [0x10000, 0x1000]
>>    gpio-controller:
>>
>> serial@20000:
>>    compatible: acme,uart
>>    reg: [0x20000, 0x1000]
>>    interrupt-parent:
>>        "#interrupt-cells": 1
>>        compatible: acme,intc
>>        reg: [0x10000, 0x1000]
>>        gpio-controller:
>>    interrupts: 5
>>
>> See? It results in the entire interrupt controller node to appear as
>> an instance under the interrupt-parent property, when the intention is
>> only to create a phandle. yamldt should not redefine the behaviour of
>> '*' aliases. Instead, it should use a different indicator, either
>> using an explicit !phandle tag, or by replacing '*' with something
>> else. I worked around it in my tests by replacing '*' with '$=E2=80=99.
>
> Yes. This is expected. I don=E2=80=99t think pure YAML form is a good mat=
ch for all
> the crazy things that are possible (and actually used in practice) with D=
TS.

I don=E2=80=99t think it is as dire as that. The DTS structure is not compl=
ex
and I think can easily be mapped into pure YAML. But, it does require
treating the DTS structure separately from its semantic meaning. For
example, the grammar of nodes, properties and labels easily maps to
pure YAML, but phandles and overlay trees have semantic meaning that
must be resolved by DT specific code. I=E2=80=99ll respond to you=E2=80=99r=
e specific
examples below...

>
> For instance there=E2=80=99s no way a normal YAML parser won=E2=80=99t ch=
oke with something like
>
> / {
>   foo;
> };
>
> / {
>   bar;
> };
>
> Which is a common idiom in DTS files.

That=E2=80=99s only true when the top level of nodes is encoded as a map, b=
ut
it shouldn=E2=80=99t be. It should be a list instead, for two reasons. Firs=
t,
order matters for the top level. Subsequent top level trees have to be
applied in order to fully resolve the tree, but a map doesn=E2=80=99t prese=
rve
the ordering. Second, as you rightly point out, the same name can be
used for multiple top level trees. So, the encoding should be a list
with each list entry containing the node path {/path,&ref}, and the
node data. One possible way to do this is with a tuple:

treedata:
- - /
  - foo:
- - /
  - bar:

Another option is to add a special property in the node to contain the name=
:

treedata:
- $path: /
  foo:
- $path: /
  bar:

Personally, I prefer the special property approach. That would also be
a good way to encode labels

> The decision to use the YAML anchors and references was more borne out of=
 a desire
> to sort of match conceptually the labels and references of DTS. It=E2=80=
=99s not a big
> issue to switch to something different.

I think it would be a good idea. One reason for defining a YAML
encoding is to be able to use existing tools to work with the data.
Changing the meaning of anchors and aliases breaks those tools
immediately.

> If we were to force YAML/DT file to be regular YAML files parseable by ev=
erything
> we=E2=80=99d have to rethink a lot of conventions that DT files currently=
 use and I=E2=80=99m afraid
> a machine translation from DTS to YAML might not be feasible then.
>
> OTOH moving to that model might make it possible to use YAML constructs t=
hat are not
> mapped at all to DTS. For instance
>
> - foo: true
>   bar: =E2=80=9Cstring=E2=80=9D
>
> - foo: false
>   bar: =E2=80=9Canother-string=E2=80=9D
>
> is not possible to be mapped to a DT node/property structure right now.

I=E2=80=99m not following. Are you saying DT has no way to encode a list of
nodes? What use case are you imagining?

>
>>
>
>> Plus, it would be useful to use normal YAML anchors/aliases for
>> creating node templates. For example:
>>
>> serial-template: &acme-uart . # The anchor for the template
>>    compatible: acme,uart
>>    interrupt-parent: *intc
>>
>> root:
>>    serial@20000:
>>        <<: *acme-uart   # Alias node merged into serial@20000
>>        interrupts: 5
>>        reg: [0x20000, 0x1000]
>>    serial@30000:
>>        <<: *acme-uart   # Alias node merged into serial@30000
>>        interrupts: 5
>>        reg: [0x30000, 0x1000]
>>
>
> Yes, I=E2=80=99m aware of this and I planned to talk to you about it :)
> It can be a very powerful way to cut down the churn of DT right now.
>
> It=E2=80=99s not going to be a problem for yamldt to support it (perhaps
> adding a new editing tags to allow more fine grained control of the
> substitions).
>
>> Another problem with anchors/references is YAML seems to require the
>> anchor to be defined before the reference, or at least that's what
>> pyyaml and ruamel both expect. Regardless, The chosen YAML encoding
>> should be readily consumable by existing yaml implementations without
>> having to do a lot of customization.
>>
>
> I think this is only true for streamable YAML implementations; yamldt
> can leave references unresolved until the emit phase (or even leave them
> be as object files).

it is possible (probable) that I=E2=80=99m just not familiar with how to
change that behaviour in pyyaml and ruamel. However, the point is moot
if we can agree to preserve pure YAML semantics.

>> I'm slightly concerned about using & anchors for labels because it
>> seems only one anchor can be defined per node, but DTC allows multiple
>> labels for a single node. This might not be an issue in practice
>> though. Another implementation issue related to using & anchors is the
>> YAML spec defines them as an encoding artifact, and parsers can
>> discard the anchor names after parsing the YAML structure, which is a
>> problem if we use something like $name to reference an anchor. The
>> solution might just be that labels need to go into a special property
>> so they don't disappear from the data stream.
>>
>
> I do support multiple labels to the same node in yamldt with the
> following trick, that uses an empty tree.
>
> foo: bar: baz { frob; };
>
> bar: &foo
>   frob: true
>
> bar: &bar
>   ~: ~
>
> Special properties should work, albeit being a little bit cludgy.

With special properties, it might look like this:

baz:
  $labels: [foo, bar]
  frob:

>
>> There appears to be no place to put metadata. The root of the tree is
>> the top level of the YAML structure. There isn't any provision for
>> having a top level object to hold things like the memreserve map. We
>> may need a namespace to use for special properties that aren't nodes
>> or properties.
>>
>
> I don=E2=80=99t think that=E2=80=99s going to be necessary. Metadata are =
artifacts that
> only have meaning when emitting a serialized form like dtb.
>
> yamldt fully supports /memreserve/ by simply treating a top level
> /memreserve/ property as special and constructing the memreserve
> entries at the emit phase.
>
> so
>
> /memreserve/ 1000 10;
>
> is simply:
>
> /memreserve/: [ 1000 10 ]
>
> It=E2=80=99s a matter of definition what properties are encoded as metada=
ta for the
> serialized form.
>
>> The encoding differentiates between nodes and properties implicitly
>> base on whether the contents are a map, or a scalar/list. This does
>> mean any parser needs to do a bit more work and it may impact what can
>> be done with validation (I'm not going to talk about validation in
>> this email though. We'll talk next week.)
>
> Hmm, I=E2=80=99m not sure I follow this. Is that related to the metadata =
problem.

It has to do with iterating over properties or nodes. Nodes and props
are mixed together, and any code processing them has to explicitly
check the type to differentiate between the two. The alternative would
be to collect all properties under a single key:

parent:
  $props:
    foo: hello
    bar: world
  child1: {}
  child2: {}

>
> BTW, a blog post explaining the rationale behind yamldt is going to come
> up soon at our website, I=E2=80=99ll post the link when it does.

Cool. I see it got posted, but didn=E2=80=99t get a chance to read it befor=
e I
got on this airplane. Will try to read this evening.

(BTW, I=E2=80=99m arriving at about 11:00 tonight)

Cheers,
g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
