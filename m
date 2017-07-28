From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Fri, 28 Jul 2017 14:26:47 +0300
Message-ID: <1501241207.1055.92.camel@hp800z>
References: <1501174151.1055.8.camel@hp800z>
         <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
         <1501181931.1055.18.camel@hp800z> <597A4B80.7000106@gmail.com>
         <1501191985.1055.50.camel@hp800z>
         <CAL_Jsq+NBEXyOmRx3Ar0OTpyaLeT0hEKw45R0PrVEdmOcd9czw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+NBEXyOmRx3Ar0OTpyaLeT0hEKw45R0PrVEdmOcd9czw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Thu, 2017-07-27 at 18:00 -0500, Rob Herring wrote:
> On Thu, Jul 27, 2017 at 4:46 PM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > Hi Frank,
> >
> > On Thu, 2017-07-27 at 13:22 -0700, Frank Rowand wrote:
> >> Hi Pantelis,
> >>
> >> Keep in mind one of the reasons Linus says he is very direct is to
> >> avoid leading a developer on, so that they don't waste a lot of time
> >> trying to resolve the maintainer's issues instead of realizing that
> >> the maintainer is saying "no". Please read my current answer as being
> >> "no, not likely to ever be accepted", not "no, not in the current form".
> >>
> >> My first reaction is: no, this is not a good idea for the Linux kernel.
> >>
> >
> > This has nothing to do with the kernel. It spits out valid DTBs that the
> > kernel (or anything else) may use.
> 
> Let me rephrase Frank's statement: this is not a good idea for the
> main repository of dts files.
> 

I absolutely agree. It is completely out of the question to convert the
whole of the repository to a new format for no particular reason.

I only ask for considering a source format change for new platforms that
may find this new format more appealing.

The kernel infrastructure will keep supporting the DTB format without
any changes.

> But sure, DTS is already not the only source of DTBs. It comes from
> firmware on Power systems. If you want to create and maintain your own
> source format, then that is perfectly fine. But based on the current
> understanding, I'm not seeing a reason we'd convert DTS files to YAML.
> Maybe you're not proposing that now, but if that is not the end goal I
> don't see the point of a new format. If YAML solves a bunch of
> problems, then of course we'd want to convert DTS files at some point.
> 

What I take from this statement is that DTBs have been generated since
for ever using a source format other than DTS, correct?

So what is changing now? That the different source format is open source
and out in the public eye?

> >> On 07/27/17 11:58, Pantelis Antoniou wrote:
> >> > On Thu, 2017-07-27 at 13:09 -0500, Rob Herring wrote:
> >> >> On Thu, Jul 27, 2017 at 11:49 AM, Pantelis Antoniou
> >> >> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >> >>> Hi all,
> >> >>>
> >> >>> This is a project I've been working on lately and it's finally in a
> >> >>> usuable form.
> >> >>>
> >> >>> I'm introducing yamldt.
> >> >>>
> >> >>> A YAML to DT blob generator/compiler, utilizing a YAML schema that is
> >> >>> functionaly equivalent to DTS and supports all DTS features.
> >> >>
> >> >> What problem are you trying to solve?
> >> >>
> >> >
> >> > I am demonstrating that the DTS source format is not the only way to
> >> > describe hardware and generate a DTB that is functionally equivalent.
> >> >
> >> > I feel that the reliance on DTS has been holding progress back in
> >> > expressing modern hardware and having a tool that generates DTB as well
> >> > will allow me to experiment in ways that things like overlays and
> >> > portable overlays can be defined.
> >>
> >> That seems to be multiple things, that should be expressed as individual
> >> issues and not lumped into a simple statement (and thus can be addressed
> >> separately):
> >>
> >>   1) DTS format is holding progress back in expressing modern hardware
> >>
> >> What are the issues you have encountered?
> >
> > DTS syntax is archaic and makes expressing things like overlays (and
> > portable connectors) extremely hard.
> 
> That's a very vague statement. Can we have some examples of what you
> can express with YAML that you can't with DTS? In the end, you are
> still limited by the DTB format. If you're adding automagically
> generated type information like what's been discussed recently for
> phandles, that syntax in the DTB still has to be agreed on whether the
> source is DTS or YAML.
> 

Actually I can.

Let me tackle two very common problems in reviewing DTS patches; the
problem is a by product of using the DTS format as it is right now.

The first is requirement that each node (and property) in the source
format needs to have a unique name. While this maybe a requirement for
the target system that will have to grok the DTB file it seeps in the
source format by the means of the node names having unit address in
them. 

