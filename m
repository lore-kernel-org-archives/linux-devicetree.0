From: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/6] usb: gadget: gr_udc: Make struct platform_device
 variable name clearer
Date: Mon, 24 Feb 2014 08:40:17 +0100
Message-ID: <530AF761.2020107@gaisler.com>
References: <1389264858-32664-1-git-send-email-andreas@gaisler.com> <1389264858-32664-2-git-send-email-andreas@gaisler.com> <20140218155253.GC9878@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140218155253.GC9878-HgARHv6XitL9zxVx7UNMDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014-02-18 16:52, Felipe Balbi wrote:
> On Thu, Jan 09, 2014 at 11:54:13AM +0100, Andreas Larsson wrote:
>> Rename struct platform_device pointers from ofdev to pdev for clarity.
>> Suggested by Mark Rutland.
>>
>> Signed-off-by: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
>> ---
>>   drivers/usb/gadget/gr_udc.c |   18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/usb/gadget/gr_udc.c b/drivers/usb/gadget/gr_udc.c
>> index 914cbd8..e66dcf0 100644
>> --- a/drivers/usb/gadget/gr_udc.c
>> +++ b/drivers/usb/gadget/gr_udc.c
>> @@ -2071,9 +2071,9 @@ static int gr_udc_init(struct gr_udc *dev)
>>   	return 0;
>>   }
>>
>> -static int gr_remove(struct platform_device *ofdev)
>> +static int gr_remove(struct platform_device *pdev)
>>   {
>> -	struct gr_udc *dev = dev_get_drvdata(&ofdev->dev);
>> +	struct gr_udc *dev = dev_get_drvdata(&pdev->dev);
>
> you can use platform_get_drvdata()
>
>> @@ -2083,7 +2083,7 @@ static int gr_remove(struct platform_device *ofdev)
>>   	gr_dfs_delete(dev);
>>   	if (dev->desc_pool)
>>   		dma_pool_destroy(dev->desc_pool);
>> -	dev_set_drvdata(&ofdev->dev, NULL);
>> +	dev_set_drvdata(&pdev->dev, NULL);
>
> and platform_set_drvdata()
>

Yes, but wouldn't that be better handled in a separate patch?

Best regards,
Andreas Larsson
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
