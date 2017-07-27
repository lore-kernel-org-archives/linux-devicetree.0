From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Thu, 27 Jul 2017 21:58:51 +0300
Message-ID: <1501181931.1055.18.camel@hp800z>
References: <1501174151.1055.8.camel@hp800z>
         <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2017-07-27 at 13:09 -0500, Rob Herring wrote:
> On Thu, Jul 27, 2017 at 11:49 AM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > Hi all,
> >
> > This is a project I've been working on lately and it's finally in a
> > usuable form.
> >
> > I'm introducing yamldt.
> >
> > A YAML to DT blob generator/compiler, utilizing a YAML schema that is
> > functionaly equivalent to DTS and supports all DTS features.
> 
> What problem are you trying to solve?
> 

I am demonstrating that the DTS source format is not the only way to
describe hardware and generate a DTB that is functionally equivalent.

I feel that the reliance on DTS has been holding progress back in
expressing modern hardware and having a tool that generates DTB as well
will allow me to experiment in ways that things like overlays and
portable overlays can be defined.

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
> 
> We have type information in dts. We can distinguish numbers, strings,
> phandles, etc. The problem is we loose that information in the DTB and
> this does nothing to help that problem.
> 

This is not enough information IMO. We not only need those scalar types
but type information about references (what phandles really are) and
use them to enforce type checking and promotion.

And of course DTS throws away all type information away and has no
way to be extended. In YAML this is a solved problem. 

> >
> > For more take a look here.
> >
> > https://github.com/pantoniou/yamldt
> 
> Looking at the example, I find the syntax harder to follow. Parsing
> what are node names vs labels is one. Relying on indentation for tree
> hierarchy is another.
> 

This is really debatable. You can use curly braces if you don't like the
indentation.

I.e.

foo:
  bar: true

Can be written as
foo: { bar: true }

YAML is a JSON superset which uses the curly braces as a map separator.

And frankly there are about x1000 more people aware of YAML syntax than
DTS syntax.

> Does C preprocessing of the YAML files work? I'm surprised if it does.
> 

I think you should check the code out and see for yourself.

The complete set of C preprocessing of DTS is available, and works
perfectly AFAIKT.

> >
> > I am eagerly awaiting for your comments.
> 
> I could see some uses here to extract data from dts files more easily.
> For example, to extract all compatible strings for some set of dts
> files. I did this by hacking dtc to dump them. Or as a starting point
> to create YAML based DT binding schema. I wonder how Grant is coming
> along with that.
> 
> Rob


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
