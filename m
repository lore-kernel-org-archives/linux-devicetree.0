From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Fri, 11 Aug 2017 17:45:54 +0300
Message-ID: <1502462754.5633.19.camel@hp800z>
References: <1501174151.1055.8.camel@hp800z>
         <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
         <1501181931.1055.18.camel@hp800z> <597A4B80.7000106@gmail.com>
         <1501191985.1055.50.camel@hp800z>
         <CAL_Jsq+NBEXyOmRx3Ar0OTpyaLeT0hEKw45R0PrVEdmOcd9czw@mail.gmail.com>
         <20170728005140.GF26163@bill-the-cat>
         <20170802150933.GG394@umbus.fritz.box>
         <CACxGe6um3TC3URKa8NWbbQT-gc=AV5jgTxbQ3pYnSp4Xmu_Mfg@mail.gmail.com>
         <20170803054914.GL394@umbus.fritz.box>
         <CACxGe6s3-1rK1NMm0B8fKP+XfxphcHj+pBU7=FxpSexXMWyeFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6s3-1rK1NMm0B8fKP+XfxphcHj+pBU7=FxpSexXMWyeFQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

On Thu, 2017-08-10 at 15:21 +0100, Grant Likely wrote:
> On Thu, Aug 3, 2017 at 6:49 AM, David Gibson
> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> > On Wed, Aug 02, 2017 at 11:04:14PM +0100, Grant Likely wrote:
> >> I'll randomly choose this point in the thread to jump in...
> >>
> >> On Wed, Aug 2, 2017 at 4:09 PM, David Gibson
> >> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> >> > On Thu, Jul 27, 2017 at 08:51:40PM -0400, Tom Rini wrote:
> >> >> If the common dts source file was in yaml, binding docs would be written
> >> >> so that we could use them as validation and hey, the above wouldn't ever
> >> >> have happened.  And I'm sure this is not the only example that's in-tree
> >> >> right now.  These kind of problems create an artificially high barrier
> >> >> to entry in a rather important area of the kernel (you can't trust the
> >> >> docs, you have to check around the code too, and of course the code
> >> >> might have moved since the docs were written).
> >> >
> >> > Yeah, problems like that suck.  But I don't see that going to YAML
> >> > helps avoid them.  It may have a number of neat things it can do, but
> >> > yaml won't magically give you a way to match against bindings.  You'd
> >> > still need to define a way of describing bindings (on top of yaml or
> >> > otherwise) and implement the matching of DTs against bindings.
> >>
> >> I'm going to try and apply a few constraints. I'm using the following
> >> assumptions for my reply.
> >> 1) DTS files exist, will continue to exist, and new ones will be
> >> created for the foreseeable future.
> >> 2) DTB is the format that the kernel and U-Boot consume
> >
> > Right.  Regardless of (1), (2) is absolutely the case.  Contrary to
> > the initial description, the proposal in this thread really seems to
> > be about completely reworking the device tree data model.  While in
> > isolation the JSON/yaml data model is, I think, superior to the dtb
> > one, attempting to change over now lies somewhere between hopelessly
> > ambitious and completely bonkers, IMO.
> 

FYI there's a new release out:

https://github.com/pantoniou/yamldt

The biggest change is that validation is now fully working using an
external schema based on what Rob has put out a couple years ago.

The README file explains things in more detail but in a nutshell
 eBPF filter(s) are generated from all the constraints, type definitions
and category types and the inheritance tree.

Executing the filters you can select a node for inspection and then
issue a validation call.

The return value of the filter is 0 on success or a negative value keyed
by the constraint index when generating the fragment.

These are the kind of errors you get check against for now (single
jedec,spi-nor and spi-slave bindings for now).

> cc -E -MT rule-check.cpp.yaml -MMD -MP -MF rule-check.o.Yd -I ./ -I ../../port -I ../../include -I ../../include/dt-bindings/input -nostdinc -undef -x assembler-with-cpp -D__DTS__ -D__YAML__ rule-check.yaml >rule-check.cpp.yaml
> ../../yamldt  -g ../../validate/schema/codegen.yaml -S ../../validate/bindings/ -y am33xx.cpp.yaml am33xx-clocks.cpp.yaml am335x-bone-common.cpp.yaml am335x-boneblack-common.cpp.yaml am335x-boneblack.cpp.yaml rule-check.cpp.yaml -o am335x-boneblack-rules.pure.yaml
> jedec,spi-nor: /ocp/spi@48030000/m25p80@0 FAIL (-1018)
> rule-check.yaml:9:23: error: constraint rule failed
>      spi-tx-bus-width: 3
>                        ^
> ../../validate/bindings/spi/spi-slave.yaml:77:19: error: constraint that fails was defined here
>        constraint: v == 1 || v == 2 || v == 4
>                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
> ../../validate/bindings/spi/spi-slave.yaml:74:5: error: property was defined at /spi-slave/properties/spi-tx-bus-width
>      spi-tx-bus-width:
>      ^~~~~~~~~~~~~~~~~

On with the comments.

> That isn't what is being proposed. The structure of data doesn't
> change. Anything encoded in YAML DT can be converted to/from DTS
> without loss, and it is not a wholesale adoption of everything that is
> possible with YAML. As with any other usage of YAML/JSON, the
> metaschema constrains what is allowed. YAML DT should specify exactly
> how DT is encoded into YAML. Anything that falls outside of that is
> illegal and must fail to load.
> 
> Your right that changing to "anything possible in YAML" would be
> bonkers, but that is not what is being proposed. It is merely a
> different encoding for DT data.
> 

