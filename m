From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v3 15/16] usb: musb: da8xx: Use devm in probe
Date: Thu, 31 Mar 2016 17:28:48 -0500
Message-ID: <56FDA4A0.6080106@lechnology.com>
References: <1458863503-31121-1-git-send-email-david@lechnology.com>
 <1458863503-31121-16-git-send-email-david@lechnology.com>
 <20160331222112.GA28044@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160331222112.GA28044@uda0271908>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:USB SUBSYSTEM" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/31/2016 05:21 PM, Bin Liu wrote:

>> -	glue = kzalloc(sizeof(*glue), GFP_KERNEL);
>> +	glue = devm_kzalloc(&pdev->dev, sizeof(*glue), GFP_KERNEL);
>>   	if (!glue) {
>>   		dev_err(&pdev->dev, "failed to allocate glue context\n");
>> -		goto err0;
>> +		return -ENOMEM;
>>   	}
>>
>> -	clk = clk_get(&pdev->dev, "usb20");
>> +	clk = devm_clk_get(&pdev->dev, "usb20");
>>   	if (IS_ERR(clk)) {
>>   		dev_err(&pdev->dev, "failed to get clock\n");
>> -		ret = PTR_ERR(clk);
>> -		goto err3;
>> +		return PTR_ERR(clk);
>
> memory leak due to not kfree(glue).

It is my understanding that since glue is allocated with devm_kzalloc(), 
that if the probe function returns and error, glue and everything else 
allocated with devm_* will be automatically freed.

If this is not the case, wouldn't devm_kfree() be the appropriate 
function instead?


>> @@ -576,8 +569,6 @@ static int da8xx_remove(struct platform_device *pdev)
>>   	platform_device_unregister(glue->musb);
>>   	usb_phy_generic_unregister(glue->phy);
>>   	clk_disable(glue->clk);
>> -	clk_put(glue->clk);
>> -	kfree(glue);
>
> Doesn't match with $subject, I'd put them into a seperate patch.


I disagree. Since these are now automatically freed because of changes 
in the probe function, these changes belong in the same patch.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
