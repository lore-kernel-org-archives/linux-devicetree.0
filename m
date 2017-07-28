From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Fri, 28 Jul 2017 10:07:10 -0500
Message-ID: <CAL_JsqLRDy_uG1eeNsjbhs29L5DF-4z2Oa_npGrYVgoMiR=YpQ@mail.gmail.com>
References: <1501174151.1055.8.camel@hp800z> <CAL_Jsq+eFTUsMNQgSHGc5ahE4LE42q=6TR6c3qDvGYAUG=fd=Q@mail.gmail.com>
 <1501181931.1055.18.camel@hp800z> <597A4B80.7000106@gmail.com>
 <1501191985.1055.50.camel@hp800z> <CAL_Jsq+NBEXyOmRx3Ar0OTpyaLeT0hEKw45R0PrVEdmOcd9czw@mail.gmail.com>
 <20170728005140.GF26163@bill-the-cat> <CAL_Jsq+eJNG66D22bNButg6=jj9WQ7Nw4PpxLsPBmGxN9KBnaw@mail.gmail.com>
 <1501244631.1055.103.camel@hp800z>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501244631.1055.103.camel@hp800z>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 28, 2017 at 7:23 AM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> Hi Rob,
>
> On Thu, 2017-07-27 at 21:12 -0500, Rob Herring wrote:
>> On Thu, Jul 27, 2017 at 7:51 PM, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> > On Thu, Jul 27, 2017 at 06:00:00PM -0500, Rob Herring wrote:
>> >> On Thu, Jul 27, 2017 at 4:46 PM, Pantelis Antoniou
>> >> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> >> > Hi Frank,
>> >> >
>> >> > On Thu, 2017-07-27 at 13:22 -0700, Frank Rowand wrote:
>> >> >> Hi Pantelis,
>> >> >>
>> >> >> Keep in mind one of the reasons Linus says he is very direct is to
>> >> >> avoid leading a developer on, so that they don't waste a lot of time
>> >> >> trying to resolve the maintainer's issues instead of realizing that
>> >> >> the maintainer is saying "no". Please read my current answer as being
>> >> >> "no, not likely to ever be accepted", not "no, not in the current form".
>> >> >>
>> >> >> My first reaction is: no, this is not a good idea for the Linux kernel.
>> >> >>
>> >> >
>> >> > This has nothing to do with the kernel. It spits out valid DTBs that the
>> >> > kernel (or anything else) may use.
>> >>
>> >> Let me rephrase Frank's statement: this is not a good idea for the
>> >> main repository of dts files.
>> >>
>> >> But sure, DTS is already not the only source of DTBs. It comes from
>> >> firmware on Power systems.
>> >
>> > Yes, but unless they're generated from something other than a (at the
>> > time) normal DTS, that's not a good example, IMHO.
>>
>> They aren't. I'm talking about IBM systems. The firmware has its own
>> representation and flattens that to a DTB is how I understand it.
>>
>> >> If you want to create and maintain your own
>> >> source format, then that is perfectly fine. But based on the current
>> >> understanding, I'm not seeing a reason we'd convert DTS files to YAML.
>> >
>> > Can I propose one?  To borrow a phrase, Validation, Validation,
>> > Validation.  Let me point to fe496e23b748 in the kernel for a moment.  I
>> > found that as part of helping a new engineer come up to speed on doing
>> > device tree work.  What I found was a case where:
>> > - The binding doc gives one value for compatible as the required value.
>> > - The code accepts only a single, different value.
>> > - A few in-kernel dts files have different still values.
>> >
>> > If the common dts source file was in yaml, binding docs would be written
>> > so that we could use them as validation and hey, the above wouldn't ever
>> > have happened.  And I'm sure this is not the only example that's in-tree
>> > right now.  These kind of problems create an artificially high barrier
>> > to entry in a rather important area of the kernel (you can't trust the
>> > docs, you have to check around the code too, and of course the code
>> > might have moved since the docs were written).
>>
>> I'm all for validation, but the binding doc or schema and files that
>> describe platforms (aka DTS files) are not the same thing. The schema
>> is what are the constraints for a binding. Maybe some bindings are
>> fixed where there's only one valid binding implementation, but that's
>> the easy case (we could use DTS for that). I'll take YAML for binding
>> docs yesterday. Believe me, I'm tired of reviewing free form binding
>> docs. If that's where you want to go, reply to my reply that went
>> unanswered on Matt Porter's YAML proposal from 2 years ago (or maybe 3
>> now). I had the whole binding doc tree converted over to an initial
>> YAML schema. We just need to agree on the schema. Or we can keep
>> waiting for Grant to publish what he started on...
>>
>
> The way I see it there's a validation hierarchy.
>
> There are the bindings that describe the schema of the resulting source
> files. The bindings must be validated against a binding schema.
>
> For the source files, at first they must be valid against the core
> language (i.e. DTS or DT YAML variant) schema.
>
> Next for each node that a binding exists in a valid format, it must be
> validated against it. I.e. if an interrupt property exist it must point
> to valid interrupt node etc.
>
> Up next a number of per-platform/configuration validation passes.
> I.e. for a complete source file which is using a specific SoC family
> i.e. "ti,am33xx" the pass may verify that for the given peripherals
> their configuration is correct, i.e. that the interrupt numbers for a
> given peripheral are the correct ones for the target board etc.
> This may be possible by having a golden master configuration when those
> number can be retrieved and compared against.
>
> Finally you could have a per-application/vendor/end-user final rule
> check, i.e. the regulators may be configured in a manner that the power
> consumption is under some specified threshold, etc. This is something
> that is completely out of the kernel scope, but may have have to
> vendors.
>
> Why don't you share what you've been working on and see what we can do
> using it as a base?