Correct, I don't propose we change anything in the DTB format or the
kernel implementation of device tree for now.

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
> 
> So, define a DT YAML metaschema, and we've automatically got an
> interchange format for DT that works with existing tools. Software
> written to interact with YAML/JSON files can be leveraged to be used
> with DTS. **without mass converting DTS to YAML**. There's no downside
> here.
> 

Right, and for FWIW it is trivial to add a JSON output or XML option or
whatever. It's not a full language that requires a yacc parser.

> This is what I meant by it defines a data model -- it defines a
> working set data model for other applications to interact with. I did
> not mean that it redefines the DTS model.
> 
> >> 3) Therefore the DTS->DTB workflow is the important one. Anything that
> >> falls outside of that may be interesting, but it distracts from the
> >> immediate problem and I don't want to talk about it here.
> >>
> >> For schema documentation and checking, I've been investigating how to
> >> use JSON Schema to enforce DT bindings. Specifically, I've been using
> >> the JSONSchema Python library which strictly speaking doesn't operate
> >> on JSON or YAML, but instead operates directly on Python data
> >> structures. If that data happens to be imported from a DTS or DTB, the
> >> JSON Schema engine doesn't care.
> >
> > So, inspired by this thread, I've had a little bit of a look at some
> > of these json/python schema systems, and thought about how they'd
> > apply to dtb.  It certainly seems worthwhile to exploit those schema
> > systems if we can, since they seem pretty close to what's wanted at
> > least flavour-wise.  But I see some difficulties that don't have
> > obvious (to me) solutions.
> >
> > The main one is that they're based around the thing checked knowing
> > its own types (at least in terms of basic scalar/sequence/map
> > structure).  I guess that's the motivation behind Pantelis yamldt
> > notion, but that doesn't address the problem of validating dtbs in the
> > absence of source.
> 
> I've been thinking about that two. It requires a kind of dual pass
> schema checking. When a schema matches a node, the first pass would be
> recasting raw dt property bytestrings into the types specified by the
> schema. Only minimal checks can be performed at this stage. Mostly it
> would be checking if it is possible to recast the bytestring into the
> specified type. ex. if it is a cell array, then the bytestring length
> must be a multiple of 4. If it is a string then it must be \0
> terminated.
> 
> Second pass would be verifying that the data itself make sense.
> 
> > In a dtb you just have bytestrings, which means your bottom level
> > types in a suitable schema need to know how to extract themselves from
> > a bytestream - and in the DT that often means getting an element
> > length from a different property or even a different node (#*-cells
> > etc.).  AFAICT the json schema languages I looked at didn't really
> > have a notion like that.
> 
> Core jsonschema doesn't have that, but the validator is extensible. It
> can be added.
> 

What I've implemented does correct type checks all the way.
You can easily use it with a DTS format file by generating YAML in a
pipe and then checking that.

You get the same error checking with the downside that you can't have
traceback to the DTS source since the file position markers are all gone
by the emit process in DTC.

> > The other is that because we don't have explicit sequences, a schema
> > matching a sequence either needs to have a explicit number of entries
> > (either from another property or preceding the sequence), or it has to
> > be the last thing in the property's pattern (for basically the same
> > reason that C99 doesn't allow flexible array members anywhere except
> > the end of a structure).
> 
> Yes. It needs to handle that.
> 

I can support a full C expression type checker for the most crazy
validation problem.

For instance you could write a checker (in ebpf C) that can 'walk' an
argument property and verify each item properly.

> > Or to look at it in a more JSONSchema specific way, before you examine
> > the schema, you can't pull the info in the dtb into Python structures
> > any more specific than "bytestring".
> >
> > Have I missed some features in JSONSchema that help with this, or do
> > you have a clever solution already?
> 
> Following on my description above, I envision two separate forms of DT
> data. A 'raw' form which is just bytestrings, and a 'parsed' for which
> replaces the bytestrings with typed values, using the schemas to
> figure out what those typed values should be. So, the workflow would
> be:
> 
> DTBFile --(parser)--> bytestring DT --(decode)--> decoded DT
> --(validate)--> pass/fail
> 
> 'parse' requires no external input
> 'decode' and 'validate' both use schema files, but 'decode' is focused
> on getting the type information back, and 'validate' is, well,
> validation.  :-)
> 
> >> The work Pantelis has done here is important because it defines a
> >> specific data model for DT data. That data model must be defined
> >> before schema files can be written, otherwise they'll be testing for
> >> the wrong things. However, rather than defining a language specific
> >> data model (ie. Python), specifying it in YAML means it doesn't depend
> >> on any particular language.
> >
> > Urgh.. except that dtb already defines a data model, and it's not the
> > same as the JSON/yaml data model.
> 
> As described above, that isn't what I'm talking about here. DTB
> doesn't say anything about how the data is represented at runtime, and
> therefore how other software interacts with it.
> 

Correct. We already do a conversion to a live tree since working with
the DT blob is too hard. IMO we can abstract things even better; there's
almost no need for the binary contents of properties to be just pointers
to the DT blob since the underlying implementation details of DTB leak.

Same thing as phandles; phandles are merely a way to refer to other
points in the tree, there's no need to have them around in numerical
form and expose this low-level detail to the driver users.

> g.

Regards

-- Pantelis


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
