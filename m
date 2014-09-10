From: "Chen, Alvin" <alvin.chen@intel.com>
Subject: RE: [PATCH 1/4 v3] GPIO: gpio-dwapb: Enable platform driver binding
 to MFD driver
Date: Wed, 10 Sep 2014 00:34:50 +0000
Message-ID: <4656BEB6164FC34F8171C6538F1A595B2E98854F@SHSMSX101.ccr.corp.intel.com>
References: <1410286081-16653-1-git-send-email-alvin.chen@intel.com>
 <1410286081-16653-2-git-send-email-alvin.chen@intel.com>
 <D034802C.A7BEE%dvhart@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <D034802C.A7BEE%dvhart@linux.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, atull <atull@opensource.altera.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ong, Boon Leong" <boon.leong.ong@intel.com>, "Kweh, Hock Leong" <hock.leong.kweh@intel.com>, Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, "Westerberg, Mika" <mika.westerberg@intel.com>, "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

> >@@ -136,7 +136,6 @@ config GPIO_DWAPB
> > 	tristate "Synopsys DesignWare APB GPIO driver"
> > 	select GPIO_GENERIC
> > 	select GENERIC_IRQ_CHIP
> >-	depends on OF_GPIO
> 
> You cover this specific dependencies with inline ifdefs, but you lose the
> CONFIG_OF depends by dropping it, and there are no such checks in the probe
> routine. Assumptions of OF are not limited to probe in this driver.
> 
> While I would like to see this assumption properly abstracted, the most
> expedient/immediate fix is probably to add a depends on OF above.

Andriy, how do you think? 

How about 
depends on OF_GPIO || MFD_GPIO_DWAPB, or
depends on OF_GPIO || MFD_INTEL_QUARK_I2C_GPIO?


> --
> Darren
> Intel Open Source Technology Center
> 

