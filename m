From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] yamldt v0.5, now a DTS compiler too
Date: Fri, 6 Oct 2017 08:55:10 -0500
Message-ID: <CAL_JsqKtQ1LyM09EcaXnPR8zfDJanuNQW2F474k2Z_hUjXOz5Q@mail.gmail.com>
References: <1506628736.28192.9.camel@hp800z> <CAL_Jsq+Hxjf8PecU+ZpCoFqbKAYJtzHpFco2Wsi_KT499fb-=g@mail.gmail.com>
 <1506973580.17981.5.camel@hp800z> <CAL_Jsq+vrAXQbfSGdANhqM3QJ2fHTQXDT1J6qGnTJkZ4egepNw@mail.gmail.com>
 <1507039989.17981.25.camel@hp800z> <CAL_JsqLLJE8bp3gwdExcsAtF+U4AHkROpbqHX8_79YhYjROovQ@mail.gmail.com>
 <1507052352.17981.48.camel@hp800z>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507052352.17981.48.camel@hp800z>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 3, 2017 at 12:39 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Hi Rob,
>
> On Tue, 2017-10-03 at 12:13 -0500, Rob Herring wrote:
>> On Tue, Oct 3, 2017 at 9:13 AM, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> > Hi Rob,
>> >
>> > On Tue, 2017-10-03 at 08:18 -0500, Rob Herring wrote:
>> >> On Mon, Oct 2, 2017 at 2:46 PM, Pantelis Antoniou
>> >> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> >> > Hi Rob,
>> >> >
>> >> > On Sun, 2017-10-01 at 17:00 -0500, Rob Herring wrote:
>> >> >> On Thu, Sep 28, 2017 at 2:58 PM, Pantelis Antoniou
>> >> >> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> >> >> > Hello again,
>> >> >> >
>> >> >> > Significant progress has been made on yamldt and is now capable of
>> >> >> > not only generating yaml from DTS source but also compiling DTS sources
>> >> >> > and being almost fully compatible with DTC.
>> >> >>
>> >> >> Can you quantify "almost"?
>> >> >>
>> >> >> > Compiling the kernel's DTBs using yamldt is as simple as using a
>> >> >> > DTC=yamldt.
>> >> >>
>> >> >> Good.
>> >> >>
>> >> >> >
>> >> >> > Error reporting is accurate and validation against a YAML based schema
>> >> >> > works as well. In a short while I will begin posting patches with
>> >> >> > fixes on bindings and DTS files in the kernel.
>> >> >>
>> >> >> What I would like to see is the schema format posted for review.
>> >> >>
>> >> >
>> >> > I'm including the skeleton.yaml binding which is the template for
>> >> > the bindings and a board-example.yaml binding for a top level binding.
>> >> >
>> >> >> I would also like to see the bindings for top-level compatible strings
>> >> >> (aka boards) as an example. That's something that's simple enough that
>> >> >> I'd think we could agree on a format and start moving towards defining
>> >> >> board bindings that way.
>> >> >>
>> >> >
>> >> > Note there is some line wrapping I'm including a link
>> >> > to the github repo of the files:
>> >> >
>> >> >
>> >> > The skeleton.yaml
>> >> >
>> >> > https://raw.githubusercontent.com/pantoniou/yamldt/master/validate/bindings/skeleton.yaml
>> >> >
>> >> > %YAML 1.1
>> >> > ---
>> >> > # The name of the binding is first
>> >> > # The anchor is put there for use by others
>> >> > skeleton: &skeleton
>> >>
>> >> This and "id" seem redundant.
>> >>
>> >
>> > Indeed.
>>
>> One other thing, "skeleton" is a bit weird as a key. It can't be
>> validated. All the other keys are standard words. I could write
>> "skeloton" by mistake and I guess I'd only find the mistake when
>> something inherits it. That's somewhat true with id, but we can at
>> least check "id" is present and that it's value is unique among all
>> other id values.
>>
>
> We can keep id and check that it matches the name of the enclosing node.
> That way you can be sure that there's no error.
>
> But it's a bit weird cause this is similar to declaring a function name
> with a typo. You won't find out until you use it.
>
>> >
>> >> >   version: 1
>> >> >
>> >> >   id: skel-device
>> >> >
>> >> >   title: >
>> >> >     Skeleton Device
>> >> >
>> >> >   maintainer:
>> >> >     name: Skeleton Person <skel-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> >> >
>> >> >   description: >
>> >> >     The Skeleton Device binding represents the SK11 device produced by
>> >> >     the Skeleton Corporation. The binding can also support compatible
>> >> >     clones made by second source vendors.
>> >> >
>> >> >   # The class is an optional property that declares this
>> >> >   # binding as part of a larger set
>> >> >   # Multiple definitions are possible
>> >> >   class: [ device, spi-device ]
>> >> >
>> >> >   # This binding inherits property characteristics from the generic
>> >> >   # spi-slave binding
>> >> >   # Note that the notation is standard yaml reference
>> >> >   inherits: *spi-slave
>> >> >
>> >> >   # virtual bindings do not generate checkers
>> >> >   virtual: true
>> >>
>> >> virtual is an overloaded term.
>> >>
>> >
>> > OK, what term should I use that this binding should not be instantiated
>> > as a checker, only be used by other bindings when inherited?
>>
>> checks: true?
>>
>> I'd really like to avoid having to decide and drop this, but I don't
>> really get why it is needed.
>>
>
> It is needed because otherwise checker filters will be generated for
> the template bindings that while they won't be executed they will be
> compiled and take up space in the schema.

