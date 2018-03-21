From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 2/3] gpiolib: Support 'gpio-reserved-ranges' property
Date: Wed, 21 Mar 2018 19:59:10 +0200
Message-ID: <1521655150.23017.79.camel@linux.intel.com>
References: <20180321165848.89751-1-swboyd@chromium.org>
         <20180321165848.89751-3-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180321165848.89751-3-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Timur Tabi <timur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2018-03-21 at 09:58 -0700, Stephen Boyd wrote:
> From: Stephen Boyd <sboyd@codeaurora.org>
> 
> Some qcom platforms make some GPIOs or pins unavailable for use by
> non-secure operating systems, and thus reading or writing the
> registers
> for those pins will cause access control issues. Add support for a DT
> property to describe the set of GPIOs that are available for use so
> that
> higher level OSes are able to know what pins to avoid reading/writing.
> Non-DT platforms can add support by directly updating the
> chip->valid_mask.

> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Hmm...

> +	gpiochip->valid_mask = kcalloc(BITS_TO_LONGS(gpiochip-
> >ngpio),
> +				       sizeof(long), GFP_KERNEL);

Just noticed that kcalloc is superfluous here.
kmalloc_array() would be enough.

> +	if (!gpiochip->valid_mask)
> +		return -ENOMEM;
> +
> +	/* Assume by default all GPIOs are valid */
> +	bitmap_fill(gpiochip->valid_mask, gpiochip->ngpio);


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
