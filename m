From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: irq: Convert Allwinner NMI Controller to
 a schema
Date: Tue, 13 Aug 2019 07:53:46 -0600
Message-ID: <CAL_JsqLAA6v1BCFHGrDR7WzOE9ri6MNq6WCkvJ5NTDnhDcAqyg@mail.gmail.com>
References: <20190723132658.5068-1-maxime.ripard@bootlin.com>
 <20190723132658.5068-2-maxime.ripard@bootlin.com>
 <CAL_JsqJkTrCuscnWgm5cDmQj5RPGnd3qXkzR40XWKB2skZFwXA@mail.gmail.com>
 <20190813054738.ge2jdu6qn2vaoasd@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190813054738.ge2jdu6qn2vaoasd@flea>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, maz@kernel.org, Chen-Yu Tsai <wens@csie.org>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 11:47 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> Hi Rob,
>
> On Tue, Jul 23, 2019 at 10:32:41AM -0600, Rob Herring wrote:
> > On Tue, Jul 23, 2019 at 7:27 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > >
> > > The Allwinner SoCs have an interrupt controller called NMI supported in
> > > Linux, with a matching Device Tree binding.
> > >
> > > Now that we have the DT validation in place, let's convert the device tree
> > > bindings for that controller over to a YAML schemas.
> > >
> > > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > > ---
> > >  .../allwinner,sun7i-a20-sc-nmi.yaml           | 83 +++++++++++++++++++
> > >  .../allwinner,sunxi-nmi.txt                   | 29 -------
> > >  2 files changed, 83 insertions(+), 29 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/allwinner,sunxi-nmi.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
> > > new file mode 100644
> > > index 000000000000..cb8077b0c8dd
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
> > > @@ -0,0 +1,83 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Allwinner A20 Non-Maskable Interrupt Controller Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Chen-Yu Tsai <wens@csie.org>
> > > +  - Maxime Ripard <maxime.ripard@bootlin.com>
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/interrupt-controller.yaml#
> > > +
> > > +select:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        enum:
> > > +          - allwinner,sun6i-a31-r-intc
> > > +          - allwinner,sun7i-a20-sc-nmi
> > > +          - allwinner,sun9i-a80-sc-nmi
> >
> > This should have all the possible compatibles in case all are not
> > listed.
>
> I'm sorry, but I'm not sure I understood what you meant here :/

You are missing these from the list:
allwinner,sun8i-a83t-r-intc
allwinner,sun50i-a64-r-intc
allwinner,sun50i-h6-r-intc

We need them all to catch any DTs with only the above strings.

>
> >
> > > +
> > > +          # Deprecated
> > > +          - allwinner,sun6i-a31-sc-nmi
> >
> > I know we already did things this way before, but perhaps this should
> > be listed below with the 'deprecated' property. The tools can include
> > it in select, but then remove it from compatible property.
>
> Can we have more than just one of the choice for an enum?
>
> In this particular case, since we have oneOf it's not really too much
> of an issue, but there's a significant amount of users of enum for the
> compatibles.

I think we have to use oneOf here. There's not that many cases of
deprecated compatibles.

Rob
