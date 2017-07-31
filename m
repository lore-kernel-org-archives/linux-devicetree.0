From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Mon, 31 Jul 2017 23:36:39 +0300
Message-ID: <1501533399.3937.24.camel@hp800z>
References: <1501174151.1055.8.camel@hp800z>
         <20170731054010.GF2652@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170731054010.GF2652-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

On Mon, 2017-07-31 at 15:40 +1000, David Gibson wrote:
> On Thu, Jul 27, 2017 at 07:49:11PM +0300, Pantelis Antoniou wrote:
> > Hi all,
> > 
> > This is a project I've been working on lately and it's finally in a
> > usuable form.
> > 
> > I'm introducing yamldt.
> > 
> > A YAML to DT blob generator/compiler, utilizing a YAML schema that is
> > functionaly equivalent to DTS and supports all DTS features.
> > 
> > yamldl parses a device tree description (source) file in YAML format and
> > outputs a (bit-exact if the -C option is used) device tree blob.
> > 
> > A DT aware YAML schema is a good fit as a DTS syntax alternative.
> > 
> > YAML is a human-readable data serialization language, and is expressive
> > enough to cover all DTS source features.
> > 
> > Simple YAML files are just key value pairs that are very easy to parse,
> > even without using a formal YAML parser. For instance YAML in restricted
> > environments may simple be appending a few lines of text in a given YAML
> > file.
> > 
> > The parsers of YAML are very mature, as it has been released in 2001. It
> > is in wide-spread use and schema validation tools are available. YAML
> > support is available for every major programming language.
> > 
> > Data in YAML can easily be converted to/form other format that a
> > particular tool that we may use in the future understands.
> > 
> > More importantly YAML offers (an optional) type information for each
> > data, which is IMHO crucial for thorough validation and checking against
> > device tree bindings (when they will be converted to a machine readable
> > format, preferably YAML).
> > 
> > For more take a look here.
> > 
> > https://github.com/pantoniou/yamldt
> > 
> > I am eagerly awaiting for your comments.
> 
> Ok, technical comments here only; I addressthe procedural questions
> brought up in the thread elsewhere.
> 
> First, there's a lot to like about YAML - if it had been as well known
> when I wrote dtc, maybe we'd already be using it.  It was also the
> frontrunner for a schema language in the various inconclusive threads
> there have been on the topic.  It's been a little while since I read
> up on YAML, so I may have forgotten some things about it.
> 
> I do have some doubts about this approach.
> 
> (1)
> 
> dts has its semantic model built closely around what dtb can
> represent.  YAML (and JSON) have a different semantic model - in many
> ways a better one than dtb (and IEEE1275), but that's not really the
> point.  I wonder if having a source language which suggests the
> possibility of things that can't actually be done in dtb will be
> confusing.  The most obvious example is that any explicit type tags
> will be stripped, of course, but there are others: nested list
> structure can't be preserved in dtb, nor even what basic scalars are
> in a list.  i.e. dtb couldn't tell the difference between:
> 	foo: [0, "\0\0\0\0"];
> and
> 	foo: ["\0\0\0\0", 0];
> 	

This is a limitation of DTB only. Nothing precludes having YAML input
being restricted to a subset of it's capabilities if targeting a DTB
output target.

But as was mentioned earlier DTB is a very low level format; it's just
keys and values. If people were to agree what to put in there to encode
the types of a sequence it would work, albeit it would look a little bit
funky on a dump. But object files and executables look funny on a dump
but no-one ever complained much about it.

> There's also the fact that using YAML implicitly puts nodes and
> properties into the namespace, which isn't the case in the dtb model.
> Obviously you can simply ban having a property and subnode with the
> same name (since that's good practice anyway), but it could be an
> issue for decompiling or manipulating existing trees. I know there
> have been device trees in the wild which had a property and subnode
> with the same name in the same place (some old PowerPC based
> Macintoshes, I think).
> 

In my test-suite I compile and verify all currently present DTS board
files in the kernel. I haven't came across to such a problem, which
frankly seems like a big bug.

> (2)
> 
> In the other direction there are several features of the dts format
> I don't think you'll get for free with YAML - and it's not clear how
> you would represent them there.  Obviously you *can* represent them -
> it's a key value tree, so it can represent anything; whether it's
> natural and readable is a different question.
> 
> YAML might have an equivalent of /incbin/, I'm not sure.  I'm pretty
> sure it doesn't have integer expression evaluation, which is quite
> useful in dts when combined with includes.  Likewise, how would you
> tell a YAML based compiler what size to use when encoding a list of
> integers - the equivalent of dtc's /bits/ directive.
> 

YAML already has support for encoding binary data (base64). The
preprocessor already works, so it is trivial to include any kind of
binary data using a preprocessor include directive of base64 data.

The whole point of this YAML thing is not to re-invent things that were
invented earlier and work.

> (3)
> 
> It's not clear to me that preserving type information helps all that
> much with validation.  You still have to validate against something,
> so you need a schema.  And if you have a schema, you can get type and
> structure information from there which will let you interpret the
> untyped dt information.  That has the additional advantage that you
> can also validate dtbs, which is a nice debugging feature when working
> with some dtb that you've got from firmware or somewhere without any
> dts/yaml/whatever.
> 

YAML schemas and schemas in general they way they are defined for other
uses are going to work poorly for our case. I can't see a case where the
complicated bindings like gpio etc will work with a canned schema. DT
files need a type system like a programming language because they are
written interactively. In theory you could do away without type
information in any general purpose language, but that's not very
user-friendly and pretty bad for interactive DT file editing.

Not to mention that when you modify the tree at runtime you need the
type system there to catch illegal tree changes.

So yes, in theory you could have grand schema that would cover
everything. But no, in practice you need the extra help that a type
system provides.

Regards

-- Pantelis


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
