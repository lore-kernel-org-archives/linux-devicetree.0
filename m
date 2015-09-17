From: "santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org" <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 1/2] soc: ti: display firmware file name as part of
 boot log
Date: Thu, 17 Sep 2015 09:18:10 -0700
Message-ID: <55FAE7C2.8030004@oracle.com>
References: <1441403199-10936-1-git-send-email-m-karicheri2@ti.com>
 <55EA673F.8010904@oracle.com> <55F06075.6050405@ti.com>
 <55F8600D.2070701@ti.com> <55F88B81.2000308@oracle.com>
 <55F9A05E.4090000@ti.com> <55F9BF61.4080200@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55F9BF61.4080200-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 9/16/15 12:13 PM, santosh shilimkar wrote:
> On 9/16/2015 10:01 AM, Murali Karicheri wrote:
>> On 09/15/2015 05:20 PM, santosh shilimkar wrote:
>>> On 9/15/2015 11:14 AM, Murali Karicheri wrote:
>>>> On 09/09/2015 12:38 PM, Murali Karicheri wrote:
>
> [..]
>>>> Santosh,
>>>>
>>>> I have checked v4.3-rc1 and I don't see it. Did you send the pull
>>>> request?
>>>>
>>> They are in the queue fo 4.4-rc1. They were too late for 4.3.
>>> You might know already, typically as a rule of thumb followed
>>> on arm-soc, we need to get patches reviewed/acked by rc4 to make
>>> it for next merge window.
>>> Ofcourse genuine bug fixes can make it to the same cycle.
>> Is there a branch where you have applied the patches that you can
>> provide me? I want to send it to internal list for merge.
>>
> Yes. I will push it out later this week. Will drop you
> note when I do that.

Rebased version against v4.3-rc1 are available below. They
should also appear in linux-next soon.

git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git

for_4.4/dts
for_4.4/drivers-soc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
