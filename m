From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Wed, 02 Aug 2017 18:17:55 +0300
Message-ID: <1501687075.3937.54.camel@hp800z>
References: <1501174151.1055.8.camel@hp800z>
         <20170731054010.GF2652@umbus.fritz.box> <1501533399.3937.24.camel@hp800z>
         <20170802145312.GF394@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170802145312.GF394-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

On Thu, 2017-08-03 at 00:53 +1000, David Gibson wrote:
> On Mon, Jul 31, 2017 at 11:36:39PM +0300, Pantelis Antoniou wrote:
> > Hi David,
> > 
> > On Mon, 2017-07-31 at 15:40 +1000, David Gibson wrote:
> > > On Thu, Jul 27, 2017 at 07:49:11PM +0300, Pantelis Antoniou wrote:
> > > > Hi all,
> > > > 
> > > > This is a project I've been working on lately and it's finally in a
> > > > usuable form.
> > > > 
> > > > I'm introducing yamldt.
> > > > 
> > > > A YAML to DT blob generator/compiler, utilizing a YAML schema that is
> > > > functionaly equivalent to DTS and supports all DTS features.
> > > > 
> > > > yamldl parses a device tree description (source) file in YAML format and
> > > > outputs a (bit-exact if the -C option is used) device tree blob.
> > > > 
> > > > A DT aware YAML schema is a good fit as a DTS syntax alternative.
> > > > 
> > > > YAML is a human-readable data serialization language, and is expressive
> > > > enough to cover all DTS source features.
> > > > 
> > > > Simple YAML files are just key value pairs that are very easy to parse,
> > > > even without using a formal YAML parser. For instance YAML in restricted
> > > > environments may simple be appending a few lines of text in a given YAML
> > > > file.
> > > > 
> > > > The parsers of YAML are very mature, as it has been released in 2001. It
> > > > is in wide-spread use and schema validation tools are available. YAML
> > > > support is available for every major programming language.
> > > > 
> > > > Data in YAML can easily be converted to/form other format that a
> > > > particular tool that we may use in the future understands.
> > > > 
> > > > More importantly YAML offers (an optional) type information for each
> > > > data, which is IMHO crucial for thorough validation and checking against
> > > > device tree bindings (when they will be converted to a machine readable
> > > > format, preferably YAML).
> > > > 
> > > > For more take a look here.
> > > > 
> > > > https://github.com/pantoniou/yamldt
> > > > 
> > > > I am eagerly awaiting for your comments.
> > > 
> > > Ok, technical comments here only; I addressthe procedural questions
> > > brought up in the thread elsewhere.
> > > 
> > > First, there's a lot to like about YAML - if it had been as well known
> > > when I wrote dtc, maybe we'd already be using it.  It was also the
> > > frontrunner for a schema language in the various inconclusive threads
> > > there have been on the topic.  It's been a little while since I read
> > > up on YAML, so I may have forgotten some things about it.
> > > 
> > > I do have some doubts about this approach.
> > > 
> > > (1)
> > > 
> > > dts has its semantic model built closely around what dtb can
> > > represent.  YAML (and JSON) have a different semantic model - in many
> > > ways a better one than dtb (and IEEE1275), but that's not really the
> > > point.  I wonder if having a source language which suggests the
> > > possibility of things that can't actually be done in dtb will be
> > > confusing.  The most obvious example is that any explicit type tags
> > > will be stripped, of course, but there are others: nested list
> > > structure can't be preserved in dtb, nor even what basic scalars are
> > > in a list.  i.e. dtb couldn't tell the difference between:
> > > 	foo: [0, "\0\0\0\0"];
> > > and
> > > 	foo: ["\0\0\0\0", 0];
> > > 	
> > 
> > This is a limitation of DTB only. Nothing precludes having YAML input
> > being restricted to a subset of it's capabilities if targeting a DTB
> > output target.
> 
> But you don't just want to do that when targetting DTB - you want to
> do it early, so that the user knows they've put in a construct which
> can't be represented in DTB.
> 

All objects are tracked as they are parsed (along with their original
unparsed content). On the emit phase the dtb generator can issue
accurate error messages for any errors it encountered.

> > But as was mentioned earlier DTB is a very low level format; it's just
> > keys and values. If people were to agree what to put in there to encode
> > the types of a sequence it would work, albeit it would look a little bit
> > funky on a dump.
> 
> Well, yes, you can encode the information there - again, you can
> encode anything in a key-value store.  It's not a natural fit,
> though.  If you do this you're talking about changing the whole data
> model of DTB.
> 
> Now, I can see why you'd want to do that - frankly YAML/JSON is just a
> nicer, more flexible data model than dtb - but that requires changing
> the whole ecosystem - all the dtb clients, as well as the tools.
> 
> And, if you want to change to a YAML/JSON data model, you might as
> well use something like UBJSON for a compact encoding, rather than
> forcing it awkwardly into dtb.
> 

I can output anything that's a key/value format. Right now outputs
generated are DTB, DTS, and YAML. The UBJSON format is on my TODO list.

However, note that even the generated (machine readable) YAML is very
compact. In fact it's more compact from the generated DTB file.

Observe:

> $ ls -l am335x-boneblack.pure.yaml am335x-boneblack.pure.dtb
> -rw-rw-r-- 1 panto panto 50045 Aug  2 18:03 am335x-boneblack.pure.dtb
> -rw-rw-r-- 1 panto panto 45560 Aug  2 18:03 am335x-boneblack.pure.yaml

Which is quite understandable, DTB files contains lots of small
integers, encoded as 32 bit values. Text YAML uses just 1-2 bytes for
most.

