From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 2/8] ARM: mediatek: add dts for 8127 Moose board
Date: Tue, 4 Nov 2014 13:44:21 +0800
Message-ID: <1415079861.31861.0.camel@mtksdaap41>
References: <1413973797-17619-1-git-send-email-yingjoe.chen@mediatek.com>
	 <1413973797-17619-3-git-send-email-yingjoe.chen@mediatek.com>
	 <CABuKBe+ku=vWiWbvAm8M7QgyzvVWZ5sdkRMocuUym8JTyk-okg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABuKBe+ku=vWiWbvAm8M7QgyzvVWZ5sdkRMocuUym8JTyk-okg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hsien-Chun Yen <hc.yen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, huang eddie <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Nathan Chung <nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yuhau Chen <yh.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2014-11-03 at 18:55 +0100, Matthias Brugger wrote:
> 2014-10-22 12:29 GMT+02:00 Joe.C <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
> > From: "Joe.C" <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >
> > Moose is a tablet evalutation board based on MT8127 SoC.
> >
> > Signed-off-by: Joe.C <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/mt8127-moose.dts | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/mt8127-moose.dts
> >
> > diff --git a/arch/arm/boot/dts/mt8127-moose.dts b/arch/arm/boot/dts/mt8127-moose.dts
> > new file mode 100644
> > index 0000000..602e2f0
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/mt8127-moose.dts
> > @@ -0,0 +1,24 @@
> > +/*
> > + * Copyright (c) 2014 MediaTek Inc.
> > + * Author: Joe.C <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +/dts-v1/;
> > +#include "mt8127.dtsi"
> > +
> > +/ {
> > +       model = "mediatek,mt8127-moose", "mediatek,mt8127";
> 
> The model should be a string that identifies the board, e.g. "Moose".
> Please add the compatible property.

Thanks for catching this. I just note we have warning on this line.
Will fix in next version.

Joe.C

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
