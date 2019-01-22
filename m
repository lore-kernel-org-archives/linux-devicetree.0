Return-Path: <SRS0=dsw9=P6=pengutronix.de=m.tretter@kernel.org>
Date: Tue, 22 Jan 2019 14:38:06 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH v2 1/3] media: dt-bindings: media: document allegro-dvt
 bindings
Message-ID: <20190122143806.1c93e613@litschi.hi.pengutronix.de>
In-Reply-To: <20190121171348.GA4532@bogus>
References: <20190118133716.29288-1-m.tretter@pengutronix.de>
	<20190118133716.29288-2-m.tretter@pengutronix.de>
	<20190121171348.GA4532@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, mchehab@kernel.org, tfiga@chromium.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 21 Jan 2019 11:13:48 -0600, Rob Herring wrote:
> On Fri, Jan 18, 2019 at 02:37:14PM +0100, Michael Tretter wrote:
> > Add device-tree bindings for the Allegro DVT video IP core found on the
> > Xilinx ZynqMP EV family.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> > Changes since v1:
> > none
> > 
> > ---
> >  .../devicetree/bindings/media/allegro.txt     | 35 +++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/allegro.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/allegro.txt b/Documentation/devicetree/bindings/media/allegro.txt
> > new file mode 100644
> > index 000000000000..765f4b0c1a57
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/allegro.txt
> > @@ -0,0 +1,35 @@
> > +Device-tree bindings for the Allegro DVT video IP codecs present in the Xilinx
> > +ZynqMP SoC. The IP core may either be a H.264/H.265 encoder or H.264/H.265
> > +decoder ip core.
> > +
> > +Each actual codec engines is controlled by a microcontroller (MCU). Host
> > +software uses a provided mailbox interface to communicate with the MCU. The
> > +MCU share an interrupt.
> > +
> > +Required properties:
> > +  - compatible: value should be one of the following
> > +    "allegro,al5e-1.1", "allegro,al5e": encoder IP core
> > +    "allegro,al5d-1.1", "allegro,al5d": decoder IP core
> > +  - reg: base and length of the memory mapped register region and base and
> > +    length of the memory mapped sram
> > +  - reg-names: must include "regs" and "sram"
> > +  - interrupts: shared interrupt from the MCUs to the processing system
> > +  - interrupt-names: "vcu_host_interrupt"  
> 
> No point in having *-names when there is only one entry.
> 
> > +
> > +Example:
> > +	al5e: al5e@a0009000 {  
> 
> video-codec as suggested.
> 
> > +		compatible = "allegro,al5e";  
> 
> Doesn't match the documentation above.

Where is the mismatch? "allegro,al5e" is one of the allowed compatible
strings that are specified above.

Michael

> 
> > +		reg = <0 0xa0009000 0 0x1000>,
> > +		      <0 0xa0000000 0 0x8000>;
> > +		reg-names = "regs", "sram";
> > +		interrupt-names = "vcu_host_interrupt";
> > +		interrupts = <0 96 4>;
> > +	};
> > +	al5d: al5d@a0029000 {
> > +		compatible = "allegro,al5d";
> > +		reg = <0 0xa0029000 0 0x1000>,
> > +		      <0 0xa0020000 0 0x8000>;
> > +		reg-names = "regs", "sram";
> > +		interrupt-names = "vcu_host_interrupt";
> > +		interrupts = <0 96 4>;
> > +	};
> > -- 
> > 2.20.1
> >   
> 
