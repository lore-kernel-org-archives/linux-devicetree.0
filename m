From: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/5] ARM: NSP: add minimal Northstar Plus device tree
Date: Wed, 26 Aug 2015 14:40:10 -0400
Message-ID: <20150826184009.GA4171@broadcom.com>
References: <1440092804-25726-1-git-send-email-jonmason@broadcom.com>
 <CAOesGMhE40_mfZCD2PqcTObE_Gz_6rKFwhf3-6kZY4n9Yxn2rQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOesGMhE40_mfZCD2PqcTObE_Gz_6rKFwhf3-6kZY4n9Yxn2rQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 25, 2015 at 04:36:45PM -0700, Olof Johansson wrote:
> Hi,
> 
> I'm not sure what the strategy behind your cc:ing on this patch set
> is. I only got a couple of them in my inbox, and this one wasn't one
> of them. :)

I sent them to the people listed as maintainers in get_maintainer.pl.
It didn't seem to include you in all of them, but I thought the
mailing list would be enough of a catch all.  My apologies.  I'll CC
everyone listed as a maintainer on all of the patches in the future.

> 
> On Thu, Aug 20, 2015 at 10:46 AM, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> > Add a very minimalistic set of Northstar Plus Device Tree files which
> > describes the SoC and the BCM958625 implementation.  The perpherials
> > described are:
> >
> > ARM Cortex A9 CPU
> > 2 8250 UARTs
> > ARM GIC
> > PL310 L2 Cache
> > ARM A9 Global timer
> >
> > Signed-off-by: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> > Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> > Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> 
> Seeing reviewed-by already attached to a v1 of a patchset has limited
> value for someone on the outside.
> 
> Reviewed-by is one of those tags that has a value that's mostly
> dependent on who it comes from. By not actually seeing the review and
> the feedback provided (and revisions made), less data is provided to
> tell if it's a valuable review or not.
> 
> Also, if you're posting the code you should probably have your name
> below Kapil's, since you're the one signing off the origin of the
> code. See Documentation/SubmittingPatches.txt for details on what
> S-o-b actually means.

We worked on it together, but I'll be happy to reorder as you suggest.

> 
> 
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/bcm-nsp.dtsi
> > @@ -0,0 +1,105 @@
> > +/*
> > + *  BSD LICENSE
> > + *
> > + *  Copyright(c) 2015 Broadcom Corporation.  All rights reserved.
> > + *
> > + *  Redistribution and use in source and binary forms, with or without
> > + *  modification, are permitted provided that the following conditions
> > + *  are met:
> > + *
> > + *    * Redistributions of source code must retain the above copyright
> > + *      notice, this list of conditions and the following disclaimer.
> > + *    * Redistributions in binary form must reproduce the above copyright
> > + *      notice, this list of conditions and the following disclaimer in
> > + *      the documentation and/or other materials provided with the
> > + *      distribution.
> > + *    * Neither the name of Broadcom Corporation nor the names of its
> > + *      contributors may be used to endorse or promote products derived
> > + *      from this software without specific prior written permission.
> > + *
> > + *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> > + *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> > + *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> > + *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
> > + *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> > + *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> > + *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> > + *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
> > + *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> > + *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> > + *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> > + */
> 
> I'm not sure we've seen BSD-only submissions before. I'll let DT
> maintainers (or Ian) speak up in case this would cause problems.

I was following the precedent in arch/arm/boot/dts/bcm-cygnus.dtsi.
If this is preferred to be GPL v2, then I will happily comply.

