From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 1/8] ARM: mediatek: Add basic support for mt8127
Date: Tue, 04 Nov 2014 10:45:40 +0100
Message-ID: <4360790.RbZnni9y9f@wuerfel>
References: <1413973797-17619-1-git-send-email-yingjoe.chen@mediatek.com> <13477264.GuOdydWub7@wuerfel> <CABuKBeL1JX88BBK7uXqpmaGzwCe5D6inB_n-NV6ajUt59V1swA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABuKBeL1JX88BBK7uXqpmaGzwCe5D6inB_n-NV6ajUt59V1swA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: HC Yen <hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "Joe. C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, huang eddie <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Nathan Chung <nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yuhau Chen <yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 04 November 2014 09:36:39 Matthias Brugger wrote:
> 2014-11-04 8:39 GMT+01:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> > On Tuesday 04 November 2014 14:36:45 HC Yen wrote:
> >> > > +
> >> > > +#include <dt-bindings/interrupt-controller/irq.h>
> >> > > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >> > > +#include "skeleton64.dtsi"
> >> >
> >> > Cortex a7 is 32 bits, right? So why do you use skeleton64.dtsi?
> >>
> >> Cortex-A7 is 32-bit, but that doesn't mean it can only have 32-bit
> >> physical address.  With LPAE enabled, we can have physical address more
> >> than 32 bits.
> >>
> >> The main difference between "skeleton64.dtsi" and "skeleton.dtsi" is
> >> "#address-cells" property set to 2.  Although there are few sources
> >> using "skeleton64.dtsi", some of them write "#address-cells = <2>"
> >> directly in order to have 64-bit address space.  ARM's TC2 reference
> >> platform (vexpress-v2p-ca15_a7.dts) is an example.
> >>
> >> Some of MediaTek ARMv7 SoCs support address space larger than 4GB. It
> >> will be convenient to share the sources if we all use 64-bit device
> >> tree.
> >
> > Right, in general, I'd use #address-cells=<2> for Cortex-A7/A15/A17.
> 
> Alright, thanks for clarification. So we should use skeleton64.dtsi
> for mt6589 as well, right?

If the chip is capable of accessing memory or registers higher than 4GB
physical address, then you should, yes.

If the SoC has limitations that mean you can't have higher addresses
anyway, then either way is fine, no need to change it.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
