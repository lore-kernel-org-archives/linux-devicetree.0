From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 3/3] pinctrl: qcom: Don't allow protected pins to be
 requested
Date: Wed, 21 Mar 2018 20:07:09 +0200
Message-ID: <1521655629.23017.84.camel@linux.intel.com>
References: <20180321165848.89751-1-swboyd@chromium.org>
         <20180321165848.89751-4-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180321165848.89751-4-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Timur Tabi <timur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2018-03-21 at 09:58 -0700, Stephen Boyd wrote:
> From: Stephen Boyd <sboyd@codeaurora.org>
> 
> Some qcom platforms make some GPIOs or pins unavailable for use
> by non-secure operating systems, and thus reading or writing the
> registers for those pins will cause access control issues and
> reset the device. With a DT/ACPI property to describe the set of
> pins that are available for use, parse the available pins and set
> the irq valid bits for gpiolib to know what to consider 'valid'.
> This should avoid any issues with gpiolib. Furthermore, implement
> the pinmux_ops::request function so that pinmux can also make
> sure to not use pins that are unavailable.
> 
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Hmm...

> +static int msm_pinmux_request(struct pinctrl_dev *pctldev, unsigned
> offset)
> +{
> +	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> +	struct gpio_chip *chip = &pctrl->chip;
> +
> +	if (gpiochip_line_is_valid(chip, offset))
> +		return 0;
> +
> +	return -EINVAL;

Perhaps traditional pattern

if (!...)
 return -EINVAL;

return 0;

?

> +}

>  	seq_printf(s, " %dmA", msm_regval_to_drive(drive));
> -	seq_printf(s, " %s", pulls[pull]);
> +	seq_printf(s, " %s\n", pulls[pull]);

I had commented this once, but you ignored by some reason.

I would rather just move 
 seq_puts(s, "\n");
here.

The rationale behind, besides making diff more neat, is to reduce
possible burden in the future if someone would like to squeeze more data
in between.

> +		tmp = kmalloc_array(len, sizeof(tmp[0]), GFP_KERNEL);

sizeof(*tmp) ?

> +		if (!tmp)
> +			return -ENOMEM;

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
