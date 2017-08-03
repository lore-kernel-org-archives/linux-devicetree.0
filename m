From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] Introducing yamldt, a yaml to dtb compiler
Date: Thu, 3 Aug 2017 17:53:32 -0500
Message-ID: <CAL_JsqL4tJja=iuXk0dCaoMFjJ52EAup4JCyVCUWnUi7EXLxGg@mail.gmail.com>
References: <1501181931.1055.18.camel@hp800z> <597A4B80.7000106@gmail.com>
 <1501191985.1055.50.camel@hp800z> <CAL_Jsq+NBEXyOmRx3Ar0OTpyaLeT0hEKw45R0PrVEdmOcd9czw@mail.gmail.com>
 <20170728005140.GF26163@bill-the-cat> <CAL_Jsq+eJNG66D22bNButg6=jj9WQ7Nw4PpxLsPBmGxN9KBnaw@mail.gmail.com>
 <1501244631.1055.103.camel@hp800z> <CAL_JsqLRDy_uG1eeNsjbhs29L5DF-4z2Oa_npGrYVgoMiR=YpQ@mail.gmail.com>
 <20170731131118.GJ2652@umbus.fritz.box> <CAL_Jsq+HjOpaLcVJzS-mskzHLTS+J=WHdqCVmpc_qJ7da2faHw@mail.gmail.com>
 <20170802143025.GD394@umbus.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170802143025.GD394-K0bRW+63XPQe6aEkudXLsA@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 2, 2017 at 9:30 AM, David Gibson