Compressing is even more interesting:

> $ ls -l *.xz
> -rw-rw-r-- 1 panto panto 8084 Aug  2 18:03 am335x-boneblack.pure.dtb.xz
> -rw-rw-r-- 1 panto panto 6620 Aug  2 18:03 am335x-boneblack.pure.yaml.xz

This is important due to the fact that overlays (i.e. editing) of YAML documents
is supported from the start.

The bootloader/firmware shall never need to edit the YAML file to modify it.
It might as well be compressed. You only need to append a marker '---' and your
modified nodes/properties and it will work.

> > But object files and executables look funny on a dump
> > but no-one ever complained much about it.
> > 
> > > There's also the fact that using YAML implicitly puts nodes and
> > > properties into the namespace, which isn't the case in the dtb model.
> > > Obviously you can simply ban having a property and subnode with the
> > > same name (since that's good practice anyway), but it could be an
> > > issue for decompiling or manipulating existing trees. I know there
> > > have been device trees in the wild which had a property and subnode
> > > with the same name in the same place (some old PowerPC based
> > > Macintoshes, I think).
> > > 
> > 
> > In my test-suite I compile and verify all currently present DTS board
> > files in the kernel. I haven't came across to such a problem, which
> > frankly seems like a big bug
> 
> The static examples in the kernel are not the whole world of dtb.
> Yes, it's both rare and a bad idea, but robustness against people
> doing strange things is a good thing to have in a tool.
> 

Pathological cases that are not in the open can never be addressed.
But they don't need to really; I don't intend for this to apply for all
platforms that are fine with DTB as it is.

> > > (2)
> > > 
> > > In the other direction there are several features of the dts format
> > > I don't think you'll get for free with YAML - and it's not clear how
> > > you would represent them there.  Obviously you *can* represent them -
> > > it's a key value tree, so it can represent anything; whether it's
> > > natural and readable is a different question.
> > > 
> > > YAML might have an equivalent of /incbin/, I'm not sure.  I'm pretty
> > > sure it doesn't have integer expression evaluation, which is quite
> > > useful in dts when combined with includes.  Likewise, how would you
> > > tell a YAML based compiler what size to use when encoding a list of
> > > integers - the equivalent of dtc's /bits/ directive.
> > > 
> > 
> > YAML already has support for encoding binary data (base64). The
> > preprocessor already works, so it is trivial to include any kind of
> > binary data using a preprocessor include directive of base64 data.
> 
> Uh.. I don't see what base64 has to do with anything.  I'm talking
> about taking a binary blob in a file and putting it straight into the
> dtb.
> 

YAML is a textual format. The canonical way to embed binary data is with
base64 encoding; it is inefficient for large blobs though.

> That said, now that I've looked at your code a bit more, I see how
> you're overriding the integer parsing to add the expression handling.
> You could do a similar extension to scalar parsing to add an /incbin/
> equivalent.
> 

Yes, it's quite simple to add it if need be.

> > The whole point of this YAML thing is not to re-invent things that were
> > invented earlier and work.
> > 
> > > (3)
> > > 
> > > It's not clear to me that preserving type information helps all that
> > > much with validation.  You still have to validate against something,
> > > so you need a schema.  And if you have a schema, you can get type and
> > > structure information from there which will let you interpret the
> > > untyped dt information.  That has the additional advantage that you
> > > can also validate dtbs, which is a nice debugging feature when working
> > > with some dtb that you've got from firmware or somewhere without any
> > > dts/yaml/whatever.
> > > 
> > 
> > YAML schemas and schemas in general they way they are defined for other
> > uses are going to work poorly for our case. I can't see a case where the
> > complicated bindings like gpio etc will work with a canned schema.
> 
> To be clear, I'm not talking about a YAML schema here (as described in
> the YAML spec).  You want one of those too, but that should be
> relatively straightforward.
> 
> I'm talking about a schema at the semantic level - i.e. a machine
> readable description of bindings.  Once you have that, it lets you
> interpret dtb bytestring without type information in the dtb itself.
> 

It's a matter of resources; a type system can help on systems with
reduced resources. I.e. you can forbid the kernel from accessing a
string property as an int etc.

The machine readable bindings is the complete solution, but it requires
a level of perfection which might not be easily attainable.

> > DT
> > files need a type system like a programming language because they are
> > written interactively. In theory you could do away without type
> > information in any general purpose language, but that's not very
> > user-friendly and pretty bad for interactive DT file editing.
> > 
> > Not to mention that when you modify the tree at runtime you need the
> > type system there to catch illegal tree changes.
> 
> Uh.. but if you're working at runtime you're talking dtb, which
> doesn't have type information.  For all you're saying that you like
> dtb and just want to change the source format, it really seems like
> you're trying to change the whole data model to include types.
> 
> That's not necessarily a bad idea, but it's a very different
> proposition from just a new source format.
> 

A type system may be possible even on DTB. Whether we can incur the
costs that's another matter.

A new output format ofcourse can support everything we come up with.

> > So yes, in theory you could have grand schema that would cover
> > everything. But no, in practice you need the extra help that a type
> > system provides.
> 
> Still not seeing how it helps.  So you know your DT has an int in this
> property say.  How do you know if that property is supposed to contain
> an int?  By looking at the binding/schema, whether or not that's
> complete.  If it does tell you it should be an int, you can read an
> int from the DT without further type information.  If it doesn't you
> don't know what it's supposed to be, so knowing the type in the DT
> doesn't help.
> 

It does help, not the compiler, but the kernel driver writer which would
prefer for a call to read an int property to fail when reading a string
property instead of returning a semi-random garbage value.

Regards

-- Pantelis
