From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 05/12] arm64: dts: mt7622: add PMIC MT6380 related nodes
Date: Fri, 5 Jan 2018 11:42:39 +0800
Message-ID: <1515123759.30687.71.camel@mtkswgap22>
References: <cover.1515057696.git.sean.wang@mediatek.com>
         <0109846a8a501ca3cae33acfceb919960fddfcbf.1515057696.git.sean.wang@mediatek.com>
         <CAOFm3uF0WHO6_Y6dKu3DnAd759tA2hNQs=0-P86s1A0e==27Ow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOFm3uF0WHO6_Y6dKu3DnAd759tA2hNQs=0-P86s1A0e==27Ow-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2018-01-04 at 11:27 +0100, Philippe Ombredanne wrote:
> Sean,
> 
> On Thu, Jan 4, 2018 at 10:40 AM,  <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >
> > Enable pwrap and MT6380 on mt7622-rfb1 board. Also add all mt6380
> > regulator nodes in an alone file to allow similar boards using MT6380
> > able to resue the configuration.
> >
> > Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt6380.dtsi     | 91 ++++++++++++++++++++++++++++
> >  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts |  8 +++
> >  arch/arm64/boot/dts/mediatek/mt7622.dtsi     | 12 ++++
> >  3 files changed, 111 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt6380.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt6380.dtsi b/arch/arm64/boot/dts/mediatek/mt6380.dtsi
> > new file mode 100644
> > index 0000000..7eb7dc2
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt6380.dtsi
> > @@ -0,0 +1,91 @@
> > +/*
> > + * Copyright (c) 2018 MediaTek Inc.
> > + * Author: Chenglin Xu <chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > + *        Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> 
> Would you mind using SPDX tags instead of this fine but long legalese?
> This is documented in Thomas patches [1].

> Also if you could spread the word in your team, this would earn you
> good karma points.
> Thank you!
> 
> [1] https://lkml.org/lkml/2017/12/28/323


Hi, Philippe

thanks for your suggestion

Certainly, this can be replaced with

SPDX-License-Identifier: GPL-2.0

most drivers from MediaTek use the similar disclaimer, it should be fine
to use SPDX tags instead.

	Sean

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
