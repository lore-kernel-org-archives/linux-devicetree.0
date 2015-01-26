From: Bjorn <bjorn@sonymobile.com>
Subject: Re: [PATCH 1/4] pinctrl: qcom: Add multiple copy base support
Date: Mon, 26 Jan 2015 14:26:16 -0800
Message-ID: <20150126222615.GA11960@sonymobile.com>
References: <1418936395-14623-1-git-send-email-agross@codeaurora.org>
 <1418936395-14623-2-git-send-email-agross@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1418936395-14623-2-git-send-email-agross@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thu 18 Dec 12:59 PST 2014, Andy Gross wrote:

> Qualcomm pinctrl devices support functions that can be routed to multiple pins.
> In some cases, there are additional mux registers that must be set for the pins
> to work correctly.
> 

I've described it as "second level muxing", but your description works too...

[..]

> +	/*
> +	 * if an alternate copy configuration is required, configure the pins to
> +	 * steer the function to the correct set of pins.  This is used in cases
> +	 * where we have more than one copy of the pins for a function
> +	 */
> +	if (f->requires_copy_select)
> +		writel(f->copy_select_value, pctrl->regs + f->copy_select_reg);

I'm not sure if this is sufficient.

In the APQ8064 case (patch 3) you use this to write 0 or 1 to $2074, but if I
read the documentation correctly you should also write to $207c and $2080 to
enable/disable slew rate control of the individual paths.

On 8974 we don't have the muxing, but the documentation states that we should
set bit 0 of $2030 depending on slimbus being muxed or not. (not sure what to
do about bit 1 though)


I looked at assigning an optional function pointer to the function, that way we
could easily express the platform specific tweaks in the individual drivers.

However, as the muxing is deselected we need to make sure the slew rate is
disabled and the only sane way I can think of then would be to tie this to the
pingroup, as selecting any other entry from the pingroup should trigger the
reset.

Regards,
Bjorn