<david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
> On Mon, Jul 31, 2017 at 12:15:14PM -0500, Rob Herring wrote:
>> On Mon, Jul 31, 2017 at 8:11 AM, David Gibson
>> <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> wrote:
>> > On Fri, Jul 28, 2017 at 10:07:10AM -0500, Rob Herring wrote:
>> >> On Fri, Jul 28, 2017 at 7:23 AM, Pantelis Antoniou
>> >> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> >> > Hi Rob,
>> >> >
>> >> > On Thu, 2017-07-27 at 21:12 -0500, Rob Herring wrote:
>> >> >> On Thu, Jul 27, 2017 at 7:51 PM, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> >> >> > On Thu, Jul 27, 2017 at 06:00:00PM -0500, Rob Herring wrote:
>> >> >> >> On Thu, Jul 27, 2017 at 4:46 PM, Pantelis Antoniou
>> >> >> >> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> >> >> >> > Hi Frank,
>> >> >> >> >
>> >> >> >> > On Thu, 2017-07-27 at 13:22 -0700, Frank Rowand wrote:
>> >> >> >> >> Hi Pantelis,
>> >> >> >> >>
>> >> >> >> >> Keep in mind one of the reasons Linus says he is very direct is to
>> >> >> >> >> avoid leading a developer on, so that they don't waste a lot of time
>> >> >> >> >> trying to resolve the maintainer's issues instead of realizing that
>> >> >> >> >> the maintainer is saying "no". Please read my current answer as being
>> >> >> >> >> "no, not likely to ever be accepted", not "no, not in the current form".
>> >> >> >> >>
>> >> >> >> >> My first reaction is: no, this is not a good idea for the Linux kernel.
>> >> >> >> >>
>> >> >> >> >
>> >> >> >> > This has nothing to do with the kernel. It spits out valid DTBs that the
>> >> >> >> > kernel (or anything else) may use.
>> >> >> >>
>> >> >> >> Let me rephrase Frank's statement: this is not a good idea for the
>> >> >> >> main repository of dts files.
>> >> >> >>
>> >> >> >> But sure, DTS is already not the only source of DTBs. It comes from
>> >> >> >> firmware on Power systems.
>> >> >> >
>> >> >> > Yes, but unless they're generated from something other than a (at the
>> >> >> > time) normal DTS, that's not a good example, IMHO.
>> >> >>
>> >> >> They aren't. I'm talking about IBM systems. The firmware has its own
>> >> >> representation and flattens that to a DTB is how I understand it.
>> >> >>
>> >> >> >> If you want to create and maintain your own
>> >> >> >> source format, then that is perfectly fine. But based on the current
>> >> >> >> understanding, I'm not seeing a reason we'd convert DTS files to YAML.
>> >> >> >
>> >> >> > Can I propose one?  To borrow a phrase, Validation, Validation,
>> >> >> > Validation.  Let me point to fe496e23b748 in the kernel for a moment.  I
>> >> >> > found that as part of helping a new engineer come up to speed on doing
>> >> >> > device tree work.  What I found was a case where:
>> >> >> > - The binding doc gives one value for compatible as the required value.
>> >> >> > - The code accepts only a single, different value.
>> >> >> > - A few in-kernel dts files have different still values.
>> >> >> >
>> >> >> > If the common dts source file was in yaml, binding docs would be written
>> >> >> > so that we could use them as validation and hey, the above wouldn't ever
>> >> >> > have happened.  And I'm sure this is not the only example that's in-tree
>> >> >> > right now.  These kind of problems create an artificially high barrier
>> >> >> > to entry in a rather important area of the kernel (you can't trust the
>> >> >> > docs, you have to check around the code too, and of course the code
>> >> >> > might have moved since the docs were written).
>> >> >>
>> >> >> I'm all for validation, but the binding doc or schema and files that
>> >> >> describe platforms (aka DTS files) are not the same thing. The schema
>> >> >> is what are the constraints for a binding. Maybe some bindings are
>> >> >> fixed where there's only one valid binding implementation, but that's
>> >> >> the easy case (we could use DTS for that). I'll take YAML for binding
>> >> >> docs yesterday. Believe me, I'm tired of reviewing free form binding
>> >> >> docs. If that's where you want to go, reply to my reply that went
>> >> >> unanswered on Matt Porter's YAML proposal from 2 years ago (or maybe 3
>> >> >> now). I had the whole binding doc tree converted over to an initial
>> >> >> YAML schema. We just need to agree on the schema. Or we can keep
>> >> >> waiting for Grant to publish what he started on...
>> >> >>
>> >> >
>> >> > The way I see it there's a validation hierarchy.
>> >> >
>> >> > There are the bindings that describe the schema of the resulting source
>> >> > files. The bindings must be validated against a binding schema.
>> >> >
>> >> > For the source files, at first they must be valid against the core
>> >> > language (i.e. DTS or DT YAML variant) schema.
>> >> >
>> >> > Next for each node that a binding exists in a valid format, it must be
>> >> > validated against it. I.e. if an interrupt property exist it must point
>> >> > to valid interrupt node etc.
>> >> >
>> >> > Up next a number of per-platform/configuration validation passes.
>> >> > I.e. for a complete source file which is using a specific SoC family
>> >> > i.e. "ti,am33xx" the pass may verify that for the given peripherals
>> >> > their configuration is correct, i.e. that the interrupt numbers for a
>> >> > given peripheral are the correct ones for the target board etc.
>> >> > This may be possible by having a golden master configuration when those
>> >> > number can be retrieved and compared against.
>> >> >
>> >> > Finally you could have a per-application/vendor/end-user final rule
>> >> > check, i.e. the regulators may be configured in a manner that the power
>> >> > consumption is under some specified threshold, etc. This is something
>> >> > that is completely out of the kernel scope, but may have have to
>> >> > vendors.
>> >> >
>> >> > Why don't you share what you've been working on and see what we can do
>> >> > using it as a base?
>> >>
>> >> I did. 2 years ago:
>> >>
>> >> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/log/?h=dt-yaml-v2
>> >>
>> >> It's very rough, but I was at the point of wanting feedback on the
>> >> schema format. Only the crickets gave me any.
>> >>
>> >> It doesn't validate anything, but is purely binding docs mass
>> >> converted to YAML using DTS files as input.
>> >
>> > Efforts on schemas have started and petered out several times :(.
>> >
>> > I think the fundamental problem is that there just isn't critical mass
>> > of people with the time to work on it.  Lots of people want better
>> > validation, but not enough to put significant time and effort into
>> > it.  I hope someone proves me wrong about that.
>>
>> I would say part of the problem is the validation plans are always
>> just too grand. We need to start small.
>
> Right, exactly.
>
>> Just having a machine
>> parseable documentation format alone would be a win. The validation
>> can come later IMO. It's going to come later anyway if we do nothing.
>
> Well, maybe.  I fear that a "machine readable" format that doesn't
> have some sort of automatic validation attached to it will end up
> being not as machine readable as originally hoped.

Yes, we need at least something to check the doc itself is readable.
I'm not suggesting that we just write docs in YAML/JSON and then write
tools later.

But to give a simple example, the kernel's checkpatch.pl check for
compatibles in dts and C being documented is just a grep for the
compatible string appearing in Documentation/devicetree/bindings/.
That's pretty hacky, but it mostly works if people run checkpatch.pl.
A more precise check would be easy to do if we had a list the actual
documented compatible strings and could get integrated into the build
flow so everyone checks it. Certainly we need something more general
than my simple example. However, if I can't see how we solve my simple
example, then I'm going to put that in the "hopelessly ambitious"
pile.

>> > Can I suggest (again) that one approach might be to add more pieces to
>> > dtc's "checks" system to at least look for the more common errors.
>> > It's not nearly a complete solution, but it gets you something with
>> > much less difficulty than defining a whole schema system.  Some
>> > rudimentary checking of unit addresses has been added relatively
>> > recently, but not a lot else in the way of semantic checks.
>>
>> Yes, I obviously agree. And at least for me, it's in a language I
>> already know. I've thought of a few more checks to add in the course
>> of this thread. Perhaps we should start a todo list if you have any
>> specific ideas. I've focused on things I repeatedly catch in binding
>> reviews (if only I could have a check for needing more specific
>> compatible strings :) ). Where we hit limits with the checks is when
>> we need specific compatible(s) to key checks on. This is any binding
>> that lacks a "class" property like gpio-controller or
>> interrupt-controller. For example I2C or SPI controllers and buses.
>> Certainly every common binding with a #*-cells property could have
>> some level of checks.
>
> Go for it.  Checks are fairly easy to right, and easy to review, so
> send 'em through and we should be able to merge them pretty quickly.

Really, I was hoping to start a list and hopefully others would be
inspired to write some. Wishful thinking on my part probably.

Rob
