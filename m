From: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 2/2] media: V3s: Add support for
 Allwinner CSI.
Date: Tue, 27 Feb 2018 09:18:47 +0800
Message-ID: <20180227091847.e67a1aeffff94eb37c7fff1e@magewell.com>
References: <1517217696-17816-1-git-send-email-yong.deng@magewell.com>
	<c86097d7-dade-01e5-3826-3f22f9ca4b4f@infradead.org>
	<20180130104833.a06e44c558c7ddc6b38e20b3@magewell.com>
	<ce3a30b9-f017-61b6-1fe6-f5dcc8bd3ec3@xs4all.nl>
Reply-To: yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD2JNYHK4MEBBA7E2LKAKGQEP2U5TVI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <ce3a30b9-f017-61b6-1fe6-f5dcc8bd3ec3-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel@lists
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, 26 Feb 2018 12:06:37 +0100
Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org> wrote:

> Hi all,
> 
> On 01/30/2018 03:48 AM, Yong wrote:
> > Hi,
> > 
> > On Mon, 29 Jan 2018 13:49:14 -0800
> > Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> > 
> >> On 01/29/2018 01:21 AM, Yong Deng wrote:
> >>> Allwinner V3s SoC features two CSI module. CSI0 is used for MIPI CSI-2
> >>> interface and CSI1 is used for parallel interface. This is not
> >>> documented in datasheet but by test and guess.
> >>>
> >>> This patch implement a v4l2 framework driver for it.
> >>>
> >>> Currently, the driver only support the parallel interface. MIPI-CSI2,
> >>> ISP's support are not included in this patch.
> >>>
> >>> Tested-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >>> Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
> >>> ---
> >>
> >>
> >> A previous version (I think v6) had a build error with the use of
> >> PHYS_OFFSET, so Kconfig was modified to depend on ARM and ARCH_SUNXI
> >> (one of which seems to be overkill).  As is here, the COMPILE_TEST piece is
> >> meaningless for all arches except ARM.  If you care enough for COMPILE_TEST
> >> (and I would), then you could make COMPILE_TEST useful on any arch by
> >> removing the "depends on ARM" (the ARCH_SUNXI takes care of that) and by
> >> having an alternate value for PHYS_OFFSET, like so:
> >>
> >> +#if defined(CONFIG_COMPILE_TEST) && !defined(PHYS_OFFSET)
> >> +#define PHYS_OFFSET	0
> >> +#endif
> >>
> >> With those 2 changes, the driver builds for me on x86_64.
> > 
> > I have considered this method.
> > But it's so sick to put these code in dirver (for my own). I mean 
> > this is meaningless for the driver itself and make people confused.
> > 
> > I grepped the driver/ code and I found many drivers writing Kconfig
> > like this. For example:
> > ARM && COMPILE_TEST
> > MIPS && COMPILE_TEST
> > PPC64 && COMPILE_TEST
> > 
> > BTW, for my own, I do not care about COMPILE_TEST.
> 
> There was a discussion about this in the v6 patch, but it petered out.
> 
> I want to merge this driver, but I would very much prefer that this
> compiles with COMPILE_TEST. So unless someone has a better solution, then
> adding 'hack' that defines PHYS_OFFSET to 0 for COMPILE_TEST would be required.

If so, I will take the advice of Randy.

> 
> Otherwise this driver looks good, so it is just this issue blocking it.
> 
> Regards,
> 
> 	Hans
> 
> > 
> >>
> >>> diff --git a/drivers/media/platform/sunxi/sun6i-csi/Kconfig b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
> >>> new file mode 100644
> >>> index 0000000..f80c965
> >>> --- /dev/null
> >>> +++ b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
> >>> @@ -0,0 +1,10 @@
> >>> +config VIDEO_SUN6I_CSI
> >>> +	tristate "Allwinner V3s Camera Sensor Interface driver"
> >>> +	depends on ARM
> >>> +	depends on VIDEO_V4L2 && COMMON_CLK && VIDEO_V4L2_SUBDEV_API && HAS_DMA
> >>> +	depends on ARCH_SUNXI || COMPILE_TEST
> >>> +	select VIDEOBUF2_DMA_CONTIG
> >>> +	select REGMAP_MMIO
> >>> +	select V4L2_FWNODE
> >>> +	---help---
> >>> +	   Support for the Allwinner Camera Sensor Interface Controller on V3s.
> >>
> >> thanks,
> >> -- 
> >> ~Randy
> > 
> > 
> > Thanks,
> > Yong
> > 


Thanks,
Yong
