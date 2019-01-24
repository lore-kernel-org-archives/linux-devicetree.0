Return-Path: <SRS0=avNg=QA=nvidia.com=talho@kernel.org>
Subject: Re: [PATCH V2 2/4] firmware: tegra: refactor bpmp driver
References: <1548073731-6449-1-git-send-email-talho@nvidia.com>
 <1548073731-6449-3-git-send-email-talho@nvidia.com>
 <7823f26a-279d-610f-0c53-3469e6fc076a@nvidia.com>
From: Timo Alho <talho@nvidia.com>
Message-ID: <4e958b74-d708-7768-5417-4549573758da@nvidia.com>
Date: Thu, 24 Jan 2019 16:26:58 +0200
MIME-Version: 1.0
In-Reply-To: <7823f26a-279d-610f-0c53-3469e6fc076a@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jon Hunter <jonathanh@nvidia.com>, treding@nvidia.com, sivaramn@nvidia.com, robh@kernel.org
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Jon,


On 24.1.2019 13.45, Jon Hunter wrote:
> 
> On 21/01/2019 12:28, Timo Alho wrote:
>> Split bpmp driver into common and chip specific parts to facilitae
> 
> s/facilitae/facilitate
> 
>> adding support for previous and futurue Tegra chips that are using
> 
> s/futurue/future >

Thanks for pointing out. I think I need to setup up some spell checker...

...

