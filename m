From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 2/3] gpiolib: Support 'gpio-reserved-ranges' property
Date: Wed, 21 Mar 2018 12:59:05 -0700
Message-ID: <152166234504.91116.14942145962035607739@swboyd.mtv.corp.google.com>
References: <20180321165848.89751-1-swboyd@chromium.org>
 <20180321165848.89751-3-swboyd@chromium.org>
 <1521655150.23017.79.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521655150.23017.79.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Timur Tabi <timur@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Andy Shevchenko (2018-03-21 10:59:10)
> On Wed, 2018-03-21 at 09:58 -0700, Stephen Boyd wrote:
> > From: Stephen Boyd <sboyd@codeaurora.org>
> > =

> > Some qcom platforms make some GPIOs or pins unavailable for use by
> > non-secure operating systems, and thus reading or writing the
> > registers
> > for those pins will cause access control issues. Add support for a DT
> > property to describe the set of GPIOs that are available for use so
> > that
> > higher level OSes are able to know what pins to avoid reading/writing.
> > Non-DT platforms can add support by directly updating the
> > chip->valid_mask.
> =

> > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> =

> Hmm...

Don't look closely! :P

> =

> > +     gpiochip->valid_mask =3D kcalloc(BITS_TO_LONGS(gpiochip-
> > >ngpio),
> > +                                    sizeof(long), GFP_KERNEL);
> =

> Just noticed that kcalloc is superfluous here.
> kmalloc_array() would be enough.
> =


Ok. I was copying the irqchip style. Should I fold them together into a
helper function and also update to kmalloc_array?
