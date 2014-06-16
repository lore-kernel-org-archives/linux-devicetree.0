From: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 20/21] usb: use devm_irq_of_parse_and_map() where appropriate
Date: Mon, 16 Jun 2014 11:54:05 +0200
Message-ID: <539EBEBD.6080903@gaisler.com>
References: <1401880402-30091-1-git-send-email-nyushchenko@dev.rtsoft.ru> <1401880402-30091-21-git-send-email-nyushchenko@dev.rtsoft.ru> <539EBA6F.7060008@gaisler.com> <539EBC8E.6060602@dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <539EBC8E.6060602-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikita Yushchenko <nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lugovskoy-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014-06-16 11:44, Nikita Yushchenko wrote:
>>> diff --git a/drivers/usb/host/ehci-grlib.c
>>> b/drivers/usb/host/ehci-grlib.c
>>> index 495b6fb..666c03e 100644
>>> --- a/drivers/usb/host/ehci-grlib.c
>>> +++ b/drivers/usb/host/ehci-grlib.c
>>> @@ -111,11 +111,11 @@ static int ehci_hcd_grlib_probe(struct
>>> platform_device *op)
>>>        hcd->rsrc_start = res.start;
>>>        hcd->rsrc_len = resource_size(&res);
>>>
>>> -    irq = irq_of_parse_and_map(dn, 0);
>>> -    if (irq == NO_IRQ) {
>>> -        dev_err(&op->dev, "%s: irq_of_parse_and_map failed\n",
>>> +    irq = devm_irq_of_parse_and_map(&op->dev, dn, 0);
>>> +    if (irq <= 0) {
>>> +        dev_err(&op->dev, "%s: devm_irq_of_parse_and_map failed\n",
>>>                __FILE__);
>>> -        rv = -EBUSY;
>>> +        rv = irq ? irq : -EINVAL;
>>
>> Here and in more places below you change the return value from -EBUSY to
>> -EINVAL when irq == 0. These changes and the reason for them is not
>> something that is commented upon in the commit message. Maybe these
>> changes were not intended or should be in a separate patch?
>
> Although errno codes are quite unspecific, I can't think a valid reason
> to return -EBUSY on [devm_]irq_of_parse_and_map() failure. It could be
> -EINVAL or -ENODEV, but not -EBUSY ...
>
> Since changing line that sets error code anyway, I decided to change
> -EBUST to -ENODEV.
>
> But I agree that this is not the topic of the patch.
>
> IS it better to remove this change from changeset alltogether, or to
> mention it in commit's log message?

Given that there are a lot of -EBUSY being returned in drivers/usb/host 
- not just in these error cases, maybe it is better to not touch this in 
this patch set.

Best regards,
Andreas Larsson
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
