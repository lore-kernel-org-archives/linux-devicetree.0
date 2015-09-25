From: Nishanth Menon <menon.nishanth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] Documentation: dt: keystone: provide SoC specific
 compatible flags
Date: Fri, 25 Sep 2015 12:38:39 -0500
Message-ID: <5605869F.9080906@gmail.com>
References: <1442938118-4718-1-git-send-email-nm@ti.com> <1442938118-4718-2-git-send-email-nm@ti.com> <5602ED34.9010108@oracle.com> <56040323.1080409@ti.com> <560406C2.6090200@ti.com> <56041CA4.40208@ti.com> <56055F1F.4060401@ti.com> <560565AF.2010701@oracle.com> <56056FD9.5060000@ti.com> <56057319.9080104@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56057319.9080104-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/25/2015 11:15 AM, santosh shilimkar wrote:
> 9/25/2015 9:01 AM, Nishanth Menon wrote:
>> On 09/25/2015 10:18 AM, santosh shilimkar wrote:
>>> On 9/25/2015 7:50 AM, Nishanth Menon wrote:
>> [...]
>>>> But, how about userspace
>>>> needing to know which SoC they are on, without needing to depend on
>>>> board->soc mapping? How do we help resolve that?
>>>>
>>> Why the user space should care about exact SOC ?
>>
>> examples vary - trivial one is: debug tools like omapconf[1] or testing
>> tools like opentest[2] need some standard way to ensure Linux kernel is
>> functional - trusting the least set of parameters is usually what we
>> would prefer. while building a generic distro such as debian or yocto,
>> one prefers NOT to need to do a package build per SoC/perboard - that
>> never scales. instead, you'd like the same application run on different
>> systems dynamically.
>>
> I guessed omapconf example is coming though Keystone has no such tool

:) That is true - as of now. maynot be the case for future.

> yet ;-). Opentest shouldn't need that info either.

we did debate this on opentest, but we could not implement anything
since we did not have a consistent solution yet.

> I do agree that having a soc along with board is useful in
> longer run to accommodation more boards and variants.
> And only on that merit, I am willing to take these patches.
> 
> Please refresh the series commit messages based on the
> discussion so far and repost. Will pick it up then.
> 
Thanks. I will do so (probably early next week)..


-- 
Regards,
Nishanth Menon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