I did. 2 years ago:

https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/log/?h=dt-yaml-v2

It's very rough, but I was at the point of wanting feedback on the
schema format. Only the crickets gave me any.

It doesn't validate anything, but is purely binding docs mass
converted to YAML using DTS files as input.

>> >> Maybe you're not proposing that now, but if that is not the end goal I
>> >> don't see the point of a new format. If YAML solves a bunch of
>> >> problems, then of course we'd want to convert DTS files at some point.
>> >
>> > To borrow that same phrase again, Tooling, Tooling, Tooling.  The
>> > current dts format is a niche format.  That's great, our community
>> > is basically responsible for all tooling, we can do what we want.
>> > That's also awful, we're the only people that care about tooling and we
>> > all have lots of other itches to scratch.  There are so so so many
>> > editors that just know YAML and will work it into the rest of the
>> > development environment someone is using.  None of that exists for our
>> > dts format.  Who cares about that?  Engineers that aren't primarily
>> > writing dts files.  I'm pretty sure every engineer that's written /
>> > extended a dts file has made an "invisible" mistake that would have been
>> > caught with a different source format that had validation already.
>>
>> The same can be said about DTB format as well.
>>
>> > And we've been talking about validation for ages now.  We'll probably
>> > still be talking about it for ages more (as it's hard
>> > thanked-at-conferences-and-such work!), until it reaches the point where
>> > anyone can pick up a current binding and re-format it into yaml for
>> > validation.
>>
>> I did state earlier that I think this tool has uses, but on it's own
>> and only to change from dts to yaml source files, I don't see it.
>> Let's start with validation and define the schema for that and tools
>> for that. If that involves dts to yaml in the flow, I don't really
>> care.
>>
>> Or if it is type checking that Pantelis keeps mentioning, then let's
>> discuss that. Those are different problems.
>>
>
> Let's discuss it then.
> I've laid out my plans to add type-checking in the compiler pass using
> YAML. What is the plan for DTC?

But you haven't. You've said YAML can do type checking, but no
concrete example. Say I have:

int-prop = <1234>;
string-prop = "some string";

How do I go from that whether in DTS or YAML to type information as
input to the compiler and/or in the dtb?

For dtc, there's only suggestion of how to tag phandles reusing the
the overlay infrastructure. That only solves phandles though. I think
a solution involving adding the information via new nodes and
properties is hacky. I think we're going to have to modify the dtb
format.

Rob
