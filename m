From: Dong Aisheng <aisheng.dong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v3 4/4] mmc: sdhci-imx-esdhc: convert to use pinctrl
 subsystem
Date: Fri, 27 Apr 2012 16:29:31 +0800
Message-ID: <20120427082930.GC826@shlinux2.ap.freescale.net>
References: <1335451227-27709-1-git-send-email-b29396@freescale.com>
 <1335451227-27709-4-git-send-email-b29396@freescale.com>
 <20120427073504.GS17184@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120427073504.GS17184-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Zhao Richard-B20223 <B20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Guo Shawn-R65073 <r65073-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org" <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 27, 2012 at 03:35:04PM +0800, Sascha Hauer wrote:
> On Thu, Apr 26, 2012 at 10:40:27PM +0800, Dong Aisheng wrote:
> > From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > 
> > This driver is shared between many platforms. Currently only imx6q has
> > pinctrl support, to avoid breaking other platforms that do not have pinctrl
> > support to run this driver, enable pinctrl dummy state for them before
> > they also convert to pinctrl subsystem.
> > 
> > Signed-off-by: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> > This patch depends on:
> > pinctrl: add pinctrl_provide_dummies interface for platforms to use
> > http://www.spinics.net/lists/arm-kernel/msg171538.html
> > 
> > ChangeLog v2->v3:
> >  * patch name updated.
> >    v1 name is ARM: imx6q: switch to use pinctrl driver
> >  * using pinctrl dummy state to avoid breaking other platforms to use this
> >    driver.
> > 
> > ChangeLog v1->v2:
> >  * using updated binding
> > ---
> >  arch/arm/boot/dts/imx6q-arm2.dts               |    4 +++
> >  arch/arm/boot/dts/imx6q.dtsi                   |   32 ++++++++++++++++++++++++
> >  arch/arm/mach-imx/Kconfig                      |    2 +
> >  arch/arm/mach-imx/eukrea_mbimxsd35-baseboard.c |    2 +
> >  arch/arm/mach-imx/mach-cpuimx51.c              |    2 +
> >  arch/arm/mach-imx/mach-cpuimx51sd.c            |    2 +
> >  arch/arm/mach-imx/mach-eukrea_cpuimx25.c       |    2 +
> >  arch/arm/mach-imx/mach-mx25_3ds.c              |    2 +
> >  arch/arm/mach-imx/mach-mx35_3ds.c              |    2 +
> >  arch/arm/mach-imx/mach-mx51_3ds.c              |    2 +
> >  arch/arm/mach-imx/mach-mx51_babbage.c          |    2 +
> >  arch/arm/mach-imx/mach-mx51_efikamx.c          |    2 +
> >  arch/arm/mach-imx/mach-mx51_efikasb.c          |    2 +
> >  arch/arm/mach-imx/mach-mx53_ard.c              |    2 +
> >  arch/arm/mach-imx/mach-mx53_evk.c              |    2 +
> >  arch/arm/mach-imx/mach-mx53_loco.c             |    2 +
> >  arch/arm/mach-imx/mach-mx53_smd.c              |    2 +
> >  arch/arm/mach-imx/mach-pcm043.c                |    2 +
> >  arch/arm/mach-imx/mach-vpr200.c                |    2 +
> 
> Here you are patching only the boards which happen to use the esdhc
> controller, so we need to patch other boards when another driver gains

Yes, theoretically, if a board does not have drivers running with pinctrl,
it may not need change.

There're so many boards under arch/arm/mach-imx/*:
b29396@shlinux2:~/upstream/linux-pinctrl$ ls arch/arm/mach-imx/mach-
mach-apf9328.c             mach-imx27_visstrim_m10.c  mach-mx31lilly.c           mach-mx51_efikamx.o        mach-pcm037_eet.c
mach-armadillo5x0.c        mach-imx6q.c               mach-mx31lilly.o           mach-mx51_efikasb.c        mach-pcm037_eet.o
mach-armadillo5x0.o        mach-imx6q.o               mach-mx31lite.c            mach-mx51_efikasb.o        mach-pcm037.o
mach-bug.c                 mach-kzm_arm11_01.c        mach-mx31lite.o            mach-mx53_ard.c            mach-pcm038.c
mach-bug.o                 mach-kzm_arm11_01.o        mach-mx31moboard.c         mach-mx53_ard.o            mach-pcm043.c
mach-cpuimx27.c            mach-mx1ads.c              mach-mx31moboard.o         mach-mx53_evk.c            mach-pcm043.o
mach-cpuimx35.c            mach-mx21ads.c             mach-mx35_3ds.c            mach-mx53_evk.o            mach-qong.c
mach-cpuimx51.c            mach-mx25_3ds.c            mach-mx35_3ds.o            mach-mx53_loco.c           mach-qong.o
mach-cpuimx51.o            mach-mx27_3ds.c            mach-mx50_rdp.c            mach-mx53_loco.o           mach-scb9328.c
mach-cpuimx51sd.c          mach-mx27ads.c             mach-mx51_3ds.c            mach-mx53_smd.c            mach-vpr200.c
mach-cpuimx51sd.o          mach-mx31_3ds.c            mach-mx51_3ds.o            mach-mx53_smd.o            mach-vpr200.o
mach-eukrea_cpuimx25.c     mach-mx31_3ds.o            mach-mx51_babbage.c        mach-mxt_td60.c
mach-imx27ipcam.c          mach-mx31ads.c             mach-mx51_babbage.o        mach-pca100.c
mach-imx27lite.c           mach-mx31ads.o             mach-mx51_efikamx.c        mach-pcm037.c

Some of them i'm not familiar and i don't know whether they may use pinctrl
so i just patched the affected ones.

One lazy method may be just patch all board files without pinctrl support
and it will not cause any error.

What's your suggestion?

> pinctrl. Let's add the provide_dummies call to the SoCs instead which
> do not have pinctrl yet.
> 
You meant add provide_dummies call in imx*_soc_init call?
We could do it but there might be a case that some boards are converted
to use pinctrl while others still not but they're based on the same soc.
For examples, 4 mx53 boards and we may not be able to convert them all at
the same time.

Regards
Dong Aisheng
