From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 4/6] clk: ingenic: Add JZ47xx TCU clocks driver
Date: Fri, 29 Dec 2017 15:02:50 +0100
Message-ID: <1514556170.2198.0@smtp.crapouillou.net>
References: <20171229125942.27305-1-paul@crapouillou.net>
        <20171229125942.27305-5-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20171229125942.27305-5-paul@crapouillou.net>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee.jones@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


[...]

> +	tcu->clocks.clk_num = nb_clks;
> +	tcu->clocks.clks = kcalloc(nb_clocks, sizeof(struct clk *), 
> GFP_KERNEL);
> +	if (!tcu->clocks.clks) {
> +		pr_err("%s: cannot allocate memory\n", __func__);
> +		goto err_free_tcu;
> +	}

Facepalm. A quick edit from kzalloc to kcalloc and I managed to break 
it.
It should be nb_clks not nb_clocks. I'll fix that in the V2.

-Paul

