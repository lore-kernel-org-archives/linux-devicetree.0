From: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 00/18] Allwinner R40 HDMI refactoring
Date: Tue, 14 Aug 2018 13:43:08 +0800
Message-ID: <87f1db37e70473cd1a77f5e0d2f9a779c6afe7db.camel@aosc.io>
References: <20180710203511.18454-1-jernej.skrabec@siol.net>
         <20180711083036.7attjq4hm5ay5gmn@flea> <2309112.TTVI9Fv1ar@jernej-laptop>
         <20180724123741.bbkjgy2uwmzsj45k@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724123741.bbkjgy2uwmzsj45k@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Jernej =?gb2312?Q?=810=947krabec?= <jernej.skrabec@siol.net>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

在 2018-07-24二的 14:37 +0200，Maxime Ripard写道：
> On Sun, Jul 22, 2018 at 04:43:56PM +0200, Jernej Škrabec wrote:
> > Hi Maxime,
> > 
> > Dne sreda, 11. julij 2018 ob 10:30:36 CEST je Maxime Ripard
> > napisal(a):
> > > On Tue, Jul 10, 2018 at 10:34:53PM +0200, Jernej Skrabec wrote:
> > > > This series fixes several issues found in R40 HDMI patch series
> > > > after
> > > > it was applied. Conversation can be found here:
> > > > 
http://lists.infradead.org/pipermail/linux-arm-kernel/2018-June/586011.htm
> > > > l
> > > > 
> > > > Patches are based on latest linux-next (next-20180710) and are
> > > > ordered
> > > > in such way that they don't break R40 HDMI at any time. Because
> > > > of that
> > > > I suggest that whole series goes through drm-misc to preserve
> > > > that order.
> > > > 
> > > > I also tested those patches on H3 to make sure it doesn't break
> > > > other
> > > > platforms. However, it would be nice to test for regressions
> > > > also on
> > > > older SoCs (with DE1).
> > > > 
> > > > Best regards,
> > > > Jernej
> > > 
> > > Applied all patches but the patch 10, thanks!
> > > Maxime
> > 
> > It seems that you forgot to merge some patches:
> > 
> > [PATCH v2 12/18] drm/sun4i: tcon: Add another way for matching
> > mixers with 
> > tcon
> > [PATCH v2 13/18] drm/sun4i: tcon: Add support for R40 TCON
> > 
> > Without them, R40 display pipeline can't work.
> > 
> > Maybe they are in your spam folder?
> 
> Thanks for telling me, I'm not quite sure what happened.
> 
> I've applied them.

Sorry, but I still didn't find them in linux-next/master.

> 
> Sorry,
> Maxime
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
