From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v2 02/20] dt-bindings: arm: Convert Marvell MMP
 board/soc bindings to json-schema
Date: Tue, 27 Aug 2019 15:23:58 +0200
Message-ID: <136a57cf3d293e3233f31d5ee660a6418726333a.camel@v3.sk>
References: <20190822092643.593488-1-lkundrak@v3.sk>
         <20190822092643.593488-3-lkundrak@v3.sk>
         <CAL_JsqJ4_h+M=6L-nzK2N+A9TAy-N8SoiFv1SSTk_kCcKt0eXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJ4_h+M=6L-nzK2N+A9TAy-N8SoiFv1SSTk_kCcKt0eXw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-08-27 at 06:59 -0500, Rob Herring wrote:
> On Thu, Aug 22, 2019 at 4:27 AM Lubomir Rintel <lkundrak@v3.sk> wrote:
> > Convert Marvell MMP SoC bindings to DT schema format using json-schema.
> > 
> > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> > 
> > ---
> > Changes since v1:
> > - Added this patch
> > 
> >  .../devicetree/bindings/arm/mrvl/mrvl.txt     | 14 ---------
> >  .../devicetree/bindings/arm/mrvl/mrvl.yaml    | 31 +++++++++++++++++++
> >  2 files changed, 31 insertions(+), 14 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
> >  create mode 100644 Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt b/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
> > deleted file mode 100644
> > index 951687528efb0..0000000000000
> > --- a/Documentation/devicetree/bindings/arm/mrvl/mrvl.txt
> > +++ /dev/null
> > @@ -1,14 +0,0 @@
> > -Marvell Platforms Device Tree Bindings
> > -----------------------------------------------------
> > -
> > -PXA168 Aspenite Board
> > -Required root node properties:
> > -       - compatible = "mrvl,pxa168-aspenite", "mrvl,pxa168";
> > -
> > -PXA910 DKB Board
> > -Required root node properties:
> > -       - compatible = "mrvl,pxa910-dkb";
> > -
> > -MMP2 Brownstone Board
> > -Required root node properties:
> > -       - compatible = "mrvl,mmp2-brownstone", "mrvl,mmp2";
> > diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
> > new file mode 100644
> > index 0000000000000..dc9de506ac6e3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
> > @@ -0,0 +1,31 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/mrvl/mrvl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Marvell Platforms Device Tree Bindings
> > +
> > +maintainers:
> > +  - Lubomir Rintel <lkundrak@v3.sk>
> > +
> > +properties:
> > +  $nodename:
> > +    const: '/'
> > +  compatible:
> > +    oneOf:
> > +      - description: PXA168 Aspenite Board
> > +        items:
> > +          - enum:
> > +              - mrvl,pxa168-aspenite
> > +          - const: mrvl,pxa168
> > +      - description: PXA910 DKB Board
> > +        items:
> > +          - enum:
> > +              - mrvl,pxa910-dkb
> 
> Doesn't match what's in dts file:
> 
> arch/arm/boot/dts/pxa910-dkb.dts:       compatible =
> "mrvl,pxa910-dkb", "mrvl,pxa910";

It corresponds to the .txt bindings specification this commit is
converting. I thought it wouldn't be a good idea to do any changes to
the contents at the time the conversion is done.

I also don't understand why does the dts file specify the board-
specific compatible string. Surely "mrvl,pxa910" alone would be
sufficient?

> > +      - description: MMP2 Brownstone Board
> 
> If this entry is only for this board...
> 
> > +        items:
> > +          - enum:
> > +              - mrvl,mmp2-brownstone
> 
> ...then this can be a 'const' instead. Same for the others.

Sure, but is it preferable? I've actually done a "git grep -A3 enum
Documentation/devicetree/bindings/" to see if the single-element is
typically used and it seems like it is. Perhaps it's a good idea to
indicate to a human reader that this is a list that's expected to
eventually be extended with new elements.

In any case, there are more boards with MMP2 currently supported,
notably the XO-1.75 laptop. I've actually sent out the dts file for
review some time ago. I haven't added a separate compatible string for
it because I thought it is not necessary (see above).

> > +          - const: mrvl,mmp2
> > +...
> > --
> > 2.21.0

Thank you
Lubo
