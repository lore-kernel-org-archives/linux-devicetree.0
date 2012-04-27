From: Dong Aisheng <aisheng.dong@freescale.com>
Subject: Re: [PATCH v3 4/4] mmc: sdhci-imx-esdhc: convert to use pinctrl
 subsystem
Date: Fri, 27 Apr 2012 17:13:22 +0800
Message-ID: <20120427091321.GF826@shlinux2.ap.freescale.net>
References: <1335451227-27709-1-git-send-email-b29396@freescale.com>
 <1335451227-27709-4-git-send-email-b29396@freescale.com>
 <20120427073504.GS17184@pengutronix.de>
 <20120427082930.GC826@shlinux2.ap.freescale.net>
 <20120427083142.GY17184@pengutronix.de>
 <20120427085445.GE826@shlinux2.ap.freescale.net>
 <20120427084744.GB17184@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120427084744.GB17184@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Dong Aisheng-B29396 <B29396@freescale.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linus.walleij@stericsson.com" <linus.walleij@stericsson.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, Guo Shawn-R65073 <r65073@freescale.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "cjb@laptop.org" <cjb@laptop.org>, Zhao Richard-B20223 <B20223@freescale.com>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 27, 2012 at 04:47:44PM +0800, Sascha Hauer wrote:
> On Fri, Apr 27, 2012 at 04:54:46PM +0800, Dong Aisheng wrote:
> > On Fri, Apr 27, 2012 at 04:31:42PM +0800, Sascha Hauer wrote:
> > > On Fri, Apr 27, 2012 at 04:29:31PM +0800, Dong Aisheng wrote:
> > > > mach-imx27ipcam.c          mach-mx31ads.c             mach-mx51_babbage.o        mach-pca100.c
> > > > mach-imx27lite.c           mach-mx31ads.o             mach-mx51_efikamx.c        mach-pcm037.c
> > > > 
> > > > Some of them i'm not familiar and i don't know whether they may use pinctrl
> > > > so i just patched the affected ones.
> > > > 
> > > > One lazy method may be just patch all board files without pinctrl support
> > > > and it will not cause any error.
> > > > 
> > > > What's your suggestion?
> > > > 
> > > > > pinctrl. Let's add the provide_dummies call to the SoCs instead which
> > > > > do not have pinctrl yet.
> > > > > 
> > > > You meant add provide_dummies call in imx*_soc_init call?
> > > > We could do it but there might be a case that some boards are converted
> > > > to use pinctrl while others still not but they're based on the same soc.
> > > > For examples, 4 mx53 boards and we may not be able to convert them all at
> > > > the same time.
> > > 
> > > My point is that none of the mx5 boards have pinctrl since there is no
> > > SoC driver for it.
> > > For DT based boards pinctrl should be mandatory once the SoC has pinctrl
> > > support. All non DT boards probably won't get pinctrl anyway.
> > > 
> > Ok, so i would be fine for me to change it in imx*_soc_init.
> > BTW, there're:
> > imx1_soc_init()
> > imx25_soc_init()
> > imx27_soc_init()
> > imx31_soc_init()
> > imx35_soc_init()
> > imx50_soc_init()
> > imx51_soc_init()
> > imx53_soc_init()
> > 
> > I'm not sure about mx1, mx27, mx31
> > Do you think if i could add them all?
> 
> Of course. Or do you see a pinctrl driver for any i.MX except i.MX6?
> 
My understanding is that besides if have pinctrl driver, calling provide_dummies
also depends on whether it really has drivers using pinctrl.
Anyway, will update it soon.
Thanks for the confirm.

Regards
Dong Aisheng