> 
> 
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +#include "skeleton.dtsi"
> > +
> > +/ {
> > +       compatible = "brcm,nsp";
> > +       model = "Broadcom Northstar Plus SoC";
> > +       interrupt-parent = <&gic>;
> > +
> > +       cpus {
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               cpu@0 {
> > +                       device_type = "cpu";
> > +                       compatible = "arm,cortex-a9";
> > +                       next-level-cache = <&L2>;
> > +                       reg = <0x0>;
> > +               };
> > +       };
> > +
> > +       clocks {
> > +               #address-cells = <1>;
> > +               #size-cells = <1>;
> > +               ranges;
> > +
> > +               periph_clk: periph_clk {
> > +                       compatible = "fixed-clock";
> > +                       #clock-cells = <0>;
> > +                       clock-frequency = <500000000>;
> > +               };
> > +       };
> > +
> > +       uart0: serial@18000300 {
> > +               compatible = "ns16550a";
> > +               reg = <0x18000300 0x100>;
> > +               interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> > +               clock-frequency = <62499840>;
> > +               status = "disabled";
> > +       };
> > +
> > +       uart1: serial@18000400 {
> > +               compatible = "ns16550a";
> > +               reg = <0x18000400 0x100>;
> > +               interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
> > +               clock-frequency = <62499840>;
> > +               status = "disabled";
> > +       };
> > +
> > +       gic: interrupt-controller@19021000 {
> > +               compatible = "arm,cortex-a9-gic";
> > +               #interrupt-cells = <3>;
> > +               #address-cells = <0>;
> > +               interrupt-controller;
> > +               reg = <0x19021000 0x1000>,
> > +                     <0x19020100 0x100>;
> > +       };
> > +
> > +       L2: l2-cache {
> > +               compatible = "arm,pl310-cache";
> > +               reg = <0x19022000 0x1000>;
> > +               cache-unified;
> > +               cache-level = <2>;
> > +       };
> > +
> > +       timer@19020200 {
> > +               compatible = "arm,cortex-a9-global-timer";
> > +               reg = <0x19020200 0x100>;
> > +               interrupts = <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>;
> > +               clocks = <&periph_clk>;
> > +       };
> > +};
> > diff --git a/arch/arm/boot/dts/bcm958625k.dts b/arch/arm/boot/dts/bcm958625k.dts
> > new file mode 100644
> > index 0000000..a1bc151
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/bcm958625k.dts
> > @@ -0,0 +1,57 @@
> > +/*
> > + *  BSD LICENSE
> > + *
> > + *  Copyright(c) 2015 Broadcom Corporation.  All rights reserved.
> > + *
> > + *  Redistribution and use in source and binary forms, with or without
> > + *  modification, are permitted provided that the following conditions
> > + *  are met:
> > + *
> > + *    * Redistributions of source code must retain the above copyright
> > + *      notice, this list of conditions and the following disclaimer.
> > + *    * Redistributions in binary form must reproduce the above copyright
> > + *      notice, this list of conditions and the following disclaimer in
> > + *      the documentation and/or other materials provided with the
> > + *      distribution.
> > + *    * Neither the name of Broadcom Corporation nor the names of its
> > + *      contributors may be used to endorse or promote products derived
> > + *      from this software without specific prior written permission.
> > + *
> > + *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> > + *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> > + *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> > + *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
> > + *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> > + *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> > + *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> > + *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
> > + *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> > + *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> > + *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "bcm-nsp.dtsi"
> > +
> > +/ {
> > +       model = "NorthStar Plus SVK (BCM958625K)";
> > +       compatible = "brcm,bcm58625", "brcm,nsp";
> > +
> > +       aliases {
> > +               serial0 = &uart0;
> > +               serial1 = &uart1;
> > +       };
> > +
> > +       chosen {
> > +               stdout-path = "serial0:115200n8";
> > +       };
> 
> No way to mount a root filesystem yet? How much work remains for that
> to be possible, and what's the plan for that?

It mounts rootfs.  I am adding the rootfs to the kernel and device
tree blob via the u-boot mkimage command.  It boots all the way to
shell without issue.

> 
> > +
> > +       uart0: serial@18000300 {
> > +               status = "okay";
> > +       };
> > +
> > +       uart1: serial@18000400 {
> > +               status = "okay";
> > +       };
> 
> I recommend using labels here instead so you don't have to mirror the
> DT layout to get the updated property right.

Agreed.

Thanks,
Jon

> 
> I.e.
> 
> &uart1 {
>         status = "okay";
> };
> 
> 
> 
> -Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
