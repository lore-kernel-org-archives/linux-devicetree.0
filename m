From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/5] DT binding documents using text markup
Date: Mon, 31 Aug 2015 09:05:00 -0500
Message-ID: <CAL_JsqJ7C4JtjGjFJjLQpLEdzbs2rw0K0TzVNB2VjOz4Sr9Nbw@mail.gmail.com>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
 <CAL_Jsq+qCJfLYxVfyQ4gAxPWLZ2=WNa0H21+cRcBi7dGVG0PMA@mail.gmail.com> <20150828171323.GA24203@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150828171323.GA24203@beef>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 28, 2015 at 12:13 PM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> On Fri, Aug 28, 2015 at 09:26:17AM -0500, Rob Herring wrote:
>> On Fri, Aug 28, 2015 at 12:23 AM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> > During the Device Tree microconference at Linux Plumbers 2015, we had
>> > a short discussion about how to improve DT Binding Documentation. A

[...]

>> > One caveat with YAML is it does not tolerate tabs. Yes, I said it.
>> > No tabs! This can be managed with proper editor modes and also with
>> > helper scripts to strip tabs to aid in people passing planned
>> > checkpatch.pl checks that would run YAML DT Binding specific tag
>> > validators for new bindings.
>>
>> What do parsers do with tabs? Throw an error?
>
> Yes, they throw an error. Keep in mind that most of what I used to start
> are general purpose conversion tools on top of a particular scripting
> languages's high level binding to libyaml. The error output leaves a
> bit to be desired for our use case. In any case, when I was developing
> the skeleton.yaml I used the yaml script from
> https://github.com/ryo/yamltools to catch all these syntax errors I
> was inserting..like tabs. the PyYaml binding being used in my PoC
> dtgendoc does the same thing but I don't gracefully handle those
> errors like we could.
>
>> Beyond tabs, how do we check files can be parsed both generically and
>> for any binding specific requirements. We now need a schema for
>> checking the schema. We need some equivalent to compile testing.
>
> Right. So, I think what you are touching on is something I should
> have expanded on in the TODO list. Basically, we need a scripted
> tool that we run from checkpatch.pl that 1) reads the .yaml and
> validates the YAML itself (that comes for free in the high level
> parsers) reporting errors in a sensical manner 2) validates our
> DT binding specific tags

We all know that no one runs checkpatch.pl. ;) I really want the basic
checking of the doc files to run from make (and run by 0-day). The
tool dependency could be an issue though. However, DocBook builds from
make and I don't think many people check that regularly. Then there is
using the binding docs to check dts files. That should probably be
part of the dtb building.

> Now, I would caution about trying to do too much on Day 1 or we
> could end up back at the "never doing anything" stage.

Certainly, but I would like to have a plan for what Day 2 and 3 look like.

> It would
> be an improvement to simply check that the basic tags exist as
> shown in the [R] or [O] fields in the documentation. One thing
> I should point out is that I carefully avoided marking some tags
> as [R] where existing bindings don't have them...even if logically,
> a description should be required on every binding. The idea here
> is to avoid updating content at the same time that we are updating
> the format. Rather, I think it would be better to get the base
> format updated, then come back with a janitorial team and add
> descriptions (since now we can generate a worklist of those
> bindings missing a top-level description) and systematically
> fix those and review with the appropriate maintainers.

Yes. Any checking would be a great improvement.

[...]

>> > When we decide on a text markup format that is acceptable, then the
>> > next step is to convert all the bindings. That process would start
>> > with the complete set of generic bindings as they will be referenced
>> > by the actual device bindings.
>>
>> You are going to do that for everyone, right? ;)
>
> Let's just say that I'm banking on others helping here once we have
> a format agreed upon. If we can hold the binding doc schema definition
> initially to just define tags for content that already exists in our
> textual binding docs, the effort for conversion is tolerable. To give
> an example, that phy-bindings.txt, it took 15 minutes to convert and
> and pass through the yaml parser and dtgendoc. The reason is that it's
> pure reformatting work. It doesn't take any special knowledge of the
> hardware and it doesn't involve reviewing dts files to extra
> additional information. Some of the annoyances can be streamlined
> like tab stripping and handling the two space indentation to make
> this process faster. One of my next things is to get a simple tool
> going that reports problems with conversions, essentially what I
> said was needed to integrate with checkpatch, so this process of
> conversion is even faster. Trivial peripheral bindings like eeprom.txt
> can be done in 5 minutes or so right now.

What if instead of using the docs as a starting point, we use dts
files as a starting point? They give us something parse-able that we
can do some automation with.

Additionaly, perhaps we can do a mass conversion of all the doc files
from txt to yaml where all the current text is converted to comments
and we fill in boilerplate and whatever we can convert with some
automation? The downside here would be it will be hard to tell which
conversions are complete.

Putting both together, we could then fairly easily for example extract
compatible strings from dts files, lookup which doc file they are in
and fill in the compatible string info.

> If we decide we must have tags like "type:" in the initial binding
> doc schema definition *and* we must add that content in each
> conversion, then this becomes more time consuming to validate that
> information against working dts files. IMHO, we'd be better off
> to get the base format straight, addressing missing pieces like
> all the compatible permutations, and convert them all with
> just that content. After that, we come back and add new content
> features like type: tagging. I'm trying to find a reasonable
> place to do this incrementally since the volume of bindings to
> convert is enormous.

I wouldn't say we have to add it, but we need to maintain type info.

Are you proposing we can actually validate dts files on day 1? That I
would expect to come later.

Rob
