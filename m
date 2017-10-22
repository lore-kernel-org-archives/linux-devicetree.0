From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Sun, 22 Oct 2017 19:48:14 +0100
Message-ID: <CACxGe6vm_iOUB-oyFw=myU1dNCsoBfmWTb+uTq3BGPb8xo+4Yw@mail.gmail.com>
References: <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
 <1501181931.1055.18.camel@hp800z> <597A4B80.7000106@gmail.com>
 <1501191985.1055.50.camel@hp800z> <CAL_Jsq+NBEXyOmRx3Ar0OTpyaLeT0hEKw45R0PrVEdmOcd9czw@mail.gmail.com>
 <20170728005140.GF26163@bill-the-cat> <20170802150933.GG394@umbus.fritz.box>
 <CACxGe6um3TC3URKa8NWbbQT-gc=AV5jgTxbQ3pYnSp4Xmu_Mfg@mail.gmail.com>
 <20170803054914.GL394@umbus.fritz.box> <CACxGe6s3-1rK1NMm0B8fKP+XfxphcHj+pBU7=FxpSexXMWyeFQ@mail.gmail.com>
 <20170814134150.GL3452@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170814134150.GL3452-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 14, 2017 at 2:41 PM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Thu, Aug 10, 2017 at 03:21:00PM +0100, Grant Likely wrote:
>> On Thu, Aug 3, 2017 at 6:49 AM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > Right.  Regardless of (1), (2) is absolutely the case.  Contrary to
>> > the initial description, the proposal in this thread really seems to
>> > be about completely reworking the device tree data model.  While in
>> > isolation the JSON/yaml data model is, I think, superior to the dtb
>> > one, attempting to change over now lies somewhere between hopelessly
>> > ambitious and completely bonkers, IMO.
>>
>> That isn't what is being proposed. The structure of data doesn't
>> change. Anything encoded in YAML DT can be converted to/from DTS
>> without loss, and it is not a wholesale adoption of everything that is
>> possible with YAML. As with any other usage of YAML/JSON, the
>> metaschema constrains what is allowed. YAML DT should specify exactly
>> how DT is encoded into YAML. Anything that falls outside of that is
>> illegal and must fail to load.
>
> Um.. yeah.  So the initial description said that, and that's the only
> sane approach, but then a number of examples given by Pantelis later
> in the thread seemed to directly contradict that, and implied carrying
> the full YAML/JSON data model into clients like the kernel.  Hence my
> confusion..
>
>> Your right that changing to "anything possible in YAML" would be
>> bonkers, but that is not what is being proposed. It is merely a
>> different encoding for DT data.
>>
>> Defining the YAML DT metaschema is important because is there is quite
>
> Ok, I'm not entirely sure what you mean by metaschema here.

In YAML/json, metaschema refers to the structure of the data, and
schema validates the data itself. So, in DT terms the metaschema would
restrict YAML to just something that encodes the DT node structure,
and the schema would be all the bindings, both generic and specific.

>> a tight coupling between YAML layout and how the data is loaded into
>> memory by YAML parsers. ie. Define the metaschema and you define the
>> data structures you get out on the other side. That makes the data
>> accessible in a consistent way to JSON & YAML tooling. For example,
>> I've had promising results using JSON Schema (specifically the Python
>> JSONSchema library) to start doing DT schema checking. Python JSON
>> schema doesn't operate directly on JSON or YAML files. It operates on
>> the data structure outputted by the JSON and YAML parsers. It would
>> just as happily operate on a DTS/DTB file parser as long as the
>> resulting data structure has the same layout.
>
> Urhhh, except that json/yaml parsers can get at least the basic
> structure of the data without context.  That's not true of dtb - you
> need the context of other properties in this node, or sometimes other
> nodes in order to parse property values into something meaningful.

I assume you=E2=80=99re talking about interpreting property values here. If
so, correct. The specific schema is needed to decode the raw bytes
into useful data. So there is some back and forth between the schema
and the data to do validation (get property bytes =E2=80=94> refer to schem=
a
to decode =E2=80=94> check with schema again to see if values are correct).

However, there is still all of the DT structure of nodes & properties
that can be defined so that schemes can be written against that
structure.

>> So, define a DT YAML metaschema, and we've automatically got an
>> interchange format for DT that works with existing tools. Software
>> written to interact with YAML/JSON files can be leveraged to be used
>> with DTS. **without mass converting DTS to YAML**. There's no downside
>> here.
>>
>> This is what I meant by it defines a data model -- it defines a
>> working set data model for other applications to interact with. I did
>> not mean that it redefines the DTS model.
>
> Ok, but unlike translating from yaml into an internal data model to
> translate dtb into an internal data model you need to know (at least
> part of) all the bindings,

I see the data model needing to handle at least two variants of
property data. 1) raw bytes that needs to be decoded  before they can
be interpreted, and structured data (ex. A reg property is a list of
address/size pairs), but that info is not in the DTB. Access to the
schema is required to decode a reg property into the list of tuples.

>> >> 3) Therefore the DTS->DTB workflow is the important one. Anything tha=
t
>> >> falls outside of that may be interesting, but it distracts from the
>> >> immediate problem and I don't want to talk about it here.
>> >>
>> >> For schema documentation and checking, I've been investigating how to
>> >> use JSON Schema to enforce DT bindings. Specifically, I've been using
>> >> the JSONSchema Python library which strictly speaking doesn't operate
>> >> on JSON or YAML, but instead operates directly on Python data
>> >> structures. If that data happens to be imported from a DTS or DTB, th=
e
>> >> JSON Schema engine doesn't care.
>> >
>> > So, inspired by this thread, I've had a little bit of a look at some
>> > of these json/python schema systems, and thought about how they'd
>> > apply to dtb.  It certainly seems worthwhile to exploit those schema
>> > systems if we can, since they seem pretty close to what's wanted at
>> > least flavour-wise.  But I see some difficulties that don't have
>> > obvious (to me) solutions.
>> >
>> > The main one is that they're based around the thing checked knowing
>> > its own types (at least in terms of basic scalar/sequence/map
>> > structure).  I guess that's the motivation behind Pantelis yamldt
>> > notion, but that doesn't address the problem of validating dtbs in the
>> > absence of source.
>>
>> I've been thinking about that two. It requires a kind of dual pass
>> schema checking. When a schema matches a node, the first pass would be
>> recasting raw dt property bytestrings into the types specified by the
>> schema. Only minimal checks can be performed at this stage. Mostly it
>> would be checking if it is possible to recast the bytestring into the
>> specified type. ex. if it is a cell array, then the bytestring length
>> must be a multiple of 4. If it is a string then it must be \0
>> terminated.
>>
>> Second pass would be verifying that the data itself make sense.
>
> Ok, that makes sense.  I was thinking shortly after sending the
> previous mail that an approach would be to combine an existing json
> schema system with each binding having, let's call it an "encoding" to
> translate between raw dtb and a parsed data structure of some sort.

Yup

> It's not entirely obvious to me that writing an encoding / decoding
> handler will be less work than writing a schema checker from scratch
> designed to work with bytestrings.  But, it's plausible that it might
> be.
>
> Fwiw, it might be worth looking back at traditional OF (IEEE 1275)
> handling of this.  Because it's DT is not a static structure, but
> something derived from live Forth objects, it has various Forth words
> to encode and decode various things.  For example some properties will
> be described in terms of how're they're built up from encode-int /
> decode-int and other basic encoders acting in sequence.

Sounds like a conversation we should have over a beer this week in Prague.

:-)

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
