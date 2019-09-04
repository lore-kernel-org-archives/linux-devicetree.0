From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: regulator: add regulator-fixed-clock binding
Date: Wed, 4 Sep 2019 10:06:14 +0100
Message-ID: <CAL_JsqLLSUWhkguCx2mc2oyV-0MHp4RWwJr5oTWRUvQiovn4Gw@mail.gmail.com>
References: <20190903080336.32288-1-philippe.schenker@toradex.com>
 <20190903080336.32288-4-philippe.schenker@toradex.com> <CAL_JsqLnqZ80soGVMvZjAMZvu+K=ebDUz2bM_ZodPp7YRvUnDw@mail.gmail.com>
 <e64429ba4b86411da1741ab54176fb5b4b7a36de.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e64429ba4b86411da1741ab54176fb5b4b7a36de.camel@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Luka Pivk <luka.pivk@toradex.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "broonie@kernel.org" <broonie@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Stefan Agner <stefan.agner@toradex.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 4, 2019 at 9:07 AM Philippe Schenker
<philippe.schenker@toradex.com> wrote:
>
> On Tue, 2019-09-03 at 09:45 +0100, Rob Herring wrote:
> > On Tue, Sep 3, 2019 at 9:03 AM Philippe Schenker
> > <philippe.schenker@toradex.com> wrote:
> > > This adds the documentation to the compatible regulator-fixed-clock
> >
> > Please explain what that is in this patch.
>
> Hi Rob and thanks for your comments. I will change this commit message
> for a possible v2 into this:
>
> This adds the documentation to the compatible regulator-fixed-clock.
> This binding is a special binding of regulator-fixed and adds the
> ability to add a clock to regulator-fixed, so the regulator can be
> enabled and disabled with that clock.
> If the special compatible regulator-fixed-clock is used it is mandatory
> to supply a clock.
>
> > >
> >
> > > Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
> > >
> > > ---
> > >
> > >  .../bindings/regulator/fixed-regulator.yaml    | 18
> > > +++++++++++++++++-
> > >  1 file changed, 17 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/regulator/fixed-
> > > regulator.yaml b/Documentation/devicetree/bindings/regulator/fixed-
> > > regulator.yaml
> > > index a650b457085d..5fd081e80b43 100644
> > > --- a/Documentation/devicetree/bindings/regulator/fixed-
> > > regulator.yaml
> > > +++ b/Documentation/devicetree/bindings/regulator/fixed-
> > > regulator.yaml
> > > @@ -19,9 +19,19 @@ description:
> > >  allOf:
> > >    - $ref: "regulator.yaml#"
> > >
> > > +select:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        const: regulator-fixed-clock
> > > +  required:
> > > +    - clocks
> >
> > You don't need this.
> >
> > If you add a new compatible, then this should probably be a new schema
> > doc. Is the 'gpio' property valid in this case as if a clock is the
> > enable, can you also have a gpio enable? That said, it seems like the
> > new compatible is only for validating the DT in the driver. You could
> > just use a clock if present and default to current behavior if not.
> > It's not the kernel's job to validate DTs.
>
> The gpio property is valid with this compatible. I added regulator-
> fixed-clock to regulator-fixed hence I also don't want to create a new
> schema file.

Okay, if all the other properties are valid then adding to this file is fine.

> With the above select statement I wanted to state clocks as required
> when the compatible regulator-fixed-clock is given.

select is not the right way to do that. select is for whether to apply
the schema to a node or not. What you have will silently not apply the
schema if 'clocks' is missing or compatible is 'regulator-fixed'.
Essentially what you need to do here is:

if:
  properties:
    compatible:
      contains:
        const: regulator-fixed-clock
then:
  required:
    - clocks

Rob
