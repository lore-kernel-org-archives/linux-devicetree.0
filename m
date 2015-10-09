From: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/4] arm64, numa, dt: adding dt based numa support
 using dt node property arm, associativity
Date: Fri, 9 Oct 2015 22:21:01 +0530
Message-ID: <CAFpQJXVMCktgza1JgrctMC9vdVkCrMEL2WENQPTVc-o1bR_5kA@mail.gmail.com>
References: <1439570374-4079-1-git-send-email-gkulkarni@caviumnetworks.com>
	<1439570374-4079-4-git-send-email-gkulkarni@caviumnetworks.com>
	<20151009151850.GX17192@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151009151850.GX17192-M2fw3Uu6cmfZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, rfranz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Steve Capper <steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Al Stone <al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Catalin,


On Fri, Oct 9, 2015 at 8:48 PM, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org> wrote:
> On Fri, Aug 14, 2015 at 10:09:33PM +0530, Ganapatrao Kulkarni wrote:
>> Adding dt node pasring for numa topology using property arm,associativity.
>> arm,associativity property can be used to map memory, cpu and
>> io devices to numa node.
>>
>> Signed-off-by: Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>> ---
>>  arch/arm64/Kconfig            |   6 +
>>  arch/arm64/include/asm/numa.h |   7 +
>>  arch/arm64/kernel/Makefile    |   1 +
>>  arch/arm64/kernel/dt_numa.c   | 316 ++++++++++++++++++++++++++++++++++++++++++
>>  arch/arm64/kernel/smp.c       |   1 +
>>  arch/arm64/mm/numa.c          |  13 ++
>
> Since a lot of code here is very similar to powerpc, any chance of
> making it common, especially if we try to use the same bindings (maybe
> with a different prefix ("arm," vs "ibm,")? See
> https://members.openpowerfoundation.org/document/dl/469.
there is discussion happened in Documentation patch (PATCH 2/4),
whether to go with associativity based dt binding or not.
https://patchwork.ozlabs.org/patch/507536/
it seems this binding may not map or will be complex representation
for  numa topologies like mesh, ring topologies
which are used in upcoming arm64 numa platforms(as Mark Rutland pointed out).
in this regard, i  have proposed new binding, which will be based on
associativity and acpi.
This binding will serve wide range of arm64 platforms.
i am waiting for review comments for the proposal, however i can post
next version of patchset with new proposal implemented.

>
> Also, since this series is from August, any chance to post another and
> incorporate the feedback provided so far?
>
> --
> Catalin

thanks
Ganapat
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
