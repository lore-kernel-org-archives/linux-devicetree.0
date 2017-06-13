From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCHv4 2/2] clk: keystone: Add sci-clk driver support
Date: Tue, 13 Jun 2017 10:06:12 +0300
Message-ID: <0b4a0ee6-0769-2112-d3dc-7c219eb9bbcc@ti.com>
References: <1495458113-7366-1-git-send-email-t-kristo@ti.com>
 <1495458113-7366-3-git-send-email-t-kristo@ti.com>
 <20170613020455.GQ20170@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170613020455.GQ20170@codeaurora.org>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, ssantosh@kernel.org, mturquette@baylibre.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 13/06/17 05:04, Stephen Boyd wrote:
> On 05/22, Tero Kristo wrote:
>> +
>> +/**
>> + * ti_sci_clk_probe - Probe function for the TI SCI clock driver
>> + * @pdev: platform device pointer to be probed
>> + *
>> + * Probes the TI SCI clock device. Allocates a new clock provider
>> + * and registers this to the common clock framework. Also applies
>> + * any required flags to the identified clocks via clock lists
>> + * supplied from DT. Returns 0 for success, negative error value
>> + * for failure.
>> + */
>> +static int ti_sci_clk_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *np = dev->of_node;
>> +	struct sci_clk_provider *provider;
>> +	const struct ti_sci_handle *handle;
>> +	struct sci_clk_data *data;
>> +	int ret;
>> +
>> +	data = (struct sci_clk_data *)of_device_get_match_data(dev);
> 
> It would be nice to avoid this cast, and also check for NULL
> here. I tried to do it in a few minutes but then that caused a
> problem with throwing away const on sci_clk_data. Can this be
> resolved? We probably shouldn't be assigning the
> sci_clk_data::clocks member anyway if the structure is const
> assuming it goes into the read-only section. It may cause some
> restructuring of the code though.

Yeah, thats a good catch. I just cooked up a fix for that, will post v5 
of this patch alone in a bit.

Basically I moved the sci_clk_data->clocks to the provider itself so the 
sci_clk_data can remain const.

-Tero

> 
>> +
>> +	handle = devm_ti_sci_get_handle(dev);
>> +	if (IS_ERR(handle))
>> +		return PTR_ERR(handle);