Size is not a problem I have. That can come later if needed.

>> >> >   # each property is defined by each name
>> >> >   properties:
>> >> >
>> >> >     # The compatible property is a reserved name. The type is always
>> >> > "string"
>> >> >     # and should not be repeated device binding.
>> >> >     compatible:
>> >> >       category: required        # required property
>> >> >       type: strseq              # is a sequence of strings
>> >> >
>> >> >       description: >
>> >> >         FX11 is a clone of the original SK11 device
>> >> >
>> >> >       # v is always the name of the value of the property
>> >> >       # np is passed to the checker and is the current
>> >> >       # node pointer. We can access properties and call
>> >> >       # methods that operate on them.
>> >> >       # There can be multiple constraints, just put them
>> >> >       # into a sequence.
>> >> >       # Note that the BASE("skel,sk11") form from the previous
>> >> >       # binding will have to be reworked.
>> >> >       constraint: |
>> >> >         anystreq(v, "skel,sk11") ||
>> >> >         anystreq(v, "faux,fx11")
>> >>
>> >> Constraints and logic ops were certainly not decided in the last
>> >> attempt and I think will be the hardest part to define. I see you are
>> >> using eBPF in the checker. Is that where anystreq comes from?
>> >>
>> >
>> > Yes. The ebpf environment declares a number of methods that are executed
>> > outside the ebpf sandbox. Check out
>> >
>> > https://raw.githubusercontent.com/pantoniou/yamldt/master/validate/schema/codegen.yaml
>> > https://github.com/pantoniou/yamldt/blob/master/ebpf_dt.c
>>
>> I looked at this some a while back. It wasn't clear to me what eBPF
>> gives us and what you have defined on top of it. What I'm really after
>> is documentation of the syntax and keywords here.
>>
>
> eBPF is portable, can be serialized after compiling in the schema file
> and can be executed in the kernel.

Executing in the kernel is a non-goal for me.

> By stripping out all documentation related properties and nodes keeping
> only the compiled filters you can generate a dtb blob that passed to
> kernel can be used for verification of all runtime changes in the
> kernel's live tree. eBPF is enforcing an execution model that is 'safe'
> so we can be sure that no foul play is possible.

Humm, if you wanted to ensure dtb's are safe, I'd think that we just
sign them like you would for the kernel or modules.

> That means that you can a) run it at boot-time, verifying the dtb blob
> passed by the bootloader for errors (potentially disabling devices
> that their nodes fail) and b) run it when applying overlays to reject
> any that result in an invalid tree.

Let's get verification at build time working first, then we can worry
about something like this.

> One other use that I'm thinking that might be possible too, like
> binding version check between what the driver is compiled against and
> what the passed blob is without using an explicit version property.
>
> The constraint format ofcourse is plain C, you can generate a .so using
> the host compiler and execute that if you are looking for performance.
>
> Syntax and keywords of the internals is in a bit of flux right now,
> since the binding format is not finalized yet. I'd be happy to
> discuss the internal at ELCE.

I won't be there.

I'm just trying to understand what eBPF defines if anything and what's
up for discussion.

[...]

>> >> >       constraint: |
>> >> >         get_depth(np) == 0 && (
>> >>
>> >> Ahh, I guess this is how you are doing it. I don't think this works
>> >> for any value other than 0. An MFD could be at any level.
>> >>
>> >
>> > Well, I could've used a streq(get_name(get_parent(np)), "/") test but
>> > this is faster. It's up to you what would work best.
>>
>> Why not just a "parent" key?
>>
>
> Because the property/type prolog code would increase even for properties
> that don't need the parent key. While generating the parent key only for
> constraints that need it keeps the filter size smaller.

One could argue that category and type are also constraints, but you
don't express them as constraints. I think constraints should be
limited to constraints on the value of the property which are not
generically expressible (like type). I haven't fully thought through
whether there's other cases.

Another problem is this constraint is not really a constraint for
compatible as you have it, but for the whole binding.

[...]

>> >> Overall, I think this format is a bit long for boards. We have
>> >> something like ~1000 boards in arch/arm last I checked. I want adding
>> >> a board binding to be very short and easy to review. It's often only a
>> >> 1 line change. The main issue I have is it is just each SoC (or SoC
>> >> family) does things their own way.
>> >>
>> >
>> > Well, this is a full featured example; you could declare this a
>> > 'virtual' (or what ever you want to call it binding) and use:
>> >
>> > board-example-foo:
>> >
>> >   inherits: *board-example
>> >
>> >   properties:
>> >     compatible: ...
>> >
>> > It is not absolutely terse, but it's still YAML. But for what is worth,
>> > those YAML files can be generated using the C preprocessor. You could
>> > define a macro that cuts the churn, albeit you lose the ability to
>> > parse them as normal YAML files.
>>
>> C preprocessor doesn't sound like a great option to me.
>>
>> Perhaps it is by SoC compatible and boards are just an addition to the
>> constraints. That's kind of how things are organized already.
>>
>
> The code base supports multiple constraints so we could have multiple
> constraint properties. How would you like your SoC example to
> work ideally?

Not sure exactly other than meeting the requirements that I gave.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
