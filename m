From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 4/4] mailbox: mailbox-test: add support for separate tx/rx
 buffer with single channel
Date: Fri, 12 Feb 2016 09:34:03 +0000
Message-ID: <56BDA70B.70008@arm.com>
References: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
 <1455210808-29395-5-git-send-email-sudeep.holla@arm.com>
 <20160212091505.GS20693@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160212091505.GS20693@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 12/02/16 09:15, Lee Jones wrote:
> On Thu, 11 Feb 2016, Sudeep Holla wrote:
>

[...]

>> @@ -294,9 +295,13 @@ static int mbox_test_probe(struct platform_device *pdev)
>>
>>   	/* It's okay for MMIO to be NULL */
>>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -	tdev->mmio = devm_ioremap_resource(&pdev->dev, res);
>> -	if (IS_ERR(tdev->mmio))
>> -		tdev->mmio = NULL;
>> +	tdev->tx_mmio = devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(tdev->tx_mmio))
>> +		tdev->tx_mmio = NULL;
>
> Nit: I'd prefer to see a new line separator here.
>

OK will add it

>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>> +	tdev->rx_mmio = devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(tdev->rx_mmio))
>> +		tdev->rx_mmio = tdev->tx_mmio;
>>
>>   	tdev->tx_channel = mbox_test_request_channel(pdev, "tx");
>>   	tdev->rx_channel = mbox_test_request_channel(pdev, "rx");
>> @@ -304,6 +309,9 @@ static int mbox_test_probe(struct platform_device *pdev)
>>   	if (!tdev->tx_channel && !tdev->rx_channel)
>>   		return -EPROBE_DEFER;
>>
>> +	if (!tdev->rx_channel && (tdev->rx_mmio != tdev->tx_mmio))
>> +		tdev->rx_channel = tdev->tx_channel;
>> +
>>   	tdev->dev = &pdev->dev;
>>   	platform_set_drvdata(pdev, tdev);
>
> Otherwise code looks good.  Nice extension.
>

Thanks for the review.

> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