>>   static int tegra_bpmp_probe(struct platform_device *pdev)
>>   {
>>   	struct tegra_bpmp *bpmp;
>> -	unsigned int i;
>>   	char tag[TAG_SZ];
>>   	size_t size;
>>   	int err;
>> @@ -766,32 +703,6 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
>>   	bpmp->soc = of_device_get_match_data(&pdev->dev);
>>   	bpmp->dev = &pdev->dev;
>>   
>> -	bpmp->tx.pool = of_gen_pool_get(pdev->dev.of_node, "shmem", 0);
>> -	if (!bpmp->tx.pool) {
>> -		dev_err(&pdev->dev, "TX shmem pool not found\n");
>> -		return -ENOMEM;
>> -	}
>> -
>> -	bpmp->tx.virt = gen_pool_dma_alloc(bpmp->tx.pool, 4096, &bpmp->tx.phys);
>> -	if (!bpmp->tx.virt) {
>> -		dev_err(&pdev->dev, "failed to allocate from TX pool\n");
>> -		return -ENOMEM;
>> -	}
>> -
>> -	bpmp->rx.pool = of_gen_pool_get(pdev->dev.of_node, "shmem", 1);
>> -	if (!bpmp->rx.pool) {
>> -		dev_err(&pdev->dev, "RX shmem pool not found\n");
>> -		err = -ENOMEM;
>> -		goto free_tx;
>> -	}
>> -
>> -	bpmp->rx.virt = gen_pool_dma_alloc(bpmp->rx.pool, 4096, &bpmp->rx.phys);
>> -	if (!bpmp->rx.virt) {
>> -		dev_err(&pdev->dev, "failed to allocate from RX pool\n");
>> -		err = -ENOMEM;
>> -		goto free_tx;
>> -	}
>> -
>>   	INIT_LIST_HEAD(&bpmp->mrqs);
>>   	spin_lock_init(&bpmp->lock);
>>   
>> @@ -801,81 +712,38 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
>>   	size = BITS_TO_LONGS(bpmp->threaded.count) * sizeof(long);
>>   
>>   	bpmp->threaded.allocated = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
>> -	if (!bpmp->threaded.allocated) {
>> -		err = -ENOMEM;
>> -		goto free_rx;
>> -	}
>> +	if (!bpmp->threaded.allocated)
>> +		return -ENOMEM;
>>   
>>   	bpmp->threaded.busy = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
>> -	if (!bpmp->threaded.busy) {
>> -		err = -ENOMEM;
>> -		goto free_rx;
>> -	}
>> +	if (!bpmp->threaded.busy)
>> +		return -ENOMEM;
>>   
>>   	spin_lock_init(&bpmp->atomic_tx_lock);
>>   	bpmp->tx_channel = devm_kzalloc(&pdev->dev, sizeof(*bpmp->tx_channel),
>>   					GFP_KERNEL);
>> -	if (!bpmp->tx_channel) {
>> -		err = -ENOMEM;
>> -		goto free_rx;
>> -	}
>> +	if (!bpmp->tx_channel)
>> +		return -ENOMEM;
>>   
>>   	bpmp->rx_channel = devm_kzalloc(&pdev->dev, sizeof(*bpmp->rx_channel),
>>   	                                GFP_KERNEL);
>> -	if (!bpmp->rx_channel) {
>> -		err = -ENOMEM;
>> -		goto free_rx;
>> -	}
>> +	if (!bpmp->rx_channel)
>> +		return -ENOMEM;
>>   
>>   	bpmp->threaded_channels = devm_kcalloc(&pdev->dev, bpmp->threaded.count,
>>   					       sizeof(*bpmp->threaded_channels),
>>   					       GFP_KERNEL);
>> -	if (!bpmp->threaded_channels) {
>> -		err = -ENOMEM;
>> -		goto free_rx;
>> -	}
>> -
>> -	err = tegra_bpmp_channel_init(bpmp->tx_channel, bpmp,
>> -				      bpmp->soc->channels.cpu_tx.offset);
>> -	if (err < 0)
>> -		goto free_rx;
>> +	if (!bpmp->threaded_channels)
>> +		return -ENOMEM;
>>   
>> -	err = tegra_bpmp_channel_init(bpmp->rx_channel, bpmp,
>> -				      bpmp->soc->channels.cpu_rx.offset);
>> +	err = bpmp->soc->ops->init(bpmp);
>>   	if (err < 0)
>> -		goto cleanup_tx_channel;
>> -
>> -	for (i = 0; i < bpmp->threaded.count; i++) {
>> -		err = tegra_bpmp_channel_init(
>> -			&bpmp->threaded_channels[i], bpmp,
>> -			bpmp->soc->channels.thread.offset + i);
>> -		if (err < 0)
>> -			goto cleanup_threaded_channels;
>> -	}
>> -
>> -	/* mbox registration */
>> -	bpmp->mbox.client.dev = &pdev->dev;
>> -	bpmp->mbox.client.rx_callback = tegra_bpmp_handle_rx;
>> -	bpmp->mbox.client.tx_block = false;
>> -	bpmp->mbox.client.knows_txdone = false;
>> -
>> -	bpmp->mbox.channel = mbox_request_channel(&bpmp->mbox.client, 0);
>> -	if (IS_ERR(bpmp->mbox.channel)) {
>> -		err = PTR_ERR(bpmp->mbox.channel);
>> -		dev_err(&pdev->dev, "failed to get HSP mailbox: %d\n", err);
>> -		goto cleanup_threaded_channels;
>> -	}
>> -
>> -	/* reset message channels */
>> -	tegra_bpmp_channel_reset(bpmp->tx_channel);
>> -	tegra_bpmp_channel_reset(bpmp->rx_channel);
>> -	for (i = 0; i < bpmp->threaded.count; i++)
>> -		tegra_bpmp_channel_reset(&bpmp->threaded_channels[i]);
>> +		return err;
>>   
>>   	err = tegra_bpmp_request_mrq(bpmp, MRQ_PING,
>>   				     tegra_bpmp_mrq_handle_ping, bpmp);
>>   	if (err < 0)
>> -		goto free_mbox;
>> +		goto deinit;
>>   
>>   	err = tegra_bpmp_ping(bpmp);
>>   	if (err < 0) {
>> @@ -917,37 +785,17 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
>>   
>>   free_mrq:
>>   	tegra_bpmp_free_mrq(bpmp, MRQ_PING, bpmp);
>> -free_mbox:
>> -	mbox_free_channel(bpmp->mbox.channel);
>> -cleanup_threaded_channels:
>> -	for (i = 0; i < bpmp->threaded.count; i++) {
>> -		if (bpmp->threaded_channels[i].bpmp)
>> -			tegra_bpmp_channel_cleanup(&bpmp->threaded_channels[i]);
>> -	}
>> +deinit:
>> +	bpmp->soc->ops->deinit(bpmp);
>>   
>> -	tegra_bpmp_channel_cleanup(bpmp->rx_channel);
>> -cleanup_tx_channel:
>> -	tegra_bpmp_channel_cleanup(bpmp->tx_channel);
>> -free_rx:
>> -	gen_pool_free(bpmp->rx.pool, (unsigned long)bpmp->rx.virt, 4096);
>> -free_tx:
>> -	gen_pool_free(bpmp->tx.pool, (unsigned long)bpmp->tx.virt, 4096);
>>   	return err;
>>   }
>>   
>>   static int __maybe_unused tegra_bpmp_resume(struct device *dev)
>>   {
>>   	struct tegra_bpmp *bpmp = dev_get_drvdata(dev);
>> -	unsigned int i;
>> -
>> -	/* reset message channels */
>> -	tegra_bpmp_channel_reset(bpmp->tx_channel);
>> -	tegra_bpmp_channel_reset(bpmp->rx_channel);
>>   
>> -	for (i = 0; i < bpmp->threaded.count; i++)
>> -		tegra_bpmp_channel_reset(&bpmp->threaded_channels[i]);
>> -
>> -	return 0;
>> +	return bpmp->soc->ops->resume(bpmp);
>>   }
>>   
>>   static SIMPLE_DEV_PM_OPS(tegra_bpmp_pm_ops, NULL, tegra_bpmp_resume);
> 
> Looks fine to me, but I do wonder if you need any checks to see if the
> ops handler is populated? For example, looking at the Tegra210 BPMP
> driver it does not populate resume, yet resume I believe would be called?
> 

Good point, I'll add checks for ops that clearly can be optional. In 
this case it would be deinit() and resume() ops.


> Cheers
> Jon
> 
