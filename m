From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Fri, 11 Aug 2017 01:05:11 +0300
Message-ID: <67999086-624C-46B0-927E-E8FCBCE86861@konsulko.com>
References: <1501174151.1055.8.camel@hp800z> <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com> <1501181931.1055.18.camel@hp800z> <597A4B80.7000106@gmail.com> <1501191985.1055.50.camel@hp800z> <CAL_Jsq+NBEXyOmRx3Ar0OTpyaLeT0hEKw45R0PrVEdmOcd9czw@mail.gmail.com> <20170728005140.GF26163@bill-the-cat> <20170802150933.GG394@umbus.fritz.box> <CACxGe6um3TC3URKa8NWbbQT-gc=AV5jgTxbQ3pYnSp4Xmu_Mfg@mail.gmail.com> <20170803054914.GL394@umbus.fritz.box> <CACxGe6s3-1rK1NMm0B8fKP+XfxphcHj+pBU7=FxpSexXMWyeFQ@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6s3-1rK1NMm0B8fKP+XfxphcHj+pBU7=FxpSexXMWyeFQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It is late, and I haven't read all of this, but I just got the validator wor=
king using a modified scheme that Rob has posted way back.

I will reply in detail tomorrow, but thing are now very far from theoretical=
.=20

Regards

-- Pantelis

=CE=A3=CF=84=CE=AC=CE=BB=CE=B8=CE=B7=CE=BA=CE=B5 =CE=B1=CF=80=CF=8C =CF=84=CE=
=BF iPad =CE=BC=CE=BF=CF=85

10 =CE=91=CF=85=CE=B3 2017, 17:21, =CE=BF/=CE=B7 Grant Likely <grant.likely@=
secretlab.ca> =CE=AD=CE=B3=CF=81=CE=B1=CF=88=CE=B5:

> On Thu, Aug 3, 2017 at 6:49 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> On Wed, Aug 02, 2017 at 11:04:14PM +0100, Grant Likely wrote:
>>> I'll randomly choose this point in the thread to jump in...
>>>=20
>>> On Wed, Aug 2, 2017 at 4:09 PM, David Gibson
>>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>>>> On Thu, Jul 27, 2017 at 08:51:40PM -0400, Tom Rini wrote:
>>>>> If the common dts source file was in yaml, binding docs would be writt=
en
>>>>> so that we could use them as validation and hey, the above wouldn't ev=
er
>>>>> have happened.  And I'm sure this is not the only example that's in-tr=
ee
>>>>> right now.  These kind of problems create an artificially high barrier=

