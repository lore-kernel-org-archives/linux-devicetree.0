From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 2/5] clk: iproc: add initial common clock support
Date: Wed, 04 Feb 2015 15:13:59 -0800
Message-ID: <54D2A7B7.6020007@codeaurora.org>
References: <Ray Jui <rjui@broadcom.com> <1422988390-24369-1-git-send-email-rjui@broadcom.com> <1422988390-24369-3-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1422988390-24369-3-git-send-email-rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>, Mike Turquette <mturquette@linaro.org>, Matt Porter <mporter@linaro.org>, Alex Elder <elder@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On 02/03/15 10:33, Ray Jui wrote:
> +/*
> + * Get the clock rate based on name
> + */
> +static unsigned long __get_rate(const char *clk_name)
> +{
> +	struct clk *clk;
> +
> +	clk = __clk_lookup(clk_name);
> +	if (!clk) {
> +		pr_err("%s: unable to find clock by name: %s\n", __func__,
> +				clk_name);
> +		return 0;
> +	}
> +
> +	return clk_get_rate(clk);
> +}
> +

This looks like something we should be providing in the core framework.
Care to make it into an of_clk_get_parent_rate() API?

> +extern void __init iproc_armpll_setup(struct device_node *node);
> +extern void __init iproc_pll_setup(struct device_node *node,
> +		const struct iproc_pll_ctrl *ctrl,
> +		const struct iproc_pll_vco_freq_param *vco_param,
> +		unsigned int num_freqs);
> +extern void __init iproc_clk_setup(struct device_node *node,
> +		const struct iproc_clk_ctrl *ctrl, unsigned int num_clks);
> +extern void __init iproc_asiu_setup(struct device_node *node,
> +		const struct iproc_asiu_div *div,
> +		const struct iproc_asiu_gate *gate, unsigned int num_clks);

__init is not necessary in header files.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
