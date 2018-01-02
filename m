From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 4/6] clk: ingenic: Add JZ47xx TCU clocks driver
Date: Tue, 2 Jan 2018 14:59:55 -0800
Message-ID: <20180102225955.GL7997@codeaurora.org>
References: <20171229125942.27305-2-paul@crapouillou.net>
 <20180101143344.2099-1-paul@crapouillou.net>
 <20180101143344.2099-4-paul@crapouillou.net>
 <20180102191356.GI7997@codeaurora.org>
 <1514923719.15685.0@smtp.crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1514923719.15685.0@smtp.crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/02, Paul Cercueil wrote:
> >> +		goto err_free_tcu;
> >> +	}
> >> +
> >> +	tcu->clocks.clk_num = nb_clks;
> >> +	tcu->clocks.clks = kcalloc(nb_clks, sizeof(struct clk *),
> >>GFP_KERNEL);
> >> +	if (!tcu->clocks.clks) {
> >> +		pr_err("%s: cannot allocate memory\n", __func__);
> >
> >We don't need allocation error messages. Please run checkpatch.
> 
> I did run checkpatch, which warned about this, but that's a false
> positive to me.
> The callback passed to CLK_OF_DECLARE() has a return type void, so
> there's no
> way I can return -ENOMEM, and I don't want the error to be unnoticed.

The kernel typically spews a bunch of information when an
allocation error happens, so your pr_err() will be lost in the
spew, which is why it's not really necessary.

> 
> About the other remarks - I agree with you, I'll fix these in the V2.
> 

Ok.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
