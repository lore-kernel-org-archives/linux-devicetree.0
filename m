From: Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 00/14] fix some type infos and bugs for arm64/of numa
Date: Tue, 14 Jun 2016 18:10:14 +0800
Message-ID: <575FD806.5090600@huawei.com>
References: <1465286898-13828-1-git-send-email-thunder.leizhen@huawei.com>
 <20160607135852.GA20477@arm.com> <575D0ABA.2010503@huawei.com>
 <20160613101233.GB1605@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160613101233.GB1605-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2016/6/13 18:12, Will Deacon wrote:
> On Sun, Jun 12, 2016 at 03:09:46PM +0800, Hanjun Guo wrote:
>> On 2016/6/7 21:58, Will Deacon wrote:
>>> On Tue, Jun 07, 2016 at 04:08:04PM +0800, Zhen Lei wrote:
>>>> v3 -> v4:
>>>> 1. Packed three patches of Kefeng Wang, patch6-8.
>>>> 2. Add 6 new patches(9-15) to enhance the numa on arm64.
>>>>
>>>> v2 -> v3:
>>>> 1. Adjust patch2 and patch5 according to Matthias Brugger's advice, to make the
>>>>    patches looks more well. The final code have no change. 
>>>>
>>>> v1 -> v2:
>>>> 1. Base on https://lkml.org/lkml/2016/5/24/679
>>> If you want bug fixes to land in 4.7, you'll need to base them on a
>>> mainline kernel.
>>>
>> Rafael queued ARM64 ACPI NUMA support for 4.8, and this patch set is based
>> on that with no urgent bugfixes, can this patch set be queued for 4.8?
> Up to Catalin, since he's handling the 4.8 merge window. It would be really
> nice if you could give us the heads up about dependencies like this in the
> future, preferably *before* the base part has already been merged. That way,
> it's easier to create shared topic branches and gives us more options if
> we think that conflicts are likely to occur.

Understood the maintenance difficulty will have, will do that next time.
Much appreciate if it can be merged for 4.8.

Thanks
Hanjun

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
