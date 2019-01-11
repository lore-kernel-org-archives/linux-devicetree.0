From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert fixed-clock binding to json-schema
Date: Fri, 11 Jan 2019 17:09:58 -0600
Message-ID: <CABGGiswYYpm-7T9e6F_Mp6FdU-JFDC8xV_JR1E6cgiz32A0u_Q@mail.gmail.com>
References: <20190110221903.3990-4-robh@kernel.org> <154722865051.169631.16957443589975628047@swboyd.mtv.corp.google.com>
 <CAL_JsqJzNBYCMWbZtR37eZd4yx2kc590V+q3603Hg=kG2bZwhw@mail.gmail.com>
 <154723284041.169631.6622751321828044091@swboyd.mtv.corp.google.com>
 <CAL_JsqJFyC3AXwbd8PoJS1wZ5BSokAPcFi=4FF2DQ6yFi0XwCw@mail.gmail.com> <154724656826.169631.7419387360923471292@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154724656826.169631.7419387360923471292@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 11, 2019 at 4:42 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Rob Herring (2019-01-11 12:49:04)
> > On Fri, Jan 11, 2019 at 12:54 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Rob Herring (2019-01-11 10:27:48)
> > > > On Fri, Jan 11, 2019 at 11:44 AM Stephen Boyd <sboyd@kernel.org> wrote:
> > > > >
> > > > > Any pointer to the full schema?
> > > >
> > > > https://github.com/robherring/yaml-bindings/blob/master/schemas/
> > > >
> > > > And the clock schema in particular:
> > > > https://github.com/robherring/yaml-bindings/blob/master/schemas/clock.yaml
> > >
> > > Awesome. Thanks for the pointers! Is the clock schema posted to the list
> > > somewhere?
> >
> > No. Happy to post things, but I'm struggling to find anyone that cares.
>
> Ok. I can review that document too if you post it to the list.
>
> >
> > > > > Why does title have a full stop?
> > > >
> > > > Because it was there in the original. My script to extract just takes
> > > > the first line of alphanumeric text.
> > >
> > > Ok. I think it would be good to treat them like commit subjects that
> > > don't have the full stop either, so if the script is able to drop the
> > > full stop it would be great.
> >
> > I can just write a meta-schema to enforce that. :)
>
> Sounds good.
>
> >
> > Yes, the meta-schema enforces this at least to the extent there is a
> > meta-schema defined for a standard property. Even if not something for
> > a specific property, we limit things to a subset of json-schema
> > keywords. Also, you also can't define something contradicting a core
> > schema (e.g. { reg: { type: string } }), but that wouldn't be found
> > until you check actual DTs.
> >
> > The meta-schema check is run with:
> > make dt_binding_check
> >
> > This is all documented in Documentation/devicetree/writing-schema.md.
> >
>
> Ok I'll read that document now. Would be cool if the build robots (and
> myself) can somehow run the dt_binding_check on a single YAML file so we
> can quickly validate the binding. Maybe even make C=2 or C=1 do that?
>
> If the robots can then complain if the single file fails to build it
> will save us tons of time. I just tried to run it but it seems to only
> care about running on all the YAML files.

make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/file/to/test

It will check only the schema specified and check all the DT files
against only that schema (plus any referenced schema if you use a
top-level 'allOf'. See the GIC schema patch[2] for an example of
that).

I'm running the schema check for patches in the DT patchwork instance.
For example, here's this patch[1]. So as long as it has my R-by, then
it should be good. I'm not yet running the schema check on DT files
because generally there are warnings and I don't intend to fix them
for everyone. But maybe I should anyways so we at least have the data.

Rob

[1] https://patchwork.ozlabs.org/patch/1023240/
[2] https://patchwork.ozlabs.org/patch/1023243/
