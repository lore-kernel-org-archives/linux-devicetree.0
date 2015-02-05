From: Liu Ying <Ying.Liu@freescale.com>
Subject: Re: [PATCH RFC v8 02/21] of: Add vendor prefix for Himax
 Technologies Inc.
Date: Thu, 5 Feb 2015 10:20:59 +0800
Message-ID: <20150205022057.GA26592@victor>
References: <1420014219-915-1-git-send-email-Ying.Liu@freescale.com>
 <1420014219-915-3-git-send-email-Ying.Liu@freescale.com>
 <CAL_JsqJQuVSBQ73v45GEy+-OR74iZ+AT-R8vaExqJfpSMupAWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJQuVSBQ73v45GEy+-OR74iZ+AT-R8vaExqJfpSMupAWA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Stefan Wahren <stefan.wahren@i2se.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "kernel@pengutronix.de" <kernel@pengutronix.de>, David Airlie <airlied@linux.ie>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, andyshrk@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, Feb 04, 2015 at 10:02:53AM -0600, Rob Herring wrote:
> On Wed, Dec 31, 2014 at 2:23 AM, Liu Ying <Ying.Liu@freescale.com> wrote:
> > Signed-off-by: Liu Ying <Ying.Liu@freescale.com>
> 
> I don't know what the status is for the rest of the series, but I'm
> applying this and patch 3 so you don't have to keep sending them.

Thank you, Rob.

Regards,
Liu Ying

> 
> Rob
> 
> > ---
> > v7->v8:
> >  * None.
> >
> > v6->v7:
> >  * None.
> >
> > v5->v6:
> >  * None.
> >
> > v4->v5:
> >  * None.
> >
> > v3->v4:
> >  * Fix an ordering issue to address Stefan Wahren's comment.
> >
> > v2->v3:
> >  * None.
> >
> > v1->v2:
> >  * None.
> >
> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index 78efebb..f46adb2 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -67,6 +67,7 @@ gumstix       Gumstix, Inc.
> >  gw     Gateworks Corporation
> >  hannstar       HannStar Display Corporation
> >  haoyu  Haoyu Microelectronic Co. Ltd.
> > +himax  Himax Technologies, Inc.
> >  hisilicon      Hisilicon Limited.
> >  hit    Hitachi Ltd.
> >  honeywell      Honeywell
> > --
> > 2.1.0
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
