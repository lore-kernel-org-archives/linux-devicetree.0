From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 3/3] pinctrl: qcom: Don't allow protected pins to be
 requested
Date: Wed, 21 Mar 2018 22:30:00 +0200
Message-ID: <1521664200.23017.90.camel@linux.intel.com>
References: <20180321165848.89751-1-swboyd@chromium.org>
         <20180321165848.89751-4-swboyd@chromium.org>
         <1521655629.23017.84.camel@linux.intel.com>
         <152166267662.91116.8188392814465278915@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152166267662.91116.8188392814465278915@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Timur Tabi <timur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2018-03-21 at 13:04 -0700, Stephen Boyd wrote:
> Quoting Andy Shevchenko (2018-03-21 11:07:09)
> > On Wed, 2018-03-21 at 09:58 -0700, Stephen Boyd wrote:
> > > 

> Or ternary?
> 
>   return gpiochip_line_is_valid(chip, offset) ? 0 : -EINVAL;

Fine with me!

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
