From: Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH v6 2/2] media: V3s: Add support for
 Allwinner CSI.
Date: Sun, 28 Jan 2018 10:19:03 +0800
Message-ID: <20180128101903.fbaec083c787bda30aeb05ef@magewell.com>
References: <1516695531-23349-1-git-send-email-yong.deng@magewell.com>
        <201801260759.RyNhDZz4%fengguang.wu@intel.com>
        <20180126094658.aa70ed3f890464f6051e21e4@magewell.com>
        <20180126110041.f89848325b9ecfb07df387ca@magewell.com>
        <20180126081000.hy7g57zp5dv6ug2g@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180126081000.hy7g57zp5dv6ug2g-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, kbuild-all-JC7UmRfGjtg@public.gmane.org, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1560@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Fri, 26 Jan 2018 09:10:00 +0100
Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> On Fri, Jan 26, 2018 at 11:00:41AM +0800, Yong wrote:
> > Hi Maxime,
> > 
> > On Fri, 26 Jan 2018 09:46:58 +0800
> > Yong <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org> wrote:
> > 
> > > Hi Maxime,
> > > 
> > > Do you have any experience in solving this problem?
> > > It seems the PHYS_OFFSET maybe undeclared when the ARCH is not arm.
> > 
> > Got it.
> > Should I add 'depends on ARM' in Kconfig?
> 
> Yes, or even better a depends on MACH_SUNXI :)

Do you mean ARCH_SUNXI?

ARCH_SUNXI is alreay there. In the early version, my Kconfig is like this:

	depends on ARCH_SUNXI

But Hans suggest me to change this to:

	depends on ARCH_SUNXI || COMPILE_TEST

to allow this driver to be compiled on e.g. Intel for compile testing.

Should we get rid of COMPILE_TEST?

Yong
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
