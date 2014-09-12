From: atull <atull@opensource.altera.com>
Subject: RE: [PATCH 4/4 v3] GPIO: gpio-dwapb: Suspend & Resume PM enabling
Date: Fri, 12 Sep 2014 10:46:54 -0500
Message-ID: <alpine.DEB.2.02.1409121045070.373@atx-linux-37>
References: <1410286081-16653-1-git-send-email-alvin.chen@intel.com> <1410286081-16653-5-git-send-email-alvin.chen@intel.com> <alpine.DEB.2.02.1409111138080.4869@atx-linux-37> <4656BEB6164FC34F8171C6538F1A595B2E990CFF@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4656BEB6164FC34F8171C6538F1A595B2E990CFF@SHSMSX101.ccr.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Chen, Alvin" <alvin.chen@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>, "Kweh, Hock Leong" <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, "Westerberg, Mika" <mika.westerberg@intel.com>, "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Fri, 12 Sep 2014, Chen, Alvin wrote:

> > On Tue, 9 Sep 2014, Weike Chen wrote:
> > 
> > >
> > >  struct dwapb_gpio;
> > > +struct dwapb_context;
> > >
> > >  struct dwapb_gpio_port {
> > >  	struct bgpio_chip	bgc;
> > >  	bool			is_registered;
> > >  	struct dwapb_gpio	*gpio;
> > > +	struct dwapb_context	*ctx;
> > 
> > Alvin,
> > 
> > Will this build if CONFIG_PM_SLEEP is not defined?
> Actually, PM_SLEEP is always set as 'y' in 'kerne/power/Kconfig'. But I manually change it to 'n', this module can be compiled correctly.
> You may be concern with 'ctx', and you can see 'ctx' accessing is always in CONFIG_PM_SLEEP.

Yes and in the case of 'struct dwapb_context *ctx;' it is ok for struct 
dwapb_context to be an incomplete type since that's just a pointer.

Alan 
