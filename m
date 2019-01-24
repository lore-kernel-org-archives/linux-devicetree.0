Return-Path: <SRS0=avNg=QA=nvidia.com=talho@kernel.org>
Subject: Re: [PATCH V2 3/4] firmware: tegra: add bpmp driver for Tegra210
References: <1548073731-6449-1-git-send-email-talho@nvidia.com>
 <1548073731-6449-4-git-send-email-talho@nvidia.com>
 <09cb4df2-cd5d-9d74-c209-2ccec6cec2c8@nvidia.com>
From: Timo Alho <talho@nvidia.com>
Message-ID: <ab9d0f38-a717-016f-6e80-2f18cbdfbee8@nvidia.com>
Date: Thu, 24 Jan 2019 15:41:07 +0200
MIME-Version: 1.0
In-Reply-To: <09cb4df2-cd5d-9d74-c209-2ccec6cec2c8@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jon Hunter <jonathanh@nvidia.com>, treding@nvidia.com, sivaramn@nvidia.com, robh@kernel.org
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Jon,

Thanks for reviewing :)

On 24.1.2019 14.16, Jon Hunter wrote:

...

>> +static int tegra210_bpmp_ring_doorbell(struct tegra_bpmp *bpmp)
>> +{
>> +	struct tegra210_bpmp *priv = bpmp->priv;
>> +	struct irq_data *irq_data;
>> +
>> +	/* Tegra Legacy Interrupt Controller (LIC) is used to notify
>> +	 * BPMP of available messages
>> +	 */
>> +	irq_data = irq_get_irq_data(priv->txirq);
>> +	if (!irq_data)
>> +		return -EINVAL;
> 
> Why not check this in probe?
> 

Indeed I can move irq_get_irq_data() to probe and store the return value 
directly to priv->txirq instead. I'll just do that then.

>> +
>> +	return irq_data->chip->irq_retrigger(irq_data);
> 
> We should check that the irq_retrigger is populated as well.

I'll add a check.

> In general, I am not sure if there is a better way to do this, but I
> don't see an alternative.
> 

I'd be also happy to hear if someone has good alternative.

...

>> +static int tegra210_bpmp_init(struct tegra_bpmp *bpmp)
>> +{
>> +	struct platform_device *pdev = to_platform_device(bpmp->dev);
>> +	struct tegra210_bpmp *priv;
>> +	struct resource *res;
>> +	unsigned int i;
>> +	int err;
>> +
>> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	bpmp->priv = priv;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	priv->atomics = devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(priv->atomics))
>> +		return PTR_ERR(priv->atomics);
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>> +	priv->arb_sema = devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(priv->arb_sema))
>> +		return PTR_ERR(priv->arb_sema);
>> +
>> +	err = tegra210_bpmp_channel_init(bpmp->tx_channel, bpmp,
>> +					 bpmp->soc->channels.cpu_tx.offset);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	err = tegra210_bpmp_channel_init(bpmp->rx_channel, bpmp,
>> +					 bpmp->soc->channels.cpu_rx.offset);
>> +	if (err < 0)
>> +		return err;
> 
> Don't we need to unmap any iomem on error that we mapped in
> tegra210_bpmp_channel_init()?

Good point. I'll just replace ioremap() with devm_ioremap(). I think
that should do it.

...

>> diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
>> index c6716ec..22c91ab 100644
>> --- a/drivers/firmware/tegra/bpmp.c
>> +++ b/drivers/firmware/tegra/bpmp.c
>> @@ -765,17 +765,23 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
>>   	if (err < 0)
>>   		goto free_mrq;
>>   
>> -	err = tegra_bpmp_init_clocks(bpmp);
>> -	if (err < 0)
>> -		goto free_mrq;
>> +	if (of_find_property(pdev->dev.of_node, "#clock-cells", NULL)) {
>> +		err = tegra_bpmp_init_clocks(bpmp);
>> +		if (err < 0)
>> +			goto free_mrq;
>> +	}
>>   
>> -	err = tegra_bpmp_init_resets(bpmp);
>> -	if (err < 0)
>> -		goto free_mrq;
>> +	if (of_find_property(pdev->dev.of_node, "#reset-cells", NULL)) {
>> +		err = tegra_bpmp_init_resets(bpmp);
>> +		if (err < 0)
>> +			goto free_mrq;
>> +	}
>>   
>> -	err = tegra_bpmp_init_powergates(bpmp);
>> -	if (err < 0)
>> -		goto free_mrq;
>> +	if (of_find_property(pdev->dev.of_node, "#power-domain-cells", NULL)) {
>> +		err = tegra_bpmp_init_powergates(bpmp);
>> +		if (err < 0)
>> +			goto free_mrq;
>> +	}
> 
> Should we use soc_data for these rather than relying on the nodes to be
> populated correctly in DT?

There are some t210 systems where BPMP functions as clocks provider (for 
EMC), and some where it does not. So controlling this via device tree 
can be handier.

> Cheers
> Jon
> 

BR,
Timo
