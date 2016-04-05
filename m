From: Graeme Gregory <graeme-/SyDAi3Rz4f10XsdtD+oqA@public.gmane.org>
Subject: Re: [PATCH v15 0/6] arm64, numa: Add numa support for arm64 platforms
Date: Tue, 5 Apr 2016 14:08:56 +0100
Message-ID: <5703B8E8.3080408__45032.067949842$1459862419$gmane$org@xora.org.uk>
References: <1457481587-8976-1-git-send-email-ddaney.cavm@gmail.com>
 <56F1936E.1090407@redhat.com> <56F1BD15.4000701@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56F1BD15.4000701-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.orglinux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.orglinux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22/03/16 21:45, David Daney wrote:
> On 03/22/2016 11:48 AM, Jon Masters wrote:
>> On 03/08/2016 06:59 PM, David Daney wrote:
>>
>>> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
>>>
>>> v15:
>>>
>>>     - Make the distance-map node optional (again), if it is not in
>>>            the device tree, default values are used.
>>>
>>>     - Minor cleanups to of_numa.c as suggested by Rob Harring.
>>
>> Hi David, all,
>>
>> Wondering what the status of this patch series is currently?
>
> I haven't seen any feedback on v15.  My assumption was that the relevant
> arm64 maintainers would take some sort of action after the merge window
> quiets down.
>
> In any event, I am happy to make any improvements that may be suggested.
>
Post merge window series does not apply to 4.6-rc2 or next.

Patch 4 collides in arch/arm64/mm/mmu.c

Thanks

Graeme


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
