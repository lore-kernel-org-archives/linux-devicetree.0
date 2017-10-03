From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Tue, 03 Oct 2017 20:39:12 +0300
Message-ID: <1507052352.17981.48.camel@hp800z>
References: <1506628736.28192.9.camel@hp800z>
         <CAL_Jsq+Hxjf8PecU+ZpCoFqbKAYJtzHpFco2Wsi_KT499fb-=g@mail.gmail.com>
         <1506973580.17981.5.camel@hp800z>
         <CAL_Jsq+vrAXQbfSGdANhqM3QJ2fHTQXDT1J6qGnTJkZ4egepNw@mail.gmail.com>
         <1507039989.17981.25.camel@hp800z>
         <CAL_JsqLLJE8bp3gwdExcsAtF+U4AHkROpbqHX8_79YhYjROovQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLLJE8bp3gwdExcsAtF+U4AHkROpbqHX8_79YhYjROovQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, 2017-10-03 at 12:13 -0500, Rob Herring wrote:
> On Tue, Oct 3, 2017 at 9:13 AM, Pantelis Antoniou
> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> > Hi Rob,
> >
> > On Tue, 2017-10-03 at 08:18 -0500, Rob Herring wrote:
> >> On Mon, Oct 2, 2017 at 2:46 PM, Pantelis Antoniou
> >> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >> > Hi Rob,
> >> >
> >> > On Sun, 2017-10-01 at 17:00 -0500, Rob Herring wrote:
> >> >> On Thu, Sep 28, 2017 at 2:58 PM, Pantelis Antoniou
> >> >> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> >> >> > Hello again,
> >> >> >
> >> >> > Significant progress has been made on yamldt and is now capable of
> >> >> > not only generating yaml from DTS source but also compiling DTS sources
> >> >> > and being almost fully compatible with DTC.
> >> >>
> >> >> Can you quantify "almost"?
> >> >>
> >> >> > Compiling the kernel's DTBs using yamldt is as simple as using a
> >> >> > DTC=yamldt.
> >> >>
> >> >> Good.
> >> >>
> >> >> >
> >> >> > Error reporting is accurate and validation against a YAML based schema
> >> >> > works as well. In a short while I will begin posting patches with
> >> >> > fixes on bindings and DTS files in the kernel.
> >> >>
> >> >> What I would like to see is the schema format posted for review.
> >> >>
> >> >
> >> > I'm including the skeleton.yaml binding which is the template for
> >> > the bindings and a board-example.yaml binding for a top level binding.
> >> >
> >> >> I would also like to see the bindings for top-level compatible strings
> >> >> (aka boards) as an example. That's something that's simple enough that
> >> >> I'd think we could agree on a format and start moving towards defining
> >> >> board bindings that way.
> >> >>
> >> >
> >> > Note there is some line wrapping I'm including a link
> >> > to the github repo of the files:
> >> >
> >> >
> >> > The skeleton.yaml
> >> >
> >> > https://raw.githubusercontent.com/pantoniou/yamldt/master/validate/bindings/skeleton.yaml
> >> >
> >> > %YAML 1.1
> >> > ---
> >> > # The name of the binding is first
> >> > # The anchor is put there for use by others
> >> > skeleton: &skeleton
> >>
> >> This and "id" seem redundant.
> >>
> >
> > Indeed.
> 
> One other thing, "skeleton" is a bit weird as a key. It can't be
> validated. All the other keys are standard words. I could write
> "skeloton" by mistake and I guess I'd only find the mistake when
> something inherits it. That's somewhat true with id, but we can at
> least check "id" is present and that it's value is unique among all
> other id values.
> 

We can keep id and check that it matches the name of the enclosing node.
That way you can be sure that there's no error.

But it's a bit weird cause this is similar to declaring a function name
with a typo. You won't find out until you use it.

> >
> >> >   version: 1
> >> >
> >> >   id: skel-device
> >> >
> >> >   title: >
> >> >     Skeleton Device
> >> >
> >> >   maintainer:
> >> >     name: Skeleton Person <skel-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> >
> >> >   description: >
> >> >     The Skeleton Device binding represents the SK11 device produced by
> >> >     the Skeleton Corporation. The binding can also support compatible
> >> >     clones made by second source vendors.
> >> >
> >> >   # The class is an optional property that declares this
> >> >   # binding as part of a larger set
> >> >   # Multiple definitions are possible
> >> >   class: [ device, spi-device ]
> >> >
> >> >   # This binding inherits property characteristics from the generic
> >> >   # spi-slave binding
> >> >   # Note that the notation is standard yaml reference
> >> >   inherits: *spi-slave
> >> >
> >> >   # virtual bindings do not generate checkers
> >> >   virtual: true
> >>
> >> virtual is an overloaded term.
> >>
> >
> > OK, what term should I use that this binding should not be instantiated
> > as a checker, only be used by other bindings when inherited?
> 
> checks: true?
> 
> I'd really like to avoid having to decide and drop this, but I don't
> really get why it is needed.
> 

