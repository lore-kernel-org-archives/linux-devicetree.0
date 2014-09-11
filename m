From: "Chen, Alvin" <alvin.chen@intel.com>
Subject: RE: [PATCH 1/4 v3] GPIO: gpio-dwapb: Enable platform driver binding
 to MFD driver
Date: Thu, 11 Sep 2014 00:46:31 +0000
Message-ID: <4656BEB6164FC34F8171C6538F1A595B2E98F982@SHSMSX101.ccr.corp.intel.com>
References: <1410286081-16653-1-git-send-email-alvin.chen@intel.com>
 <1410286081-16653-2-git-send-email-alvin.chen@intel.com>
 <alpine.DEB.2.02.1409101353500.2790@atx-linux-37>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>, "Kweh, Hock Leong" <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, "Westerberg, Mika" <mika.westerberg@intel.com>, "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

> >
> > Hi Alvin,
> >
> > I did a quick test and this looks like it works for me (with device tree).
> > I had a couple of small fixes below.
> It is very appreciated to help testing.
> 
> 
> > Alan
> >
> > >
> > > -	port->bgc.gc.ngpio = ngpio;
> > > -	port->bgc.gc.of_node = port_np;
> > > +#ifdef CONFIG_OF_GPIO
> > > +	port->bgc.gc.of_node = pp->node;
> > > +#endif
> >
> > Please use 'if (IS_ENABLED(CONFIG_OF_GPIO)) as a conditional as you do
> > elsewhere.
> OK.
> 
Alan, I just do a quick test, here we can't use 'IS_ENABLED', it can't be compiled without OF_GPIO set.
Because 'gc.of_node' is not defined without 'OF_GPIO'. You can refer the structure of 'gc'.

