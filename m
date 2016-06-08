From: "Leizhen (ThunderTown)" <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 00/14] fix some type infos and bugs for arm64/of numa
Date: Wed, 8 Jun 2016 16:59:03 +0800
Message-ID: <5757DE57.10700@huawei.com>
References: <1465286898-13828-1-git-send-email-thunder.leizhen@huawei.com>
 <20160607135852.GA20477@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160607135852.GA20477-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 2016/6/7 21:58, Will Deacon wrote:
> On Tue, Jun 07, 2016 at 04:08:04PM +0800, Zhen Lei wrote:
>> v3 -> v4:
>> 1. Packed three patches of Kefeng Wang, patch6-8.
>> 2. Add 6 new patches(9-15) to enhance the numa on arm64.
>>
>> v2 -> v3:
>> 1. Adjust patch2 and patch5 according to Matthias Brugger's advice, to make the
>>    patches looks more well. The final code have no change. 
>>
>> v1 -> v2:
>> 1. Base on https://lkml.org/lkml/2016/5/24/679
> 
> If you want bug fixes to land in 4.7, you'll need to base them on a
> mainline kernel.

I heared that David Daney's acpi numa patch series was accepted and put into next branch(Linux 4.8).
Otherwise I will suggest him sending his patch6-7 to mainline first. So that, only a very small conflict
will be exist.

I also tested that:
1. git am David Daney's patch6-7, then git am all of my patches on a branch, named branch A.
2. git am David Daney's patch6-7 on another branch, named branch B.
3. when I git merge B into branch A, it's still conflict. So I guess git merge is based on source code, rather than patches.

So at present, unless the maintainers are willing to resolve the conflict, otherwise I update my patches will not work.

Fortunately, these patches are not particularly urgent. So I think I can wait until Linux 4.8 start, then send these patches again.
But I'm not sure whether these patches can be merged into Linux 4.8, I really hope.

> 
> Will
> 
> .
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
