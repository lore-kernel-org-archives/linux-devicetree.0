From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v12 4/4] Watchdog: introduce ARM SBSA watchdog driver
Date: Sun, 28 Feb 2016 22:01:55 +0800
Message-ID: <CADyBb7s9eX6mn6vkb3tn=m=TfD83d4R+U5=iLPADa+XHBE3kDw@mail.gmail.com>
References: <1455611785-2407-1-git-send-email-fu.wei@linaro.org>
	<1455611785-2407-5-git-send-email-fu.wei@linaro.org>
	<56D0A72B.8020100@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D0A72B.8020100-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Jon Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linaro ACPI Mailman List <linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Richard Ruigrok <rruigrok-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Abdulhamid, Harb" <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Christopher Covington <cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Dave Young <dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pratyush Anand <panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, G Gregory <graeme.gregory>
List-Id: devicetree@vger.kernel.org

Hi Timur,

On 27 February 2016 at 03:27, Timur Tabi <timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
>>
>> +       if (action) {
>> +               irq = platform_get_irq(pdev, 0);
>> +               if (irq < 0) {
>> +                       action = 0;
>> +                       dev_warn(dev, "unable to get ws0 interrupt.\n");
>> +               } else {
>> +                       if (devm_request_irq(dev, irq,
>> sbsa_gwdt_interrupt, 0,
>> +                                            pdev->name, gwdt)) {
>> +                               action = 0;
>> +                               dev_warn(dev, "unable to request IRQ
>> %d.\n",
>> +                                        irq);
>> +                       }
>> +               }
>> +               if (!action)
>> +                       dev_warn(dev, "falling back to signle stage
>> mode.\n");
>> +       }
>> +
>> +       /*
>> +        * Get the frequency of system counter from the cp15 interface of
>> ARM
>> +        * Generic timer. We don't need to check it, because if it returns
>> "0",
>> +        * system would panic in very early stage.
>> +        */
>> +       gwdt->clk = arch_timer_get_cntfrq();
>> +       gwdt->refresh_base = rf_base;
>> +       gwdt->control_base = cf_base;
>
>
> I think you need to ping the watchdog before enabling the interrupt, in case
> there is a pending interrupt.  This just happened to me in testing, so I
> recommend this:
>
>>         /*
>>          * Get the frequency of system counter from the cp15 interface of
>> ARM
>>          * Generic timer. We don't need to check it, because if it returns
>> "0",
>>          * system would panic in very early stage.
>>          */
>>         gwdt->clk = arch_timer_get_cntfrq();
>>         gwdt->refresh_base = rf_base;
>>         gwdt->control_base = cf_base;
>>
>>         if (action) {
>>                 irq = platform_get_irq(pdev, 0);
>>                 if (irq < 0) {
>>                         action = 0;
>>                         dev_warn(dev, "unable to get ws0 interrupt.\n");
>>                 } else {
>>                         sbsa_gwdt_keepalive(&gwdt->wdd);
>>                         if (devm_request_irq(dev, irq,
>> sbsa_gwdt_interrupt, 0,
>>                                              pdev->name, gwdt)) {
>>                                 action = 0;
>>                                 dev_warn(dev, "unable to request IRQ
>> %d.\n",
>>                                          irq);
>>                         }
>>                 }
>>                 if (!action)
>>                         dev_warn(dev, "falling back to single stage
>> mode.\n");
>>         }
>
>
> In fact, I think you need to move the "if (action) {" block near the end of
> sbsa_gwdt_probe().  We don't want to enable the interrupt until the watchdog
> is fully initialized.
>

Good point! Thanks for your testing :-)

Will post v14 for this change.

> --
> Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> Forum, a Linux Foundation collaborative project.



-- 
Best regards,

Fu Wei
Software Engineer
Red Hat Software (Beijing) Co.,Ltd.Shanghai Branch
Ph: +86 21 61221326(direct)
Ph: +86 186 2020 4684 (mobile)
Room 1512, Regus One Corporate Avenue,Level 15,
One Corporate Avenue,222 Hubin Road,Huangpu District,
Shanghai,China 200021
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