>>>>> to entry in a rather important area of the kernel (you can't trust the=

>>>>> docs, you have to check around the code too, and of course the code
>>>>> might have moved since the docs were written).
>>>>=20
>>>> Yeah, problems like that suck.  But I don't see that going to YAML
>>>> helps avoid them.  It may have a number of neat things it can do, but
>>>> yaml won't magically give you a way to match against bindings.  You'd
>>>> still need to define a way of describing bindings (on top of yaml or
>>>> otherwise) and implement the matching of DTs against bindings.
>>>=20
>>> I'm going to try and apply a few constraints. I'm using the following
>>> assumptions for my reply.
>>> 1) DTS files exist, will continue to exist, and new ones will be
>>> created for the foreseeable future.
>>> 2) DTB is the format that the kernel and U-Boot consume
>>=20
>> Right.  Regardless of (1), (2) is absolutely the case.  Contrary to
>> the initial description, the proposal in this thread really seems to
>> be about completely reworking the device tree data model.  While in
>> isolation the JSON/yaml data model is, I think, superior to the dtb
>> one, attempting to change over now lies somewhere between hopelessly
>> ambitious and completely bonkers, IMO.
>=20
> That isn't what is being proposed. The structure of data doesn't
> change. Anything encoded in YAML DT can be converted to/from DTS
> without loss, and it is not a wholesale adoption of everything that is
> possible with YAML. As with any other usage of YAML/JSON, the
> metaschema constrains what is allowed. YAML DT should specify exactly
> how DT is encoded into YAML. Anything that falls outside of that is
> illegal and must fail to load.
>=20
> Your right that changing to "anything possible in YAML" would be
> bonkers, but that is not what is being proposed. It is merely a
> different encoding for DT data.
>=20
> Defining the YAML DT metaschema is important because is there is quite
> a tight coupling between YAML layout and how the data is loaded into
> memory by YAML parsers. ie. Define the metaschema and you define the
> data structures you get out on the other side. That makes the data
> accessible in a consistent way to JSON & YAML tooling. For example,
> I've had promising results using JSON Schema (specifically the Python
> JSONSchema library) to start doing DT schema checking. Python JSON
> schema doesn't operate directly on JSON or YAML files. It operates on
> the data structure outputted by the JSON and YAML parsers. It would
> just as happily operate on a DTS/DTB file parser as long as the
> resulting data structure has the same layout.
>=20
> So, define a DT YAML metaschema, and we've automatically got an
> interchange format for DT that works with existing tools. Software
> written to interact with YAML/JSON files can be leveraged to be used
> with DTS. **without mass converting DTS to YAML**. There's no downside
> here.
>=20
> This is what I meant by it defines a data model -- it defines a
> working set data model for other applications to interact with. I did
> not mean that it redefines the DTS model.
>=20
>>> 3) Therefore the DTS->DTB workflow is the important one. Anything that
>>> falls outside of that may be interesting, but it distracts from the
>>> immediate problem and I don't want to talk about it here.
>>>=20
>>> For schema documentation and checking, I've been investigating how to
>>> use JSON Schema to enforce DT bindings. Specifically, I've been using
>>> the JSONSchema Python library which strictly speaking doesn't operate
>>> on JSON or YAML, but instead operates directly on Python data
>>> structures. If that data happens to be imported from a DTS or DTB, the
>>> JSON Schema engine doesn't care.
>>=20
>> So, inspired by this thread, I've had a little bit of a look at some
>> of these json/python schema systems, and thought about how they'd
>> apply to dtb.  It certainly seems worthwhile to exploit those schema
>> systems if we can, since they seem pretty close to what's wanted at
>> least flavour-wise.  But I see some difficulties that don't have
>> obvious (to me) solutions.
>>=20
>> The main one is that they're based around the thing checked knowing
>> its own types (at least in terms of basic scalar/sequence/map
>> structure).  I guess that's the motivation behind Pantelis yamldt
>> notion, but that doesn't address the problem of validating dtbs in the
>> absence of source.
>=20
> I've been thinking about that two. It requires a kind of dual pass
> schema checking. When a schema matches a node, the first pass would be
> recasting raw dt property bytestrings into the types specified by the
> schema. Only minimal checks can be performed at this stage. Mostly it
> would be checking if it is possible to recast the bytestring into the
> specified type. ex. if it is a cell array, then the bytestring length
> must be a multiple of 4. If it is a string then it must be \0
> terminated.
>=20
> Second pass would be verifying that the data itself make sense.
>=20
>> In a dtb you just have bytestrings, which means your bottom level
>> types in a suitable schema need to know how to extract themselves from
>> a bytestream - and in the DT that often means getting an element
>> length from a different property or even a different node (#*-cells
>> etc.).  AFAICT the json schema languages I looked at didn't really
>> have a notion like that.
>=20
> Core jsonschema doesn't have that, but the validator is extensible. It
> can be added.
>=20
>> The other is that because we don't have explicit sequences, a schema
>> matching a sequence either needs to have a explicit number of entries
>> (either from another property or preceding the sequence), or it has to
>> be the last thing in the property's pattern (for basically the same
>> reason that C99 doesn't allow flexible array members anywhere except
>> the end of a structure).
>=20
> Yes. It needs to handle that.
>=20
>> Or to look at it in a more JSONSchema specific way, before you examine
>> the schema, you can't pull the info in the dtb into Python structures
>> any more specific than "bytestring".
>>=20
>> Have I missed some features in JSONSchema that help with this, or do
>> you have a clever solution already?
>=20
> Following on my description above, I envision two separate forms of DT
> data. A 'raw' form which is just bytestrings, and a 'parsed' for which
> replaces the bytestrings with typed values, using the schemas to
> figure out what those typed values should be. So, the workflow would
> be:
>=20
> DTBFile --(parser)--> bytestring DT --(decode)--> decoded DT
> --(validate)--> pass/fail
>=20
> 'parse' requires no external input
> 'decode' and 'validate' both use schema files, but 'decode' is focused
> on getting the type information back, and 'validate' is, well,
> validation.  :-)
>=20
>>> The work Pantelis has done here is important because it defines a
>>> specific data model for DT data. That data model must be defined
>>> before schema files can be written, otherwise they'll be testing for
>>> the wrong things. However, rather than defining a language specific
>>> data model (ie. Python), specifying it in YAML means it doesn't depend
>>> on any particular language.
>>=20
>> Urgh.. except that dtb already defines a data model, and it's not the
>> same as the JSON/yaml data model.
>=20
> As described above, that isn't what I'm talking about here. DTB
> doesn't say anything about how the data is represented at runtime, and
> therefore how other software interacts with it.
>=20
> g.
