From: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] media: V3s: Add support for
 Allwinner CSI.
Date: Mon, 25 Dec 2017 08:55:57 +0800
Message-ID: <20171225085557.9814ae157e227049ef79d8b9@magewell.com>
References: <1513936020-35569-1-git-send-email-yong.deng@magewell.com>
	<20171222102156.cfemen6ouxxxbrem@plaes.org>
	<CAOFm3uEfD4G2cLWNBhtB0tfD0A0e47div0RNGFioNCm-b108bg@mail.gmail.com>
Reply-To: yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD2JNYHK4MEBBJ4ZQHJAKGQEQJ6R6PY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAOFm3uEfD4G2cLWNBhtB0tfD0A0e47div0RNGFioNCm-b108bg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <dev>
List-Id: devicetree@vger.kernel.org

On Fri, 22 Dec 2017 14:40:37 +0100
Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org> wrote:

> Yong,
> 
> On Fri, Dec 22, 2017 at 11:21 AM, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org> wrote:
> > On Fri, Dec 22, 2017 at 05:47:00PM +0800, Yong Deng wrote:
> >> Allwinner V3s SoC have two CSI module. CSI0 is used for MIPI interface
> >> and CSI1 is used for parallel interface. This is not documented in
> >> datasheet but by testing and guess.
> >>
> >> This patch implement a v4l2 framework driver for it.
> >>
> >> Currently, the driver only support the parallel interface. MIPI-CSI2,
> >> ISP's support are not included in this patch.
> >>
> >> Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> 
> <snip>
> 
> >> --- /dev/null
> >> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> >> @@ -0,0 +1,878 @@
> >> +/*
> >> + * Copyright (c) 2017 Magewell Electronics Co., Ltd. (Nanjing).
> >> + * All rights reserved.
> >> + * Author: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> >> + *
> >> + * This program is free software; you can redistribute it and/or modify
> >> + * it under the terms of the GNU General Public License version 2 as
> >> + * published by the Free Software Foundation.
> >> + *
> >> + * This program is distributed in the hope that it will be useful,
> >> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >> + * GNU General Public License for more details.
> >> + */
> 
> 
> Would you mind using the new SPDX tags documented in Thomas patch set
> [1] rather than this fine but longer legalese?

Sure.

> 
> >> +MODULE_LICENSE("GPL v2");
> 
> Per module.h this means GPL2 only. This is not matching your top
> license above which is GPL2 or later.
> Please  make sure your MODULE_LICENSE is consistent with the top level license.

OK. I misunderstood it.

> 
> 
> [1] https://lkml.org/lkml/2017/12/4/934
> 
> --
> Cordially
> Philippe Ombredanne


Thanks,
Yong
