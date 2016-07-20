From: Julien Grall <julien.grall-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v4] xen/arm: Add a clock property
Date: Wed, 20 Jul 2016 13:10:14 +0100
Message-ID: <04d9dbfb-196d-a775-7fbb-526aba8085f4@arm.com>
References: <1468309605-19522-1-git-send-email-dirk.behme@de.bosch.com>
 <CAMuHMdU9yP2SMYa5ssrQSu1vwSN2gM4mD-EVYSGr2Pqf=jmCgw@mail.gmail.com>
 <cc28ef7e-dce3-fe5f-ab80-b662244bcbd0@arm.com>
 <CAMuHMdWeJjcuBHjnjppc5Ys5Ew8VssXzg=dLpLPCOQaBnUo_7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdWeJjcuBHjnjppc5Ys5Ew8VssXzg=dLpLPCOQaBnUo_7Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stefano Stabellini <sstabellini-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 20/07/16 12:49, Geert Uytterhoeven wrote:
> Hi Julien,
>
> On Wed, Jul 20, 2016 at 1:01 PM, Julien Grall <julien.grall-5wv7dgnIgG8@public.gmane.org> wrote:
>> On 20/07/16 10:43, Geert Uytterhoeven wrote:
>>> On Tue, Jul 12, 2016 at 9:46 AM, Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
>>> wrote:
>>>>
>>>> Clocks described by this property are reserved for use by Xen, and the OS
>>>> must not alter their state any way, such as disabling or gating a clock,
>>>> or modifying its rate. Ensuring this may impose constraints on parent
>>>> clocks or other resources used by the clock tree.
>>>>
>>>> This property is used to proxy clocks for devices Xen has taken ownership
>>>> of, such as UARTs, for which the associated clock controller(s) remain
>>>> under the control of Dom0.
>>>
>>>
>>> I'm not familiar with using XEN at all, but I'm a bit puzzled...
>>>
>>> Can't you just add a clocks property to the (virtual) serial device node
>>> in DT?
>>> Then the (virtual) serial device driver can get and enable the clock?
>>
>> There is no DT node for the Xen console (hvc). The UART used by Xen will be
>> completely removed from the Device tree.
>
> Why is it removed?

Because the device is used exclusively by Xen and DOM0 should not touch 
it at all (IRQs and MMIOs are not mapped).

Regards,

-- 
Julien Grall
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
