From: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC v8 5/5] dma: mpc512x: register for device tree channel lookup
Date: Thu, 6 Mar 2014 18:28:57 +0400
Message-ID: <CAF0T0X5XAd=qW_4F2fmz_nmLDifjeicO23i_BThph2gsQiKgRg@mail.gmail.com>
References: <1393240172-18769-1-git-send-email-a13xp0p0v88@gmail.com>
	<1393240172-18769-6-git-send-email-a13xp0p0v88@gmail.com>
	<1393247295.28803.10.camel@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393247295.28803.10.camel-XvqNBM/wLWRrdx17CPfAsdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Andy.

2014-02-24 17:08 GMT+04:00 Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>:
> On Mon, 2014-02-24 at 15:09 +0400, Alexander Popov wrote:
>> @@ -1018,11 +1019,23 @@ static int mpc_dma_probe(struct platform_device *op)
>>       /* Register DMA engine */
>>       dev_set_drvdata(dev, mdma);
>>       retval = dma_async_device_register(dma);
>> -     if (retval) {
>> -             devm_free_irq(dev, mdma->irq, mdma);
>> -             irq_dispose_mapping(mdma->irq);
>> +     if (retval)
>> +             goto out_irq;
>> +
>> +     /* register with OF helpers for DMA lookups (nonfatal) */
>> +     if (dev->of_node) {
>> +             retval = of_dma_controller_register(dev->of_node,
>> +                                                 of_dma_xlate_by_chan_id,
>> +                                                 mdma);
>> +             if (retval)
>> +                     dev_warn(dev, "could not register for OF lookup\n");
>>       }
>>
>> +     return 0;
>> +
>> +out_irq:
>> +     devm_free_irq(dev, mdma->irq, mdma);
>
> Something wrong either with devm_request_irq() or you don't need to call
> devm_free_irq() explicitly. Once we already try to discuss this earlier
> in this mailing list with Lars-Peter(?), though there were no solution
> how to keep devm_*_irq usability.

Thanks, I've read this discussion. It seems that the current code doesn't do
anything bad, though devm_request_irq() and devm_free_irq() can be changed
to request_irq() and free_irq() accordingly. Do you think it's worth being done
in a separate patch in this series?

>> +     irq_dispose_mapping(mdma->irq);
>>       return retval;
>>  }
>>
>> @@ -1031,6 +1044,8 @@ static int mpc_dma_remove(struct platform_device *op)
>>       struct device *dev = &op->dev;
>>       struct mpc_dma *mdma = dev_get_drvdata(dev);
>>
>> +     if (dev->of_node)
>> +             of_dma_controller_free(dev->of_node);
>>       dma_async_device_unregister(&mdma->dma);
>>       devm_free_irq(dev, mdma->irq, mdma);
>>       irq_dispose_mapping(mdma->irq);

Best regards,
Alexander
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