It is needed because otherwise checker filters will be generated for
the template bindings that while they won't be executed they will be
compiled and take up space in the schema.

> >
> >> >
> >> >   # each property is defined by each name
> >> >   properties:
> >> >
> >> >     # The compatible property is a reserved name. The type is always
> >> > "string"
> >> >     # and should not be repeated device binding.
> >> >     compatible:
> >> >       category: required        # required property
> >> >       type: strseq              # is a sequence of strings
> >> >
> >> >       description: >
> >> >         FX11 is a clone of the original SK11 device
> >> >
> >> >       # v is always the name of the value of the property
> >> >       # np is passed to the checker and is the current
> >> >       # node pointer. We can access properties and call
> >> >       # methods that operate on them.
> >> >       # There can be multiple constraints, just put them
> >> >       # into a sequence.
> >> >       # Note that the BASE("skel,sk11") form from the previous
> >> >       # binding will have to be reworked.
> >> >       constraint: |
> >> >         anystreq(v, "skel,sk11") ||
> >> >         anystreq(v, "faux,fx11")
> >>
> >> Constraints and logic ops were certainly not decided in the last
> >> attempt and I think will be the hardest part to define. I see you are
> >> using eBPF in the checker. Is that where anystreq comes from?
> >>
> >
> > Yes. The ebpf environment declares a number of methods that are executed
> > outside the ebpf sandbox. Check out
> >
> > https://raw.githubusercontent.com/pantoniou/yamldt/master/validate/schema/codegen.yaml
> > https://github.com/pantoniou/yamldt/blob/master/ebpf_dt.c
> 
> I looked at this some a while back. It wasn't clear to me what eBPF
> gives us and what you have defined on top of it. What I'm really after
> is documentation of the syntax and keywords here.
> 

eBPF is portable, can be serialized after compiling in the schema file
and can be executed in the kernel.

By stripping out all documentation related properties and nodes keeping
only the compiled filters you can generate a dtb blob that passed to
kernel can be used for verification of all runtime changes in the
kernel's live tree. eBPF is enforcing an execution model that is 'safe'
so we can be sure that no foul play is possible.

That means that you can a) run it at boot-time, verifying the dtb blob
passed by the bootloader for errors (potentially disabling devices
that their nodes fail) and b) run it when applying overlays to reject
any that result in an invalid tree.

One other use that I'm thinking that might be possible too, like
binding version check between what the driver is compiled against and
what the passed blob is without using an explicit version property. 

The constraint format ofcourse is plain C, you can generate a .so using
the host compiler and execute that if you are looking for performance.

Syntax and keywords of the internals is in a bit of flux right now,
since the binding format is not finalized yet. I'd be happy to
discuss the internal at ELCE. 

