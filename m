From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Sun, 22 Oct 2017 20:13:53 +0100
Message-ID: <CACxGe6v+SaMcBDE=aB-2J=hbhmkq4tYbcp=-J5zK_GisNKJ5yg@mail.gmail.com>
References: <1506628736.28192.9.camel@hp800z> <CACxGe6tJfcnwDB=m7GLnCeDSc4Srxqssv+-p1+zapDo2yLWXXQ@mail.gmail.com>
 <D029AB76-4084-40D4-8095-CFFBEA55DB86@konsulko.com> <CACxGe6v702Xc3kyXy-1sN+rBqbarVZGvVbO-XWHm9GRvMr=Z4w@mail.gmail.com>
 <744E94DE-E4AE-425B-9B02-E0E022017450@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <744E94DE-E4AE-425B-9B02-E0E022017450-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Oct 22, 2017 at 7:23 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Hi Grant,
>
>> On Oct 22, 2017, at 19:54 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wro=
te:
>>
>> On Fri, Oct 20, 2017 at 8:16 PM, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>> Hi Grant,
>>>
>>>> On Oct 20, 2017, at 20:46 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
>>>>
>>>> On Thu, Sep 28, 2017 at 8:58 PM, Pantelis Antoniou
>>>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
[...]
>>> Yes. This is expected. I don=E2=80=99t think pure YAML form is a good m=
atch for all
>>> the crazy things that are possible (and actually used in practice) with=
 DTS.
>>
>> I don=E2=80=99t think it is as dire as that. The DTS structure is not co=
mplex
>> and I think can easily be mapped into pure YAML. But, it does require
>> treating the DTS structure separately from its semantic meaning. For
>> example, the grammar of nodes, properties and labels easily maps to
>> pure YAML, but phandles and overlay trees have semantic meaning that
>> must be resolved by DT specific code. I=E2=80=99ll respond to you=E2=80=
=99re specific
>> examples below=E2=80=A6
>>
>
> We are in complete agreement here. Single nodes and properties map to YAM=
L perfectly.
> It=E2=80=99s the complex way that we build the complete DTB that stress t=
he YAML structures.

Okay, good.

>>> If we were to force YAML/DT file to be regular YAML files parseable by =
everything
>>> we=E2=80=99d have to rethink a lot of conventions that DT files current=
ly use and I=E2=80=99m afraid
>>> a machine translation from DTS to YAML might not be feasible then.
>>>
>>> OTOH moving to that model might make it possible to use YAML constructs=
 that are not
>>> mapped at all to DTS. For instance
>>>
>>> - foo: true
>>>  bar: =E2=80=9Cstring=E2=80=9D
>>>
>>> - foo: false
>>>  bar: =E2=80=9Canother-string=E2=80=9D
>>>
>>> is not possible to be mapped to a DT node/property structure right now.
>>
>> I=E2=80=99m not following. Are you saying DT has no way to encode a list=
 of
>> nodes? What use case are you imagining?
>>
>
> This threw me off too at first.
>
> The problem is when you try to convert this into a live tree structure.
>
> The YAML encoding is
>
> +SEQ
>  +MAP
>   =3DVAL :foo
>   =3DVAL :true
>   =3DVAL :bar
>   =3DVAL "string
>  -MAP
>  +MAP
>   =3DVAL :foo
>   =3DVAL :false
>   =3DVAL :bar
>   =3DVAL "another-string
>  -MAP
> -SEQ
>
> So it=E2=80=99s a sequence of MAPs.
>
> In a live tree DTS form would be
>
> noname-property =3D { foo=3Dtrue; bar =3D =E2=80=9Cstring=E2=80=9D; }, { =
foo =3D false; bar=3D=E2=80=9Canother-string=E2=80=9D; };
>
> We don=E2=80=99t have the capability as right now to express something li=
ke this.
>
> Namely properties containing nodes, and the root of the live tree not bei=
ng a node.

Ah, so you're proposing property data that encodes key/value pairs,
correct? Effectively adding another layer of namespace under a
property, but that namespace is invisible to and generic DT parsing
code in an OS (for how DT is defined today).

I would straight out make that structure illegal in the YAML DT
metaschema until such time as the semantics are defined. For now
properties should only be allowed to contain scalars, or lists of
scalars/lists which can be nested.

[...]

>>>> The encoding differentiates between nodes and properties implicitly
>>>> base on whether the contents are a map, or a scalar/list. This does
>>>> mean any parser needs to do a bit more work and it may impact what can
>>>> be done with validation (I'm not going to talk about validation in
>>>> this email though. We'll talk next week.)
>>>
>>> Hmm, I=E2=80=99m not sure I follow this. Is that related to the metadat=
a problem.
>>
>> It has to do with iterating over properties or nodes. Nodes and props
>> are mixed together, and any code processing them has to explicitly
>> check the type to differentiate between the two. The alternative would
>> be to collect all properties under a single key:
>>
>> parent:
>>  $props:
>>    foo: hello
>>    bar: world
>>  child1: {}
>>  child2: {}
>>
>
> That=E2=80=99s no problem. It does look weird though. I am using the same=
 parser
> for parsing bindings and this might make the files a little bit weird.

That it does. I don=E2=80=99t feel strongly about either approach, but I wa=
nt
to see how the different encodings affect doing the schema bits.

>
> Keep in mind that we have two YAML formats to parse; the hardware descrip=
tion
> and the bindings describing them.

Three! Hw description, schema & metaschema. :-) But metaschema should
be a normal jsonschema file.

>
>>>
>>> BTW, a blog post explaining the rationale behind yamldt is going to com=
e
>>> up soon at our website, I=E2=80=99ll post the link when it does.
>>
>> Cool. I see it got posted, but didn=E2=80=99t get a chance to read it be=
fore I
>> got on this airplane. Will try to read this evening.
>>
>> (BTW, I=E2=80=99m arriving at about 11:00 tonight)
>>
>
> Have a safe flight, you=E2=80=99ll get to beat me up tomorrow :)

See you tomorrow. It will be good to catch up.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
