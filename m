From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 2/3] gpiolib: Support 'gpio-reserved-ranges' property
Date: Wed, 21 Mar 2018 22:31:14 +0200
Message-ID: <1521664274.23017.92.camel@linux.intel.com>
References: <20180321165848.89751-1-swboyd@chromium.org>
         <20180321165848.89751-3-swboyd@chromium.org>
         <1521655150.23017.79.camel@linux.intel.com>
         <152166234504.91116.14942145962035607739@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152166234504.91116.14942145962035607739@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Timur Tabi <timur@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 2018-03-21 at 12:59 -0700, Stephen Boyd wrote:
> Quoting Andy Shevchenko (2018-03-21 10:59:10)
> > On Wed, 2018-03-21 at 09:58 -0700, Stephen Boyd wrote:
> > > 

> > 
> > > +     gpiochip->valid_mask = kcalloc(BITS_TO_LONGS(gpiochip-
> > > > ngpio),
> > > 
> > > +                                    sizeof(long), GFP_KERNEL);
> > 
> > Just noticed that kcalloc is superfluous here.
> > kmalloc_array() would be enough.
> > 
> 
> Ok. I was copying the irqchip style. Should I fold them together into
> a
> helper function and also update to kmalloc_array?

Not sure about first part, but definitely makes sense the second one (as
a separate patch perhaps).

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
