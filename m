From: Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v2 5/6] clk: stm32f469: Add QSPI clock
Date: Thu, 20 Oct 2016 17:44:44 +0200
Message-ID: <ce7829db-a858-2de9-f9e5-89c6642262b1@st.com>
References: <1476436699-21879-1-git-send-email-gabriel.fernandez@st.com>
 <1476436699-21879-6-git-send-email-gabriel.fernandez@st.com>
 <20161019203228.GC8871@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161019203228.GC8871-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, olivier.bideau-qxv4g6HH51o@public.gmane.org, amelie.delaunay-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Stephen


On 10/19/2016 10:32 PM, Stephen Boyd wrote:
> On 10/14, gabriel.fernandez-qxv4g6HH51o@public.gmane.org wrote:
>> @@ -532,10 +618,42 @@ static struct clk_hw *stm32_register_cclk(struct device *dev, const char *name,
>>   	{ 0 },
>>   };
>>   
>> +struct stm32f4_clk_data {
>> +	const struct stm32f4_gate_data *gates_data;
>> +	const u64 *gates_map;
>> +	int gates_num;
>> +};
>> @@ -549,6 +667,19 @@ static void __init stm32f4_rcc_init(struct device_node *np)
>>   		goto fail;
>>   	}
>>   
>> +	match = of_match_node(stm32f4_of_match, np);
>> +	if (WARN_ON(!match))
>> +		return;
>> +
>> +	data = match->data;
>> +
>> +	clks = kmalloc_array(data->gates_num + END_PRIMARY_CLK,
>> +			sizeof(struct clk_hw *), GFP_KERNEL);
> sizeof(*clks)?
ok

>
>> +	if (!clks)
>> +		goto fail;
>> +
>> +	stm32f4_gate_map = data->gates_map;
>> +
>>   	hse_clk = of_clk_get_parent_name(np, 0);
>>   
>>   	clk_register_fixed_rate_with_accuracy(NULL, "hsi", NULL, 0,
>> @@ -581,11 +712,15 @@ static void __init stm32f4_rcc_init(struct device_node *np)
>>   	clks[FCLK] = clk_hw_register_fixed_factor(NULL, "fclk", "ahb_div",
>>   					       0, 1, 1);
>>   
>> -	for (n = 0; n < ARRAY_SIZE(stm32f4_gates); n++) {
>> -		const struct stm32f4_gate_data *gd = &stm32f4_gates[n];
>> -		unsigned int secondary =
>> -		    8 * (gd->offset - STM32F4_RCC_AHB1ENR) + gd->bit_idx;
>> -		int idx = stm32f4_rcc_lookup_clk_idx(0, secondary);
>> +	for (n = 0; n < data->gates_num; n++) {
>> +		const struct stm32f4_gate_data *gd;
>> +		unsigned int secondary;
>> +		int idx;
>> +
>> +		gd = (struct stm32f4_gate_data *) &data->gates_data[n];
> Why do we cast here? Get rid of const? Perhaps the struct
> shouldn't have const on the member instead?
we don't need cast here.

Thank's Stephen

BR
Gabriel
>
>> +		secondary = 8 * (gd->offset - STM32F4_RCC_AHB1ENR) +
>> +			gd->bit_idx;
>> +		idx = stm32f4_rcc_lookup_clk_idx(0, secondary);
>>   
>>   		if (idx < 0)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
