From: Liviu Dudau <liviu-I3yL/QOVVjH10XsdtD+oqA@public.gmane.org>
Subject: Re: Re: [PATCH v6 2/2] media: V3s: Add support for
 Allwinner CSI.
Date: Wed, 31 Jan 2018 14:47:53 +0000
Message-ID: <20180131144753.GB19945@bart.dudau.co.uk>
References: <1516695531-23349-1-git-send-email-yong.deng@magewell.com>
 <201801260759.RyNhDZz4%fengguang.wu@intel.com>
 <20180126094658.aa70ed3f890464f6051e21e4@magewell.com>
 <20180126110041.f89848325b9ecfb07df387ca@magewell.com>
 <20180131030807.GA19945@bart.dudau.co.uk>
 <20180131074212.7hvb3nqkt22h2chg@flea.lan>
Reply-To: liviu-I3yL/QOVVjH10XsdtD+oqA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDK653XKRACRBHFOY7JQKGQEPOLPLTY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180131074212.7hvb3nqkt22h2chg-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree
List-Id: devicetree@vger.kernel.org

On Wed, Jan 31, 2018 at 08:42:12AM +0100, Maxime Ripard wrote:
> Hi Liviu,

Hi Maxime,

> 
> On Wed, Jan 31, 2018 at 03:08:08AM +0000, Liviu Dudau wrote:
> > On Fri, Jan 26, 2018 at 11:00:41AM +0800, Yong wrote:
> > > Hi Maxime,
> > > 
> > > On Fri, 26 Jan 2018 09:46:58 +0800
> > > Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org> wrote:
> > > 
> > > > Hi Maxime,
> > > > 
> > > > Do you have any experience in solving this problem?
> > > > It seems the PHYS_OFFSET maybe undeclared when the ARCH is not arm.
> > > 
> > > Got it.
> > > Should I add 'depends on ARM' in Kconfig?
> > 
> > No, I don't think you should do that, you should fix the code.
> > 
> > The dma_addr_t addr that you've got is ideally coming from dma_alloc_coherent(),
> > in which case the addr is already "suitable" for use by the device (because the
> > bus where the device is attached to does all the address translations).
> 
> Like we're discussing in that other part of the thread with Thierry
> and Arnd, things are slightly more complicated than that :)

Yeah, sorry, my threading of the discussion was broken and I've seen the rest of the 
thread after I have replied. My bad!

> 
> In our case, the bus where the device is attached will not do the
> address translations, and shouldn't.

In my view, the bus is already doing address translation at physical level, AFAIU it
remaps the memory to zero. What you (we?) need is a simple bus driver that registers
the correct virt_to_bus()/bus_to_virt() hooks for the device that do this translation
at the DMA API level as well.

> 
> > If you apply PHYS_OFFSET forcefully to it you might get unexpected
> > results.
> 
> Out of curiosity, what would be these unexpected results?

If in the future (or a parallel world setup) the device is sitting behind an IOMMU, the
addr value might well be smaller than PHYS_OFFSET and you will under-wrap, possibly
starting to hit kernel physical addresses (or anything sitting at the top of the physical
memory).

>From my time playing with IOMMUs and PCI domains, I've learned to treat the dma_addr_t as
a cookie value and never try to do arithmetics with it.

Best regards,
Liviu

> 
> Thanks!
> Maxime
> 
> -- 
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> 
> -- 
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
