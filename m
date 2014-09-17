From: "Chen, Alvin" <alvin.chen@intel.com>
Subject: RE: [PATCH 1/4 v4] GPIO: gpio-dwapb: Enable platform driver binding
 to MFD driver
Date: Wed, 17 Sep 2014 07:09:42 +0000
Message-ID: <4656BEB6164FC34F8171C6538F1A595B2E9925AB@SHSMSX101.ccr.corp.intel.com>
References: <1410859335-11080-1-git-send-email-alvin.chen@intel.com>
 <1410859335-11080-2-git-send-email-alvin.chen@intel.com>
 <alpine.DEB.2.02.1409160921020.4740@atx-linux-37>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1409160921020.4740@atx-linux-37>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>, "Kweh, Hock Leong" <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, "Westerberg, Mika" <mika.westerberg@intel.com>, "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

> > +		if (pp->idx == 0 &&
> > +		    of_property_read_bool(port_np, "interrupt-controller")) {
> > +			pp->irq = irq_of_parse_and_map(port_np, 0);
> > +			if (!pp->irq) {
> > +				dev_warn(dev, "no irq for bank %s\n",
> > +					 port_np->full_name);
> > +			}
> > +		} else {
> > +			pp->irq	= 0;
> > +		}
> 
> The else clause is not needed since pp->irq == 0 already, right?
> 
Yes, while call kcalloc, the memory is set to '0'. I will improve it.
