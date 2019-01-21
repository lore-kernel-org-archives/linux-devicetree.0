Return-Path: <SRS0=chu1=P5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41949 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbfAURme (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 21 Jan 2019 12:42:34 -0500
Date: Mon, 21 Jan 2019 18:42:31 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH v2 1/3] media: dt-bindings: media: document allegro-dvt
 bindings
Message-ID: <20190121184231.16b3170e@litschi.hi.pengutronix.de>
In-Reply-To: <26befa99cb1ddb0c36823cb573f2012d4bd98015.camel@ndufresne.ca>
References: <20190118133716.29288-1-m.tretter@pengutronix.de>
        <20190118133716.29288-2-m.tretter@pengutronix.de>
        <1548068375.3287.1.camel@pengutronix.de>
        <26befa99cb1ddb0c36823cb573f2012d4bd98015.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, mchehab@kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, tfiga@chromium.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 21 Jan 2019 11:17:43 -0500, Nicolas Dufresne wrote:
> Le lundi 21 janvier 2019 à 11:59 +0100, Philipp Zabel a écrit :
> > On Fri, 2019-01-18 at 14:37 +0100, Michael Tretter wrote:  
> > > Add device-tree bindings for the Allegro DVT video IP core found on the
> > > Xilinx ZynqMP EV family.
> > > 
> > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > ---
> > > Changes since v1:
> > > none
> > > 
> > > ---
> > >  .../devicetree/bindings/media/allegro.txt     | 35 +++++++++++++++++++
> > >  1 file changed, 35 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/allegro.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/allegro.txt b/Documentation/devicetree/bindings/media/allegro.txt
> > > new file mode 100644
> > > index 000000000000..765f4b0c1a57
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/allegro.txt
> > > @@ -0,0 +1,35 @@
> > > +Device-tree bindings for the Allegro DVT video IP codecs present in the Xilinx
> > > +ZynqMP SoC. The IP core may either be a H.264/H.265 encoder or H.264/H.265
> > > +decoder ip core.
> > > +
> > > +Each actual codec engines is controlled by a microcontroller (MCU). Host
> > > +software uses a provided mailbox interface to communicate with the MCU. The
> > > +MCU share an interrupt.
> > > +
> > > +Required properties:
> > > +  - compatible: value should be one of the following
> > > +    "allegro,al5e-1.1", "allegro,al5e": encoder IP core
> > > +    "allegro,al5d-1.1", "allegro,al5d": decoder IP core
> > > +  - reg: base and length of the memory mapped register region and base and
> > > +    length of the memory mapped sram
> > > +  - reg-names: must include "regs" and "sram"
> > > +  - interrupts: shared interrupt from the MCUs to the processing system
> > > +  - interrupt-names: "vcu_host_interrupt"
> > > +
> > > +Example:
> > > +	al5e: al5e@a0009000 {  
> > 
> > Should the node names be "vpu" or "video-codec"?  
> 
> Xilinx calls this IP the "vcu", so "vpu" would be even more confusing.

The term vcu, as used by Xilinx, includes the encoder, decoder, both
microblaze processors, and the "VCU Settings" module. The already
existing "xlnx,vcu" binding refers to this "VCU Settings" module (or
"VCU System-Level Control" or "LogicoreIP").

> Was this just a typo ? That being said, is this referring to the actual
> HW or the firmware that runs on a microblaze (the firmware being
> Allegro specific) ?

The binding refers to actual hardware, i.e., encoder + microblaze or
decoder + microblaze. My understanding is that the microblaze is a
generic microblaze, but is integrated with the Allegro specific
encoder/decoder IP into a single codec IP block.

Michael

> 
> >   
> > > +		compatible = "allegro,al5e";
> > > +		reg = <0 0xa0009000 0 0x1000>,
> > > +		      <0 0xa0000000 0 0x8000>;
> > > +		reg-names = "regs", "sram";
> > > +		interrupt-names = "vcu_host_interrupt";
> > > +		interrupts = <0 96 4>;
> > > +	};
> > > +	al5d: al5d@a0029000 {
> > > +		compatible = "allegro,al5d";
> > > +		reg = <0 0xa0029000 0 0x1000>,
> > > +		      <0 0xa0020000 0 0x8000>;
> > > +		reg-names = "regs", "sram";
> > > +		interrupt-names = "vcu_host_interrupt";
> > > +		interrupts = <0 96 4>;
> > > +	};  
> > 
> > regards
> > Philipp  
