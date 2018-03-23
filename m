From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 3/3] pinctrl: qcom: Don't allow protected pins to be
 requested
Date: Fri, 23 Mar 2018 13:34:35 +0200
Message-ID: <1521804875.23017.95.camel@linux.intel.com>
References: <20180321165848.89751-1-swboyd@chromium.org>
         <20180321165848.89751-4-swboyd@chromium.org>
         <97380342-c3aa-5d34-7b22-f6ebbab4bafe@codeaurora.org>
         <b5dac2f7-eabb-6e09-2146-775b09d4eca8@codeaurora.org>
         <59df3700-c0bd-6ee8-eeab-6a49cb92d1db@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <59df3700-c0bd-6ee8-eeab-6a49cb92d1db@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2018-03-22 at 19:59 -0500, Timur Tabi wrote:
> On 03/22/2018 07:23 PM, Timur Tabi wrote:
> > 
> > Also, you don't allocate chip->valid_mask anywhere.
> 
> So I see now where it's allocated, but something is fishy.

No, it seems you missed %p vs. %px discussion.

The pointers printed by %p nowadays are hashed values, not the original
ones.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
