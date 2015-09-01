From: Tim Bird <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/5] DT binding documents using text markup
Date: Tue, 1 Sep 2015 10:14:06 -0700
Message-ID: <CA+bK7J4Ha55oFhCYDnUcBu8ZHCP3ReB6B=7Y9Fw7CknxPcaoWQ@mail.gmail.com>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
	<CAL_Jsq+qCJfLYxVfyQ4gAxPWLZ2=WNa0H21+cRcBi7dGVG0PMA@mail.gmail.com>
	<20150828171323.GA24203@beef>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150828171323.GA24203@beef>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 28, 2015 at 10:13 AM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:

> Now, I would caution about trying to do too much on Day 1 or we
> could end up back at the "never doing anything" stage.

I strongly agree with that (despite my having just sent a bunch of comments
on the binding format document).

> It would
> be an improvement to simply check that the basic tags exist as
> shown in the [R] or [O] fields in the documentation. One thing
> I should point out is that I carefully avoided marking some tags
> as [R] where existing bindings don't have them...even if logically,
> a description should be required on every binding. The idea here
> is to avoid updating content at the same time that we are updating
> the format.

I strongly agree with this as well.  I think that the goal for the first
pass should be "no lost text".  That is, if it doesn't convert into something
in the binding format, it should still be preserved somewhere, for evaluation
and formatting on a subsequent pass.

> Rather, I think it would be better to get the base
> format updated, then come back with a janitorial team and add
> descriptions (since now we can generate a worklist of those
> bindings missing a top-level description) and systematically
> fix those and review with the appropriate maintainers.

Agreed.  It will be very useful, once we get our first pass done, to
be able to find: 1) documents not converted yet, 2) property definitions
that are missing certain fields, 3) things that could still be formatted,
from text that is remaining in the description strings or other free-form text.
This should be easy to script.

>> An example such as checking that compatible strings are documented as
>> checkpatch.pl does would be nice. Roughly, that would be just list all
>> compatible values.
>
> Ok, so my comments above were strictly about a validator for the
> binding doc submission itself. I can add an example based on your
> checkpatch.pl to adapt it to the .yaml compatible tags.
>
>> > The scope of the initial YAML DT Binding format was specifically
>> > limited to supporting *only* the content we have in bindings today.
>> > The idea here is to propose and agree on something that will take
>> > us just a few steps in the right direction. If we move *all* current
>> > binding content to a machine parseable format, additional features
>> > can be added with more automation and scripting. As it stands today,
>> > because of the inconsistency of the wording of the files, we can't
>> > add a lot of new features to the content until we convert what we
>> > have today into a standard format.
>> >
>> > With that said, it should be noted that some new features such as
>> > "type" tags to indicate cell types could be added to support
>> > additional DTS validation beyond what the current content supports.
>> > Another possibility is adding "range" type information to validate
>> > the legal values for a cell.
>> >
>> > This series is broken up into three major parts:
>> >
>> > 1) The documentation defining the YAML DT binding format
>> > 2) A skeleton device binding example illustrating use of this format
>> > 3) Some real binding conversions (eeprom.txt, phy-bindings.txt, and
>> >    ti-phy.txt
>> >
>> > As a proof of concept of what can be done with a proper machine
>> > readable DT binding source file, there's a simple markdown document
>> > generator at https://github.com/konsulko/dtgendoc. Also, to see
>> > actual output from the generator, the generated markdown from those
>> > bindings is viewable at https://github.com/konsulko/dtgendoc/wiki
>>
>> Nice.
>>
>> > There's a lot of other possibilities for validation tools using
>> > only the data we have today in the bindings. In addition, Frank
>> > Rowand covered some DT debug techniques that would benefit from
>> > the binding documentation being 100% reliably searchable.
>> >
>> > I found it useful to see a side-by-side view of a converted doc
>> > versus the original content, so here's a screenshot of eeprom.txt
>> > vs. eeprom.yaml:
>> > https://github.com/konsulko/dtgendoc/wiki#eepromtxt-vs-eepromyaml
>> >
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
>
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
>
> But to answer your question, if we get a format I'll do
> conversions and hope I'm not alone.

I'm sure others will help out.  I will, and I'm pretty sure we can get
some conversion sprints set up at conferences (I know I can set aside
some time or resources at ELC in the spring - it might be too late for
ELCE in October to set up a scheduled block of time, but we can start
getting the word out.)  As I said in my other e-mail, one doesn't have
to be a kernel coder to do this, and the conversions should be pretty
straight-forward.
 -- Tim
