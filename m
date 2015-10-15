From: santosh shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 0/3]
Date: Thu, 15 Oct 2015 09:21:07 -0700
Message-ID: <561FD273.2040208@oracle.com>
References: <1444832235-15263-1-git-send-email-m-karicheri2@ti.com>
 <561E7792.409@oracle.com> <561FCE2B.8020802@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561FCE2B.8020802-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, corbet-T1hC0tSOHrs@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/15/2015 9:02 AM, Murali Karicheri wrote:
> On 10/14/2015 11:41 AM, santosh shilimkar wrote:
>> 10/14/2015 7:17 AM, Murali Karicheri wrote:
>>> This patch series enable accumulator queue support for K2 SoCs.
>>> Accumulator
>>> queues are a type of qmss queue that is monitored by the PDSP firmware
>>> and
>>> accumulated. Host is interrupted by PDSP firmware when packets become
>>> available in a ring buffer shared between the host and PDSP.
>>>
>>> There was an issue raised when merging the original patch set at
>>>   (1) https://lkml.org/lkml/2015/9/4/681
>>>     [PATCH v1 1/2] soc: ti: display firmware file name as part of boot
>>> log
>>>   (2) https://lkml.org/lkml/2015/9/4/680
>>>     [PATCH v1 2/2] ARM: dts: keystone: enable accumulator channels
>>>
>>> This series fixes the issues raised against v3. Maintainer, could you
>>> please
>>> apply this series to v4.4 next please at your earliest opportunity.
>>>
>> I have picked up the series. Thanks for quick turnaround.
>
> Thanks Santosh. Could you send this pull request for v4.4 next. We want
> this merged to our internal release and if this is on next branch it
> will help.
>
It should be already in linux-next and pull request was sent before I
replied yesterday. Its late for the merge window with usual norms
so lets see if it makes it.

Regards,
Santosh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
