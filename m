From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: sound: Add Xilinx logicPD-I2S FPGA IP
 bindings
Date: Mon, 2 Sep 2019 15:24:13 +0100
Message-ID: <CAL_JsqJJ31wfXnLGSp5Hzkb2L7VeDoOki+eBqUkm2LWEtsA58A@mail.gmail.com>
References: <20190830210607.22644-1-miquel.raynal@bootlin.com>
 <20190830210607.22644-2-miquel.raynal@bootlin.com>
 <20190902044231.GA17348@bogus> <20190902155113.40b00fa0@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190902155113.40b00fa0@xps13>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alexandre@bootlin.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jaroslav Kysela <perex@perex.cz>, Michal Simek <michal.simek@xilinx.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 2, 2019 at 2:51 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Rob,
>
> Thanks for the review, one question below.
>
> Rob Herring <robh@kernel.org> wrote on Mon, 02 Sep 2019 14:39:09 +0100:
>
> > On Fri, Aug 30, 2019 at 11:06:06PM +0200, Miquel Raynal wrote:
> > > Document the logicPD I2S FPGA block bindings in yaml.
> > >
> > > Syntax verified with dt-doc-validate.
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  .../bindings/sound/xlnx,logicpd-i2s.yaml      | 57 +++++++++++++++++++
> > >  1 file changed, 57 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sound/xlnx,logicpd-i2s.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/xlnx,logicpd-i2s.yaml b/Documentation/devicetree/bindings/sound/xlnx,logicpd-i2s.yaml
> > > new file mode 100644
> > > index 000000000000..cbff641af199
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/xlnx,logicpd-i2s.yaml
> > > @@ -0,0 +1,57 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/sound/xlnx,logicpd-i2s.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Device-Tree bindings for Xilinx logicPD I2S FPGA block
> > > +
> > > +maintainers:
> > > +  - Miquel Raynal <miquel.raynal@bootlin.com>
> > > +
> > > +description: |
> > > +  The IP supports I2S playback/capture audio. It acts as a slave and
> > > +  clocks should come from the codec. It only supports two channels and
> > > +  S16_LE format.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: xlnx,logicpd-i2s
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +    description:
> > > +      Base address and size of the IP core instance.
> > > +
> > > +  interrupts:
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +    items:
> > > +      - description: tx interrupt
> > > +      - description: rx interrupt
> > > +    description:
> > > +      Either the Tx interruption or the Rx interruption or both.
> >
> > The schema says either tx or both. Doesn't really matter here as it's
> > just numbers.
>
> I see , I'll drop the 'items' entry.
>
> >
> > > +
> > > +  interrupt-names:
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +    items:
> > > +      - const: tx
> > > +      - const: rx
> >
> > But here it does matter.
> >
> > The easiest way to express this is:
> >
> > oneOf:
> >   - items:
> >       - enum: [ tx, rx ]
> >   - items:
> >       - const: tx
> >       - const: rx
> >
>
> Does this enforce an order? (I don't know if it matters, though, but in
> the bellow example I put the Rx interrupt first).

Yes. It does matter and should be defined what the order it.

Rob
