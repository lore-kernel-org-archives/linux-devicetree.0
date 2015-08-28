From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/5] DT binding documents using text markup
Date: Fri, 28 Aug 2015 09:26:17 -0500
Message-ID: <CAL_Jsq+qCJfLYxVfyQ4gAxPWLZ2=WNa0H21+cRcBi7dGVG0PMA@mail.gmail.com>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440739433-6799-1-git-send-email-mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 28, 2015 at 12:23 AM, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
> During the Device Tree microconference at Linux Plumbers 2015, we had
> a short discussion about how to improve DT Binding Documentation. A
> number of issues were raised (again, as these things have been
> discussed in the past) including:
>
>         * Inconsistency between binding documents due to prose text
>           format.
>         * Inability to reliably machine read bindings for mass update
>           or search.
>         * Bit rot of bindings as new conventions are agreed upon but
>           only new bindings are changed.

Thanks for pulling this together.

> Grant Likely probably summed up the issue best with "...as long as
> bindings are human readable, we'll have issues...". The context
> of that comment was, of course, regarding our current documents
> written in very inconsistent prose style. When the topic of needing
> the bindings in a rigid format was raised, there was general head
> nodding that this was needed. It was noted that this has been
> discussed many times before and nothing has been done.
>
> My proposed solution to the problem is to convert all DT bindings
> a rigid text markup format. In choosing a text markup language my
> requirements were:
>
>         1) Human readable
>         2) Well documented
>         3) Easy to translate to other data formats
>         4) Well supported by tools and libraries
>
> After looking at a number of markup options, YAML stood out as the
> one that meets all of these requirements. The YAML syntax is adopted
> in many projects specifically because of the high level of readability.
> A comprehensive spec is at http://www.yaml.org/spec/1.2/spec.html.
> There's a number of tools to convert between YAML and other popular
> data formats such as JSON and XML. XML was cited by Behan Webster
> during the microconference as an important data format as the type
> of developers that may produce comprehensive DTS Binding validation
> tools will want to use XML. Every major scripting language has a
> high level binding to the low level libyaml C library to facilitate
> handling of YAML data files.

Being markup language novice, this looks good to me.

> One caveat with YAML is it does not tolerate tabs. Yes, I said it.
> No tabs! This can be managed with proper editor modes and also with
> helper scripts to strip tabs to aid in people passing planned
> checkpatch.pl checks that would run YAML DT Binding specific tag
> validators for new bindings.

What do parsers do with tabs? Throw an error?

Beyond tabs, how do we check files can be parsed both generically and
for any binding specific requirements. We now need a schema for
checking the schema. We need some equivalent to compile testing.

An example such as checking that compatible strings are documented as
checkpatch.pl does would be nice. Roughly, that would be just list all
compatible values.

> The scope of the initial YAML DT Binding format was specifically
> limited to supporting *only* the content we have in bindings today.
> The idea here is to propose and agree on something that will take
> us just a few steps in the right direction. If we move *all* current
> binding content to a machine parseable format, additional features
> can be added with more automation and scripting. As it stands today,
> because of the inconsistency of the wording of the files, we can't
> add a lot of new features to the content until we convert what we
> have today into a standard format.
>
> With that said, it should be noted that some new features such as
> "type" tags to indicate cell types could be added to support
> additional DTS validation beyond what the current content supports.
> Another possibility is adding "range" type information to validate
> the legal values for a cell.
>
> This series is broken up into three major parts:
>
> 1) The documentation defining the YAML DT binding format
> 2) A skeleton device binding example illustrating use of this format
> 3) Some real binding conversions (eeprom.txt, phy-bindings.txt, and
>    ti-phy.txt
>
> As a proof of concept of what can be done with a proper machine
> readable DT binding source file, there's a simple markdown document
> generator at https://github.com/konsulko/dtgendoc. Also, to see
> actual output from the generator, the generated markdown from those
> bindings is viewable at https://github.com/konsulko/dtgendoc/wiki

Nice.

> There's a lot of other possibilities for validation tools using
> only the data we have today in the bindings. In addition, Frank
> Rowand covered some DT debug techniques that would benefit from
> the binding documentation being 100% reliably searchable.
>
> I found it useful to see a side-by-side view of a converted doc
> versus the original content, so here's a screenshot of eeprom.txt
> vs. eeprom.yaml:
> https://github.com/konsulko/dtgendoc/wiki#eepromtxt-vs-eepromyaml
>
> When we decide on a text markup format that is acceptable, then the
> next step is to convert all the bindings. That process would start
> with the complete set of generic bindings as they will be referenced
> by the actual device bindings.

You are going to do that for everyone, right? ;)

I've got some comments on the specific format as well.

Rob
