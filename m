From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Add a ngpios-ranges property
Date: Wed, 10 Jan 2018 14:54:21 +0200
Message-ID: <1515588861.7000.842.camel@linux.intel.com>
References: <20180110015848.11480-1-sboyd@codeaurora.org>
         <20180110015848.11480-3-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20180110015848.11480-3-sboyd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Timur Tabi <timur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 2018-01-09 at 17:58 -0800, Stephen Boyd wrote:
> Some qcom platforms make some GPIOs or pins unavailable for use
> by non-secure operating systems, and thus reading or writing the
> registers for those pins will cause access control issues.
> Introduce a DT property to describe the set of GPIOs that are
> available for use so that higher level OSes are able to know what
> pins to avoid reading/writing.
 
> +- ngpios-ranges:
> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: Tuples of GPIO ranges (base, size) indicating
> +		    GPIOs available for use.

Can be name more particular?

We have on one hand gpio-range-list for mapping, on the other this one
might become generic.

So, there are few options (at least?) to consider:
1) re-use gpio-ranges
2) add a valid property to gpio-ranges
3) rename ngpios-ranges to something like gpio-valid-ranges (I don't
like it so much either, but for me it looks more descriptive than
ngpios-ranges)


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