So you have something like this peppered all over the sources:


>                gpio0: gpio@44e07000 {
>                         compatible = "ti,omap4-gpio";
>                         ti,hwmods = "gpio1";
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
>                         reg = <0x44e07000 0x1000>;
>                         interrupts = <96>;
>                 };
> 
>                 gpio1: gpio@4804c000 {
>                         compatible = "ti,omap4-gpio";
>                         ti,hwmods = "gpio2";
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
>                         reg = <0x4804c000 0x1000>;
>                         interrupts = <98>;
>                 };

The node names in general are not useful to the kernel. References to nodes are
made using the labels and phandle references. But it is very easy for the
node names to miss the unit address, or even worse having a wrong unit address.

IMO this is an artificial problem. Having identical names in children of the nodes
should not be a problem for the compiler; it's the DTB emit phase that can handle
appending unit address names (whether in the case of a name clash or by default when
having a ref property present).

The second problem is the proliferation of almost identical device descriptions with minor
changes that make the DTS sources so bulky. Macros help a bit but can't solve the underlying
problem of not having a method of reusing parts of the source with a way to modify the changing
bits.

However YAML has method for handling just that, a merge operator.

http://yaml.org/type/merge.html

We could write the above DT part in YAML as follows:

>  gpio: &gpio0
>     compatible: "ti,omap4-gpio"
>     ti,hwmods: "gpio1"
>     gpio-controller: true
>     "#gpio-cells": 2
>     interrupt-controller: true
>     "#interrupt-cells": 2
>     reg: [ 0x44e07000, 0x1000 ]
>     interrupts: 96
> 
>   gpio: &gpio1
>     << : *gpio0
>     ti,hwmods: "gpio2"
>     reg: [ 0x4804c000, 0x1000 ]
>     interrupts: 98

This is good but we can do even better

>  gpio: &gpio0
>     compatible: "ti,omap4-gpio"
>     ti,hwmods: 'gpio', "1" # single quoted strings do not get the terminating \0
>     gpio-controller: true
>     "#gpio-cells": 2
>     interrupt-controller: true
>     "#interrupt-cells": 2
>     reg: [ 0x44e07000, 0x1000 ]
>     interrupts: 96
> 
>   gpio: &gpio1
>     << : *gpio0
>     ti,hwmods: ~. "2"     # ~ is the null value, we interpret it as 'keep' when using the merge operator
>     reg: [ 0x4804c000, ~ ]
>     interrupts: 98

These are problems that the YAML schema I'm proposing doesn't have. In
fact I've taken an hour or so and implemented the automatic unit
renaming for DTB output already:


> am33xx.yaml:223:3: warning: renamed /ocp/gpio@44e07000 to include unit address
>    gpio: &gpio0
>    ^~~~~~~~~~~~
> am33xx.yaml:233:3: warning: renamed /ocp/gpio@4804c000 to include unit address
>    gpio: &gpio1
>    ^~~~~~~~~~~~

So things are mostly there already.

> > When you have a very large set of boards with are different but similar
> > in ways, the syntax of DTS and the implementation of the single program
> > that can generate a DTB is an impediment.
> 
> So how does using YAML solve this?

Familiar syntax/large amount of available tools and bindings to
languages. And a way to cut down on the clutter and repetition.

> > Going on and fixing it is pointless since..
> >
> >> How would yaml syntax solve those issues?
> >
> > YAML has features that apply well to problem I'm trying to solve.
> >
> > The main thing is the availability of type information that can be made
> > available both at runtime and at compile time.
> 
> How do you get it at runtime? You are still using DTB.
> 

I explained in an previous email to Frank. You can create 'shadow'
properties (prefixed with a .). I'm quoting my reply to him here.


> This problem would be easily solvable if there was a method to record
> type information about the sequence of property elements. You would
> never even need fixups.
> 
> For example you could generate a shadow property for each property
> that
> is encountered and fill it with information about the type of the
> original named property.
> 
> For instance for ref2 = <&target 42 &target_2> you could generate a
> .ref2 = "rcl" property that encodes <remote-reference>, <cell>,
> <local-reference>.
> 
> It would be pretty efficient too since the second property can a)
> eliminated in most cases when the auto type detection (like the one
> used
> in fdtdump) is used and b) the name contains the original property
> name
> so it can be reused in the string table.
> 
> You wouldn't need the __fixups__ nodes at all then. The original ref2
> property would be encoded in a way that the value placed in the place
> of
> the &target be an offset in the string table that would contain the
> name
> of the remote reference to resolve.
> 

> Rob

Regards

-- Pantelis