> >> How would you express the ordering requirement (most significant
> >> compatible first)?
> >>
> >
> > Err, there might be new bpf API needed there. For the first stab at
> > the bindings problem I concentrated on getting things working and be as
> > clear as possible.
> >
> > You could do something like that:
> >
> >    orderedstrseq(v, (const char *[]){ "skel,sk11", "faux,fx11", NULL })
> >
> > Which would check ordering too.
> >
> > Obviously you'd hide the weird syntax using a macro.
> >
> > #define ORDEREDSTRSEQ(_v, ...) \
> >         orderedstrseq(_v, (const char *[]){ __VA_ARGS__ , NULL })
> >
> >
> > So you'd write the above as:
> >
> >         ORDEREDSTRSEQ(v, "skel,sk11", "faux,fx11")
> >
> >> >
> >> >     # The reg property is a reserved name. The type is always "int" and
> >> >     # should not be repeated in a device binding. Constraints are
> >> > defined
> >> >     # only in the context of the parent node's address, size, and ranges
> >> >     # cells. The description is inherited from the spi-slave binding.
> >> >     # Note that if inheriting from a base binding this declaration may
> >> >     # be omitted.
> >> >     reg:
> >> >       category: required        # required property
> >> >       type: intseq              # is a sequence of integers
> >> >
> >> >     # spi-max-frequency needs the device-specific constraint to be
> >> > supplied
> >> >     spi-max-frequency:
> >> >       # this constraint is dependent on the compatible property
> >> >       # property containing "skel,sk11"
> >> >       constraint: |
> >> >         v <= anystreq(get_strseq(np, "compatible"), "skel,sk11") ?
> >> > 10000000 : 1000000
> >> >
> >> >     # This property overrides the generic binding description with
> >> >     # a device specific description in order to mention the chip's
> >> >     # h/w cfg strapping pins.
> >> >     spi-cs-high:
> >> >       description: >
> >> >         Set if skeleton device configuration pins are set for chip
> >> >         select polarity high
> >> >
> >> >     # Device specific properties don't inherit characteristic from a
> >> > generic
> >> >     # binding so category, type, constraint, and description must be
> >> > specified
> >> >     # if needed.
> >> >     skel,deprecated1:
> >> >       # note that the category may be declare more than one option
> >> >       category: [ deprecated, optional ]
> >> >       type: int
> >> >       constraint: |
> >> >         v >= 100000 && v <= 200000
> >> >       description: >
> >> >         First of two deprecated properties.
> >> >
> >> >     # There are no constraints for properties of empty type
> >> >     skel,deprecated2:
> >> >       category: deprecated
> >> >       type: empty
> >> >       description: >
> >> >         Second of two deprecated properties.
> >> >
> >> >     # This example could be auto-generated rather than explicitly
> >> > included
> >> >     # in the yaml source.
> >> >     # Note that the YAML example must be validated against this binding
> >> >     # to be an accepted entry
> >> >     example:
> >> >
> >> >       dts: |
> >> >         sk11@0 {
> >> >             compatible = "skel,sk11";
> >> >             reg = <0>;
> >> >             spi-max-frequency = <1000000>;
> >> >             spi-cs-high;
> >> >         };
> >> >
> >> >       yaml: |
> >> >         sk11@0:
> >> >           compatible: "skel,sk11"
> >> >           reg: 0
> >> >           sip-max-frequency: 1000000
> >> >           spi-cs-high: true
> >> >         ---
> >> > ...
> >> >
> >> > And board-example.yaml
> >> >
> >> > https://raw.githubusercontent.com/pantoniou/yamldt/master/validate/bindings/board-example.yaml
> >> >
> >> > %YAML 1.1
> >> > ---
> >> > board-example: &board-example
> >> >   version: 1
> >> >
> >> >   title: A board example using compatible and model properties
> >> >
> >> >   maintainer:
> >> >     name: Skeleton Person <skel-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> >
> >> >   class: board
> >> >
> >> >   # this binding is selected when the compatible property constraint
> >> > matches
> >> >   selected: "compatible"
> >>
> >> We need some way to express this must be the root node. More
> >> generally, we need to express what bindings must be a child of (think
> >> sub-devices in MFDs). Perhaps that's just a "parent" key with the
> >> value being the id/name.
> >
> >> >
> >> >   description: >
> >> >     A board binding example. Matches on a top-level compatible string
> >> > and model.
> >> >
> >> >   properties:
> >> >
> >> >     compatible:
> >> >       category: required
> >> >       type: strseq
> >> >       description: |
> >> >         Compatible strings for the board example.
> >> >         The depth of the node must be zero, i.e. root.
> >> >
> >> >       constraint: |
> >> >         get_depth(np) == 0 && (
> >>
> >> Ahh, I guess this is how you are doing it. I don't think this works
> >> for any value other than 0. An MFD could be at any level.
> >>
> >
> > Well, I could've used a streq(get_name(get_parent(np)), "/") test but
> > this is faster. It's up to you what would work best.
> 
> Why not just a "parent" key?
> 

Because the property/type prolog code would increase even for properties
that don't need the parent key. While generating the parent key only for
constraints that need it keeps the filter size smaller.

Of course if parent ends up being used for most constraints the
balancing act changes.


> >> >         anystreq(v, "example,evm") ||
> >> >         anystreq(v, "example,evm2") ||
> >> >         anystreq(v, "example,base"))
> >> >
> >> >     model:
> >> >       category: required
> >> >       type: str
> >> >       description: models that this board family supports
> >> >       constraint: |
> >> >         streq(v, "Example EVM") ||
> >> >         streq(v, "Example EVM2")
> >> >
> >> >   example:
> >> >     dts: |
> >> >       / {
> >> >           compatible = "example,evm", "example,base";
> >> >           model = "Example EVM";
> >> >       };
> >> >     yaml: |
> >> >       compatible: [ "example,evm", "example,base" ] ;
> >> >       model: "Example EVM";
> >>
> >> I really don't want to see 2 examples. For now, it's going to be dts
> >> format. It could be converted by script later if needed.
> >>
> >> Overall, I think this format is a bit long for boards. We have
> >> something like ~1000 boards in arch/arm last I checked. I want adding
> >> a board binding to be very short and easy to review. It's often only a
> >> 1 line change. The main issue I have is it is just each SoC (or SoC
> >> family) does things their own way.
> >>
> >
> > Well, this is a full featured example; you could declare this a
> > 'virtual' (or what ever you want to call it binding) and use:
> >
> > board-example-foo:
> >
> >   inherits: *board-example
> >
> >   properties:
> >     compatible: ...
> >
> > It is not absolutely terse, but it's still YAML. But for what is worth,
> > those YAML files can be generated using the C preprocessor. You could
> > define a macro that cuts the churn, albeit you lose the ability to
> > parse them as normal YAML files.
> 
> C preprocessor doesn't sound like a great option to me.
> 
> Perhaps it is by SoC compatible and boards are just an addition to the
> constraints. That's kind of how things are organized already.
> 

The code base supports multiple constraints so we could have multiple
constraint properties. How would you like your SoC example to
work ideally?

> Rob

Regards

-- Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
