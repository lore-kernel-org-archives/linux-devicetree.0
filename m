From: "Chen, Alvin" <alvin.chen@intel.com>
Subject: RE: [PATCH 1/3 v2] GPIO: gpio-dwapb: Enable platform driver binding
 to MFD driver
Date: Tue, 9 Sep 2014 01:50:42 +0000
Message-ID: <4656BEB6164FC34F8171C6538F1A595B2E983296@SHSMSX101.ccr.corp.intel.com>
References: <1409928798-31895-1-git-send-email-alvin.chen@intel.com>
 <4656BEB6164FC34F8171C6538F1A595B2E9829DA@SHSMSX101.ccr.corp.intel.com>
 <1409918522.30155.89.camel@intel.com> <31986364.cn091cmIXU@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <31986364.cn091cmIXU@wuerfel>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Kweh, Hock Leong" <hock.leong.kweh@intel.com>, "sebastian@breakpoint.cc" <sebastian@breakpoint.cc>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>, "gnurou@gmail.com" <gnurou@gmail.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, "dvhart@linux.intel.com" <dvhart@linux.intel.com>, "atull@opensource.altera.com" <atull@opensource.altera.com>
List-Id: devicetree@vger.kernel.org

> On Friday 05 September 2014 12:02:01 Shevchenko, Andriy wrote:
> > > irq = irq_of_parse_and_map(node, 0); If (!irq) {
> > > pp->irq = -1;
> > > return;
> > > } else {
> > > pp->irq = irq;
> > > }
> > > Then the code looks strange.
> > >
> > > How do you think?
> >
> > If I understood correctly you messed up with hwirq vs. virq.
> > Otherwise you have mention that you are using virq everywhere (I guess
> > you may rename the field in the structure), but in this case the field
> > in the platform_data looks a bit strange.
> 
> The field in platform_data should be the mapped virtual irq number, it makes no
> sense to use the hwirq unless you also add a pointer to the domain in which
> that hwirq exists.
> 
> Also the output of irq_of_parse_and_map() is a mapped irq, as the name
> suggests.
> 
I agree with Arnd. Here, the 'irq' is 'virq'.
Andriy, you may be confused by the code like 'irq_create_mapping'. For Quark case, it has 8 GPIO pins, and each pin can trigger
interrupt, but all these interrupts are triggered by PCI irq which is shared. The 'irq' in pdata is PCI irq. As all GPIO interrupts connect to the PCI
irq, once the GPIO interrupt is triggered, and the PCI irq handler will be called 'dwapb_irq_handler_mfd'. And in 'dwapb_do_irq', it will read the
interrupt register to see the interrupt is triggered by which GPIO pin, and 'irq_create_mapping' is for this case.


.
