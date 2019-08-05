From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: arm: amlogic: add bindings for G12B
 based S922X SoC
Date: Mon, 5 Aug 2019 16:21:05 -0600
Message-ID: <CAL_JsqL_L2qHe334sB57hR_coRhawKiqXYjKAQDJt_DHfBamBQ@mail.gmail.com>
References: <20190731124000.22072-1-narmstrong@baylibre.com>
 <20190731124000.22072-3-narmstrong@baylibre.com> <7hblx3gua3.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7hblx3gua3.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christian Hewitt <christianshewitt@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 5, 2019 at 3:46 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Neil Armstrong <narmstrong@baylibre.com> writes:
>
> > Add a specific compatible for the Amlogic G12B family based S922X SoC
> > to differentiate with the A311D SoC from the same family.
> >
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> > index 325c6fd3566d..3c3bc806cd23 100644
> > --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> > +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> > @@ -139,6 +139,7 @@ properties:
> >          items:
> >            - enum:
> >                - hardkernel,odroid-n2
> > +          - const: amlogic,s922x
> >            - const: amlogic,g12b
>
> nit: in previous binding docs, we were trying to keep these sorted
> alphabetically.  I'll reorder the new "s922x" after "g12b" when
> applying.

No, this is not documentation ordering. It's the order compatible
strings must be in.

Rob
