From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 4/6] clk: ingenic: Add JZ47xx TCU clocks driver
Date: Tue, 02 Jan 2018 21:08:39 +0100
Message-ID: <1514923719.15685.0@smtp.crapouillou.net>
References: <20171229125942.27305-2-paul@crapouillou.net>
        <20180101143344.2099-1-paul@crapouillou.net>
        <20180101143344.2099-4-paul@crapouillou.net>
        <20180102191356.GI7997@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180102191356.GI7997@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

[...]

>>  +
>>  +static void __init ingenic_tcu_init(struct device_node *np,
>>  +		enum ingenic_version id)
>>  +{
>>  +	struct ingenic_tcu *tcu;
>>  +	size_t i, nb_clks;
>>  +	int ret = -ENOMEM;
>>  +
>>  +	if (id >= ID_JZ4770)
>>  +		nb_clks = (JZ4770_CLK_LAST - JZ4740_CLK_TIMER0) + 1;
>>  +	else
>>  +		nb_clks = (JZ4740_CLK_LAST - JZ4740_CLK_TIMER0) + 1;
>>  +
>>  +	tcu = kzalloc(sizeof(*tcu), GFP_KERNEL);
>>  +	if (!tcu) {
>>  +		pr_err("%s: cannot allocate memory\n", __func__);
> 
> We don't need allocation error messages. Please run checkpatch.
> 
>>  +		return;
>>  +	}
>>  +
>>  +	tcu->map = syscon_node_to_regmap(np->parent);
>>  +	if (IS_ERR(tcu->map)) {
>>  +		pr_err("%s: failed to map TCU registers\n", __func__);
>>  +		goto err_free_tcu;
>>  +	}
>>  +
>>  +	tcu->clocks.clk_num = nb_clks;
>>  +	tcu->clocks.clks = kcalloc(nb_clks, sizeof(struct clk *), 
>> GFP_KERNEL);
>>  +	if (!tcu->clocks.clks) {
>>  +		pr_err("%s: cannot allocate memory\n", __func__);
> 
> We don't need allocation error messages. Please run checkpatch.

I did run checkpatch, which warned about this, but that's a false 
positive to me.
The callback passed to CLK_OF_DECLARE() has a return type void, so 
there's no
way I can return -ENOMEM, and I don't want the error to be unnoticed.

About the other remarks - I agree with you, I'll fix these in the V2.

Thanks,
-Paul
