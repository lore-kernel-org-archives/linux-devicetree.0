From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv2] watchdog: xilinx: Add clock support
Date: Thu, 4 Aug 2016 08:43:58 +0200
Message-ID: <bf0f7196-0bdd-581f-ffdd-d5e6c151c55e@xilinx.com>
References: <1470198518-22286-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <57A21A64.4090509@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57A21A64.4090509-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, shubhrajyoti.datta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Guenter,

On 3.8.2016 18:23, Guenter Roeck wrote:
> On 08/02/2016 09:28 PM, Shubhrajyoti Datta wrote:
>> Add support for the clock. Currently we enable
>> at probe and relinquish at remove.
>>
>> Acked-by: Sören Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> 
> Patch itself looks good.
> 
> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> 
> Do you have a separate patch to add the clock to virtex440-ml507.dts ?
> 
> Not that it matters much, I guess - virtex440-ml507.dts says
>         compatible = "xlnx,xps-timebase-wdt-1.00.b";
> which isn't supported by of_xilinx_wdt.c, and not documented in
> of-xilinx-wdt.txt. Is that an oversight or on purpose ?

We had an internal discussion about ppc405 and ppc440 support and truth
is Xilinx is not doing any testing on these cpus and the part of that is
that none is keeping stuff up2date.

I tried to remove xilinx ppc support from U-Boot because I didn't see
activity there but there were people who invested their time to do
necessary changes to keep it alive. I think kernel is just a same case.
I am happy to remove these xilinx ppc4xx dtses from the kernel but I
expect that there will be others who want to have it there.
And this is the group who should keep these dtses up2date and test them
regularly.

Thanks,
Michal

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
