From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: mt7622: group clock DT nodes into
 separate DT file
Date: Tue, 30 May 2017 09:16:32 +0800
Message-ID: <1496106992.3570.15.camel@mtkswgap22>
References: <cover.1496061587.git.sean.wang@mediatek.com>
         <f5fa4a4dd78bf92500a517b0582c745569aa8ff2.1496061587.git.sean.wang@mediatek.com>
         <4a57ab2f-03b0-3c68-23cd-ed8253978ed7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4a57ab2f-03b0-3c68-23cd-ed8253978ed7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2017-05-29 at 17:09 +0200, Matthias Brugger wrote:
> 
> On 29/05/17 14:56, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > For more readability and maintenance, all the clock related DT
> > nodes for mt7622 SoC are grouped into a separate DT file. And
> > currently mt7622-clock.dtsi only includes the fixed clock for
> > uart0 and the oscillator which would be extended after MT7622
> > clock driver is introduced.
> > 
> 
> We've not done this for any other Mediatek SoC at the moment.
> Do you expect the m7622 to have more clock nodes then for example mt7623?


clocks on mt7622 has fewer nodes than mt7623

> Apart from that this clock nodes are just dummy clocks which should 
> disappear as soon as the clock driver got merged.
> Last point, you break bisectability if add a clock node in a patch 
> *after* the consumer was added.
> 
> So please add the clock nodes to the dtsi as we did up to now. If in the 
> future we see that mt7622 has a whole bunch of clock nodes, we can still 
> abstract them in an external dtsi file.
> 

Okay, I will merge back them into the main dtsi files for those reasons
in the next version. 


Appreciate all your reviewing and suggestions

	Sean

> Thanks,
> Matthias
> 
> > Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt7622-clock.dtsi | 20 ++++++++++++++++++++
> >   arch/arm64/boot/dts/mediatek/mt7622.dtsi       |  1 +
> >   2 files changed, 21 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt7622-clock.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7622-clock.dtsi b/arch/arm64/boot/dts/mediatek/mt7622-clock.dtsi
> > new file mode 100644
> > index 0000000..264421d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt7622-clock.dtsi
> > @@ -0,0 +1,20 @@
> > +/*
> > + * Copyright (c) 2017 MediaTek Inc.
> > + * Author: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > + *
> > + * SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > + */
> > +/ {
> > +	clk25m: oscillator@0 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <25000000>;
> > +		clock-output-names = "clkxtal";
> > +	};
> > +
> > +	uart_clk: dummy26m {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <25000000>;
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> > index 3a729d9..3768c28 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> > @@ -8,6 +8,7 @@
> >   
> >   #include <dt-bindings/interrupt-controller/irq.h>
> >   #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include "mt7622-clock.dtsi"
> >   
> >   / {
> >   	compatible = "mediatek,mt7622";
> > 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
