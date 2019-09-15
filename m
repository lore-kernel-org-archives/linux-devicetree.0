From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v6 1/5] dt-bindings: media: Add Allwinner A10 CSI binding
Date: Sun, 15 Sep 2019 16:54:16 +0800
Message-ID: <CAGb2v66Sin9HZ+QENegLQ3d7iiy278niwdr9rEZ0HwUfeQNFRQ@mail.gmail.com>
References: <cover.34bcd988943a26671681eaf849aacab51fab1cfe.1562847292.git-series.maxime.ripard@bootlin.com>
 <110dd9ff1784c29fa16304825a41d1603a33f166.1562847292.git-series.maxime.ripard@bootlin.com>
 <CAGb2v64nx2AuWZN+RxCneE0pqvXr_d7u6mQ+=nCHv2VJ1MNtrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGb2v64nx2AuWZN+RxCneE0pqvXr_d7u6mQ+=nCHv2VJ1MNtrQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 15, 2019 at 4:34 PM Chen-Yu Tsai <wens@csie.org> wrote:
>
> Hi,
>
> Sorry for chiming in so late.
>
> On Thu, Jul 11, 2019 at 8:15 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > The Allwinner A10 CMOS Sensor Interface is a camera capture interface also
> > used in later (A10s, A13, A20, R8 and GR8) SoCs.
> >
> > On some SoCs, like the A10, there's multiple instances of that controller,
> > with one instance supporting more channels and having an ISP.
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 94 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > new file mode 100644
> > index 000000000000..97c9fc3b5050
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
> > @@ -0,0 +1,94 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/allwinner,sun4i-a10-csi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner A10 CMOS Sensor Interface (CSI) Device Tree Bindings
> > +
> > +maintainers:
> > +  - Chen-Yu Tsai <wens@csie.org>
> > +  - Maxime Ripard <maxime.ripard@bootlin.com>
> > +
> > +description: |-
> > +  The Allwinner A10 and later has a CMOS Sensor Interface to retrieve
> > +  frames from a parallel or BT656 sensor.
> > +
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - allwinner,sun7i-a20-csi0
> > +          - const: allwinner,sun4i-a10-csi0
>
> CSI0 on the A10 has an ISP. Do we know if the one in the A20 does
> as well? It certainly doesn't say so in the user manual. If not,
> then we can't claim that A20 CSI0 is compatible with A10 CSI0.
>
> > +
> > +      - items:
> > +          - const: allwinner,sun4i-a10-csi0
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: The CSI interface clock
> > +      - description: The CSI module clock
> > +      - description: The CSI ISP clock
> > +      - description: The CSI DRAM clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bus
> > +      - const: mod
>
> I doubt this actually is a module clock. Based on the usage in your
> device tree patch, and the csi driver in the old linux-sunxi kernel,
> the clock rate is set to 24 MHz, or whatever the sensor requires for
> MCLK.

I'm working on adding support for this on the R40, and it seems with
this SoC the picture is much clearer. It has the same CSI interface
block, but the CCU has the clocks correctly named. We have:

  - CSI_MCLK0
  - CSI_MCLK1
  - CSI_SCLK

in addition to the bus clocks.

The CSI section also explains the clock signals:

    6.1.3.2. Clock Sources
    Two Clocks need to be configured for CSI controller. CSI0/1_MCLK
    provides the master clock for sensor and other devices. CSI_SCLK
    is the top clock for the whole CSI module.

So it would seem the ISP clock we currently have in the DT is simply
the module clock shared by all CSI-related hardware blocks, and the
module clock is bogus.

ChenYu

> ChenYu
>
> > +      - const: isp
> > +      - const: ram
> > +
> > +  resets:
> > +    description: The reset line driver this IP
> > +    maxItems: 1
> > +
> > +  pinctrl-0:
> > +    minItems: 1
> > +
> > +  pinctrl-names:
> > +    const: default
> > +
> > +  port:
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        properties:
> > +          bus-width:
> > +            const: 8
> > +            description: Number of data lines actively used.
> > +
> > +          data-active: true
> > +          hsync-active: true
> > +          pclk-sample: true
> > +          remote-endpoint: true
> > +          vsync-active: true
> > +
> > +        required:
> > +          - bus-width
> > +          - data-active
> > +          - hsync-active
> > +          - pclk-sample
> > +          - remote-endpoint
> > +          - vsync-active
> > +
> > +    required:
> > +      - endpoint
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +
> > +additionalProperties: false
> > +...
> > --
> > git-series 0.9.1
