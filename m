From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 15/16] usb: musb: da8xx: Use devm in probe
Date: Fri, 1 Apr 2016 13:36:45 +0300
Message-ID: <56FE4F3D.9040209@cogentembedded.com>
References: <1458863503-31121-1-git-send-email-david@lechnology.com>
 <1458863503-31121-16-git-send-email-david@lechnology.com>
 <20160331222112.GA28044@uda0271908>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160331222112.GA28044@uda0271908>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org, David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:USB SUBSYSTEM" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 4/1/2016 1:21 AM, Bin Liu wrote:

>> Simplify things a bit by using devm functions where possible.
>>
>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>> ---
>>
>> v3 changes:
>>
>> * Kept clk variable to minimize noise.
>>
>>
>>   drivers/usb/musb/da8xx.c | 19 +++++--------------
>>   1 file changed, 5 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
>> index b03d3b8..0c1997c 100644
>> --- a/drivers/usb/musb/da8xx.c
>> +++ b/drivers/usb/musb/da8xx.c
>> @@ -490,20 +490,18 @@ static int da8xx_probe(struct platform_device *pdev)
>>   	struct da8xx_glue		*glue;
>>   	struct platform_device_info	pinfo;
>>   	struct clk			*clk;
>> +	int				ret;
>>
>> -	int				ret = -ENOMEM;
>> -
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

    No, since devm_kzalloc() was used, the memory will be automatically freed 
on returning error by da8xx_probe().

>>   	}
>>
>>   	ret = clk_enable(clk);
>> @@ -560,12 +558,7 @@ err5:
>>   	clk_disable(clk);
>>
>>   err4:
>> -	clk_put(clk);
>> -
>> -err3:
>> -	kfree(glue);
>>
>> -err0:
>>   	return ret;
>>   }
>>
>> @@ -576,8 +569,6 @@ static int da8xx_remove(struct platform_device *pdev)
>>   	platform_device_unregister(glue->musb);
>>   	usb_phy_generic_unregister(glue->phy);
>>   	clk_disable(glue->clk);
>> -	clk_put(glue->clk);
>> -	kfree(glue);
>
> Doesn't match with $subject, I'd put them into a seperate patch.

    Again, these are now done automatically.

> Regards,
> -Bin.

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
