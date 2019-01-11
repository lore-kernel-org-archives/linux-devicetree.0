From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert fixed-clock binding to json-schema
Date: Fri, 11 Jan 2019 14:49:04 -0600
Message-ID: <CAL_JsqJFyC3AXwbd8PoJS1wZ5BSokAPcFi=4FF2DQ6yFi0XwCw@mail.gmail.com>
References: <20190110221903.3990-4-robh@kernel.org> <154722865051.169631.16957443589975628047@swboyd.mtv.corp.google.com>
 <CAL_JsqJzNBYCMWbZtR37eZd4yx2kc590V+q3603Hg=kG2bZwhw@mail.gmail.com> <154723284041.169631.6622751321828044091@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154723284041.169631.6622751321828044091@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 11, 2019 at 12:54 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Rob Herring (2019-01-11 10:27:48)
> > On Fri, Jan 11, 2019 at 11:44 AM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Rob Herring (2019-01-10 14:19:01)
> > > > Convert the fixed-clock binding to DT schema format using json-schema.
> > > >
> > >
> > > Any pointer to the full schema?
> >
> > https://github.com/robherring/yaml-bindings/blob/master/schemas/
> >
> > And the clock schema in particular:
> > https://github.com/robherring/yaml-bindings/blob/master/schemas/clock.yaml
>
> Awesome. Thanks for the pointers! Is the clock schema posted to the list
> somewhere?

No. Happy to post things, but I'm struggling to find anyone that cares.

> > > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > > Cc: linux-clk@vger.kernel.org
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > [...]
> > > > diff --git a/Documentation/devicetree/bindings/clock/fixed-clock.yaml b/Documentation/devicetree/bindings/clock/fixed-clock.yaml
> > > > new file mode 100644
> > > > index 000000000000..8b5628463b90
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/clock/fixed-clock.yaml
> > > > @@ -0,0 +1,44 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Binding for simple fixed-rate clock sources.
> > >
> > > Why does title have a full stop?
> >
> > Because it was there in the original. My script to extract just takes
> > the first line of alphanumeric text.
>
> Ok. I think it would be good to treat them like commit subjects that
> don't have the full stop either, so if the script is able to drop the
> full stop it would be great.

I can just write a meta-schema to enforce that. :)

> > > > +
> > > > +maintainers:
> > > > +  - Michael Turquette <mturquette@baylibre.com>
> > > > +  - Stephen Boyd <sboyd@kernel.org>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: fixed-clock
> > > > +
> > > > +  "#clock-cells":
> > > > +    const: 0
> > > > +
> > > > +  clock-frequency: true
> > >
> > > Why doesn't this need the $ref: /schemas/types.yaml#/... thing?
> >
> > You might want to read bindings/example-schema.yaml which tries to
> > explain some of this.
> >
> > Standard properties are already defined in the core schemas. So we
> > only have to say "we use this property" and any binding specific
> > constraints. In this case, there aren't any other constraints. It is
> > also needed to be listed here to mark it required and to satisfy
> > 'additionalProperties: false'.
>
> Hmm ok. I suppose I'll have to hold that information in my mind when
> reviewing bindings. Is there any tooling or some script that I can run
> on json-schema bindings to verify they're correct? Or to find something
> redundant like this where a standard property is redefined? Grep would
> work for the redundant problem I suppose.

Yes, the meta-schema enforces this at least to the extent there is a
meta-schema defined for a standard property. Even if not something for
a specific property, we limit things to a subset of json-schema
keywords. Also, you also can't define something contradicting a core
schema (e.g. { reg: { type: string } }), but that wouldn't be found
until you check actual DTs.

The meta-schema check is run with:
make dt_binding_check

This is all documented in Documentation/devicetree/writing-schema.md.

Rob
